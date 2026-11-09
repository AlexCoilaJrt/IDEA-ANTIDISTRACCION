import 'package:enfoque/app/tab_header.dart';
import 'package:enfoque/app/theme/semantic_colors.dart';
import 'package:enfoque/app/theme/tokens.dart';
import 'package:enfoque/core/ui/ui.dart';
import 'package:enfoque/core/utils/formatters.dart';
import 'package:enfoque/domain/logic/stats_calculator.dart';
import 'package:enfoque/domain/models/models.dart';
import 'package:enfoque/features/focus/view/home_screen.dart';
import 'package:enfoque/features/stats/view_model/stats_view_model.dart';
import 'package:enfoque/l10n/gen/app_localizations.dart';
import 'package:enfoque/l10n/l10n_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class StatsScreen extends ConsumerWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final state = ref.watch(statsViewModelProvider);
    final period = ref.watch(selectedStatsPeriodProvider);

    return FocusScaffold(
      header: TabHeader(section: l10n.navProgress),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SegmentedButton<StatsPeriod>(
            showSelectedIcon: false,
            segments: [
              ButtonSegment(
                value: StatsPeriod.week,
                label: Text(l10n.statsWeek),
              ),
              ButtonSegment(
                value: StatsPeriod.month,
                label: Text(l10n.statsMonth),
              ),
              ButtonSegment(
                value: StatsPeriod.year,
                label: Text(l10n.statsYear),
              ),
            ],
            selected: {period},
            onSelectionChanged: (s) =>
                ref.read(statsViewModelProvider.notifier).selectPeriod(s.first),
          ),
          const Gap(AppSpacing.lg),
          switch (state) {
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
        ],
      ),
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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        StatGrid(
          columns: 3,
          children: [
            MetricTile(
              icon: Icons.timer_outlined,
              value: l10n.shortDuration(state.totalMinutes),
              label: l10n.statsFocused,
              color: colors.focus,
              badge: state.change == null
                  ? null
                  : '${signedPercent(state.change!)}%',
            ),
            MetricTile(
              icon: Icons.local_fire_department_outlined,
              value: l10n.streakDays(state.streak.current),
              label: l10n.statCurrentStreak,
              color: colors.streak,
              badge: state.streak.todayQualified ? l10n.statsActive : null,
            ),
            MetricTile(
              icon: Icons.verified_outlined,
              value: state.completionRate == null
                  ? '—'
                  : '${state.completionRate}%',
              label: l10n.statsCompleted,
              color: AppColors.indigoLight,
            ),
          ],
        ),
        const Gap(AppSpacing.lg),
        _HoursCard(state: state),
        const Gap(AppSpacing.lg),
        _SectionCard(
          icon: Icons.calendar_view_month,
          title: l10n.statsConsistency,
          trailing: Text(
            toBeginningOfSentenceCase(
              DateFormat.MMMM(locale).format(state.now),
            ),
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          child: MonthCalendar(
            month: state.now,
            today: state.now,
            minutesByDay: state.minutesByDay,
            weekdayInitials: l10n.weekdayLetters,
            lessLabel: l10n.statsLess,
            moreLabel: l10n.statsMore,
            semanticsLabel: l10n.statsConsistency,
          ),
        ),
        if (state.subjects.isNotEmpty) ...[
          const Gap(AppSpacing.lg),
          _SubjectsCard(state: state),
        ],
        const Gap(AppSpacing.lg),
        _DistractionCard(state: state),
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

/// Tarjeta con título (e icono opcional) y contenido.
class _SectionCard extends StatelessWidget {
  const new({
    required this.title,
    required this.child,
    this.icon,
    this.subtitle,
    this.trailing,
  });

  final String title;
  final String? subtitle;
  final IconData? icon;
  final Widget? trailing;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                if (icon != null) ...[
                  Icon(icon, color: AppColors.indigoLight),
                  const Gap(AppSpacing.sm),
                ],
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: theme.textTheme.titleLarge),
                      if (subtitle != null)
                        Text(
                          subtitle!,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                    ],
                  ),
                ),
                ?trailing,
              ],
            ),
            const Gap(AppSpacing.lg),
            child,
          ],
        ),
      ),
    );
  }
}

/// Colores de las materias del período, sin repetir.
Map<String, Color> _palette(StatsState state) =>
    AppColors.subjectsWithoutClashes([
      for (final e in state.subjects)
        if (e.key != null) e.key!,
      for (final b in state.bars)
        for (final k in b.bySubject.keys) ?k,
    ]);

Color _colorOf(Map<String, Color> palette, String? subject) => subject == null
    ? AppColors.outline
    : palette[subject] ?? AppColors.subject(subject);

class _HoursCard extends StatelessWidget {
  const new({required this.state});

  final StatsState state;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final locale = Localizations.localeOf(context).toLanguageTag();
    final today = DateTime(state.now.year, state.now.month, state.now.day);
    final bars = state.bars;
    final labels = [
      for (final (i, b) in bars.indexed)
        switch (state.period) {
          StatsPeriod.week => l10n.weekdayLetters[i],
          StatsPeriod.month =>
            b.start.day == 1 || b.start.day % 5 == 0 ? '${b.start.day}' : '',
          StatsPeriod.year => DateFormat.MMM(
            locale,
          ).format(b.start).substring(0, 1).toUpperCase(),
        },
    ];
    final highlight = state.period == StatsPeriod.year
        ? state.now.month - 1
        : bars.indexWhere((b) => b.start == today);
    final subjects = {for (final b in bars) ...b.bySubject.keys}.toList();
    final palette = _palette(state);

