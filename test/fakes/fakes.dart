import 'dart:async';

import 'package:enfoque/core/utils/result.dart';
import 'package:enfoque/data/repositories/allowed_apps_repository.dart';
import 'package:enfoque/data/repositories/blocker_repository.dart';
import 'package:enfoque/data/repositories/session_repository.dart';
import 'package:enfoque/data/repositories/settings_repository.dart';
import 'package:enfoque/data/repositories/streak_repository.dart';
import 'package:enfoque/domain/models/models.dart';

/// Repositorios falsos en memoria para pruebas, Widgetbook e integración.

class FakeSessionRepository implements SessionRepository {
  final sessions = <int, FocusSession>{};
  final distractions = <int, List<DistractionEvent>>{};
  final _changes = StreamController<void>.broadcast();
  var _nextId = 1;

  void _notify() => _changes.add(null);

  Stream<T> _watch<T>(T Function() read) async* {
    yield read();
    yield* _changes.stream.map((_) => read());
  }

  FocusSession? get _active =>
      sessions.values.where((s) => s.isActive).firstOrNull;

  @override
  Future<Result<FocusSession>> create({
    required DateTime startedAt,
    required PomodoroPlan plan,
  }) async {
    final s = FocusSession(
      id: _nextId++,
      startedAt: startedAt,
      plan: plan,
      outcome: SessionOutcome.active,
    );
    sessions[s.id] = s;
    _notify();
    return Result.ok(s);
  }

  @override
  Future<Result<FocusSession?>> active() async => Result.ok(_active);

  @override
  Stream<FocusSession?> watchActive() => _watch(() => _active);

  @override
  Future<Result<FocusSession>> getById(int id) async {
    final s = sessions[id];
    return s == null ? Result.error(StateError('No existe')) : Result.ok(s);
  }

  @override
  Future<Result<void>> recordExitLevel(int id, int level) async {
    final s = sessions[id];
    if (s == null) return Result.error(StateError('No existe'));
    if (level > s.exitLevel) sessions[id] = s.copyWith(exitLevel: level);
    _notify();
    return const Result.ok(null);
  }

  @override
  Future<Result<FocusSession>> complete(
    int id, {
    required SessionOutcome outcome,
    required DateTime endedAt,
    required int focusedMinutes,
    required List<DistractionEvent> distractions,
    String? exitReason,
  }) async {
    final s = sessions[id]!.copyWith(
      outcome: outcome,
      endedAt: endedAt,
      focusedMinutes: focusedMinutes,
      distractionCount: distractions.length,
      exitReason: exitReason,
    );
    sessions[id] = s;
    this.distractions[id] = distractions;
    _notify();
    return Result.ok(s);
  }

  @override
  Future<Result<void>> delete(int id) async {
    sessions.remove(id);
    _notify();
    return const Result.ok(null);
  }

  @override
  Future<Result<List<FocusSession>>> between(
    DateTime from,
    DateTime to,
  ) async => Result.ok([
    for (final s in sessions.values)
      if (!s.startedAt.isBefore(from) && s.startedAt.isBefore(to)) s,
  ]);

  @override
  Stream<List<FocusSession>> watchSince(DateTime from) => _watch(
    () => [
      for (final s in sessions.values.toList().reversed)
        if (!s.startedAt.isBefore(from)) s,
    ],
  );
}

class FakeStreakRepository implements StreakRepository {
  final days = <DateTime, DayFocus>{};
  final _changes = StreamController<void>.broadcast();

  @override
  Future<Result<void>> upsertDay(DayFocus day) async {
    days[day.day] = day;
    _changes.add(null);
    return const Result.ok(null);
  }

  @override
  Stream<List<DayFocus>> watchDays() async* {
    yield days.values.toList();
    yield* _changes.stream.map((_) => days.values.toList());
  }
}

class FakeSettingsRepository implements SettingsRepository {
  new([this.settings = const AppSettings()]);

  AppSettings settings;
  final _changes = StreamController<void>.broadcast();

  @override
  Future<Result<AppSettings>> load() async => Result.ok(settings);

  @override
  Future<Result<void>> save(AppSettings s) async {
    settings = s;
    _changes.add(null);
    return const Result.ok(null);
  }

  @override
  Stream<AppSettings> watch() async* {
    yield settings;
    yield* _changes.stream.map((_) => settings);
  }
}

