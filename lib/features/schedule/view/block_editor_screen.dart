import 'dart:async';

import 'package:enfoque/app/schedule_coordinator.dart';
import 'package:enfoque/app/theme/tokens.dart';
import 'package:enfoque/core/ui/ui.dart';
import 'package:enfoque/core/utils/formatters.dart';
import 'package:enfoque/core/utils/result.dart';
import 'package:enfoque/domain/models/models.dart';
import 'package:enfoque/features/schedule/view_model/block_editor_view_model.dart';
import 'package:enfoque/l10n/gen/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// Crear o editar un bloque del horario.
class BlockEditorScreen extends ConsumerWidget {
  const new({required this.blockId, super.key});

  final int blockId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final provider = blockEditorViewModelProvider(blockId);
    final state = ref.watch(provider);
    final ui = state.value;

    Future<void> delete() async {
      final confirmed = await showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(l10n.blockEditorDeleteTitle),
          content: Text(l10n.blockEditorDeleteBody),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text(l10n.commonCancel),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: Text(l10n.commonDelete),
            ),
          ],
        ),
      );
      if (confirmed != true) return;
      await ref.read(provider.notifier).delete();
      if (context.mounted) context.pop();
    }

    Future<void> save() async {
      final result = await ref.read(provider.notifier).save();
      if (!context.mounted) return;
      if (result is Ok) {
        context.pop();
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(l10n.commonGenericError)));
      }
    }

    return FocusScaffold(
      title: ui == null || ui.isNew
          ? l10n.blockEditorNewTitle
          : l10n.blockEditorEditTitle,
      actions: [
        if (ui != null && !ui.isNew)
          IconButton(
            tooltip: l10n.blockEditorDelete,
            icon: const Icon(Icons.delete_outline),
            onPressed: () => unawaited(delete()),
          ),
      ],
      body: switch (state) {
        AsyncData(:final value) => _EditorBody(blockId: blockId, state: value),
        AsyncError() => ErrorState(
          message: l10n.commonGenericError,
          retryLabel: l10n.commonRetry,
          onRetry: () => ref.invalidate(provider),
        ),
        _ => LoadingState(label: l10n.commonLoading),
      },
      bottom: ui == null
          ? null
          : FocusButton(
              label: l10n.commonSave,
              loading: ui.saving,
              onPressed: ui.canSave ? () => unawaited(save()) : null,
            ),
    );
  }
}

class _EditorBody extends ConsumerWidget {
  const new({required this.blockId, required this.state});

  final int blockId;
  final BlockEditorState state;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final locale = Localizations.localeOf(context).toLanguageTag();
    final vm = ref.read(blockEditorViewModelProvider(blockId).notifier);
    final block = state.block;
    final plan = block.plan;
    final start = Formatters.minuteOfDay(block.startMinute);
    final end = Formatters.minuteOfDay(
      block.startMinute + block.duration.inMinutes,
    );
    final overlaps = state.overlaps;

    Future<void> pickTime() async {
      final picked = await showTimePicker(
        context: context,
        initialTime: TimeOfDay(
          hour: block.startMinute ~/ 60,
          minute: block.startMinute % 60,
        ),
      );
      if (picked != null) vm.setStart(picked.hour * 60 + picked.minute);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextFormField(
          initialValue: block.label,
          onChanged: vm.setLabel,
          textCapitalization: TextCapitalization.sentences,
          decoration: InputDecoration(
            labelText: l10n.blockEditorLabel,
            hintText: l10n.blockEditorLabelHint,
          ),
        ),
        SectionTitle(l10n.blockEditorDays),
        Wrap(
          spacing: AppSpacing.sm,
          runSpacing: AppSpacing.sm,
          children: [
            for (var d = DateTime.monday; d <= DateTime.sunday; d++)
              FilterChip(
                label: Text(Formatters.weekdayName(d, locale, short: true)),
                tooltip: Formatters.weekdayName(d, locale),
                selected: block.weekdays.contains(d),
                onSelected: (_) => vm.toggleDay(d),
              ),
          ],
        ),
        if (!state.hasDays)
          Padding(
            padding: const EdgeInsets.only(top: AppSpacing.sm),
            child: Text(
              l10n.blockEditorNoDays,
              style: TextStyle(color: theme.colorScheme.error),
            ),
          ),
        SectionTitle(l10n.blockEditorTime),
        // Wrap: con texto grande el botón baja a la siguiente línea.
        Wrap(
          alignment: WrapAlignment.spaceBetween,
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: AppSpacing.md,
          runSpacing: AppSpacing.sm,
          children: [
            Text(start, style: theme.textTheme.headlineMedium),
            OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                minimumSize: const Size(0, AppSizes.minTouchTarget),
              ),
              onPressed: () => unawaited(pickTime()),
              icon: const Icon(Icons.schedule, size: AppSizes.iconSm),
              label: Text(l10n.blockEditorChangeTime),
            ),
          ],
        ),
        SectionTitle(l10n.blockEditorType),
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
            selected: {block.preset},
            onSelectionChanged: (s) => vm.setPreset(s.first),
          ),
        ),
        const Gap(AppSpacing.lg),
        if (block.preset == PomodoroPreset.free) ...[
          Text(l10n.homeFreeMinutesLabel(block.freeMinutes)),
          Slider(
            value: block.freeMinutes.toDouble(),
            min: 5,
            max: 240,
            divisions: 47,
            label: l10n.commonMinutesShort(block.freeMinutes),
            onChanged: (v) => vm.setFreeMinutes(v.round()),
          ),
        ] else ...[
          Text(l10n.homeCyclesLabel(block.cycles)),
          Slider(
            value: block.cycles.toDouble(),
            min: 1,
            max: 8,
            divisions: 7,
            label: '${block.cycles}',
            onChanged: (v) => vm.setCycles(v.round()),
          ),
        ],
        Text(
          l10n.blockEditorSummary(plan.plannedFocusMinutes, start, end),
          style: theme.textTheme.bodyLarge,
        ),
        if (block.preset != PomodoroPreset.free && plan.hasLongBreak)
          Text(
            l10n.homeLongBreakIncluded(plan.longBreakMinutes),
            style: theme.textTheme.bodySmall,
          ),
        if (overlaps.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: AppSpacing.md),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.error_outline, color: theme.colorScheme.error),
                const Gap(AppSpacing.sm),
                Expanded(
                  child: Text(
                    l10n.blockEditorOverlap(
                      reminderRuleFor(overlaps.first, l10n).title,
                    ),
                    style: TextStyle(color: theme.colorScheme.error),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
