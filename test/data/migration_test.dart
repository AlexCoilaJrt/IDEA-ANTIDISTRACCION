// SQL partido en varias líneas para que se lea mejor.
// ignore_for_file: no_adjacent_strings_in_list
import 'package:drift/drift.dart' show driftRuntimeOptions;
import 'package:drift/native.dart';
import 'package:enfoque/data/repositories/schedule_repository.dart';
import 'package:enfoque/data/repositories/session_repository.dart';
import 'package:enfoque/data/services/db/app_database.dart';
import 'package:enfoque/domain/models/models.dart';
import 'package:flutter_test/flutter_test.dart';

/// Esquema v1 tal como lo creó la primera versión instalada.
const _v1 = [
  'CREATE TABLE sessions (id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, '
      'started_at INTEGER NOT NULL, ended_at INTEGER NULL, '
      'planned_min INTEGER NOT NULL, focus_min INTEGER NOT NULL, '
      'break_min INTEGER NOT NULL, cycles INTEGER NOT NULL, '
      'focused_min INTEGER NOT NULL DEFAULT 0, outcome INTEGER NOT NULL, '
      'early_exit INTEGER NOT NULL DEFAULT 0, '
      'exit_level INTEGER NOT NULL DEFAULT 0, exit_reason TEXT NULL, '
      'distraction_count INTEGER NOT NULL DEFAULT 0, '
      'subject_id INTEGER NULL, room_id TEXT NULL)',
  'CREATE TABLE distraction_events (id INTEGER NOT NULL PRIMARY KEY '
      'AUTOINCREMENT, session_id INTEGER NOT NULL REFERENCES sessions (id) '
      'ON DELETE CASCADE, package_name TEXT NOT NULL, at INTEGER NOT NULL)',
  'CREATE TABLE allowed_apps (package_name TEXT NOT NULL, '
      'label TEXT NOT NULL, PRIMARY KEY (package_name))',
  'CREATE TABLE streak_days (day INTEGER NOT NULL, '
      'focused_min INTEGER NOT NULL, had_early_exit INTEGER NOT NULL, '
      'PRIMARY KEY (day))',
  'CREATE TABLE settings ("key" TEXT NOT NULL, value TEXT NOT NULL, '
      'PRIMARY KEY ("key"))',
  // Una sesión vieja: 9 nov 2026 09:00, 2 x 25/5, completada.
  'INSERT INTO sessions (started_at, planned_min, focus_min, break_min, '
      'cycles, focused_min, outcome) VALUES (1794232800, 50, 25, 5, 2, 50, 1)',
  'PRAGMA user_version = 1',
];

void main() {
  setUpAll(() => driftRuntimeOptions.dontWarnAboutMultipleDatabases = true);

  test('v1 → v3 conserva sesiones, agrega descanso largo y horario', () async {
    final db = AppDatabase(
      NativeDatabase.memory(setup: (raw) => _v1.forEach(raw.execute)),
    );
    addTearDown(db.close);
    final repo = SessionRepositoryImpl(db);

    final old = await repo.watchSince(DateTime(2000)).first;
    expect(old, hasLength(1));
    expect(old.single.focusedMinutes, 50);
    expect(old.single.plan.longBreakMinutes, 0);

    final created = (await repo.create(
      startedAt: DateTime(2026, 11, 10),
      plan: PomodoroPlan.fromPreset(PomodoroPreset.classic, cycles: 5),
    )).valueOrNull!;
    expect(created.plan.longBreakMinutes, 15);

    // v3: la tabla del horario existe y funciona.
    final schedule = ScheduleRepositoryImpl(db);
    final block = (await schedule.save(
      const StudyBlock(weekdays: {1, 3}, startMinute: 18 * 60),
    )).valueOrNull!;
    expect(block.id, greaterThan(0));
  });
}
