import 'dart:async';

import 'package:enfoque/app/dependencies.dart';
import 'package:enfoque/app/router.dart';
import 'package:enfoque/app/theme/semantic_colors.dart';
import 'package:enfoque/app/theme/tokens.dart';
import 'package:enfoque/core/ui/ui.dart';
import 'package:enfoque/domain/models/models.dart';
import 'package:enfoque/features/onboarding/view_model/permissions_view_model.dart';
import 'package:enfoque/l10n/gen/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// Asistente de permisos: uno a la vez, con instrucciones exactas.
class PermissionsScreen extends ConsumerWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final state = ref.watch(permissionsViewModelProvider);
    final onboardingDone =
        ref.watch(settingsStreamProvider).value?.onboardingDone ?? false;
    final ui = state.value;
    final canContinue = ui?.canContinue ?? false;

    // Aviso cuando un permiso pasa a activado.
    ref.listen(
      permissionsViewModelProvider.select((s) => s.value?.permissions),
      (previous, next) {
        if (previous == null || next == null) return;
        final newlyGranted = PermissionsUiState.order.any(
          (k) =>
              !PermissionsUiState(permissions: previous).isGranted(k) &&
              PermissionsUiState(permissions: next).isGranted(k),
        );
        if (newlyGranted) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(content: Text(l10n.permNowOn)));
        }
      },
    );

    return FocusScaffold(
      title: l10n.permissionsTitle,
      body: switch (state) {
        AsyncData(:final value) => _Wizard(state: value),
        AsyncError() => ErrorState(
          message: l10n.commonGenericError,
          retryLabel: l10n.commonRetry,
          onRetry: () => ref.invalidate(permissionsViewModelProvider),
        ),
        _ => LoadingState(label: l10n.commonLoading),
      },
      bottom: ui == null
          ? null
          : Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                  child: Text(
                    !canContinue
                        ? l10n.permissionsRequiredMissing
                        : ui.permissions.allGranted
                        ? l10n.permissionsAllDone
                        : l10n.permissionsRequiredDone,
                    textAlign: TextAlign.center,
                  ),
                ),
                FocusButton(
                  label: l10n.permissionsContinue,
                  variant: ui.current == null || !canContinue
                      ? FocusButtonVariant.primary
                      : FocusButtonVariant.secondary,
                  onPressed: !canContinue
                      ? null
                      : () => onboardingDone
                            ? context.pop()
                            : context.go(Routes.allowlist),
                ),
              ],
            ),
    );
  }
}

class _Wizard extends ConsumerWidget {
  const new({required this.state});

  final PermissionsUiState state;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final vm = ref.read(permissionsViewModelProvider.notifier);
    final current = state.current;
    final total = PermissionsUiState.order.length;

