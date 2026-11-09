import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

part 'app_database.g.dart';

/// Sesiones de enfoque. `outcome` guarda el índice de `SessionOutcome`.
@DataClassName('SessionRow')
class Sessions extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get startedAt => dateTime()();
  DateTimeColumn get endedAt => dateTime().nullable()();
  IntColumn get plannedMin => integer()();
  IntColumn get focusMin => integer()();
  IntColumn get breakMin => integer()();
  IntColumn get cycles => integer()();
  IntColumn get focusedMin => integer().withDefault(const Constant(0))();
  IntColumn get outcome => integer()();
  BoolColumn get earlyExit => boolean().withDefault(const Constant(false))();
  IntColumn get exitLevel => integer().withDefault(const Constant(0))();
  TextColumn get exitReason => text().nullable()();
  IntColumn get distractionCount => integer().withDefault(const Constant(0))();
  IntColumn get subjectId => integer().nullable()();
  TextColumn get roomId => text().nullable()();
}

/// Intentos de distracción. Nunca se sincronizan.
@DataClassName('DistractionRow')
class DistractionEvents extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get sessionId =>
      integer().references(Sessions, #id, onDelete: KeyAction.cascade)();
  TextColumn get packageName => text()();
  DateTimeColumn get at => dateTime()();
}

@DataClassName('AllowedAppRow')
class AllowedApps extends Table {
  TextColumn get packageName => text()();
  TextColumn get label => text()();

  @override
  Set<Column<Object>> get primaryKey => {packageName};
}

/// Resumen diario para la racha. `day` es la medianoche local.
@DataClassName('StreakDayRow')
class StreakDays extends Table {
  DateTimeColumn get day => dateTime()();
  IntColumn get focusedMin => integer()();
  BoolColumn get hadEarlyExit => boolean()();

  @override
  Set<Column<Object>> get primaryKey => {day};
}

/// Ajustes clave-valor.
@DataClassName('SettingRow')
class Settings extends Table {
  TextColumn get key => text()();
  TextColumn get value => text()();

  @override
  Set<Column<Object>> get primaryKey => {key};
}

@DriftDatabase(
  tables: [Sessions, DistractionEvents, AllowedApps, StreakDays, Settings],
)
class AppDatabase extends _$AppDatabase {
  new([QueryExecutor? executor])
    : super(executor ?? driftDatabase(name: 'enfoque'));

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    beforeOpen: (details) async {
      await customStatement('PRAGMA foreign_keys = ON');
    },
  );
}
