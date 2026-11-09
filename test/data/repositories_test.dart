import 'package:drift/drift.dart' show driftRuntimeOptions;
import 'package:drift/native.dart';
import 'package:enfoque/data/repositories/session_repository.dart';
import 'package:enfoque/data/repositories/settings_repository.dart';
import 'package:enfoque/data/repositories/streak_repository.dart';
import 'package:enfoque/data/services/db/app_database.dart';
import 'package:enfoque/domain/models/models.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late AppDatabase db;

  setUpAll(() => driftRuntimeOptions.dontWarnAboutMultipleDatabases = true);
  setUp(() => db = AppDatabase(NativeDatabase.memory()));
  tearDown(() => db.close());

  group('SessionRepositoryImpl', () {
    const plan = PomodoroPlan(focusMinutes: 25, breakMinutes: 5, cycles: 2);
    final start = DateTime(2026, 11, 9, 9);

    test('crea, lee la activa y la completa con distracciones', () async {
      final repo = SessionRepositoryImpl(db);
      final created = (await repo.create(
        startedAt: start,
        plan: plan,
      )).valueOrNull!;
      expect(created.plan, plan);
      expect(created.plannedMinutes, 50);
      expect((await repo.active()).valueOrNull?.id, created.id);

      await repo.recordExitLevel(created.id, 2);
      await repo.recordExitLevel(created.id, 1);

      final done = (await repo.complete(
        created.id,
        outcome: SessionOutcome.earlyExit,
        endedAt: start.add(const Duration(minutes: 12)),
        focusedMinutes: 12,
        exitReason: 'r',
        distractions: [
          DistractionEvent(packageName: 'a', at: start),
          DistractionEvent(packageName: 'b', at: start),
        ],
      )).valueOrNull!;

      expect(done.outcome, SessionOutcome.earlyExit);
      expect(done.exitLevel, 2);
      expect(done.distractionCount, 2);
      expect((await repo.active()).valueOrNull, isNull);
      expect(await db.select(db.distractionEvents).get(), hasLength(2));
    });

    test('between y watchSince filtran por fecha de inicio', () async {
      final repo = SessionRepositoryImpl(db);
      await repo.create(startedAt: start, plan: plan);
      await repo.create(
        startedAt: start.add(const Duration(days: 1)),
        plan: plan,
      );
      final today = (await repo.between(
        DateTime(2026, 11, 9),
        DateTime(2026, 11, 10),
      )).valueOrNull!;
      expect(today, hasLength(1));
      final since = await repo.watchSince(DateTime(2026, 11, 10)).first;
      expect(since, hasLength(1));
    });

    test('borrar una sesión borra sus distracciones', () async {
      final repo = SessionRepositoryImpl(db);
      final s = (await repo.create(startedAt: start, plan: plan)).valueOrNull!;
      await repo.complete(
        s.id,
        outcome: SessionOutcome.completed,
        endedAt: start,
        focusedMinutes: 1,
        distractions: [DistractionEvent(packageName: 'a', at: start)],
      );
      await repo.delete(s.id);
      expect(await db.select(db.distractionEvents).get(), isEmpty);
    });
  });

  test('SettingsRepositoryImpl guarda y lee todos los campos', () async {
    final repo = SettingsRepositoryImpl(db);
    expect((await repo.load()).valueOrNull, const AppSettings());
    const changed = AppSettings(
      dailyGoalMinutes: 60,
      preset: PomodoroPreset.free,
      freeMinutes: 90,
      cycles: 3,
      strictness: Strictness.strict,
      themeMode: AppThemeMode.light,
      onboardingDone: true,
      allowlistSeeded: true,
    );
    await repo.save(changed);
    expect((await repo.load()).valueOrNull, changed);
    expect(await repo.watch().first, changed);
  });

  test('StreakRepositoryImpl reemplaza el resumen del día', () async {
    final repo = StreakRepositoryImpl(db);
    final day = DateTime(2026, 11, 9);
    await repo.upsertDay(
      DayFocus(day: day, focusedMinutes: 10, hadEarlyExit: false),
    );
    await repo.upsertDay(
      DayFocus(day: day, focusedMinutes: 35, hadEarlyExit: true),
    );
    final days = await repo.watchDays().first;
    expect(days.single.focusedMinutes, 35);
    expect(days.single.hadEarlyExit, isTrue);
  });
}
