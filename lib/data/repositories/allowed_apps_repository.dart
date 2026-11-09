import 'package:drift/drift.dart';
import 'package:enfoque/core/utils/result.dart';
import 'package:enfoque/data/services/blocker/blocker_service.dart';
import 'package:enfoque/data/services/db/app_database.dart';
import 'package:enfoque/domain/models/models.dart';

/// Apps instaladas y apps permitidas durante las sesiones.
abstract class AllowedAppsRepository {
  Future<Result<List<InstalledApp>>> installedApps();

  Future<Result<List<AllowedApp>>> allowed();

  Stream<List<AllowedApp>> watchAllowed();

  Future<Result<void>> setAllowed(InstalledApp app, {required bool allowed});

  Future<Result<void>> addAll(List<InstalledApp> apps);
}

class AllowedAppsRepositoryImpl implements AllowedAppsRepository {
  new(this._db, this._blocker);

  final AppDatabase _db;
  final BlockerService _blocker;

  List<InstalledApp>? _installedCache;

  @override
  Future<Result<List<InstalledApp>>> installedApps() => guard(() async {
    return _installedCache ??= [
      for (final dto in await _blocker.getLaunchableApps())
        InstalledApp(
          packageName: dto.packageName,
          label: dto.label,
          icon: dto.iconPng,
        ),
    ];
  });

  @override
  Future<Result<List<AllowedApp>>> allowed() => guard(
    () async =>
        (await _db.select(_db.allowedApps).get()).map(_toDomain).toList(),
  );

  @override
  Stream<List<AllowedApp>> watchAllowed() =>
      (_db.select(_db.allowedApps)..orderBy([(t) => OrderingTerm.asc(t.label)]))
          .watch()
          .map((rows) => rows.map(_toDomain).toList());

  @override
  Future<Result<void>> setAllowed(InstalledApp app, {required bool allowed}) =>
      guard(() async {
        if (allowed) {
          await _db
              .into(_db.allowedApps)
              .insertOnConflictUpdate(
                AllowedAppsCompanion.insert(
                  packageName: app.packageName,
                  label: app.label,
                ),
              );
        } else {
          await (_db.delete(
            _db.allowedApps,
          )..where((t) => t.packageName.equals(app.packageName))).go();
        }
      });

  @override
  Future<Result<void>> addAll(List<InstalledApp> apps) => guard(() async {
    await _db.batch((b) {
      b.insertAllOnConflictUpdate(_db.allowedApps, [
        for (final app in apps)
          AllowedAppsCompanion.insert(
            packageName: app.packageName,
            label: app.label,
          ),
      ]);
    });
  });

  static AllowedApp _toDomain(AllowedAppRow r) =>
      AllowedApp(packageName: r.packageName, label: r.label);
}