    return _SectionCard(
      title: l10n.statsHours,
      subtitle: l10n.statsHoursSub,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          StackedBarChart(
            bars: [
              for (final b in bars)
                [
                  for (final e in b.bySubject.entries)
                    (color: _colorOf(palette, e.key), value: e.value),
                ],
            ],
            labels: labels,
            highlight: highlight < 0 ? null : highlight,
            semanticsLabel: l10n.statsHours,
          ),
          if (subjects.isNotEmpty) ...[
            const Gap(AppSpacing.md),
            Wrap(
              spacing: AppSpacing.lg,
              runSpacing: AppSpacing.xs,
              children: [
                for (final s in subjects)
                  _Legend(
                    color: _colorOf(palette, s),
                    label: s ?? l10n.statsNoSubject,
                  ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}

class _Legend extends StatelessWidget {
  const new({required this.color, required this.label, this.trailing});

  final Color color;
  final String label;
  final String? trailing;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisSize: trailing == null ? MainAxisSize.min : MainAxisSize.max,
      children: [
        Container(
          width: AppSpacing.md,
          height: AppSpacing.md,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const Gap(AppSpacing.sm),
        if (trailing == null)
          Text(label, style: theme.textTheme.bodyMedium)
        else ...[
          Expanded(child: Text(label, style: theme.textTheme.bodyLarge)),
          Text(trailing!, style: theme.textTheme.titleSmall),
        ],
      ],
    );
  }
}

class _SubjectsCard extends StatelessWidget {
  const new({required this.state});

  final StatsState state;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final total = state.subjects.fold(0, (a, e) => a + e.value);
    final named = state.subjects.where((e) => e.key != null).length;
    final count = named == 0 ? state.subjects.length : named;
    final palette = _palette(state);

    return _SectionCard(
      title: l10n.statsBySubject,
      trailing: Text(
        l10n.statsTotal(l10n.longDuration(total)),
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      child: Row(
        children: [
          SubjectDonut(
            slices: [
              for (final e in state.subjects)
                (color: _colorOf(palette, e.key), value: e.value),
            ],
            centerValue: '$count',
            centerLabel: l10n.statsSubjectsCount(count),
            semanticsLabel: l10n.statsBySubject,
          ),
          const Gap(AppSpacing.xl),
          Expanded(
            child: Column(
              children: [
                for (final e in state.subjects.take(5))
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: AppSpacing.xs,
                    ),
                    child: _Legend(
                      color: _colorOf(palette, e.key),
                      label: e.key ?? l10n.statsNoSubject,
                      trailing: '${(e.value * 100 / total).round()}%',
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DistractionCard extends StatelessWidget {
  const new({required this.state});

  final StatsState state;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final colors = context.semanticColors;
    final top = state.topDistraction;
    final change = top?.change;
    final good = top == null || (change ?? 0) <= 0;

    return _SectionCard(
      title: l10n.statsDistractionTitle,
      subtitle: l10n.statsDistractionSub,
      icon: Icons.phonelink_lock_outlined,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (top != null) ...[
            Container(
              padding: const EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(
                color: theme.colorScheme.surfaceContainerHigh,
                borderRadius: BorderRadius.circular(AppRadius.md),
              ),
              child: Row(
                children: [
                  SizedBox.square(
                    dimension: AppSizes.appIcon,
                    child: top.icon == null
                        ? Icon(Icons.block, color: colors.away)
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(AppRadius.sm),
                            child: Image.memory(
                              top.icon!,
                              gaplessPlayback: true,
                            ),
                          ),
                  ),
                  const Gap(AppSpacing.md),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          l10n.statsDistractionApp(top.label),
                          style: theme.textTheme.titleSmall,
                        ),
                        Text(
                          l10n.statsDistractionCount(top.attempts),
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (change != null)
                    ChangeLabel(
                      change: change,
                      text: '${signedPercent(change)}%',
                      inverted: true,
                    ),
                ],
              ),
            ),
            const Gap(AppSpacing.md),
          ],
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.celebration_outlined,
                size: AppSizes.iconSm,
                color: good ? colors.focus : colors.onBreak,
              ),
              const Gap(AppSpacing.sm),
              Expanded(
                child: Text(
                  top == null
                      ? l10n.statsDistractionNone
                      : change == null
                      ? l10n.statsDistractionCount(state.distractionTotal)
                      : change <= 0
                      ? l10n.statsDistractionBetter(-change)
                      : l10n.statsDistractionWorse(change),
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: good ? colors.focus : colors.onBreak,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
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
    final when = Formatters.dayAndTime(session.startedAt, locale);
    return SessionCard(
      title: session.label == null ? when : '${session.label} · $when',
      minutesLabel: l10n.commonMinutesShort(session.focusedMinutes),
      statusLabel: label,
      statusColor: session.label == null
          ? color
          : AppColors.subject(session.label),
      detail: l10n.sessionDistractions(session.distractionCount),
    );
  }
}
