import 'dart:async';

import 'package:enfoque/app/router.dart';
import 'package:enfoque/app/tab_header.dart';
import 'package:enfoque/app/theme/semantic_colors.dart';
import 'package:enfoque/app/theme/tokens.dart';
import 'package:enfoque/core/ui/ui.dart';
import 'package:enfoque/core/utils/formatters.dart';
import 'package:enfoque/core/utils/result.dart';
import 'package:enfoque/domain/models/models.dart';
import 'package:enfoque/domain/use_cases/session_use_cases.dart';
import 'package:enfoque/features/focus/view_model/home_view_model.dart';
import 'package:enfoque/features/schedule/view/schedule_screen.dart';
import 'package:enfoque/features/schedule/view_model/schedule_view_model.dart';
import 'package:enfoque/l10n/gen/app_localizations.dart';
import 'package:enfoque/l10n/l10n_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends ConsumerWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final state = ref.watch(homeViewModelProvider);

    return FocusScaffold(
      header: TabHeader(
        section: l10n.navHome,
        actions: [
          IconButton(
            tooltip: l10n.homeSettings,
            icon: const Icon(Icons.settings_outlined),
            onPressed: () => context.push(Routes.settings),
          ),
        ],
      ),
      body: switch (state) {
        AsyncData(:final value) => _HomeBody(state: value),
        AsyncError() => ErrorState(
          message: l10n.commonGenericError,
          retryLabel: l10n.commonRetry,
          onRetry: () => ref.invalidate(homeViewModelProvider),
        ),
        _ => LoadingState(label: l10n.commonLoading),
      },
    );
  }
}

/// Empieza una sesión y muestra el problema si no se pudo.
Future<void> startFromHome(
  BuildContext context,
  WidgetRef ref, {
  StudyBlock? block,
}) async {
  final l10n = AppLocalizations.of(context);
  final result = await ref
      .read(homeViewModelProvider.notifier)
      .startSession(block: block);
  if (!context.mounted) return;
  switch (result) {
    case Ok():
      break; // El router abre la sesión.
    case Failure(error: MissingPermissionsException()):
      await context.push(Routes.permissions);
    case Failure():
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(l10n.commonGenericError)));
  }
}

class _HomeBody extends ConsumerWidget {
  const new({required this.state});

  final HomeState state;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final colors = context.semanticColors;
    final locale = Localizations.localeOf(context).toLanguageTag();
    final name = state.settings.displayName.trim();
    final next = ref.watch(nextScheduledProvider).value;
    final best = state.bestDayIndex;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Saludo y racha.
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name.isEmpty ? l10n.homeHelloNoName : l10n.homeHello(name),
                    style: theme.textTheme.headlineMedium,
                  ),
                  Row(
                    children: [
                      Container(
                        width: AppSpacing.sm,
                        height: AppSpacing.sm,
                        decoration: BoxDecoration(
                          color: colors.focus,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const Gap(AppSpacing.xs),
                      Flexible(
                        child: Text(
                          l10n.homeReady,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            _StreakRun(
              days: state.streak.current,
              active: state.streak.todayQualified,
            ),
          ],
        ),
        const Gap(AppSpacing.xl),
        if (next != null)
          _NextSessionCard(
            occurrence: next,
            now: state.now,
            starting: state.starting,
          )
        else
          _NoScheduleCard(onOpen: () => context.go(Routes.schedule)),
        const Gap(AppSpacing.md),
        _QuickSessionCard(settings: state.settings),
        const Gap(AppSpacing.xl),
        // Hoy.
        Row(
          children: [
            Expanded(
              child: Text(l10n.homeToday, style: theme.textTheme.headlineSmall),
            ),
            Text(
              l10n.homeGoal(l10n.longDuration(state.settings.dailyGoalMinutes)),
              style: theme.textTheme.labelLarge?.copyWith(color: colors.focus),
            ),
          ],
        ),
        const Gap(AppSpacing.md),
        StatGrid(
          columns: 3,
          children: [
            MetricTile(
              icon: Icons.schedule,
              value: l10n.shortDuration(state.todayMinutes),
              label: l10n.homeMetricFocused,
              color: colors.focus,
            ),
            MetricTile(
              icon: Icons.done_all,
              value: '${state.todaySessions}',
              label: l10n.homeMetricSessions,
              color: AppColors.indigoLight,
            ),
            MetricTile(
              icon: Icons.shield_outlined,
              value: '${state.todayExits}',
              label: l10n.homeMetricExits,
              color: state.todayExits > 0 ? colors.away : colors.focus,
            ),
          ],
        ),
        const Gap(AppSpacing.xl),
        // Esta semana.
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(l10n.homeThisWeek, style: theme.textTheme.headlineSmall),
                  Text(
                    l10n.homeWeekTotal(l10n.longDuration(state.weekTotal)),
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
            if (state.weekChange case final change?)
              Flexible(
                child: ChangeLabel(
                  change: change,
                  text: l10n.homeVsLastWeek(signedPercent(change)),
                ),
              ),
          ],
        ),
        const Gap(AppSpacing.md),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: Column(
              children: [
                WeekBars(
                  values: state.week,
                  labels: l10n.weekdayLetters,
                  highlight: state.todayIndex,
                  semanticsLabel: l10n.homeThisWeek,
                ),
                if (best != null) ...[
                  const Gap(AppSpacing.lg),
                  Container(
                    padding: const EdgeInsets.only(
                      left: AppSpacing.lg,
                      right: AppSpacing.xs,
                    ),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.surfaceContainerHigh,
                      borderRadius: BorderRadius.circular(AppRadius.md),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.emoji_events_outlined,
                          color: colors.streak,
                          size: AppSizes.iconSm,
                        ),
                        const Gap(AppSpacing.sm),
                        Expanded(
                          child: Text(
                            l10n.homeBestDay(
                              Formatters.weekdayName(best + 1, locale),
                              l10n.shortDuration(state.week[best]),
                            ),
                            style: theme.textTheme.bodyMedium,
                          ),
                        ),
                        TextButton(
                          onPressed: () => context.go(Routes.progress),
                          style: TextButton.styleFrom(
                            foregroundColor: colors.focus,
                          ),
                          child: Text(l10n.homeDetails),
                        ),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ],
    );
  }
}

/// `+18` o `-30`.
String signedPercent(int change) => change > 0 ? '+$change' : '$change';

/// Flecha y texto en menta (sube) o coral (baja).
class ChangeLabel extends StatelessWidget {
  const new({
    required this.change,
    required this.text,
    super.key,
    this.inverted = false,
  });

  final int change;
  final String text;

  /// Para métricas donde bajar es bueno (distracciones).
  final bool inverted;

  @override
  Widget build(BuildContext context) {
    final colors = context.semanticColors;
    final good = inverted ? change <= 0 : change >= 0;
    final color = good ? colors.focus : colors.away;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          change >= 0 ? Icons.trending_up : Icons.trending_down,
          color: color,
          size: AppSizes.iconSm,
        ),
        const Gap(AppSpacing.xs),
        Flexible(
          child: Text(
            text,
            style: Theme.of(context).textTheme.labelLarge
                ?.copyWith(color: color),
          ),
        ),
      ],
    );
  }
}

