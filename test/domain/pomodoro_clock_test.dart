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

  group('descanso largo cada 4 bloques', () {
    final classic = PomodoroPlan.fromPreset(PomodoroPreset.classic, cycles: 6);

    test('el preset clásico usa 15 min y el de 50/10 usa 30 min', () {
      expect(classic.longBreakMinutes, 15);
      expect(
        PomodoroPlan.fromPreset(PomodoroPreset.long, cycles: 5).breakAfter(4),
        30,
      );
    });

    test('solo el descanso tras el bloque 4 es largo', () {
      expect(classic.breakAfter(3), 5);
      expect(classic.breakAfter(4), 15);
      expect(classic.breakAfter(5), 5);
      expect(classic.hasLongBreak, isTrue);
      // 6 x 25 + 4 x 5 + 15 = 185 min.
      expect(classic.totalDuration, const Duration(minutes: 185));
    });

    test('con 4 bloques o menos no hay descanso largo', () {
      final four = PomodoroPlan.fromPreset(PomodoroPreset.classic, cycles: 4);
      expect(four.hasLongBreak, isFalse);
      expect(four.totalDuration, const Duration(minutes: 115));
    });

    test('phaseAt reconoce el descanso largo', () {
      // Bloque 4 termina en 4 x 25 + 3 x 5 = 115 min.
      final p = PomodoroClock.phaseAt(classic, start, at(120));
      expect(p.kind, PomodoroPhaseKind.rest);
      expect(p.isLongBreak, isTrue);
      expect(p.cycle, 4);
      expect(p.remainingInPhase, const Duration(minutes: 10));
      final next = PomodoroClock.phaseAt(classic, start, at(130));
      expect(next.kind, PomodoroPhaseKind.focus);
      expect(next.cycle, 5);
    });

    test('focusedMinutesAt no cuenta el descanso largo', () {
      expect(PomodoroClock.focusedMinutesAt(classic, start, at(130)), 100);
      expect(PomodoroClock.focusedMinutesAt(classic, start, at(140)), 110);
    });

    test('los planes viejos sin descanso largo no cambian', () {
      expect(plan.longBreakMinutes, 0);
      expect(
        const PomodoroPlan(
          focusMinutes: 25,
          breakMinutes: 5,
          cycles: 6,
        ).totalDuration,
        const Duration(minutes: 175),
      );
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
