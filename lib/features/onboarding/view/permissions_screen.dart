import 'package:enfoque/app/dependencies.dart';
import 'package:enfoque/app/router.dart';
import 'package:enfoque/app/theme/tokens.dart';
import 'package:enfoque/core/ui/ui.dart';
import 'package:enfoque/domain/models/models.dart';
import 'package:enfoque/features/onboarding/view_model/permissions_view_model.dart';
import 'package:enfoque/l10n/gen/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class PermissionsScreen extends ConsumerWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final state = ref.watch(permissionsViewModelProvider);
    final onboardingDone =
        ref.watch(settingsStreamProvider).value?.onboardingDone ?? false;
    final canBlock = state.value?.canBlock ?? false;

    return FocusScaffold(
      title: l10n.permissionsTitle,
      body: switch (state) {
        AsyncData(:final value) => _PermissionList(permissions: value),
        AsyncError() => ErrorState(
          message: l10n.commonGenericError,
          retryLabel: l10n.commonRetry,
          onRetry: () => ref.invalidate(permissionsViewModelProvider),
        ),
        _ => LoadingState(label: l10n.commonLoading),
      },
      bottom: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (!canBlock)
            Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.sm),
              child: Text(l10n.permissionsMissing),
            ),
          FocusButton(
            label: l10n.permissionsContinue,
            onPressed: !canBlock
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

class _PermissionList extends ConsumerWidget {
  const new({required this.permissions});

  final AppPermissions permissions;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final vm = ref.read(permissionsViewModelProvider.notifier);
    PermissionStepState s({required bool granted}) =>
        granted ? PermissionStepState.granted : PermissionStepState.pending;

    final items = [
      (
        PermissionKind.usageAccess,
        Icons.query_stats,
        l10n.permissionUsageTitle,
        l10n.permissionUsageBody,
        true,
        permissions.usageAccess,
      ),
      (
        PermissionKind.overlay,
        Icons.layers_outlined,
        l10n.permissionOverlayTitle,
        l10n.permissionOverlayBody,
        true,
        permissions.overlay,
      ),
      (
        PermissionKind.notifications,
        Icons.notifications_outlined,
        l10n.permissionNotificationsTitle,
        l10n.permissionNotificationsBody,
        false,
        permissions.notifications,
      ),
      (
        PermissionKind.batteryOptimization,
        Icons.battery_saver_outlined,
        l10n.permissionBatteryTitle,
        l10n.permissionBatteryBody,
        false,
        permissions.batteryOptimization,
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(l10n.permissionsBody),
        const Gap(AppSpacing.lg),
        for (final (kind, icon, title, body, required, granted) in items)
          Padding(
            padding: const EdgeInsets.only(bottom: AppSpacing.md),
            child: PermissionStepCard(
              icon: icon,
              title: title,
              body: body,
              badge: required
                  ? l10n.permissionRequired
                  : l10n.permissionRecommended,
              state: s(granted: granted),
              actionLabel: l10n.permissionGrant,
              grantedLabel: l10n.permissionGranted,
              onRequest: () => vm.request(kind),
            ),
          ),
      ],
    );
  }
}
