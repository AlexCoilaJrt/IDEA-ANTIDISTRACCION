import 'package:enfoque/domain/models/pomodoro_plan.dart';

enum PomodoroPhaseKind { focus, rest, done }

/// Fase de la sesión en un instante.
class PomodoroPhase {
  const new({
    required this.kind,
    required this.cycle,
    required this.remainingInPhase,
    required this.remainingTotal,
    required this.phaseLength,
  });

  final PomodoroPhaseKind kind;

  /// Bloque actual, empezando en 1.
  final int cycle;
  final Duration remainingInPhase;
  final Duration remainingTotal;
  final Duration phaseLength;

  /// Progreso de la fase actual entre 0 y 1.
  double get progress {
    if (phaseLength == Duration.zero) return 1;
    final done = phaseLength - remainingInPhase;
    return (done.inMilliseconds / phaseLength.inMilliseconds).clamp(0.0, 1.0);
  }
}

/// Lógica Dart pura del Pomodoro. Debe coincidir con `PomodoroClock` en Kotlin.
abstract final class PomodoroClock {
  static PomodoroPhase phaseAt(
    PomodoroPlan plan,
    DateTime startedAt,
    DateTime now,
  ) {
    final total = plan.totalDuration;
    var elapsed = now.difference(startedAt);
    if (elapsed.isNegative) elapsed = Duration.zero;
    final focus = Duration(minutes: plan.focusMinutes);
    if (elapsed >= total) {
      return PomodoroPhase(
        kind: PomodoroPhaseKind.done,
        cycle: plan.cycles,
        remainingInPhase: Duration.zero,
        remainingTotal: Duration.zero,
        phaseLength: focus,
      );
    }
    final rest = Duration(minutes: plan.breakMinutes);
    final cycleLength = focus + rest;
    final index = elapsed.inMilliseconds ~/ cycleLength.inMilliseconds;
    final within = Duration(
      milliseconds: elapsed.inMilliseconds % cycleLength.inMilliseconds,
    );
    final inFocus = within < focus;
    return PomodoroPhase(
      kind: inFocus ? PomodoroPhaseKind.focus : PomodoroPhaseKind.rest,
      cycle: index + 1,
      remainingInPhase: inFocus ? focus - within : cycleLength - within,
      remainingTotal: total - elapsed,
      phaseLength: inFocus ? focus : rest,
    );
  }

  /// Minutos de enfoque completos transcurridos hasta [now] (sin descansos).
  static int focusedMinutesAt(
    PomodoroPlan plan,
    DateTime startedAt,
    DateTime now,
  ) {
    var elapsed = now.difference(startedAt);
    if (elapsed.isNegative) return 0;
    final total = plan.totalDuration;
    if (elapsed > total) elapsed = total;
    final focus = Duration(minutes: plan.focusMinutes);
    final cycleLength = focus + Duration(minutes: plan.breakMinutes);
    final fullCycles = elapsed.inMilliseconds ~/ cycleLength.inMilliseconds;
    final within = Duration(
      milliseconds: elapsed.inMilliseconds % cycleLength.inMilliseconds,
    );
    final partial = within < focus ? within : focus;
    final focused = focus * fullCycles + partial;
    return focused.inMinutes.clamp(0, plan.plannedFocusMinutes);
  }
}
