import 'package:drift/drift.dart';
import 'package:enfoque/core/utils/result.dart';
import 'package:enfoque/data/services/db/app_database.dart';
import 'package:enfoque/domain/models/models.dart';

/// Resumen diario usado por la racha y las estadísticas.
abstract class StreakRepository {
  Future<Result<void>> upsertDay(DayFocus day);

  Stream<List<DayFocus>> watchDays();
}

class StreakRepositoryImpl implements StreakRepository {
  new(this._db);

  final AppDatabase _db;

  @override
  Future<Result<void>> upsertDay(DayFocus day) => guard(() async {
    await _db
        .into(_db.streakDays)
        .insertOnConflictUpdate(
          StreakDaysCompanion.insert(
            day: day.day,
            focusedMin: day.focusedMinutes,
            hadEarlyExit: day.hadEarlyExit,
          ),
        );
  });

  @override
  Stream<List<DayFocus>> watchDays() =>
      (_db.select(
        _db.streakDays,
      )..orderBy([(t) => OrderingTerm.asc(t.day)])).watch().map(
        (rows) => [
          for (final r in rows)
            DayFocus(
              day: r.day,
              focusedMinutes: r.focusedMin,
              hadEarlyExit: r.hadEarlyExit,
            ),
        ],
      );
}
