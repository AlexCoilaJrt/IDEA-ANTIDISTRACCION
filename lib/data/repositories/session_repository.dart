import 'package:drift/drift.dart';
import 'package:enfoque/core/utils/result.dart';
import 'package:enfoque/data/services/db/app_database.dart';
import 'package:enfoque/domain/models/models.dart';

/// Fuente de verdad de las sesiones de enfoque.
abstract class SessionRepository {
  Future<Result<FocusSession>> create({
    required DateTime startedAt,
    required PomodoroPlan plan,
  });

  Future<Result<FocusSession?>> active();

  Stream<FocusSession?> watchActive();

  Future<Result<FocusSession>> getById(int id);

  /// Guarda el escalón más alto alcanzado en "Salir antes".
  Future<Result<void>> recordExitLevel(int id, int level);

  Future<Result<FocusSession>> complete(
    int id, {
    required SessionOutcome outcome,
    required DateTime endedAt,
    required int focusedMinutes,
    required List<DistractionEvent> distractions,
    String? exitReason,
  });

  Future<Result<void>> delete(int id);

  /// Sesiones que empezaron en `[from, to)`.
  Future<Result<List<FocusSession>>> between(DateTime from, DateTime to);

  /// Sesiones (de la más reciente a la más antigua) desde [from].
  Stream<List<FocusSession>> watchSince(DateTime from);
}

class SessionRepositoryImpl implements SessionRepository {
  new(this._db);

  final AppDatabase _db;

  @override
  Future<Result<FocusSession>> create({
    required DateTime startedAt,
    required PomodoroPlan plan,
  }) => guard(() async {
    final id = await _db
        .into(_db.sessions)
        .insert(
          SessionsCompanion.insert(
            startedAt: startedAt,
            plannedMin: plan.plannedFocusMinutes,
            focusMin: plan.focusMinutes,
            breakMin: plan.breakMinutes,
            cycles: plan.cycles,
            longBreakMin: Value(plan.longBreakMinutes),
            outcome: SessionOutcome.active.index,
          ),
        );
    return await _byId(id);
  });

  @override
  Future<Result<FocusSession?>> active() => guard(() async {
    final row = await _activeQuery().getSingleOrNull();
    return row == null ? null : _toDomain(row);
  });

  @override
  Stream<FocusSession?> watchActive() => _activeQuery().watchSingleOrNull().map(
    (row) => row == null ? null : _toDomain(row),
  );

  @override
  Future<Result<FocusSession>> getById(int id) => guard(() => _byId(id));

  @override
  Future<Result<void>> recordExitLevel(int id, int level) => guard(() async {
    final row = await (_db.select(
      _db.sessions,
    )..where((t) => t.id.equals(id))).getSingle();
    if (level <= row.exitLevel) return;
    await (_db.update(_db.sessions)..where((t) => t.id.equals(id))).write(
      SessionsCompanion(exitLevel: Value(level)),
    );
  });

  @override
  Future<Result<FocusSession>> complete(
    int id, {
    required SessionOutcome outcome,
    required DateTime endedAt,
    required int focusedMinutes,
    required List<DistractionEvent> distractions,
    String? exitReason,
  }) => guard(() async {
    await _db.transaction(() async {
      await (_db.update(_db.sessions)..where((t) => t.id.equals(id))).write(
        SessionsCompanion(
          endedAt: Value(endedAt),
          outcome: Value(outcome.index),
          focusedMin: Value(focusedMinutes),
          earlyExit: Value(outcome == SessionOutcome.earlyExit),
          exitReason: Value(exitReason),
          distractionCount: Value(distractions.length),
        ),
      );
      await _db.batch((b) {
        b.insertAll(_db.distractionEvents, [
          for (final d in distractions)
            DistractionEventsCompanion.insert(
              sessionId: id,
              packageName: d.packageName,
              at: d.at,
            ),
        ]);
      });
    });
    return await _byId(id);
  });

  @override
  Future<Result<void>> delete(int id) => guard(() async {
    await (_db.delete(_db.sessions)..where((t) => t.id.equals(id))).go();
  });

  @override
  Future<Result<List<FocusSession>>> between(DateTime from, DateTime to) =>
      guard(() async {
        final rows =
            await (_db.select(_db.sessions)
                  ..where(
                    (t) =>
                        t.startedAt.isBiggerOrEqualValue(from) &
                        t.startedAt.isSmallerThanValue(to),
                  )
                  ..orderBy([(t) => OrderingTerm.asc(t.startedAt)]))
                .get();
        return rows.map(_toDomain).toList();
      });

  @override
  Stream<List<FocusSession>> watchSince(DateTime from) =>
      (_db.select(_db.sessions)
            ..where((t) => t.startedAt.isBiggerOrEqualValue(from))
            ..orderBy([(t) => OrderingTerm.desc(t.startedAt)]))
          .watch()
          .map((rows) => rows.map(_toDomain).toList());

  SimpleSelectStatement<$SessionsTable, SessionRow> _activeQuery() =>
      _db.select(_db.sessions)
        ..where((t) => t.outcome.equals(SessionOutcome.active.index))
        ..orderBy([(t) => OrderingTerm.desc(t.startedAt)])
        ..limit(1);

  Future<FocusSession> _byId(int id) async {
    final row = await (_db.select(
      _db.sessions,
    )..where((t) => t.id.equals(id))).getSingle();
    return _toDomain(row);
  }

  static FocusSession _toDomain(SessionRow r) => FocusSession(
    id: r.id,
    startedAt: r.startedAt,
    endedAt: r.endedAt,
    plan: PomodoroPlan(
      focusMinutes: r.focusMin,
      breakMinutes: r.breakMin,
      cycles: r.cycles,
      longBreakMinutes: r.longBreakMin,
    ),
    outcome: SessionOutcome.values[r.outcome],
    focusedMinutes: r.focusedMin,
    exitLevel: r.exitLevel,
    exitReason: r.exitReason,
    distractionCount: r.distractionCount,
    subjectId: r.subjectId,
    roomId: r.roomId,
  );
}
