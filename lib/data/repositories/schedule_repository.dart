import 'package:drift/drift.dart';
import 'package:enfoque/core/utils/result.dart';
import 'package:enfoque/data/services/db/app_database.dart';
import 'package:enfoque/domain/models/models.dart';

/// Horario semanal de estudio.
abstract class ScheduleRepository {
  Stream<List<StudyBlock>> watchBlocks();

  Future<Result<List<StudyBlock>>> blocks();

  Future<Result<StudyBlock?>> getById(int id);

  /// Crea (si `id == 0`) o actualiza el bloque. Devuelve el guardado.
  Future<Result<StudyBlock>> save(StudyBlock block);

  Future<Result<void>> delete(int id);
}

class ScheduleRepositoryImpl implements ScheduleRepository {
  new(this._db);

  final AppDatabase _db;

  @override
  Stream<List<StudyBlock>> watchBlocks() =>
      _ordered().watch().map((rows) => rows.map(_toDomain).toList());

  @override
  Future<Result<List<StudyBlock>>> blocks() =>
      guard(() async => (await _ordered().get()).map(_toDomain).toList());

  @override
  Future<Result<StudyBlock?>> getById(int id) => guard(() async {
    final row = await (_db.select(
      _db.studyBlocks,
    )..where((t) => t.id.equals(id))).getSingleOrNull();
    return row == null ? null : _toDomain(row);
  });

  @override
  Future<Result<StudyBlock>> save(StudyBlock block) => guard(() async {
    final companion = StudyBlocksCompanion(
      weekdays: Value((block.weekdays.toList()..sort()).join(',')),
      startMinute: Value(block.startMinute),
      preset: Value(block.preset.name),
      cycles: Value(block.cycles),
      freeMinutes: Value(block.freeMinutes),
      label: Value(_cleanLabel(block.label)),
      enabled: Value(block.enabled),
    );
    if (block.id == 0) {
      final id = await _db.into(_db.studyBlocks).insert(companion);
      return block.copyWith(id: id, label: _cleanLabel(block.label));
    }
    await (_db.update(
      _db.studyBlocks,
    )..where((t) => t.id.equals(block.id))).write(companion);
    return block.copyWith(label: _cleanLabel(block.label));
  });

  @override
  Future<Result<void>> delete(int id) => guard(() async {
    await (_db.delete(_db.studyBlocks)..where((t) => t.id.equals(id))).go();
  });

  SimpleSelectStatement<$StudyBlocksTable, StudyBlockRow> _ordered() =>
      _db.select(_db.studyBlocks)
        ..orderBy([(t) => OrderingTerm.asc(t.startMinute)]);

  static String? _cleanLabel(String? label) {
    final trimmed = label?.trim();
    return trimmed == null || trimmed.isEmpty ? null : trimmed;
  }

  static StudyBlock _toDomain(StudyBlockRow r) => StudyBlock(
    id: r.id,
    weekdays: {for (final d in r.weekdays.split(',')) ?int.tryParse(d)},
    startMinute: r.startMinute,
    preset: PomodoroPreset.values.firstWhere(
      (p) => p.name == r.preset,
      orElse: () => PomodoroPreset.classic,
    ),
    cycles: r.cycles,
    freeMinutes: r.freeMinutes,
    label: r.label,
    enabled: r.enabled,
  );
}
