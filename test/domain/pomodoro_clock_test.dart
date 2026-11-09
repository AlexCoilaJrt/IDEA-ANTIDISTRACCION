import 'package:enfoque/domain/logic/pomodoro_clock.dart';
import 'package:enfoque/domain/models/pomodoro_plan.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const plan = PomodoroPlan(focusMinutes: 25, breakMinutes: 5, cycles: 2);
  final start = DateTime(2026, 11, 9, 8);
  DateTime at(int minutes, [int seconds = 0]) =>
      start.add(Duration(minutes: minutes, seconds: seconds));

  group('PomodoroPlan', () {
    test('duración total sin descanso final', () {
      expect(plan.totalDuration, const Duration(minutes: 55));
      expect(plan.plannedFocusMinutes, 50);
    });

    test('el modo libre ignora ciclos y descanso', () {
      final free = PomodoroPlan.fromPreset(
        PomodoroPreset.free,
        cycles: 3,
        freeMinutes: 90,
      );
      expect(
        free,
        const PomodoroPlan(focusMinutes: 90, breakMinutes: 0, cycles: 1),
      );
    });
  });

  group('PomodoroClock.phaseAt', () {
    test('primer bloque de enfoque', () {
      final p = PomodoroClock.phaseAt(plan, start, at(10));
      expect(p.kind, PomodoroPhaseKind.focus);
      expect(p.cycle, 1);
      expect(p.remainingInPhase, const Duration(minutes: 15));
      expect(p.remainingTotal, const Duration(minutes: 45));
    });

    test('descanso', () {
      final p = PomodoroClock.phaseAt(plan, start, at(27));
      expect(p.kind, PomodoroPhaseKind.rest);
      expect(p.remainingInPhase, const Duration(minutes: 3));
    });

    test('segundo bloque', () {
      final p = PomodoroClock.phaseAt(plan, start, at(30));
      expect(p.kind, PomodoroPhaseKind.focus);
      expect(p.cycle, 2);
    });

    test('terminado', () {
      final p = PomodoroClock.phaseAt(plan, start, at(55));
      expect(p.kind, PomodoroPhaseKind.done);
      expect(p.remainingTotal, Duration.zero);
    });
  });

  group('PomodoroClock.focusedMinutesAt', () {
    test('no cuenta los descansos', () {
      expect(PomodoroClock.focusedMinutesAt(plan, start, at(10)), 10);
      expect(PomodoroClock.focusedMinutesAt(plan, start, at(28)), 25);
      expect(PomodoroClock.focusedMinutesAt(plan, start, at(40)), 35);
    });

    test('no pasa del total planeado', () {
      expect(PomodoroClock.focusedMinutesAt(plan, start, at(200)), 50);
    });

    test('redondea hacia abajo los minutos incompletos', () {
      expect(PomodoroClock.focusedMinutesAt(plan, start, at(4, 59)), 4);
    });
  });
}