class _StreakRun extends StatelessWidget {
  const new({required this.days, required this.active});

  final int days;
  final bool active;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final fire = context.semanticColors.streak;
    return Container(
      constraints: const BoxConstraints(maxWidth: 150),
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
        vertical: AppSpacing.sm,
      ),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHigh,
        borderRadius: BorderRadius.circular(AppRadius.lg),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            active
                ? Icons.local_fire_department
                : Icons.local_fire_department_outlined,
            color: fire,
          ),
          const Gap(AppSpacing.sm),
          Flexible(
            child: Text(
              l10n.homeStreakRun(days),
              style: theme.textTheme.labelLarge?.copyWith(color: fire),
            ),
          ),
        ],
      ),
    );
  }
}

class _NextSessionCard extends ConsumerWidget {
  const new({
    required this.occurrence,
    required this.now,
    required this.starting,
  });

  final ScheduledOccurrence occurrence;
  final DateTime now;
  final bool starting;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final locale = Localizations.localeOf(context).toLanguageTag();
    final block = occurrence.block;
    final plan = block.plan;
    final happening = occurrence.isHappeningAt(now);
    final title = l10n.homeWhenRange(
      scheduleDayText(context, occurrence.start, now),
      Formatters.time(occurrence.start, locale),
      Formatters.time(occurrence.end, locale),
    );

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppRadius.lg),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.indigo.withValues(alpha: 0.22),
            theme.colorScheme.surfaceContainer,
          ],
        ),
      ),
      padding: const EdgeInsets.all(AppSpacing.xl),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              if (block.label case final label?) ...[
                Flexible(child: SubjectTag(label: label, filled: true)),
                const Gap(AppSpacing.md),
              ],
              Flexible(
                child: Text(
                  happening ? l10n.homeNowSession : l10n.homeNextSession,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
            ],
          ),
          const Gap(AppSpacing.lg),
          Text(title, style: theme.textTheme.headlineMedium),
          const Gap(AppSpacing.xs),
          Row(
            children: [
              Icon(
                Icons.timelapse,
                color: context.semanticColors.focus,
                size: AppSizes.iconSm,
              ),
              const Gap(AppSpacing.sm),
              Expanded(
                child: Text(
                  block.preset == PomodoroPreset.free
                      ? l10n.homeBlocksFree(plan.focusMinutes)
                      : l10n.homeBlocksPomodoro(plan.cycles, plan.focusMinutes),
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
            ],
          ),
          const Gap(AppSpacing.lg),
          BlockSegments(total: plan.cycles, done: 0),
          const Gap(AppSpacing.xl),
          FocusButton(
            label: l10n.scheduleStartNow,
            icon: Icons.play_arrow_rounded,
            loading: starting,
            onPressed: () =>
                unawaited(startFromHome(context, ref, block: block)),
          ),
        ],
      ),
    );
  }
}