class FakeAllowedAppsRepository implements AllowedAppsRepository {
  new({List<InstalledApp>? installed})
    : installed =
          installed ??
          const [
            InstalledApp(packageName: 'com.android.calculator2', label: 'Calc'),
            InstalledApp(packageName: 'com.instagram.android', label: 'Insta'),
            InstalledApp(packageName: 'com.adobe.reader', label: 'PDF Reader'),
          ];

  final List<InstalledApp> installed;
  final allowedApps = <String, AllowedApp>{};
  final _changes = StreamController<void>.broadcast();

  @override
  Future<Result<List<InstalledApp>>> installedApps() async =>
      Result.ok(installed);

  @override
  Future<Result<List<AllowedApp>>> allowed() async =>
      Result.ok(allowedApps.values.toList());

  @override
  Stream<List<AllowedApp>> watchAllowed() async* {
    yield allowedApps.values.toList();
    yield* _changes.stream.map((_) => allowedApps.values.toList());
  }

  @override
  Future<Result<void>> setAllowed(
    InstalledApp app, {
    required bool allowed,
  }) async {
    if (allowed) {
      allowedApps[app.packageName] = AllowedApp(
        packageName: app.packageName,
        label: app.label,
      );
    } else {
      allowedApps.remove(app.packageName);
    }
    _changes.add(null);
    return const Result.ok(null);
  }

  @override
  Future<Result<void>> addAll(List<InstalledApp> apps) async {
    for (final a in apps) {
      allowedApps[a.packageName] = AllowedApp(
        packageName: a.packageName,
        label: a.label,
      );
    }
    _changes.add(null);
    return const Result.ok(null);
  }
}

/// Motor de bloqueo simulado.
class FakeBlockerRepository implements BlockerRepository {
  new({
    this.perms = const AppPermissions(
      usageAccess: true,
      overlay: true,
      notifications: true,
      batteryOptimization: true,
    ),
  });

  AppPermissions perms;
  BlockerConfig? config;
  bool active = false;
  bool failStart = false;
  bool failStatus = false;
  bool exitRequested = false;
  int? nativeSessionId;
  final nativeDistractions = <DistractionEvent>[];
  final requested = <PermissionKind>[];
  final launched = <String>[];
  final _events = StreamController<BlockerEvent>.broadcast();
  int stopCalls = 0;

  /// Simula que el usuario abrió una app bloqueada.
  void emitDistraction(String pkg, DateTime at) {
    final e = DistractionEvent(packageName: pkg, at: at);
    nativeDistractions.add(e);
    _events.add(DistractionAttempted(e));
  }

  void emit(BlockerEvent event) => _events.add(event);

  @override
  Future<Result<void>> start(BlockerConfig c) async {
    if (failStart) return Result.error(StateError('falló el motor'));
    config = c;
    active = true;
    nativeSessionId = c.sessionId;
    nativeDistractions.clear();
    return const Result.ok(null);
  }

  @override
  Future<Result<void>> stop() async {
    stopCalls++;
    active = false;
    nativeSessionId = null;
    nativeDistractions.clear();
    return const Result.ok(null);
  }

  @override
  Future<Result<BlockerStatus>> status() async {
    if (failStatus) return Result.error(StateError('sin motor'));
    return Result.ok(
      BlockerStatus(
        active: active,
        sessionId: nativeSessionId,
        endsAt: config?.endsAt,
        distractions: List.of(nativeDistractions),
      ),
    );
  }

  @override
  Stream<BlockerEvent> get events => _events.stream;

  @override
  Future<Result<AppPermissions>> permissions() async => Result.ok(perms);

  @override
  Future<Result<void>> requestPermission(PermissionKind kind) async {
    requested.add(kind);
    return const Result.ok(null);
  }

  @override
  Future<Result<bool>> consumeExitRequest() async {
    final r = exitRequested;
    exitRequested = false;
    return Result.ok(r);
  }

  @override
  Future<Result<void>> launchApp(String packageName) async {
    launched.add(packageName);
    return const Result.ok(null);
  }
}

/// Reloj controlable.
class FakeClock {
  new(this.now);

  DateTime now;

  DateTime call() => now;

  void advance(Duration d) => now = now.add(d);
}
