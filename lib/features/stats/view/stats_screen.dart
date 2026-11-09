import 'package:enfoque/app/theme/semantic_colors.dart';
import 'package:enfoque/app/theme/tokens.dart';
import 'package:enfoque/core/ui/ui.dart';
import 'package:enfoque/core/utils/formatters.dart';
import 'package:enfoque/domain/models/models.dart';
import 'package:enfoque/features/stats/view_model/stats_view_model.dart';
import 'package:enfoque/l10n/gen/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StatsScreen extends ConsumerWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final state = ref.watch(statsViewModelProvider);

    return FocusScaffold(
      title: l10n.progressTitle,
      body: switch (state) {
        AsyncData(:final value) when value.isEmpty => EmptyState(
          title: l10n.statEmptyTitle,
          message: l10n.statEmptyBody,
          icon: Icons.insights,
        ),
        AsyncData(:final value) => _StatsBody(state: value),
        AsyncError() => ErrorState(
          message: l10n.commonGenericError,
          retryLabel: l10n.commonRetry,
          onRetry: () => ref.invalidate(statsViewModelProvider),
        ),
        _ => LoadingState(label: l10n.commonLoading),
      },
    );
  }
}

class _StatsBody extends StatelessWidget {
  const new({required this.state});

  final StatsState state;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final colors = context.semanticColors;
    final locale = Localizations.localeOf(context).toLanguageTag();

    final tiles = [
      StatTile(
        label: l10n.statCurrentStreak,
        value: l10n.streakDays(state.streak.current),
        icon: Icons.local_fire_department,
        color: colors.streak,
      ),
      StatTile(
        label: l10n.statBestStreak,
        value: l10n.streakDays(state.streak.best),
        icon: Icons.emoji_events_outlined,
        color: colors.streak,
      ),
      StatTile(
        label: l10n.statToday,
        value: l10n.commonMinutesShort(state.todayMinutes),
        icon: Icons.today,
        color: colors.focus,
      ),
      StatTile(
        label: l10n.statWeek,
        value: l10n.commonMinutesShort(state.weekMinutes),
        icon: Icons.date_range,
        color: colors.focus,
      ),
      StatTile(
        label: l10n.statSessions,
        value: '${state.completedSessions}',
        icon: Icons.check_circle_outline,
      ),
      StatTile(
        label: l10n.statDistractions,
        value: '${state.weekDistractions}',
        icon: Icons.block,
        color: colors.away,
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        StatGrid(columns: 2, children: tiles),
        SectionTitle(l10n.statWeekChart),
        WeekBarChart(
          values: state.lastWeekMinutes,
          labels: [
            for (final d in state.lastWeekDays)
              Formatters.weekdayShort(d, locale),
          ],
          goalMinutes: state.goalMinutes,
          semanticsLabel: l10n.statWeekChart,
        ),
        SectionTitle(l10n.statHeatmap),
        HeatmapCalendar(
          minutesByDay: state.minutesByDay,
          endDay: state.today,
          goalMinutes: state.goalMinutes,
          semanticsLabel: l10n.statHeatmap,
        ),
        if (state.recentSessions.isNotEmpty) ...[
          SectionTitle(l10n.statRecentSessions),
          for (final s in state.recentSessions)
            Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.sm),
              child: _SessionTile(session: s, locale: locale),
            ),
        ],
      ],
    );
  }
}

class _SessionTile extends StatelessWidget {
  const new({required this.session, required this.locale});

  final FocusSession session;
  final String locale;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final colors = context.semanticColors;
    final (label, color) = switch (session.outcome) {
      SessionOutcome.completed => (l10n.sessionCardCompleted, colors.focus),
      SessionOutcome.earlyExit => (l10n.sessionCardEarlyExit, colors.away),
      SessionOutcome.interrupted => (
        l10n.sessionCardInterrupted,
        colors.onBreak,
      ),
      SessionOutcome.active => (l10n.sessionCardActive, colors.focus),
    };
    return SessionCard(
      title: Formatters.dayAndTime(session.startedAt, locale),
      minutesLabel: l10n.commonMinutesShort(session.focusedMinutes),
      statusLabel: label,
      statusColor: color,
      detail: l10n.sessionDistractions(session.distractionCount),
    );
  }
}
