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

  /// Desde la versión 2 del esquema.
  IntColumn get longBreakMin => integer().withDefault(const Constant(0))();
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

/// Bloques del horario semanal (desde la versión 3 del esquema).
/// `weekdays` guarda los días como texto: "1,3,5".
@DataClassName('StudyBlockRow')
class StudyBlocks extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get weekdays => text()();
  IntColumn get startMinute => integer()();
  TextColumn get preset => text()();
  IntColumn get cycles => integer()();
  IntColumn get freeMinutes => integer()();
  TextColumn get label => text().nullable()();
  BoolColumn get enabled => boolean().withDefault(const Constant(true))();
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
  tables: [
    Sessions,
    DistractionEvents,
    AllowedApps,
    StreakDays,
    Settings,
    StudyBlocks,
  ],
)
class AppDatabase extends _$AppDatabase {
  new([QueryExecutor? executor])
    : super(executor ?? driftDatabase(name: 'enfoque'));

  @override
  int get schemaVersion => 3;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (m) => m.createAll(),
    onUpgrade: (m, from, to) async {
      // v2: descanso largo cada 4 bloques.
      if (from < 2) await m.addColumn(sessions, sessions.longBreakMin);
      // v3: horario semanal.
      if (from < 3) await m.createTable(studyBlocks);
    },
    beforeOpen: (details) async {
      await customStatement('PRAGMA foreign_keys = ON');
    },
  );
}
