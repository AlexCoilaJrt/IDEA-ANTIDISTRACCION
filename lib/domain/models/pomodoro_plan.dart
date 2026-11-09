import 'package:freezed_annotation/freezed_annotation.dart';

part 'pomodoro_plan.freezed.dart';

/// Preajustes de Pomodoro (CLAUDE.md §7).
enum PomodoroPreset {
  classic(focusMinutes: 25, breakMinutes: 5),
  long(focusMinutes: 50, breakMinutes: 10),
  free(focusMinutes: 45, breakMinutes: 0);

  new({required this.focusMinutes, required this.breakMinutes});

  final int focusMinutes;
  final int breakMinutes;
}

/// Plan de una sesión: [cycles] bloques de [focusMinutes] separados por
/// descansos de [breakMinutes]. No hay descanso después del último bloque.
@freezed
abstract class PomodoroPlan with _$PomodoroPlan {
  const factory({
    required int focusMinutes,
    required int breakMinutes,
    required int cycles,
  }) = _PomodoroPlan;

  const new _();

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
      cycles: cycles,
    );
  }

  /// Minutos de enfoque planeados (sin descansos).
  int get plannedFocusMinutes => focusMinutes * cycles;

  /// Duración total, descansos incluidos.
  Duration get totalDuration =>
      Duration(minutes: focusMinutes * cycles + breakMinutes * (cycles - 1));
}
