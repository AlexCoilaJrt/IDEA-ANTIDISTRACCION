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
    this.isLongBreak = false,
  });

  final PomodoroPhaseKind kind;

  /// Bloque actual, empezando en 1.
  final int cycle;
  final Duration remainingInPhase;
  final Duration remainingTotal;
  final Duration phaseLength;

  /// Si es un descanso, si es el largo (cada 4 bloques).
  final bool isLongBreak;

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
    if (elapsed >= total) {
      return PomodoroPhase(
        kind: PomodoroPhaseKind.done,
        cycle: plan.cycles,
        remainingInPhase: Duration.zero,
        remainingTotal: Duration.zero,
        phaseLength: Duration(minutes: plan.focusMinutes),
      );
    }
    final segment = plan.segments.firstWhere((s) => elapsed < s.end);
    return PomodoroPhase(
      kind: segment.kind == SegmentKind.focus
          ? PomodoroPhaseKind.focus
          : PomodoroPhaseKind.rest,
      isLongBreak: segment.kind == SegmentKind.longBreak,
      cycle: segment.cycle,
      remainingInPhase: segment.end - elapsed,
      remainingTotal: total - elapsed,
      phaseLength: segment.length,
    );
  }

  /// Minutos de enfoque completos transcurridos hasta [now] (sin descansos).
  static int focusedMinutesAt(
    PomodoroPlan plan,
    DateTime startedAt,
    DateTime now,
  ) {
    final elapsed = now.difference(startedAt);
    if (elapsed.isNegative) return 0;
    var focused = Duration.zero;
    for (final s in plan.segments) {
      if (s.kind != SegmentKind.focus || elapsed <= s.start) continue;
      final inSegment = elapsed - s.start;
      focused += inSegment < s.length ? inSegment : s.length;
    }
    return focused.inMinutes.clamp(0, plan.plannedFocusMinutes);
  }
}
