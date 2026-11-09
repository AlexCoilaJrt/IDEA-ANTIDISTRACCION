import 'dart:async';

import 'package:enfoque/app/theme/semantic_colors.dart';
import 'package:enfoque/app/theme/tokens.dart';
import 'package:enfoque/core/ui/ui.dart';
import 'package:enfoque/core/utils/formatters.dart';
import 'package:enfoque/domain/logic/exit_cost.dart';
import 'package:enfoque/domain/logic/pomodoro_clock.dart';
import 'package:enfoque/domain/models/models.dart';
import 'package:enfoque/features/focus/view_model/exit_cost_view_model.dart';
import 'package:enfoque/features/focus/view_model/session_view_model.dart';
import 'package:enfoque/l10n/gen/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Sesión activa a pantalla completa. "Atrás" no la cierra.
class SessionScreen extends ConsumerWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final state = ref.watch(sessionViewModelProvider);

    ref.listen(sessionViewModelProvider.select((s) => s?.exitRequested), (
      _,
      requested,
    ) {
      if (requested ?? false) {
        ref.read(sessionViewModelProvider.notifier).exitRequestHandled();
        final id = ref.read(sessionViewModelProvider)?.session.id;
        if (id != null) unawaited(showExitCostSheet(context, id));
      }
    });

    if (state == null) {
      return Scaffold(body: LoadingState(label: l10n.commonLoading));
    }

    return PopScope(
      canPop: false,
      child: FocusScaffold(
        header: Padding(
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.lg,
            AppSpacing.md,
            AppSpacing.lg,
            AppSpacing.sm,
          ),
          child: Row(
            children: [
              const BrandMark(size: 32),
              const Gap(AppSpacing.md),
              Text(
                l10n.sessionTitle,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ],
          ),
        ),
        body: _SessionBody(state: state),
        bottom: FocusButton(
          label: l10n.sessionExitEarly,
          icon: Icons.close,
          variant: FocusButtonVariant.text,
          onPressed: () => showExitCostSheet(context, state.session.id),
        ),
      ),
    );
  }
}

class _SessionBody extends ConsumerWidget {
  const new({required this.state});

  final SessionUiState state;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final colors = context.semanticColors;
    final phase = state.phase;
    final session = state.session;
    final plan = session.plan;
    final resting = phase.kind == PomodoroPhaseKind.rest;
    final (stateLabel, phaseName, color) = switch (phase.kind) {
      PomodoroPhaseKind.rest => (
        phase.isLongBreak ? l10n.sessionPhaseLongRest : l10n.sessionStateRest,
        phase.isLongBreak ? l10n.sessionPhaseLongRest : l10n.sessionPhaseRest,
        colors.onBreak,
      ),
      _ => (l10n.sessionStateFocus, l10n.sessionPhaseFocus, colors.focus),
    };
    final blocking = !resting || state.strictness == Strictness.strict;
    final time = Formatters.countdown(phase.remainingInPhase);
    final elapsedMinutes =
        (plan.totalDuration - phase.remainingTotal).inMinutes;
    final cheers = [l10n.sessionCheer1, l10n.sessionCheer2, l10n.sessionCheer3];

    return Column(
      children: [
        Wrap(
          alignment: WrapAlignment.spaceBetween,
          spacing: AppSpacing.sm,
          runSpacing: AppSpacing.sm,
          children: [
            StatusPill(
              label: session.label ?? l10n.sessionNoSubject,
              color: session.label == null
                  ? AppColors.indigoLight
                  : Color.lerp(
                      AppColors.subject(session.label),
                      Colors.white,
                      0.35,
                    )!,
              dot: true,
              uppercase: true,
            ),
            StatusPill(
              label: blocking
                  ? l10n.sessionBlockingOn
                  : l10n.sessionBlockingPaused,
              color: blocking ? colors.focus : colors.onBreak,
              icon: blocking ? Icons.lock_outline : Icons.lock_open_outlined,
            ),
          ],
        ),
        const Gap(AppSpacing.xxl),
        FocusTimerRing(
          progress: phase.progress,
          timeText: time,
          label: stateLabel,
          color: color,
          glow: !resting,
          caption: plan.cycles > 1
              ? l10n.sessionCaption(phase.cycle, plan.cycles, phaseName)
              : phaseName,
          semanticsLabel: l10n.sessionTimerSemantics(stateLabel, time),
        ),
        const Gap(AppSpacing.lg),
        Text(
          l10n.sessionRemainingTotal(
            Formatters.countdown(phase.remainingTotal),
          ),
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        Text(
          l10n.sessionDistractions(state.distractionCount),
          style: theme.textTheme.bodyMedium?.copyWith(
            color: state.distractionCount > 0
                ? colors.away
                : theme.colorScheme.onSurfaceVariant,
          ),
        ),
        if (state.allowedApps.isNotEmpty) ...[
          const Gap(AppSpacing.xl),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.apps,
                size: AppSizes.iconSm,
                color: theme.colorScheme.onSurfaceVariant,
              ),
              const Gap(AppSpacing.sm),
              Text(
                l10n.sessionAllowedApps.toUpperCase(),
                style: theme.textTheme.labelLarge?.copyWith(letterSpacing: 1.2),
              ),
            ],
          ),
          const Gap(AppSpacing.md),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: AppSpacing.sm,
            runSpacing: AppSpacing.md,
            children: [
              for (final app in state.allowedApps)
                AppBubble(
                  label: app.label,
                  icon: state.icons[app.packageName],
                  onTap: () => ref
                      .read(sessionViewModelProvider.notifier)
                      .launchAllowedApp(app.packageName),
                ),
            ],
          ),
        ],
        const Gap(AppSpacing.xl),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.favorite_outline,
              size: AppSizes.iconSm,
              color: colors.focus,
            ),
            const Gap(AppSpacing.sm),
            Flexible(
              child: Text(
                cheers[(elapsedMinutes ~/ 5) % cheers.length],
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyMedium,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

/// Abre la hoja de "Salir antes" para la sesión [sessionId].
Future<void> showExitCostSheet(BuildContext context, int sessionId) =>
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      isDismissible: false,
      enableDrag: false,
      builder: (_) => _ExitCostSheetHost(sessionId: sessionId),
    );

class _ExitCostSheetHost extends ConsumerWidget {
  const new({required this.sessionId});

  final int sessionId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = exitCostViewModelProvider(sessionId);
    final state = ref.watch(provider);
    final vm = ref.read(provider.notifier);

    ref.listen(provider.select((s) => s.exited), (_, exited) {
      // El router puede haber quitado ya la hoja al ir al resumen.
      if (exited && (ModalRoute.of(context)?.isCurrent ?? false)) {
        Navigator.of(context).pop();
      }
    });

    return SingleChildScrollView(
      child: ExitCostSheet(
        step: state.step,
        secondsLeft: state.secondsLeft,
        reasonLength: state.reason.trim().length,
        minReasonLength: ExitCost.minReasonLength,
        busy: state.busy,
        onReasonChanged: vm.updateReason,
        onContinue: state.canContinue ? vm.next : null,
        onConfirmExit: () => unawaited(vm.confirmExit()),
        onKeepStudying: () => Navigator.of(context).pop(),
      ),
    );
  }
}
