import 'package:enfoque/domain/logic/streak_calculator.dart';
import 'package:enfoque/domain/models/models.dart';
import 'package:flutter_test/flutter_test.dart';

DayFocus day(int d, int minutes, {bool early = false}) => DayFocus(
  day: DateTime(2026, 11, d),
  focusedMinutes: minutes,
  hadEarlyExit: early,
);

void main() {
  const goal = 25;
  final today = DateTime(2026, 11, 9, 18, 30);

  group('StreakCalculator.qualifies', () {
    test('cuenta con la meta cumplida y sin salidas anticipadas', () {
      expect(StreakCalculator.qualifies(day(9, 25), goal), isTrue);
    });

    test('no cuenta si no llega a la meta', () {
      expect(StreakCalculator.qualifies(day(9, 24), goal), isFalse);
    });

    test('no cuenta si hubo una salida anticipada', () {
      expect(
        StreakCalculator.qualifies(day(9, 120, early: true), goal),
        isFalse,
      );
    });
  });

  group('StreakCalculator.summarize', () {
    test('sin días da cero', () {
      final s = StreakCalculator.summarize([], today: today, goalMinutes: goal);
      expect(s, StreakSummary.empty);
    });

    test('racha que incluye hoy', () {
      final s = StreakCalculator.summarize(
        [day(7, 30), day(8, 40), day(9, 25)],
        today: today,
        goalMinutes: goal,
      );
      expect(s.current, 3);
      expect(s.best, 3);
      expect(s.todayQualified, isTrue);
    });

    test('hoy todavía no cuenta: la racha de ayer sigue viva', () {
      final s = StreakCalculator.summarize(
        [day(7, 30), day(8, 40), day(9, 10)],
        today: today,
        goalMinutes: goal,
      );
      expect(s.current, 2);
      expect(s.todayQualified, isFalse);
    });

    test('un día saltado corta la racha', () {
      final s = StreakCalculator.summarize(
        [day(5, 30), day(6, 30), day(7, 30), day(9, 30)],
        today: today,
        goalMinutes: goal,
      );
      expect(s.current, 1);
      expect(s.best, 3);
    });

    test('si ayer no contó y hoy tampoco, la racha es cero', () {
      final s = StreakCalculator.summarize(
        [day(6, 30), day(7, 30)],
        today: today,
        goalMinutes: goal,
      );
      expect(s.current, 0);
      expect(s.best, 2);
    });

    test('una salida anticipada hoy rompe la racha de hoy', () {
      final s = StreakCalculator.summarize(
        [day(8, 30), day(9, 60, early: true)],
        today: today,
        goalMinutes: goal,
      );
      expect(s.todayQualified, isFalse);
      expect(s.current, 1);
    });

    test('ignora días futuros y el orden de entrada', () {
      final s = StreakCalculator.summarize(
        [day(9, 30), day(10, 30), day(8, 30)],
        today: today,
        goalMinutes: goal,
      );
      expect(s.current, 2);
    });

    test('funciona al cruzar un cambio de mes', () {
      final s = StreakCalculator.summarize(
        [
          DayFocus(
            day: DateTime(2026, 10, 31),
            focusedMinutes: 30,
            hadEarlyExit: false,
          ),
          DayFocus(
            day: DateTime(2026, 11),
            focusedMinutes: 30,
            hadEarlyExit: false,
          ),
        ],
        today: DateTime(2026, 11, 1, 9),
        goalMinutes: goal,
      );
      expect(s.current, 2);
    });
  });

  group('StreakCalculator.aggregate', () {
    test('agrupa sesiones del día y detecta salidas anticipadas', () {
      final start = DateTime(2026, 11, 9, 8);
      final sessions = [
        FocusSession(
          id: 1,
          startedAt: start,
          plan: const PomodoroPlan(
            focusMinutes: 25,
            breakMinutes: 5,
            cycles: 1,
          ),
          outcome: SessionOutcome.completed,
          focusedMinutes: 25,
        ),
        FocusSession(
          id: 2,
          startedAt: start.add(const Duration(hours: 3)),
          plan: const PomodoroPlan(
            focusMinutes: 25,
            breakMinutes: 5,
            cycles: 1,
          ),
          outcome: SessionOutcome.earlyExit,
          focusedMinutes: 10,
        ),
      ];
      final result = StreakCalculator.aggregate(
        DateTime(2026, 11, 9),
        sessions,
      );
      expect(result.focusedMinutes, 35);
      expect(result.hadEarlyExit, isTrue);
    });
  });
}
