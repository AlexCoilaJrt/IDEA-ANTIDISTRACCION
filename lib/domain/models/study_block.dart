import 'package:enfoque/domain/models/pomodoro_plan.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'study_block.freezed.dart';

/// Bloque fijo del horario semanal de estudio. Ej.: lunes, miércoles y
/// viernes a las 18:00, 2 bloques de 25/5, "Matemáticas".
@freezed
abstract class StudyBlock with _$StudyBlock {
  const factory({
    /// Días con `DateTime.monday` (1) a `DateTime.sunday` (7).
    required Set<int> weekdays,

    /// Minutos desde la medianoche (18:00 = 1080).
    required int startMinute,
    @Default(0) int id,
    @Default(PomodoroPreset.classic) PomodoroPreset preset,
    @Default(1) int cycles,
    @Default(45) int freeMinutes,

    /// Materia o tema (opcional).
    String? label,
    @Default(true) bool enabled,
  }) = _StudyBlock;

  const new _();

  PomodoroPlan get plan =>
      PomodoroPlan.fromPreset(preset, cycles: cycles, freeMinutes: freeMinutes);

  Duration get duration => plan.totalDuration;

  /// Inicio en una fecha dada (respeta cambios de hora del calendario).
  DateTime startOn(DateTime day) => DateTime(
    day.year,
    day.month,
    day.day,
    startMinute ~/ 60,
    startMinute % 60,
  );
}

/// Una ocurrencia concreta de un bloque en una fecha.
@freezed
abstract class ScheduledOccurrence with _$ScheduledOccurrence {
  const factory({required StudyBlock block, required DateTime start}) =
      _ScheduledOccurrence;

  const new _();

  DateTime get end => start.add(block.duration);

  bool isHappeningAt(DateTime t) => !t.isBefore(start) && t.isBefore(end);
}
