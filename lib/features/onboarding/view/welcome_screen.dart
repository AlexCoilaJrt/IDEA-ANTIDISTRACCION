import 'package:enfoque/app/router.dart';
import 'package:enfoque/app/theme/tokens.dart';
import 'package:enfoque/core/ui/ui.dart';
import 'package:enfoque/l10n/gen/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';

class WelcomeScreen extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final animate = !MediaQuery.disableAnimationsOf(context);
    final points = [
      (Icons.block, l10n.welcomePointBlock),
      (Icons.hourglass_bottom, l10n.welcomePointExit),
      (Icons.local_fire_department, l10n.welcomePointStreak),
    ];

    return FocusScaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Gap(AppSpacing.xxxl),
          Icon(
            Icons.center_focus_strong,
            size: AppSizes.iconXl,
            color: theme.colorScheme.primary,
          ),
          const Gap(AppSpacing.xl),
          Text(l10n.welcomeTitle, style: theme.textTheme.headlineMedium),
          const Gap(AppSpacing.md),
          Text(l10n.welcomeBody, style: theme.textTheme.bodyLarge),
          const Gap(AppSpacing.xxl),
          for (final (i, (icon, text)) in points.indexed)
            Padding(
                  padding: const EdgeInsets.only(bottom: AppSpacing.lg),
                  child: Row(
                    children: [
                      Icon(icon, color: theme.colorScheme.primary),
                      const Gap(AppSpacing.lg),
                      Expanded(child: Text(text)),
                    ],
                  ),
                )
                .animate(target: animate ? 1 : 0)
                .fadeIn(
                  delay: AppDurations.fast * i,
                  duration: AppDurations.slow,
                ),
        ],
      ),
      bottom: FocusButton(
        label: l10n.welcomeStart,
        onPressed: () => context.go(Routes.permissions),
      ),
    );
  }
}
