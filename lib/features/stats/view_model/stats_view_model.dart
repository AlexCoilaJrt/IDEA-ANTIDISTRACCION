import 'dart:typed_data';

import 'package:enfoque/app/dependencies.dart';
import 'package:enfoque/domain/logic/stats_calculator.dart';
import 'package:enfoque/domain/logic/streak_calculator.dart';
import 'package:enfoque/domain/models/models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'stats_view_model.freezed.dart';
part 'stats_view_model.g.dart';

/// App que más intentó distraerte en el período.
@freezed
abstract class TopDistraction with _$TopDistraction {
  const factory({
    required String label,
    required int attempts,

    /// Total de intentos del período y del anterior.
    required int total,
    required int previousTotal,
    Uint8List? icon,
  }) = _TopDistraction;

  const new _();

  int? get change => StatsCalculator.percentChange(total, previousTotal);
}

@freezed
abstract class StatsState with _$StatsState {
  const factory({
    required StatsPeriod period,
    required DateTime now,
    required StreakSummary streak,
    required int totalMinutes,
    required List<StatsBar> bars,
    required Map<DateTime, int> minutesByDay,

    /// Minutos por materia (`null` = sin materia), de mayor a menor.
    required List<MapEntry<String?, int>> subjects,
    required int distractionTotal,
    required List<FocusSession> recentSessions,
    int? change,
    int? completionRate,
    TopDistraction? topDistraction,
  }) = _StatsState;

  const new _();

  bool get isEmpty => minutesByDay.isEmpty && recentSessions.isEmpty;
}

/// Semana, mes o año seleccionado en Progreso.
@riverpod
class SelectedStatsPeriod extends _$SelectedStatsPeriod {
  @override
  StatsPeriod build() => StatsPeriod.week;

  // ignore: use_setters_to_change_properties, es un comando del notifier.
  void select(StatsPeriod period) => state = period;
}

/// Progreso: métricas del período, gráficos, consistencia y distracciones.
@riverpod
class StatsViewModel extends _$StatsViewModel {
  @override
  Future<StatsState> build() async {
    final period = ref.watch(selectedStatsPeriodProvider);
    final settings = await ref.watch(settingsStreamProvider.future);
    final days = await ref.watch(streakDaysProvider.future);
    final sessions = await ref.watch(sessionHistoryProvider.future);
    final now = ref.watch(clockProvider)();
    final (from, to) = StatsCalculator.range(period, now);
    final (pFrom, pTo) = StatsCalculator.previousRange(period, now);
    final total = StatsCalculator.totalMinutes(sessions, from, to);

    // Distracciones por app (solo en el celular).
    final repo = ref.read(sessionRepositoryProvider);
    final current = (await repo.distractionsByApp(from, to)).valueOrNull ?? {};
    final previous =
        (await repo.distractionsByApp(pFrom, pTo)).valueOrNull ?? {};
    TopDistraction? top;
    if (current.isNotEmpty) {
      final best = current.entries.reduce((a, b) => a.value >= b.value ? a : b);
      final apps =
          (await ref.read(allowedAppsRepositoryProvider).installedApps())
              .valueOrNull ??
          const <InstalledApp>[];
      final app = apps.where((a) => a.packageName == best.key).firstOrNull;
      top = TopDistraction(
        label: app?.label ?? best.key.split('.').last,
        icon: app?.icon,
        attempts: best.value,
        total: current.values.fold(0, (a, b) => a + b),
        previousTotal: previous.values.fold(0, (a, b) => a + b),
      );
    }

    return StatsState(
      period: period,
      now: now,
      streak: StreakCalculator.summarize(
        days,
        today: now,
        goalMinutes: settings.dailyGoalMinutes,
      ),
      totalMinutes: total,
      change: StatsCalculator.percentChange(
        total,
        StatsCalculator.totalMinutes(sessions, pFrom, pTo),
      ),
      completionRate: StatsCalculator.completionRate(sessions, from, to),
      bars: StatsCalculator.bars(period, sessions, now),
      minutesByDay: StatsCalculator.minutesByDay(sessions),
      subjects: StatsCalculator.bySubject(sessions, from, to),
      distractionTotal: current.values.fold(0, (a, b) => a + b),
      topDistraction: top,
      recentSessions: sessions.where((s) => !s.isActive).take(5).toList(),
    );
  }

  void selectPeriod(StatsPeriod period) =>
      ref.read(selectedStatsPeriodProvider.notifier).select(period);
}
