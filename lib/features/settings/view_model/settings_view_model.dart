import 'package:enfoque/app/dependencies.dart';
import 'package:enfoque/domain/models/models.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'settings_view_model.g.dart';

/// Ajustes: meta diaria, modo estricto y tema.
@riverpod
class SettingsViewModel extends _$SettingsViewModel {
  @override
  Future<AppSettings> build() => ref.watch(settingsStreamProvider.future);

  Future<void> setDailyGoal(int minutes) =>
      _save((s) => s.copyWith(dailyGoalMinutes: minutes.clamp(5, 480)));

  Future<void> setStrict({required bool strict}) => _save(
    (s) => s.copyWith(
      strictness: strict ? Strictness.strict : Strictness.standard,
    ),
  );

  Future<void> setThemeMode(AppThemeMode mode) =>
      _save((s) => s.copyWith(themeMode: mode));

  /// Lee la última versión guardada para no pisar cambios seguidos.
  Future<void> _save(AppSettings Function(AppSettings) change) async {
    final repo = ref.read(settingsRepositoryProvider);
    final current = (await repo.load()).valueOrNull;
    if (current == null) return;
    await repo.save(change(current));
  }
}