    Future<void> verify(PermissionKind kind) async {
      final granted = await vm.verify(kind);
      if (!granted && context.mounted) {
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(SnackBar(content: Text(l10n.permStillOff)));
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(l10n.permissionsIntro, style: theme.textTheme.bodyMedium),
        const Gap(AppSpacing.lg),
        Text(
          l10n.permissionsStep(state.stepNumber, total),
          style: theme.textTheme.labelLarge,
        ),
        const Gap(AppSpacing.sm),
        ClipRRect(
          borderRadius: BorderRadius.circular(AppRadius.circle),
          child: LinearProgressIndicator(
            value:
                PermissionsUiState.order.where(state.isGranted).length / total,
            minHeight: AppSpacing.sm,
          ),
        ),
        const Gap(AppSpacing.lg),
        if (current == null)
          _AllDoneCard(message: l10n.permissionsAllDone)
        else
          AnimatedSwitcher(
            duration: MediaQuery.disableAnimationsOf(context)
                ? Duration.zero
                : AppDurations.medium,
            child: _guideFor(
              context,
              current,
              onPrimary: () => unawaited(vm.open(current)),
              onVerify: () => unawaited(verify(current)),
              onSkip: PermissionsUiState.isRequired(current)
                  ? null
                  : () => vm.skip(current),
              onOpenAppInfo: () => unawaited(vm.openAppDetails()),
            ),
          ),
        SectionTitle(l10n.permissionsSummary),
        for (final kind in PermissionsUiState.order)
          PermissionStatusRow(
            icon: _icon(kind),
            title: _title(l10n, kind),
            selected: kind == current,
            status: state.isGranted(kind)
                ? PermissionRowStatus.granted
                : state.skipped.contains(kind)
                ? PermissionRowStatus.skipped
                : PermissionRowStatus.pending,
            statusLabel: state.isGranted(kind)
                ? l10n.permissionGranted
                : state.skipped.contains(kind)
                ? l10n.permStatusSkipped
                : l10n.permStatusPending,
            onTap: state.isGranted(kind) ? null : () => vm.select(kind),
          ),
      ],
    );
  }

  Widget _guideFor(
    BuildContext context,
    PermissionKind kind, {
    required VoidCallback onPrimary,
    required VoidCallback onVerify,
    required VoidCallback? onSkip,
    required VoidCallback onOpenAppInfo,
  }) {
    final l10n = AppLocalizations.of(context);
    final required = PermissionsUiState.isRequired(kind);
    final restrictedHelp = HelpExpansion(
      title: l10n.permRestrictedTitle,
      body: l10n.permRestrictedBody,
      steps: [
        l10n.permRestrictedStep1,
        l10n.permRestrictedStep2,
        l10n.permRestrictedStep3,
      ],
      actionLabel: l10n.permOpenAppInfo,
      onAction: onOpenAppInfo,
    );

    final (reason, steps, primary, help) = switch (kind) {
      PermissionKind.usageAccess => (
        l10n.permissionUsageBody,
        [
          l10n.permUsageStep1,
          l10n.permStepFindApp,
          l10n.permUsageStep2,
          l10n.permStepBack,
        ],
        l10n.permOpenSettings,
        restrictedHelp,
      ),
      PermissionKind.overlay => (
        l10n.permissionOverlayBody,
        [
          l10n.permOverlayStep1,
          l10n.permStepFindApp,
          l10n.permOverlayStep2,
          l10n.permStepBack,
        ],
        l10n.permOpenSettings,
        restrictedHelp,
      ),
      PermissionKind.notifications => (
        l10n.permissionNotificationsBody,
        [l10n.permNotifStep1, l10n.permNotifStep2],
        l10n.permAllowNotifications,
        null,
      ),
      PermissionKind.batteryOptimization => (
        l10n.permissionBatteryBody,
        [l10n.permBatteryStep1, l10n.permBatteryStep2],
        l10n.permBatteryAction,
        null,
      ),
    };

    return PermissionGuideCard(
      key: ValueKey(kind),
      icon: _icon(kind),
      title: _title(l10n, kind),
      reason: reason,
      badge: required ? l10n.permissionRequired : l10n.permissionRecommended,
      howToTitle: l10n.permissionsHowTo,
      steps: steps,
      safetyNote: l10n.permissionsSafetyNote,
      primaryLabel: primary,
      onPrimary: onPrimary,
      verifyLabel: l10n.permVerify,
      onVerify: onVerify,
      skipLabel: onSkip == null ? null : l10n.permSkip,
      onSkip: onSkip,
      help: help,
    );
  }

  static IconData _icon(PermissionKind kind) => switch (kind) {
    PermissionKind.usageAccess => Icons.query_stats,
    PermissionKind.overlay => Icons.layers_outlined,
    PermissionKind.notifications => Icons.notifications_outlined,
    PermissionKind.batteryOptimization => Icons.battery_saver_outlined,
  };

  static String _title(AppLocalizations l10n, PermissionKind kind) =>
      switch (kind) {
        PermissionKind.usageAccess => l10n.permissionUsageTitle,
        PermissionKind.overlay => l10n.permissionOverlayTitle,
        PermissionKind.notifications => l10n.permissionNotificationsTitle,
        PermissionKind.batteryOptimization => l10n.permissionBatteryTitle,
      };
}

class _AllDoneCard extends StatelessWidget {
  const new({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    final focus = context.semanticColors.focus;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.xl),
        child: Column(
          children: [
            Icon(Icons.verified, color: focus, size: AppSizes.iconXl),
            const Gap(AppSpacing.md),
            Text(
              message,
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
