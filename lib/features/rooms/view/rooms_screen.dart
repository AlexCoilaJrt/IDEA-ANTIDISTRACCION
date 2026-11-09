import 'package:enfoque/app/tab_header.dart';
import 'package:enfoque/app/theme/semantic_colors.dart';
import 'package:enfoque/app/theme/tokens.dart';
import 'package:enfoque/core/ui/ui.dart';
import 'package:enfoque/l10n/gen/app_localizations.dart';
import 'package:flutter/material.dart';

/// Pestaña Salas: con el estilo del diseño, pero se implementa en la fase 3
/// (requiere Firebase). No muestra datos inventados.
class RoomsScreen extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final colors = context.semanticColors;
    final features = [
      (Icons.groups_outlined, l10n.roomsFeature1),
      (Icons.bolt, l10n.roomsFeature2),
      (Icons.notifications_active_outlined, l10n.roomsFeature3),
    ];

    return FocusScaffold(
      header: TabHeader(section: l10n.navRooms),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: AppSpacing.md,
            runSpacing: AppSpacing.sm,
            children: [
              Text(l10n.roomsTitle, style: theme.textTheme.headlineLarge),
              StatusPill(label: l10n.roomsSoon, color: colors.focus),
            ],
          ),
          const Gap(AppSpacing.lg),
          Row(
            children: [
              Expanded(
                child: FocusButton(
                  label: l10n.roomsCreate,
                  icon: Icons.add_circle_outline,
                  onPressed: null,
                ),
              ),
              const Gap(AppSpacing.md),
              Expanded(
                child: FocusButton(
                  label: l10n.roomsCode,
                  icon: Icons.dialpad,
                  variant: FocusButtonVariant.secondary,
                  onPressed: null,
                ),
              ),
            ],
          ),
          const Gap(AppSpacing.xl),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.xl),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Icon(
                    Icons.diversity_3_outlined,
                    size: AppSizes.iconXl,
                    color: AppColors.indigoLight,
                  ),
                  const Gap(AppSpacing.lg),
                  Text(
                    l10n.roomsComingTitle,
                    style: theme.textTheme.titleLarge,
                  ),
                  const Gap(AppSpacing.sm),
                  Text(
                    l10n.roomsComingBody,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const Gap(AppSpacing.lg),
                  for (final (icon, text) in features)
                    Padding(
                      padding: const EdgeInsets.only(bottom: AppSpacing.md),
                      child: Row(
                        children: [
                          Container(
                            width: AppSizes.appIcon,
                            height: AppSizes.appIcon,
                            decoration: BoxDecoration(
                              color: colors.focus.withValues(alpha: 0.14),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              icon,
                              color: colors.focus,
                              size: AppSizes.iconSm,
                            ),
                          ),
                          const Gap(AppSpacing.md),
                          Expanded(child: Text(text)),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
