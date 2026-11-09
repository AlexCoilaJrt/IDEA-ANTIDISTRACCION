import 'dart:async';

import 'package:enfoque/app/router.dart';
import 'package:enfoque/app/schedule_coordinator.dart';
import 'package:enfoque/app/theme/semantic_colors.dart';
import 'package:enfoque/app/theme/tokens.dart';
import 'package:enfoque/core/ui/ui.dart';
import 'package:enfoque/core/utils/formatters.dart';
import 'package:enfoque/domain/models/models.dart';
import 'package:enfoque/features/schedule/view_model/schedule_view_model.dart';
import 'package:enfoque/l10n/gen/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// Pestaña Horario: agenda semanal de bloques de estudio.
class ScheduleScreen extends ConsumerWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final state = ref.watch(scheduleViewModelProvider);

    return FocusScaffold(
      title: l10n.navSchedule,
      scrollable: state.value?.isEmpty != true,
      body: switch (state) {
        AsyncData(:final value) when value.isEmpty => EmptyState(
          title: l10n.scheduleEmptyTitle,
          message: l10n.scheduleEmptyBody,
          icon: Icons.calendar_month_outlined,
        ),
        AsyncData(:final value) => _Agenda(state: value),
        AsyncError() => ErrorState(
          message: l10n.commonGenericError,
          retryLabel: l10n.commonRetry,
          onRetry: () => ref.invalidate(scheduleViewModelProvider),
        ),
        _ => LoadingState(label: l10n.commonLoading),
      },
      bottom: FocusButton(
        label: l10n.scheduleAdd,
        icon: Icons.add,
        onPressed: () => context.push(Routes.blockEditor(0)),
      ),
    );
  }
}

class _Agenda extends ConsumerWidget {
  const new({required this.state});

  final ScheduleState state;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final locale = Localizations.localeOf(context).toLanguageTag();
    final vm = ref.read(scheduleViewModelProvider.notifier);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (state.next case final next?)
          NextScheduledCard(occurrence: next, now: state.now),
        const Gap(AppSpacing.md),
        if (!state.exactAlarms)
          Card(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.alarm, color: context.semanticColors.onBreak),
                      const Gap(AppSpacing.md),
                      Expanded(child: Text(l10n.scheduleExactWarning)),
                    ],
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () => unawaited(vm.requestExactAlarms()),
                      child: Text(l10n.scheduleExactAction),
                    ),
                  ),
                ],
              ),
            ),
          ),
        Padding(
          padding: const EdgeInsets.only(top: AppSpacing.sm),
          child: Row(
            children: [
              Icon(
                Icons.notifications_active_outlined,
                size: AppSizes.iconSm,
                color: theme.colorScheme.onSurfaceVariant,
              ),
              const Gap(AppSpacing.sm),
              Expanded(
                child: Text(
                  l10n.scheduleRemindersNote,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
            ],
          ),
        ),
        for (var day = DateTime.monday; day <= DateTime.sunday; day++) ...[
          SectionTitle(Formatters.weekdayName(day, locale)),
          if (state.blocksFor(day).isEmpty)
            Text(
              l10n.scheduleDayFree,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            )
          else
            for (final block in state.blocksFor(day))
              _BlockTile(
                block: block,
                onTap: () => context.push(Routes.blockEditor(block.id)),
                onToggle: (v) => vm.setEnabled(block, enabled: v),
              ),
        ],
      ],
    );
  }
}

class _BlockTile extends StatelessWidget {
  const new({required this.block, required this.onTap, required this.onToggle});

  final StudyBlock block;
  final VoidCallback onTap;
  final ValueChanged<bool> onToggle;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final rule = reminderRuleFor(block, l10n);
    final range = l10n.scheduleRange(
      Formatters.minuteOfDay(block.startMinute),
      Formatters.minuteOfDay(block.startMinute + block.duration.inMinutes),
    );
    final muted = !block.enabled;
    return Card(
      margin: const EdgeInsets.only(bottom: AppSpacing.sm),
      child: ListTile(
        onTap: onTap,
        leading: Icon(
          Icons.menu_book_outlined,
          color: muted
              ? theme.colorScheme.onSurfaceVariant
              : theme.colorScheme.primary,
        ),
        title: Text(rule.title),
        subtitle: Text(
          muted
              ? '$range · ${l10n.schedulePaused}'
              : '$range · ${rule.detail.split(' · ').first}',
        ),
        trailing: Semantics(
          label: l10n.scheduleToggleSemantics(rule.title),
          child: Switch(value: block.enabled, onChanged: onToggle),
        ),
      ),
    );
  }
}

/// Tarjeta "Próxima sesión" (Horario e Inicio).
class NextScheduledCard extends StatelessWidget {
  const new({
    required this.occurrence,
    required this.now,
    super.key,
    this.onTap,
  });

  final ScheduledOccurrence occurrence;
  final DateTime now;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final rule = reminderRuleFor(occurrence.block, l10n);
    final happening = occurrence.isHappeningAt(now);
    return Card(
      color: theme.colorScheme.primaryContainer,
      child: InkWell(
        borderRadius: BorderRadius.circular(AppRadius.md),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Row(
            children: [
              Icon(
                happening ? Icons.play_circle_outline : Icons.event,
                color: theme.colorScheme.onPrimaryContainer,
                size: AppSizes.iconLg,
              ),
              const Gap(AppSpacing.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      happening
                          ? l10n.scheduleNowTitle
                          : l10n.scheduleNextTitle,
                      style: theme.textTheme.labelLarge?.copyWith(
                        color: theme.colorScheme.onPrimaryContainer,
                      ),
                    ),
                    Text(
                      rule.title,
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: theme.colorScheme.onPrimaryContainer,
                      ),
                    ),
                    Text(
                      scheduleWhenText(context, occurrence.start, now),
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onPrimaryContainer,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// "Hoy a las 18:00", "Mañana a las 07:30" o "Miércoles a las 18:00".
String scheduleWhenText(BuildContext context, DateTime start, DateTime now) {
  final l10n = AppLocalizations.of(context);
  final locale = Localizations.localeOf(context).toLanguageTag();
  final today = DateTime(now.year, now.month, now.day);
  final day = DateTime(start.year, start.month, start.day);
  final tomorrow = DateTime(today.year, today.month, today.day + 1);
  final dayText = day == today
      ? l10n.scheduleToday
      : day == tomorrow
      ? l10n.scheduleTomorrow
      : Formatters.weekdayName(start.weekday, locale);
  return l10n.scheduleWhen(dayText, Formatters.time(start, locale));
}
