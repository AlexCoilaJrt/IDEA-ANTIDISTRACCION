import 'package:enfoque/domain/models/study_block.dart';

/// Lógica pura del horario semanal.
abstract final class ScheduleCalculator {
  static const int _minutesPerDay = 24 * 60;
  static const int _minutesPerWeek = 7 * _minutesPerDay;

  /// Aviso previo antes de cada sesión (igual que en Kotlin).
  static const reminderLead = Duration(minutes: 10);

  /// Ocurrencias de los bloques activos que empiezan en `[from, to)`,
  /// ordenadas por hora.
  static List<ScheduledOccurrence> occurrencesBetween(
    Iterable<StudyBlock> blocks,
    DateTime from,
    DateTime to,
  ) {
    final result = <ScheduledOccurrence>[];
    var day = DateTime(from.year, from.month, from.day);
    while (day.isBefore(to)) {
      for (final b in blocks) {
        if (!b.enabled || !b.weekdays.contains(day.weekday)) continue;
        final start = b.startOn(day);
        if (!start.isBefore(from) && start.isBefore(to)) {
          result.add(ScheduledOccurrence(block: b, start: start));
        }
      }
      day = DateTime(day.year, day.month, day.day + 1);
    }
    result.sort((a, b) => a.start.compareTo(b.start));
    return result;
  }

  /// La sesión en curso o la próxima (dentro de 8 días); `null` si no hay.
  static ScheduledOccurrence? nextOrCurrent(
    Iterable<StudyBlock> blocks,
    DateTime now,
  ) {
    // Empieza un día antes para incluir una sesión que cruza la medianoche.
    final from = DateTime(now.year, now.month, now.day - 1);
    final to = DateTime(now.year, now.month, now.day + 8);
    for (final o in occurrencesBetween(blocks, from, to)) {
      if (o.end.isAfter(now)) return o;
    }
    return null;
  }

  /// Bloques de [others] que se cruzan con [block] en algún día.
  static List<StudyBlock> overlapping(
    StudyBlock block,
    Iterable<StudyBlock> others,
  ) => [
    for (final other in others)
      if (other.id != block.id && _overlaps(block, other)) other,
  ];

  static bool _overlaps(StudyBlock a, StudyBlock b) {
    for (final (aStart, aEnd) in _weekIntervals(a)) {
      for (final (bStart, bEnd) in _weekIntervals(b)) {
        // También compara contra la semana siguiente/anterior por si un bloque
        // del domingo cruza al lunes.
        for (final shift in const [-_minutesPerWeek, 0, _minutesPerWeek]) {
          if (aStart < bEnd + shift && bStart + shift < aEnd) return true;
        }
      }
    }
    return false;
  }

  static Iterable<(int, int)> _weekIntervals(StudyBlock b) sync* {
    final length = b.duration.inMinutes;
    for (final d in b.weekdays) {
      final start = (d - 1) * _minutesPerDay + b.startMinute;
      yield (start, start + length);
    }
  }
}
