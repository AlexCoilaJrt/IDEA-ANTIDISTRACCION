import 'package:enfoque/app/dependencies.dart';
import 'package:enfoque/core/utils/result.dart';
import 'package:enfoque/domain/logic/stats_calculator.dart';
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
    required StreakSummary streak,
    required DateTime now,
    required int todayMinutes,
    required int todaySessions,
    required int todayExits,

    /// Minutos de lunes a domingo de esta semana.
    required List<int> week,
    required int weekTotal,

    /// Cambio frente a la semana pasada; `null` si no hay con qué comparar.
    int? weekChange,
    @Default(false) bool starting,
  }) = _HomeState;

  const new _();

  /// Lunes = 0.
  int get todayIndex => now.weekday - 1;

  int? get bestDayIndex => StatsCalculator.bestIndex(week);

  bool get goalReached => todayMinutes >= settings.dailyGoalMinutes;
}

/// Inicio: saludo, próxima sesión, sesión rápida, hoy y esta semana.
@riverpod
class HomeViewModel extends _$HomeViewModel {
  @override
  Future<HomeState> build() async {
    final settings = await ref.watch(settingsStreamProvider.future);
    final days = await ref.watch(streakDaysProvider.future);
    final sessions = await ref.watch(sessionHistoryProvider.future);
    final now = ref.watch(clockProvider)();
    final today = StatsCalculator.today(sessions, now);
    final (from, to) = StatsCalculator.range(StatsPeriod.week, now);
    final (pFrom, pTo) = StatsCalculator.previousRange(StatsPeriod.week, now);
    final weekTotal = StatsCalculator.totalMinutes(sessions, from, to);
    return HomeState(
      settings: settings,
      now: now,
      streak: StreakCalculator.summarize(
        days,
        today: now,
        goalMinutes: settings.dailyGoalMinutes,
      ),
      todayMinutes: today.minutes,
      todaySessions: today.sessions,
      todayExits: today.earlyExits,
      week: StatsCalculator.weekMinutes(sessions, now),
      weekTotal: weekTotal,
      weekChange: StatsCalculator.percentChange(
        weekTotal,
        StatsCalculator.totalMinutes(sessions, pFrom, pTo),
      ),
    );
  }

  Future<void> selectPreset(PomodoroPreset preset) =>
      _update((s) => s.copyWith(preset: preset));

  Future<void> setCycles(int cycles) =>
      _update((s) => s.copyWith(cycles: cycles.clamp(1, 8)));

  Future<void> setFreeMinutes(int minutes) =>
      _update((s) => s.copyWith(freeMinutes: minutes.clamp(5, 240)));

  /// Sesión rápida (plan de los ajustes) o la del horario ([block]).
  /// El router abre la pantalla de sesión solo.
  Future<Result<FocusSession>> startSession({StudyBlock? block}) async {
    final current = state.value;
    if (current != null) state = AsyncData(current.copyWith(starting: true));
    final result = await ref
        .read(startSessionUseCaseProvider)
        .call(plan: block?.plan, label: block?.label);
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
