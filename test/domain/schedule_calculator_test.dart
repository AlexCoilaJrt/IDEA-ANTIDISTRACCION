import 'package:enfoque/domain/logic/schedule_calculator.dart';
import 'package:enfoque/domain/models/models.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // 9 nov 2026 es lunes.
  final monday = DateTime(2026, 11, 9);
  const math = StudyBlock(
    id: 1,
    weekdays: {DateTime.monday, DateTime.wednesday, DateTime.friday},
    startMinute: 18 * 60,
    cycles: 2,
    label: 'Matemáticas',
  );
  const sundayNight = StudyBlock(
    id: 2,
    weekdays: {DateTime.sunday},
    startMinute: 23 * 60 + 30,
    preset: PomodoroPreset.long,
  );

  test('9 nov 2026 es lunes', () {
    expect(monday.weekday, DateTime.monday);
  });

  group('StudyBlock', () {
    test('duración e inicio en una fecha', () {
      expect(math.duration, const Duration(minutes: 55));
      expect(math.startOn(monday), DateTime(2026, 11, 9, 18));
    });
  });

  group('occurrencesBetween', () {
    test('lista las ocurrencias de la semana en orden', () {
      final week = ScheduleCalculator.occurrencesBetween(
        [math, sundayNight],
        monday,
        DateTime(2026, 11, 16),
      );
      expect(week.map((o) => o.start), [
        DateTime(2026, 11, 9, 18),
        DateTime(2026, 11, 11, 18),
        DateTime(2026, 11, 13, 18),
        DateTime(2026, 11, 15, 23, 30),
      ]);
    });

    test('ignora los bloques pausados', () {
      final week = ScheduleCalculator.occurrencesBetween(
        [math.copyWith(enabled: false)],
        monday,
        DateTime(2026, 11, 16),
      );
      expect(week, isEmpty);
    });
  });

  group('nextOrCurrent', () {
    test('antes de la hora: la de hoy', () {
      final next = ScheduleCalculator.nextOrCurrent([
        math,
      ], monday.add(const Duration(hours: 9)));
      expect(next!.start, DateTime(2026, 11, 9, 18));
    });

    test('durante la sesión: la actual', () {
      final now = DateTime(2026, 11, 9, 18, 30);
      final current = ScheduleCalculator.nextOrCurrent([math], now)!;
      expect(current.isHappeningAt(now), isTrue);
    });

    test('después de la sesión: la siguiente (miércoles)', () {
      final next = ScheduleCalculator.nextOrCurrent([
        math,
      ], DateTime(2026, 11, 9, 19));
      expect(next!.start, DateTime(2026, 11, 11, 18));
    });

    test('una sesión que cruza la medianoche sigue siendo la actual', () {
      final now = DateTime(2026, 11, 16, 0, 10);
      final current = ScheduleCalculator.nextOrCurrent([sundayNight], now)!;
      expect(current.start, DateTime(2026, 11, 15, 23, 30));
    });

    test('sin bloques no hay próxima', () {
      expect(ScheduleCalculator.nextOrCurrent([], monday), isNull);
    });
  });

  group('overlapping', () {
    test('detecta cruces el mismo día', () {
      const other = StudyBlock(
        id: 3,
        weekdays: {DateTime.wednesday},
        startMinute: 18 * 60 + 30,
      );
      expect(ScheduleCalculator.overlapping(other, [math]), [math]);
    });

    test('bloques seguidos (uno termina cuando empieza el otro) no chocan', () {
      const after = StudyBlock(
        id: 3,
        weekdays: {DateTime.monday},
        startMinute: 18 * 60 + 55,
      );
      expect(ScheduleCalculator.overlapping(after, [math]), isEmpty);
    });

    test('otro día no choca', () {
      const tuesday = StudyBlock(
        id: 3,
        weekdays: {DateTime.tuesday},
        startMinute: 18 * 60,
      );
      expect(ScheduleCalculator.overlapping(tuesday, [math]), isEmpty);
    });

    test('domingo de noche que cruza al lunes temprano', () {
      const earlyMonday = StudyBlock(
        id: 3,
        weekdays: {DateTime.monday},
        startMinute: 0,
      );
      expect(ScheduleCalculator.overlapping(earlyMonday, [sundayNight]), [
        sundayNight,
      ]);
    });

    test('un bloque no choca consigo mismo al editarlo', () {
      expect(ScheduleCalculator.overlapping(math, [math]), isEmpty);
    });
  });
}
