import 'package:enfoque/app/router.dart';
import 'package:enfoque/app/theme/semantic_colors.dart';
import 'package:enfoque/app/theme/tokens.dart';
import 'package:enfoque/core/ui/ui.dart';
import 'package:enfoque/l10n/gen/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Bienvenida en 3 pasos (DESIGN 1. Bienvenida/Onboarding).
class WelcomeScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final _controller = PageController();
  var _page = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _next(int count) {
    if (_page == count - 1) {
      context.go(Routes.permissions);
      return;
    }
    final reduce = MediaQuery.disableAnimationsOf(context);
    if (reduce) {
      _controller.jumpToPage(_page + 1);
    } else {
      _controller.nextPage(
        duration: AppDurations.slow,
        curve: Curves.easeOutCubic,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final colors = context.semanticColors;
    final pages = [
      (
        Icons.eco,
        colors.focus,
        Icons.lock_open_outlined,
        l10n.welcome1Badge,
        l10n.welcomeTitle,
        l10n.welcome1Body,
      ),
      (
        Icons.calendar_month,
        AppColors.indigoLight,
        Icons.timer_outlined,
        l10n.welcome2Badge,
        l10n.welcome2Title,
        l10n.welcome2Body,
      ),
      (
        Icons.local_fire_department,
        colors.streak,
        Icons.insights,
        l10n.welcome3Badge,
        l10n.welcome3Title,
        l10n.welcome3Body,
      ),
    ];
    final last = _page == pages.length - 1;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: AppSizes.maxContentWidth,
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                    AppSpacing.lg,
                    AppSpacing.sm,
                    AppSpacing.sm,
                    0,
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: AppSpacing.md,
                        height: AppSpacing.md,
                        decoration: BoxDecoration(
                          color: colors.focus,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const Gap(AppSpacing.sm),
                      Text(
                        l10n.welcomeBrand,
                        style: theme.textTheme.titleMedium?.copyWith(
                          letterSpacing: 2,
                        ),
                      ),
                      const Spacer(),
                      if (!last)
                        TextButton(
                          onPressed: () => context.go(Routes.permissions),
                          child: Text(l10n.welcomeSkip),
                        ),
                    ],
                  ),
                ),
                Expanded(
                  child: PageView(
                    controller: _controller,
                    onPageChanged: (i) => setState(() => _page = i),
                    children: [
                      for (final (icon, accent, badgeIcon, badge, title, body)
                          in pages)
                        SingleChildScrollView(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppSpacing.xl,
                          ),
                          child: Column(
                            children: [
                              const Gap(AppSpacing.xxl),
                              OnboardingIllustration(
                                icon: icon,
                                accent: accent,
                              ),
                              const Gap(AppSpacing.xxl),
                              StatusPill(
                                label: badge,
                                color: accent,
                                icon: badgeIcon,
                              ),
                              const Gap(AppSpacing.lg),
                              Semantics(
                                header: true,
                                child: Text(
                                  title,
                                  textAlign: TextAlign.center,
                                  style: theme.textTheme.displaySmall,
                                ),
                              ),
                              const Gap(AppSpacing.md),
                              Text(
                                body,
                                textAlign: TextAlign.center,
                                style: theme.textTheme.bodyLarge?.copyWith(
                                  color: theme.colorScheme.onSurfaceVariant,
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
                PageDots(count: pages.length, index: _page),
                Padding(
                  padding: const EdgeInsets.all(AppSpacing.lg),
                  child: FocusButton(
                    label: last ? l10n.welcomeStart : l10n.welcomeNext,
                    icon: Icons.arrow_forward,
                    onPressed: () => _next(pages.length),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
