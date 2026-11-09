import 'package:enfoque/app/router.dart';
import 'package:enfoque/app/theme/tokens.dart';
import 'package:enfoque/core/ui/ui.dart';
import 'package:enfoque/domain/models/models.dart';
import 'package:enfoque/features/settings/view_model/settings_view_model.dart';
import 'package:enfoque/l10n/gen/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SettingsScreen extends ConsumerWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final state = ref.watch(settingsViewModelProvider);

    return FocusScaffold(
      title: l10n.settingsTitle,
      body: switch (state) {
        AsyncData(:final value) => _SettingsBody(settings: value),
        AsyncError() => ErrorState(
          message: l10n.commonGenericError,
          retryLabel: l10n.commonRetry,
          onRetry: () => ref.invalidate(settingsViewModelProvider),
        ),
        _ => LoadingState(label: l10n.commonLoading),
      },
    );
  }
}

class _SettingsBody extends ConsumerWidget {
  const new({required this.settings});

  final AppSettings settings;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final vm = ref.read(settingsViewModelProvider.notifier);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          initialValue: settings.displayName,
          textCapitalization: TextCapitalization.words,
          decoration: InputDecoration(
            labelText: l10n.settingsName,
            hintText: l10n.settingsNameHint,
            prefixIcon: const Icon(Icons.person_outline),
          ),
          onChanged: vm.setDisplayName,
        ),
        SectionTitle(l10n.settingsDailyGoal),
        Text(l10n.settingsDailyGoalValue(settings.dailyGoalMinutes)),
        Slider(
          value: settings.dailyGoalMinutes.toDouble(),
          min: 5,
          max: 240,
          divisions: 47,
          label: l10n.commonMinutesShort(settings.dailyGoalMinutes),
          onChanged: (v) => vm.setDailyGoal(v.round()),
        ),
        SwitchListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(l10n.settingsStrictness),
          subtitle: Text(l10n.settingsStrictnessBody),
          value: settings.strictness == Strictness.strict,
          onChanged: (v) => vm.setStrict(strict: v),
        ),
        SectionTitle(l10n.settingsTheme),
        SizedBox(
          width: double.infinity,
          child: SegmentedButton<AppThemeMode>(
            segments: [
              ButtonSegment(
                value: AppThemeMode.system,
                label: Text(l10n.settingsThemeSystem),
              ),
              ButtonSegment(
                value: AppThemeMode.light,
                label: Text(l10n.settingsThemeLight),
              ),
              ButtonSegment(
                value: AppThemeMode.dark,
                label: Text(l10n.settingsThemeDark),
              ),
            ],
            selected: {settings.themeMode},
            onSelectionChanged: (s) => vm.setThemeMode(s.first),
          ),
        ),
        const Gap(AppSpacing.lg),
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: const Icon(Icons.apps),
          title: Text(l10n.settingsAllowedApps),
          trailing: const Icon(Icons.chevron_right),
          onTap: () => context.push(Routes.allowlist),
        ),
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: const Icon(Icons.verified_user_outlined),
          title: Text(l10n.settingsPermissions),
          trailing: const Icon(Icons.chevron_right),
          onTap: () => context.push(Routes.permissions),
        ),
        const Gap(AppSpacing.lg),
        Row(
          children: [
            Icon(
              Icons.lock_outline,
              size: AppSizes.iconSm,
              color: theme.colorScheme.onSurfaceVariant,
            ),
            const Gap(AppSpacing.sm),
            Expanded(
              child: Text(
                l10n.settingsPrivacy,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
