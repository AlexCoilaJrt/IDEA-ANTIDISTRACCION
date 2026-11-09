import 'package:enfoque/domain/models/models.dart';

enum StatsPeriod { week, month, year }

/// Resumen del día para Inicio.
class DaySummary {
  const new({
    required this.minutes,
    required this.sessions,
    required this.earlyExits,
  });

  final int minutes;

  /// Sesiones completadas.
  final int sessions;
  final int earlyExits;
}

/// Una barra del gráfico: minutos por materia (`null` = sin materia).
class StatsBar {
  const new({required this.start, required this.bySubject});

  /// Día (semana/mes) o primer día del mes (año).
  final DateTime start;
  final Map<String?, int> bySubject;

  int get total => bySubject.values.fold(0, (a, b) => a + b);
}

/// Lógica pura de estadísticas a partir de las sesiones guardadas.
abstract final class StatsCalculator {
  static DateTime _date(DateTime t) => DateTime(t.year, t.month, t.day);

  static DateTime weekStart(DateTime t) =>
      DateTime(t.year, t.month, t.day - (t.weekday - 1));

  static Iterable<FocusSession> _finished(Iterable<FocusSession> s) =>
      s.where((x) => !x.isActive);

  static Iterable<FocusSession> _between(
    Iterable<FocusSession> s,
    DateTime from,
    DateTime to,
  ) => _finished(s)
      .where((x) => !x.startedAt.isBefore(from) && x.startedAt.isBefore(to));

  static Map<DateTime, int> minutesByDay(Iterable<FocusSession> sessions) {
    final result = <DateTime, int>{};
    for (final s in _finished(sessions)) {
      result.update(
        _date(s.startedAt),
        (v) => v + s.focusedMinutes,
        ifAbsent: () => s.focusedMinutes,
      );
    }
    return result;
  }

  static DaySummary today(Iterable<FocusSession> sessions, DateTime now) {
    final from = _date(now);
    final day = _between(sessions, from, from.add(const Duration(days: 1)));
    return DaySummary(
      minutes: day.fold(0, (a, s) => a + s.focusedMinutes),
      sessions: day.where((s) => s.outcome == SessionOutcome.completed).length,
      earlyExits: day.where((s) => s.earlyExit).length,
    );
  }

  /// Minutos de lunes a domingo de la semana de [now].
  static List<int> weekMinutes(Iterable<FocusSession> sessions, DateTime now) {
    final byDay = minutesByDay(sessions);
    final monday = weekStart(now);
    return [
      for (var i = 0; i < 7; i++)
        byDay[DateTime(monday.year, monday.month, monday.day + i)] ?? 0,
    ];
  }

  /// Rango `[from, to)` del período que contiene a [now].
  static (DateTime, DateTime) range(StatsPeriod period, DateTime now) =>
      switch (period) {
        StatsPeriod.week => _week(weekStart(now)),
        StatsPeriod.month => (
          DateTime(now.year, now.month),
          DateTime(now.year, now.month + 1),
        ),
        StatsPeriod.year => (DateTime(now.year), DateTime(now.year + 1)),
      };

  static (DateTime, DateTime) _week(DateTime monday) =>
      (monday, DateTime(monday.year, monday.month, monday.day + 7));

  /// El período anterior al que contiene a [now].
  static (DateTime, DateTime) previousRange(StatsPeriod period, DateTime now) {
    final (from, _) = range(period, now);
    return switch (period) {
      StatsPeriod.week => (DateTime(from.year, from.month, from.day - 7), from),
      StatsPeriod.month => (DateTime(from.year, from.month - 1), from),
      StatsPeriod.year => (DateTime(from.year - 1), from),
    };
  }

  static int totalMinutes(
    Iterable<FocusSession> sessions,
    DateTime from,
    DateTime to,
  ) => _between(sessions, from, to).fold(0, (a, s) => a + s.focusedMinutes);

  /// Cambio porcentual redondeado; `null` si no hay base para comparar.
  static int? percentChange(int current, int previous) {
    if (previous == 0) return null;
    return ((current - previous) * 100 / previous).round();
  }

  /// Índice del día con más minutos; `null` si todos son 0.
  static int? bestIndex(List<int> values) {
    var best = -1;
    var max = 0;
    for (var i = 0; i < values.length; i++) {
      if (values[i] > max) {
        max = values[i];
        best = i;
      }
    }
    return best < 0 ? null : best;
  }

  /// Minutos por materia, de mayor a menor (`null` = sin materia).
  static List<MapEntry<String?, int>> bySubject(
    Iterable<FocusSession> sessions,
    DateTime from,
    DateTime to,
  ) {
    final map = <String?, int>{};
    for (final s in _between(sessions, from, to)) {
      if (s.focusedMinutes == 0) continue;
      final key = (s.label?.trim().isEmpty ?? true) ? null : s.label!.trim();
      map.update(
        key,
        (v) => v + s.focusedMinutes,
        ifAbsent: () => s.focusedMinutes,
      );
    }
    return map.entries.toList()..sort((a, b) => b.value.compareTo(a.value));
  }

  /// Porcentaje de sesiones terminadas a tiempo en el rango.
  static int? completionRate(
    Iterable<FocusSession> sessions,
    DateTime from,
    DateTime to,
  ) {
    final finished = _between(sessions, from, to).toList();
    if (finished.isEmpty) return null;
    final done = finished
        .where((s) => s.outcome == SessionOutcome.completed)
        .length;
    return (done * 100 / finished.length).round();
  }

  /// Barras del gráfico: por día (semana y mes) o por mes (año).
  static List<StatsBar> bars(
    StatsPeriod period,
    Iterable<FocusSession> sessions,
    DateTime now,
  ) {
    final (from, to) = range(period, now);
    final starts = <DateTime>[];
    if (period == StatsPeriod.year) {
      for (var m = 1; m <= 12; m++) {
        starts.add(DateTime(now.year, m));
      }
    } else {
      for (
        var d = from;
        d.isBefore(to);
        d = DateTime(d.year, d.month, d.day + 1)
      ) {
        starts.add(d);
      }
    }
    return [
      for (var i = 0; i < starts.length; i++)
        StatsBar(
          start: starts[i],
          bySubject: {
            for (final e in bySubject(
              sessions,
              starts[i],
              i + 1 < starts.length ? starts[i + 1] : to,
            ))
              e.key: e.value,
          },
        ),
    ];
  }
}
