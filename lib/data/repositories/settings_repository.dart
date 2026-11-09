import 'package:enfoque/core/utils/result.dart';
import 'package:enfoque/data/services/db/app_database.dart';
import 'package:enfoque/domain/models/models.dart';

/// Ajustes del usuario guardados como clave-valor en drift.
abstract class SettingsRepository {
  Future<Result<AppSettings>> load();

  Stream<AppSettings> watch();

  Future<Result<void>> save(AppSettings settings);
}

class SettingsRepositoryImpl implements SettingsRepository {
  new(this._db);

  final AppDatabase _db;

  static const _goal = 'daily_goal_min';
  static const _preset = 'preset';
  static const _free = 'free_min';
  static const _cycles = 'cycles';
  static const _strictness = 'strictness';
  static const _theme = 'theme_mode';
  static const _onboarding = 'onboarding_done';
  static const _seeded = 'allowlist_seeded';
  static const _name = 'display_name';

  @override
  Future<Result<AppSettings>> load() =>
      guard(() async => _fromRows(await _db.select(_db.settings).get()));

  @override
  Stream<AppSettings> watch() =>
      _db.select(_db.settings).watch().map(_fromRows);

  @override
  Future<Result<void>> save(AppSettings s) => guard(() async {
    final values = <String, String>{
      _goal: '${s.dailyGoalMinutes}',
      _preset: s.preset.name,
      _free: '${s.freeMinutes}',
      _cycles: '${s.cycles}',
      _strictness: s.strictness.name,
      _theme: s.themeMode.name,
      _onboarding: '${s.onboardingDone}',
      _seeded: '${s.allowlistSeeded}',
      _name: s.displayName.trim(),
    };
    await _db.batch((b) {
      b.insertAllOnConflictUpdate(_db.settings, [
        for (final e in values.entries)
          SettingsCompanion.insert(key: e.key, value: e.value),
      ]);
    });
  });

  static AppSettings _fromRows(List<SettingRow> rows) {
    final map = {for (final r in rows) r.key: r.value};
    const d = AppSettings();
    T byName<T extends Enum>(List<T> values, String? name, T fallback) =>
        values.where((v) => v.name == name).firstOrNull ?? fallback;
    return AppSettings(
      dailyGoalMinutes: int.tryParse(map[_goal] ?? '') ?? d.dailyGoalMinutes,
      preset: byName(PomodoroPreset.values, map[_preset], d.preset),
      freeMinutes: int.tryParse(map[_free] ?? '') ?? d.freeMinutes,
      cycles: int.tryParse(map[_cycles] ?? '') ?? d.cycles,
      strictness: byName(Strictness.values, map[_strictness], d.strictness),
      themeMode: byName(AppThemeMode.values, map[_theme], d.themeMode),
      onboardingDone: map[_onboarding] == 'true',
      allowlistSeeded: map[_seeded] == 'true',
      displayName: map[_name] ?? '',
    );
  }
}
