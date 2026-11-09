import 'package:enfoque/domain/logic/stats_calculator.dart';
import 'package:enfoque/domain/models/models.dart';
import 'package:flutter_test/flutter_test.dart';

FocusSession s(
  DateTime start,
  int minutes, {
  SessionOutcome outcome = SessionOutcome.completed,
  String? label,
}) => FocusSession(
  id: start.millisecondsSinceEpoch,
  startedAt: start,
  plan: const PomodoroPlan(focusMinutes: 25, breakMinutes: 5, cycles: 1),
  outcome: outcome,
  focusedMinutes: minutes,
  label: label,
);

void main() {
  // Miércoles 11 nov 2026.
  final now = DateTime(2026, 11, 11, 20);
  final sessions = [
    s(DateTime(2026, 11, 9, 8), 50, label: 'Cálculo'),
    s(DateTime(2026, 11, 10, 9), 30, label: 'Física'),
    s(DateTime(2026, 11, 11, 7), 25, label: 'Cálculo'),
    s(DateTime(2026, 11, 11, 18), 10, outcome: SessionOutcome.earlyExit),
    // Semana pasada.
    s(DateTime(2026, 11, 3, 8), 50),
    // Activa: no cuenta.
    s(DateTime(2026, 11, 11, 19), 0, outcome: SessionOutcome.active),
  ];

  test('resumen de hoy', () {
    final today = StatsCalculator.today(sessions, now);
    expect(today.minutes, 35);
    expect(today.sessions, 1);
    expect(today.earlyExits, 1);
  });

  test('minutos de lunes a domingo de esta semana', () {
    expect(StatsCalculator.weekMinutes(sessions, now), [
      50,
      30,
      35,
      0,
      0,
      0,
      0,
    ]);
  });

  test('cambio frente a la semana pasada y mejor día', () {
    final (from, to) = StatsCalculator.range(StatsPeriod.week, now);
    final (pFrom, pTo) = StatsCalculator.previousRange(StatsPeriod.week, now);
    expect(from, DateTime(2026, 11, 9));
    expect(to, DateTime(2026, 11, 16));
    expect(pFrom, DateTime(2026, 11, 2));
    final current = StatsCalculator.totalMinutes(sessions, from, to);
    final previous = StatsCalculator.totalMinutes(sessions, pFrom, pTo);
    expect(current, 115);
    expect(previous, 50);
    expect(StatsCalculator.percentChange(current, previous), 130);
    expect(StatsCalculator.percentChange(10, 0), isNull);
    expect(StatsCalculator.bestIndex([50, 30, 35, 0, 0, 0, 0]), 0);
    expect(StatsCalculator.bestIndex([0, 0]), isNull);
  });

  test('por materia, de mayor a menor, con "sin materia"', () {
    final (from, to) = StatsCalculator.range(StatsPeriod.week, now);
    final subjects = StatsCalculator.bySubject(sessions, from, to);
    expect(subjects.map((e) => e.key), ['Cálculo', 'Física', null]);
    expect(subjects.first.value, 75);
  });

  test('tasa de sesiones completadas', () {
    final (from, to) = StatsCalculator.range(StatsPeriod.week, now);
    expect(StatsCalculator.completionRate(sessions, from, to), 75);
  });

  test('barras: 7 en la semana, días del mes y 12 en el año', () {
    expect(StatsCalculator.bars(StatsPeriod.week, sessions, now), hasLength(7));
    expect(
      StatsCalculator.bars(StatsPeriod.month, sessions, now),
      hasLength(30),
    );
    final year = StatsCalculator.bars(StatsPeriod.year, sessions, now);
    expect(year, hasLength(12));
    expect(year[10].total, 165);
    final week = StatsCalculator.bars(StatsPeriod.week, sessions, now);
    expect(week[0].bySubject, {'Cálculo': 50});
  });

  test('una semana que empieza el mes anterior', () {
    // Domingo 1 nov 2026: la semana empezó el lunes 26 oct.
    expect(StatsCalculator.range(StatsPeriod.week, DateTime(2026, 11)), (
      DateTime(2026, 10, 26),
      DateTime(2026, 11, 2),
    ));
  });

  test('el mes y el año cruzan bien el fin de año', () {
    final dec = DateTime(2026, 12, 31);
    expect(StatsCalculator.range(StatsPeriod.month, dec), (
      DateTime(2026, 12),
      DateTime(2027),
    ));
    expect(
      StatsCalculator.previousRange(StatsPeriod.month, DateTime(2027, 1, 5)),
      (DateTime(2026, 12), DateTime(2027)),
    );
  });
}