class _NoScheduleCard extends StatelessWidget {
  const new({required this.onOpen});

  final VoidCallback onOpen;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.xl),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.event_note_outlined,
                  color: AppColors.indigoLight,
                ),
                const Gap(AppSpacing.md),
                Expanded(
                  child: Text(
                    l10n.homeNoScheduleTitle,
                    style: theme.textTheme.titleLarge,
                  ),
                ),
              ],
            ),
            const Gap(AppSpacing.sm),
            Text(
              l10n.homeNoScheduleBody,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const Gap(AppSpacing.lg),
            FocusButton(
              label: l10n.homeOpenSchedule,
              icon: Icons.calendar_month_outlined,
              variant: FocusButtonVariant.secondary,
              onPressed: onOpen,
            ),
          ],
        ),
      ),
    );
  }
}

class _QuickSessionCard extends StatelessWidget {
  const new({required this.settings});

  final AppSettings settings;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final plan = settings.plan;
    final subtitle = settings.preset == PomodoroPreset.free
        ? l10n.homeQuickFree(plan.focusMinutes)
        : l10n.homeQuickPomodoro(
            plan.cycles,
            plan.focusMinutes,
            plan.breakMinutes,
          );

    return Card(
      child: InkWell(
        onTap: () => unawaited(
          showModalBottomSheet<void>(
            context: context,
            isScrollControlled: true,
            builder: (_) => const _QuickSessionSheet(),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Row(
            children: [
              Container(
                width: AppSizes.iconLg + AppSpacing.sm,
                height: AppSizes.iconLg + AppSpacing.sm,
                decoration: const BoxDecoration(
                  color: AppColors.mint,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.bolt, color: AppColors.onMint),
              ),
              const Gap(AppSpacing.lg),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.homeQuickTitle,
                      style: theme.textTheme.titleMedium,
                    ),
                    Text(
                      subtitle,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: AppSizes.iconLg,
                height: AppSizes.iconLg,
                decoration: BoxDecoration(
                  color: theme.colorScheme.surfaceContainerHigh,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.chevron_right,
                  color: context.semanticColors.focus,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Ajustes de la sesión rápida y botón para empezar.
class _QuickSessionSheet extends ConsumerWidget {
  const new();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final state = ref.watch(homeViewModelProvider).value;
    if (state == null) return const SizedBox.shrink();
    final vm = ref.read(homeViewModelProvider.notifier);
    final settings = state.settings;
    final locale = Localizations.localeOf(context).toLanguageTag();
    final end = state.now.add(settings.plan.totalDuration);

    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.xl,
          0,
          AppSpacing.xl,
          AppSpacing.xl,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(l10n.homeQuickTitle, style: theme.textTheme.headlineSmall),
            SectionTitle(l10n.homePresetLabel),
            SegmentedButton<PomodoroPreset>(
              segments: [
                ButtonSegment(
                  value: PomodoroPreset.classic,
                  label: Text(l10n.homePresetClassic),
                ),
                ButtonSegment(
                  value: PomodoroPreset.long,
                  label: Text(l10n.homePresetLong),
                ),
                ButtonSegment(
                  value: PomodoroPreset.free,
                  label: Text(l10n.homePresetFree),
                ),
              ],
              selected: {settings.preset},
              onSelectionChanged: (s) => vm.selectPreset(s.first),
            ),
            const Gap(AppSpacing.lg),
            if (settings.preset == PomodoroPreset.free) ...[
              Text(l10n.homeFreeMinutesLabel(settings.freeMinutes)),
              Slider(
                value: settings.freeMinutes.toDouble(),
                min: 5,
                max: 240,
                divisions: 47,
                label: l10n.commonMinutesShort(settings.freeMinutes),
                onChanged: (v) => vm.setFreeMinutes(v.round()),
              ),
            ] else ...[
              Text(l10n.homeCyclesLabel(settings.cycles)),
              Slider(
                value: settings.cycles.toDouble(),
                min: 1,
                max: 8,
                divisions: 7,
                label: '${settings.cycles}',
                onChanged: (v) => vm.setCycles(v.round()),
              ),
              Text(
                settings.plan.hasLongBreak
                    ? l10n.homeLongBreakIncluded(settings.plan.longBreakMinutes)
                    : l10n.homeLongBreakHint(settings.plan.longBreakMinutes),
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
            const Gap(AppSpacing.sm),
            Text(
              l10n.blockEditorSummary(
                settings.plan.plannedFocusMinutes,
                Formatters.time(state.now, locale),
                Formatters.time(end, locale),
              ),
              style: theme.textTheme.bodyLarge,
            ),
            const Gap(AppSpacing.xl),
            FocusButton(
              label: l10n.homeStart,
              icon: Icons.play_arrow_rounded,
              variant: FocusButtonVariant.mint,
              loading: state.starting,
              onPressed: () async {
                await startFromHome(context, ref);
                // Si la sesión empezó, el router ya quitó la hoja.
                if (context.mounted) Navigator.of(context).maybePop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
