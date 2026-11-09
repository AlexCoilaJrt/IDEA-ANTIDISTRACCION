import 'package:freezed_annotation/freezed_annotation.dart';

part 'pomodoro_plan.freezed.dart';

/// Preajustes de Pomodoro (CLAUDE.md §7). El descanso largo dura el triple
/// del corto y llega cada [PomodoroPlan.longBreakEvery] bloques.
enum PomodoroPreset {
  classic(focusMinutes: 25, breakMinutes: 5, longBreakMinutes: 15),
  long(focusMinutes: 50, breakMinutes: 10, longBreakMinutes: 30),
  free(focusMinutes: 45, breakMinutes: 0, longBreakMinutes: 0);

  new({
    required this.focusMinutes,
    required this.breakMinutes,
    required this.longBreakMinutes,
  });

  final int focusMinutes;
  final int breakMinutes;
  final int longBreakMinutes;
}

/// Un tramo de la sesión: enfoque o descanso.
enum SegmentKind { focus, shortBreak, longBreak }

class PomodoroSegment {
  const new({
    required this.kind,
    required this.cycle,
    required this.start,
    required this.length,
  });

  final SegmentKind kind;

  /// Bloque al que pertenece (un descanso pertenece al bloque anterior).
  final int cycle;

  /// Desde el inicio de la sesión.
  final Duration start;
  final Duration length;

  Duration get end => start + length;
}

/// Plan de una sesión: [cycles] bloques de [focusMinutes]. Entre bloques hay
/// un descanso de [breakMinutes], salvo cada [longBreakEvery] bloques, que es
/// de [longBreakMinutes]. No hay descanso después del último bloque.
@freezed
abstract class PomodoroPlan with _$PomodoroPlan {
  const factory({
    required int focusMinutes,
    required int breakMinutes,
    required int cycles,
    @Default(0) int longBreakMinutes,
  }) = _PomodoroPlan;

  factory fromPreset(
    PomodoroPreset preset, {
    int cycles = 1,
    int? freeMinutes,
  }) {
    if (preset == PomodoroPreset.free) {
      return PomodoroPlan(
        focusMinutes: freeMinutes ?? preset.focusMinutes,
        breakMinutes: 0,
        cycles: 1,
      );
    }
    return PomodoroPlan(
      focusMinutes: preset.focusMinutes,
      breakMinutes: preset.breakMinutes,
      longBreakMinutes: preset.longBreakMinutes,
      cycles: cycles,
    );
  }

  const new _();

  /// Cada cuántos bloques llega el descanso largo (igual en Kotlin).
  static const longBreakEvery = 4;

  /// Minutos de enfoque planeados (sin descansos).
  int get plannedFocusMinutes => focusMinutes * cycles;

  /// `true` si el descanso después del bloque [cycle] (desde 1) es largo.
  bool isLongBreakAfter(int cycle) =>
      longBreakMinutes > 0 && cycle % longBreakEvery == 0;

  /// Minutos del descanso después del bloque [cycle] (desde 1).
  int breakAfter(int cycle) =>
      isLongBreakAfter(cycle) ? longBreakMinutes : breakMinutes;

  /// Tramos de la sesión en orden (los descansos de 0 min no aparecen).
  List<PomodoroSegment> get segments {
    final result = <PomodoroSegment>[];
    var t = Duration.zero;
    for (var c = 1; c <= cycles; c++) {
      final focus = Duration(minutes: focusMinutes);
      result.add(
        PomodoroSegment(
          kind: SegmentKind.focus,
          cycle: c,
          start: t,
          length: focus,
        ),
      );
      t += focus;
      if (c == cycles) break;
      final rest = Duration(minutes: breakAfter(c));
      if (rest > Duration.zero) {
        result.add(
          PomodoroSegment(
            kind: isLongBreakAfter(c)
                ? SegmentKind.longBreak
                : SegmentKind.shortBreak,
            cycle: c,
            start: t,
            length: rest,
          ),
        );
        t += rest;
      }
    }
    return result;
  }

  /// Duración total, descansos incluidos.
  Duration get totalDuration {
    final s = segments;
    return s.isEmpty ? Duration.zero : s.last.end;
  }

  /// Si la sesión llega a tener un descanso largo.
  bool get hasLongBreak => segments.any((s) => s.kind == SegmentKind.longBreak);
}
