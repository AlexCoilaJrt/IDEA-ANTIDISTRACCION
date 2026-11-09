import 'package:enfoque/app/dependencies.dart';
import 'package:enfoque/domain/logic/streak_calculator.dart';
import 'package:enfoque/domain/models/models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'stats_view_model.freezed.dart';
part 'stats_view_model.g.dart';

@freezed
abstract class StatsState with _$StatsState {
  const factory({
    required StreakSummary streak,
    required int goalMinutes,
    required int todayMinutes,
    required int weekMinutes,
    required int completedSessions,
    required int weekDistractions,

    /// Últimos 7 días, del más antiguo a hoy.
    required List<DateTime> lastWeekDays,
    required List<int> lastWeekMinutes,
    required Map<DateTime, int> minutesByDay,
    required List<FocusSession> recentSessions,
    required DateTime today,
  }) = _StatsState;

  const new _();

  bool get isEmpty => recentSessions.isEmpty && minutesByDay.isEmpty;
}

/// Sesiones de las últimas 12 semanas (para estadísticas).
@riverpod
Stream<List<FocusSession>> statsSessions(Ref ref) {
  final now = ref.watch(clockProvider)();
  final from = DateTime(now.year, now.month, now.day - 7 * 12);
  return ref.watch(sessionRepositoryProvider).watchSince(from);
}

/// Racha y estadísticas locales.
@riverpod
class StatsViewModel extends _$StatsViewModel {
  @override
  Future<StatsState> build() async {
    final settings = await ref.watch(settingsStreamProvider.future);
    final days = await ref.watch(streakDaysProvider.future);
    final sessions = await ref.watch(statsSessionsProvider.future);
    final now = ref.watch(clockProvider)();
    final today = StreakCalculator.dateOnly(now);

    final minutesByDay = {
      for (final d in days) StreakCalculator.dateOnly(d.day): d.focusedMinutes,
    };
    final lastWeek = [
      for (var i = 6; i >= 0; i--)
        DateTime(today.year, today.month, today.day - i),
    ];
    final weekStart = lastWeek.first;
    final finished = sessions.where((s) => !s.isActive).toList();

    return StatsState(
      streak: StreakCalculator.summarize(
        days,
        today: now,
        goalMinutes: settings.dailyGoalMinutes,
      ),
      goalMinutes: settings.dailyGoalMinutes,
      todayMinutes: minutesByDay[today] ?? 0,
      weekMinutes: lastWeek.fold(0, (sum, d) => sum + (minutesByDay[d] ?? 0)),
      completedSessions: finished
          .where((s) => s.outcome == SessionOutcome.completed)
          .length,
      weekDistractions: finished
          .where((s) => !s.startedAt.isBefore(weekStart))
          .fold(0, (sum, s) => sum + s.distractionCount),
      lastWeekDays: lastWeek,
      lastWeekMinutes: [for (final d in lastWeek) minutesByDay[d] ?? 0],
      minutesByDay: minutesByDay,
      recentSessions: finished.take(10).toList(),
      today: today,
    );
  }
}
