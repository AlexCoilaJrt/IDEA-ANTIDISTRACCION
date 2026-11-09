import 'dart:async';

import 'package:enfoque/app/theme/semantic_colors.dart';
import 'package:enfoque/app/theme/tokens.dart';
import 'package:enfoque/core/ui/ui.dart';
import 'package:enfoque/core/utils/formatters.dart';
import 'package:enfoque/domain/logic/exit_cost.dart';
import 'package:enfoque/domain/logic/pomodoro_clock.dart';
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
        body: _SessionBody(state: state),
        bottom: FocusButton(
          label: l10n.sessionExitEarly,
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
    final (label, color) = switch (phase.kind) {
      PomodoroPhaseKind.focus => (l10n.sessionPhaseFocus, colors.focus),
      PomodoroPhaseKind.rest => (l10n.sessionPhaseRest, colors.onBreak),
      PomodoroPhaseKind.done => (l10n.sessionPhaseDone, colors.focus),
    };
    final time = Formatters.countdown(phase.remainingInPhase);
    final plan = state.session.plan;

    return Column(
      children: [
        const Gap(AppSpacing.xxl),
        FocusTimerRing(
          progress: phase.progress,
          timeText: time,
          label: label,
          color: color,
          caption: plan.cycles > 1
              ? l10n.sessionCycle(phase.cycle, plan.cycles)
              : null,
          semanticsLabel: l10n.sessionTimerSemantics(label, time),
        ),
        const Gap(AppSpacing.xl),
        Text(
          l10n.sessionRemainingTotal(
            Formatters.countdown(phase.remainingTotal),
          ),
          style: theme.textTheme.bodyLarge,
        ),
        const Gap(AppSpacing.sm),
        Text(
          l10n.sessionDistractions(state.distractionCount),
          style: theme.textTheme.bodyMedium?.copyWith(
            color: state.distractionCount > 0
                ? colors.away
                : theme.colorScheme.onSurfaceVariant,
          ),
        ),
        if (state.allowedApps.isNotEmpty) ...[
          SectionTitle(l10n.sessionAllowedApps),
          Wrap(
            spacing: AppSpacing.sm,
            runSpacing: AppSpacing.sm,
            children: [
              for (final app in state.allowedApps)
                ActionChip(
                  label: Text(app.label),
                  onPressed: () => ref
                      .read(sessionViewModelProvider.notifier)
                      .launchAllowedApp(app.packageName),
                ),
            ],
          ),
        ],
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
