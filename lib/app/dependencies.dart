import 'package:enfoque/data/repositories/allowed_apps_repository.dart';
import 'package:enfoque/data/repositories/blocker_repository.dart';
import 'package:enfoque/data/repositories/session_repository.dart';
import 'package:enfoque/data/repositories/settings_repository.dart';
import 'package:enfoque/data/repositories/streak_repository.dart';
import 'package:enfoque/data/services/blocker/blocker_service.dart';
import 'package:enfoque/data/services/db/app_database.dart';
import 'package:enfoque/domain/models/models.dart';
import 'package:enfoque/domain/use_cases/session_use_cases.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dependencies.g.dart';

// Inyección de dependencias. Las pruebas reemplazan los repositorios con
// `overrideWithValue` usando las versiones falsas de `test/fakes`.

@Riverpod(keepAlive: true)
Clock clock(Ref ref) => DateTime.now;

// --- Servicios ---

@Riverpod(keepAlive: true)
AppDatabase appDatabase(Ref ref) {
  final db = AppDatabase();
  ref.onDispose(db.close);
  return db;
}

@Riverpod(keepAlive: true)
BlockerService blockerService(Ref ref) {
  final service = BlockerService();
  ref.onDispose(service.dispose);
  return service;
}

// --- Repositorios ---

@Riverpod(keepAlive: true)
SessionRepository sessionRepository(Ref ref) =>
    SessionRepositoryImpl(ref.watch(appDatabaseProvider));

@Riverpod(keepAlive: true)
StreakRepository streakRepository(Ref ref) =>
    StreakRepositoryImpl(ref.watch(appDatabaseProvider));

@Riverpod(keepAlive: true)
SettingsRepository settingsRepository(Ref ref) =>
    SettingsRepositoryImpl(ref.watch(appDatabaseProvider));

@Riverpod(keepAlive: true)
AllowedAppsRepository allowedAppsRepository(Ref ref) =>
    AllowedAppsRepositoryImpl(
      ref.watch(appDatabaseProvider),
      ref.watch(blockerServiceProvider),
    );

@Riverpod(keepAlive: true)
BlockerRepository blockerRepository(Ref ref) =>
    BlockerRepositoryImpl(ref.watch(blockerServiceProvider));

// --- Casos de uso ---

@Riverpod(keepAlive: true)
StartSessionUseCase startSessionUseCase(Ref ref) => StartSessionUseCase(
  sessions: ref.watch(sessionRepositoryProvider),
  allowedApps: ref.watch(allowedAppsRepositoryProvider),
  settings: ref.watch(settingsRepositoryProvider),
  blocker: ref.watch(blockerRepositoryProvider),
  clock: ref.watch(clockProvider),
);

@Riverpod(keepAlive: true)
FinishSessionUseCase finishSessionUseCase(Ref ref) => FinishSessionUseCase(
  sessions: ref.watch(sessionRepositoryProvider),
  streak: ref.watch(streakRepositoryProvider),
  blocker: ref.watch(blockerRepositoryProvider),
  clock: ref.watch(clockProvider),
);

@Riverpod(keepAlive: true)
ReconcileSessionUseCase reconcileSessionUseCase(Ref ref) =>
    ReconcileSessionUseCase(
      sessions: ref.watch(sessionRepositoryProvider),
      blocker: ref.watch(blockerRepositoryProvider),
      finish: ref.watch(finishSessionUseCaseProvider),
      clock: ref.watch(clockProvider),
    );

// --- Estado compartido de la app ---

@Riverpod(keepAlive: true)
Stream<AppSettings> settingsStream(Ref ref) =>
    ref.watch(settingsRepositoryProvider).watch();

@Riverpod(keepAlive: true)
Stream<FocusSession?> activeSession(Ref ref) =>
    ref.watch(sessionRepositoryProvider).watchActive();

@Riverpod(keepAlive: true)
Stream<List<DayFocus>> streakDays(Ref ref) =>
    ref.watch(streakRepositoryProvider).watchDays();

@Riverpod(keepAlive: true)
Stream<List<AllowedApp>> allowedAppsStream(Ref ref) =>
    ref.watch(allowedAppsRepositoryProvider).watchAllowed();
