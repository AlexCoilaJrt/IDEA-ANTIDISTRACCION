import 'package:drift/drift.dart' show driftRuntimeOptions;
import 'package:drift/native.dart';
import 'package:enfoque/data/repositories/schedule_repository.dart';
import 'package:enfoque/data/services/db/app_database.dart';
import 'package:enfoque/domain/models/models.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late AppDatabase db;
  late ScheduleRepositoryImpl repo;

  setUpAll(() => driftRuntimeOptions.dontWarnAboutMultipleDatabases = true);
  setUp(() {
    db = AppDatabase(NativeDatabase.memory());
    repo = ScheduleRepositoryImpl(db);
  });
  tearDown(() => db.close());

  test('crea, lee, actualiza y borra bloques', () async {
    final created = (await repo.save(
      const StudyBlock(
        weekdays: {5, 1, 3},
        startMinute: 18 * 60,
        preset: PomodoroPreset.long,
        cycles: 3,
        label: '  Matemáticas  ',
      ),
    )).valueOrNull!;
    expect(created.id, greaterThan(0));
    expect(created.label, 'Matemáticas');

    final read = (await repo.getById(created.id)).valueOrNull!;
    expect(read.weekdays, {1, 3, 5});
    expect(read.preset, PomodoroPreset.long);
    expect(read.cycles, 3);

    await repo.save(read.copyWith(enabled: false, label: ''));
    final updated = (await repo.getById(created.id)).valueOrNull!;
    expect(updated.enabled, isFalse);
    expect(updated.label, isNull);

    await repo.delete(created.id);
    expect((await repo.getById(created.id)).valueOrNull, isNull);
  });

  test('watchBlocks ordena por hora', () async {
    await repo.save(const StudyBlock(weekdays: {1}, startMinute: 20 * 60));
    await repo.save(const StudyBlock(weekdays: {2}, startMinute: 7 * 60));
    final blocks = await repo.watchBlocks().first;
    expect(blocks.map((b) => b.startMinute), [7 * 60, 20 * 60]);
  });
}
