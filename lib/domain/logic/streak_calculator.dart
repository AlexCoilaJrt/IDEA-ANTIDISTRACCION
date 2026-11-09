import 'package:enfoque/domain/models/models.dart';

/// Reglas de la racha (CLAUDE.md §7): un día cuenta con al menos la meta de
/// minutos y sin salidas anticipadas.
abstract final class StreakCalculator {
  static DateTime dateOnly(DateTime t) => DateTime(t.year, t.month, t.day);

  static bool qualifies(DayFocus day, int goalMinutes) =>
      !day.hadEarlyExit && day.focusedMinutes >= goalMinutes;

  /// Resume el día [day] a partir de sus sesiones terminadas.
  static DayFocus aggregate(DateTime day, Iterable<FocusSession> sessions) {
    var minutes = 0;
    var early = false;
    for (final s in sessions) {
      if (s.isActive) continue;
      minutes += s.focusedMinutes;
      early = early || s.earlyExit;
    }
    return DayFocus(
      day: dateOnly(day),
      focusedMinutes: minutes,
      hadEarlyExit: early,
    );
  }

  static StreakSummary summarize(
    Iterable<DayFocus> days, {
    required DateTime today,
    required int goalMinutes,
  }) {
    final todayDate = dateOnly(today);
    final qualified = <DateTime>{
      for (final d in days)
        if (qualifies(d, goalMinutes) && !dateOnly(d.day).isAfter(todayDate))
          dateOnly(d.day),
    };
    if (qualified.isEmpty) return StreakSummary.empty;

    final todayQualified = qualified.contains(todayDate);

    // Racha actual: termina hoy, o ayer si hoy todavía no cuenta.
    var cursor = todayQualified ? todayDate : _previous(todayDate);
    var current = 0;
    while (qualified.contains(cursor)) {
      current++;
      cursor = _previous(cursor);
    }

    // Mejor racha histórica.
    final sorted = qualified.toList()..sort();
    var best = 0;
    var run = 0;
    DateTime? last;
    for (final d in sorted) {
      run = (last != null && _previous(d) == last) ? run + 1 : 1;
      if (run > best) best = run;
      last = d;
    }

    return StreakSummary(
      current: current,
      best: best,
      todayQualified: todayQualified,
    );
  }

  /// Día anterior respetando el calendario (no restar 24 h: cambio de hora).
  static DateTime _previous(DateTime d) => DateTime(d.year, d.month, d.day - 1);
}
