import 'package:enfoque/app/dependencies.dart';
import 'package:enfoque/core/utils/result.dart';
import 'package:enfoque/domain/logic/streak_calculator.dart';
import 'package:enfoque/domain/models/models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_view_model.freezed.dart';
part 'home_view_model.g.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory({
    required AppSettings settings,
    required int todayMinutes,
    required StreakSummary streak,
    required DateTime plannedEnd,
    required DateTime now,
    @Default(false) bool starting,
  }) = _HomeState;

  const new _();

  bool get goalReached => todayMinutes >= settings.dailyGoalMinutes;
}

/// Pantalla de inicio: elegir el tipo de sesión y empezar.
@riverpod
class HomeViewModel extends _$HomeViewModel {
  @override
  Future<HomeState> build() async {
    final settings = await ref.watch(settingsStreamProvider.future);
    final days = await ref.watch(streakDaysProvider.future);
    final now = ref.watch(clockProvider)();
    final today = StreakCalculator.dateOnly(now);
    final todayMinutes = days
        .where((d) => StreakCalculator.dateOnly(d.day) == today)
        .fold(0, (sum, d) => sum + d.focusedMinutes);
    return HomeState(
      settings: settings,
      todayMinutes: todayMinutes,
      streak: StreakCalculator.summarize(
        days,
        today: now,
        goalMinutes: settings.dailyGoalMinutes,
      ),
      plannedEnd: now.add(settings.plan.totalDuration),
      now: now,
    );
  }

  Future<void> selectPreset(PomodoroPreset preset) =>
      _update((s) => s.copyWith(preset: preset));

  Future<void> setCycles(int cycles) =>
      _update((s) => s.copyWith(cycles: cycles.clamp(1, 8)));

  Future<void> setFreeMinutes(int minutes) =>
      _update((s) => s.copyWith(freeMinutes: minutes.clamp(5, 240)));

  /// Empieza la sesión. El router abre la pantalla de sesión solo.
  Future<Result<FocusSession>> startSession() async {
    final current = state.value;
    if (current != null) state = AsyncData(current.copyWith(starting: true));
    final result = await ref.read(startSessionUseCaseProvider).call();
    if (!ref.mounted) return result;
    final after = state.value;
    if (after != null) state = AsyncData(after.copyWith(starting: false));
    return result;
  }

  /// Lee la última versión guardada para no pisar cambios seguidos.
  Future<void> _update(AppSettings Function(AppSettings) change) async {
    final repo = ref.read(settingsRepositoryProvider);
    final current = (await repo.load()).valueOrNull;
    if (current == null) return;
    await repo.save(change(current));
  }
}
