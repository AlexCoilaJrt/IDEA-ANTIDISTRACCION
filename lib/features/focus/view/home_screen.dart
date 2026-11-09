import 'package:enfoque/app/router.dart';
import 'package:enfoque/app/theme/tokens.dart';
import 'package:enfoque/core/ui/ui.dart';
import 'package:enfoque/core/utils/formatters.dart';
import 'package:enfoque/core/utils/result.dart';
import 'package:enfoque/domain/models/models.dart';
import 'package:enfoque/domain/use_cases/session_use_cases.dart';
import 'package:enfoque/features/focus/view_model/home_view_model.dart';
import 'package:enfoque/l10n/gen/app_localizations.dart';
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
      title: l10n.appTitle,
      actions: [
        IconButton(
          tooltip: l10n.homeAllowedApps,
          icon: const Icon(Icons.apps),
          onPressed: () => context.push(Routes.allowlist),
        ),
        IconButton(
          tooltip: l10n.homeSettings,
          icon: const Icon(Icons.settings_outlined),
          onPressed: () => context.push(Routes.settings),
        ),
      ],
      body: switch (state) {
        AsyncData(:final value) => _HomeBody(state: value),
        AsyncError() => ErrorState(
          message: l10n.commonGenericError,
          retryLabel: l10n.commonRetry,
          onRetry: () => ref.invalidate(homeViewModelProvider),
        ),
        _ => LoadingState(label: l10n.commonLoading),
      },
      bottom: state.value == null
          ? null
          : FocusButton(
              label: l10n.homeStart,
              icon: Icons.play_arrow_rounded,
              loading: state.value!.starting,
              onPressed: () => _start(context, ref),
            ),
    );
  }

  Future<void> _start(BuildContext context, WidgetRef ref) async {
    final l10n = AppLocalizations.of(context);
    final result = await ref
        .read(homeViewModelProvider.notifier)
        .startSession();
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
}

class _HomeBody extends ConsumerWidget {
  const new({required this.state});

  final HomeState state;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final vm = ref.read(homeViewModelProvider.notifier);
    final settings = state.settings;
    final locale = Localizations.localeOf(context).toLanguageTag();
    final goal = settings.dailyGoalMinutes;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                l10n.homeGreeting,
                style: theme.textTheme.headlineSmall,
              ),
            ),
            StreakBadge(
              label: l10n.streakDays(state.streak.current),
              active: state.streak.todayQualified,
            ),
          ],
        ),
        const Gap(AppSpacing.xl),
        Text(
          state.goalReached
              ? l10n.homeGoalReached
              : l10n.homeTodayProgress(state.todayMinutes, goal),
          style: theme.textTheme.titleSmall,
        ),
        const Gap(AppSpacing.sm),
        ClipRRect(
          borderRadius: BorderRadius.circular(AppRadius.circle),
          child: LinearProgressIndicator(
            value: (state.todayMinutes / goal).clamp(0, 1),
            minHeight: AppSpacing.sm,
          ),
        ),
        SectionTitle(l10n.homePresetLabel),
        SizedBox(
          width: double.infinity,
          child: SegmentedButton<PomodoroPreset>(
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
        ],
        Text(
          l10n.homeSessionSummary(
            settings.plan.plannedFocusMinutes,
            Formatters.time(state.plannedEnd, locale),
          ),
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}
