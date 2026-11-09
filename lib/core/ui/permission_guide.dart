import 'package:enfoque/app/theme/semantic_colors.dart';
import 'package:enfoque/app/theme/tokens.dart';
import 'package:flutter/material.dart';

/// Guía de un permiso: para qué sirve, qué hacer exactamente en Android y
/// los botones de acción. Sin estado.
class PermissionGuideCard extends StatelessWidget {
  const new({
    required this.icon,
    required this.title,
    required this.reason,
    required this.badge,
    required this.howToTitle,
    required this.steps,
    required this.safetyNote,
    required this.primaryLabel,
    required this.onPrimary,
    required this.verifyLabel,
    required this.onVerify,
    super.key,
    this.skipLabel,
    this.onSkip,
    this.help,
  });

  final IconData icon;
  final String title;

  /// Para qué lo necesita la app.
  final String reason;

  /// "Obligatorio" o "Recomendado".
  final String badge;
  final String howToTitle;

  /// Instrucciones numeradas de lo que el usuario verá en Android.
  final List<String> steps;
  final String safetyNote;
  final String primaryLabel;
  final VoidCallback onPrimary;
  final String verifyLabel;
  final VoidCallback onVerify;
  final String? skipLabel;
  final VoidCallback? onSkip;

  /// Ayuda extra opcional (por ejemplo, "Ajuste restringido").
  final Widget? help;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Icon(icon, color: scheme.primary, size: AppSizes.iconLg),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: Semantics(
                    header: true,
                    child: Text(title, style: theme.textTheme.titleLarge),
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.sm),
            Align(
              alignment: Alignment.centerLeft,
              child: Chip(
                label: Text(badge),
                visualDensity: VisualDensity.compact,
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(reason, style: theme.textTheme.bodyLarge),
            const SizedBox(height: AppSpacing.lg),
            Text(howToTitle, style: theme.textTheme.titleSmall),
            const SizedBox(height: AppSpacing.sm),
            for (final (i, step) in steps.indexed)
              Padding(
                padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: AppSpacing.md,
                      backgroundColor: scheme.primaryContainer,
                      child: Text(
                        '${i + 1}',
                        style: theme.textTheme.labelMedium?.copyWith(
                          color: scheme.onPrimaryContainer,
                        ),
                      ),
                    ),
                    const SizedBox(width: AppSpacing.md),
                    Expanded(child: Text(step)),
                  ],
                ),
              ),
            const SizedBox(height: AppSpacing.sm),
            Container(
              padding: const EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(
                color: scheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(AppRadius.sm),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.shield_outlined,
                    size: AppSizes.iconSm,
                    color: scheme.onSurfaceVariant,
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  Expanded(
                    child: Text(
                      safetyNote,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: scheme.onSurfaceVariant,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (help != null) ...[const SizedBox(height: AppSpacing.sm), help!],
            const SizedBox(height: AppSpacing.lg),
            FilledButton.icon(
              onPressed: onPrimary,
              icon: const Icon(Icons.open_in_new, size: AppSizes.iconSm),
              label: Text(primaryLabel),
            ),
            const SizedBox(height: AppSpacing.sm),
            OutlinedButton(onPressed: onVerify, child: Text(verifyLabel)),
            if (skipLabel != null && onSkip != null)
              TextButton(
                style: TextButton.styleFrom(
                  minimumSize: const Size.fromHeight(AppSizes.minTouchTarget),
                ),
                onPressed: onSkip,
                child: Text(skipLabel!),
              ),
          ],
        ),
      ),
    );
  }
}

/// Ayuda desplegable con pasos numerados y un botón opcional.
class HelpExpansion extends StatelessWidget {
  const new({
    required this.title,
    required this.body,
    required this.steps,
    super.key,
    this.actionLabel,
    this.onAction,
  });

  final String title;
  final String body;
  final List<String> steps;
  final String? actionLabel;
  final VoidCallback? onAction;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final warn = context.semanticColors.onBreak;
    return ExpansionTile(
      tilePadding: EdgeInsets.zero,
      childrenPadding: const EdgeInsets.only(bottom: AppSpacing.sm),
      leading: Icon(Icons.help_outline, color: warn),
      title: Text(title, style: theme.textTheme.bodyMedium),
      expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(body),
        const SizedBox(height: AppSpacing.sm),
        for (final (i, step) in steps.indexed)
          Padding(
            padding: const EdgeInsets.only(bottom: AppSpacing.xs),
            child: Text('${i + 1}. $step'),
          ),
        if (actionLabel != null && onAction != null) ...[
          const SizedBox(height: AppSpacing.sm),
          OutlinedButton.icon(
            onPressed: onAction,
            icon: const Icon(Icons.info_outline, size: AppSizes.iconSm),
            label: Text(actionLabel!),
          ),
        ],
      ],
    );
  }
}

enum PermissionRowStatus { granted, pending, skipped }

/// Fila del resumen de permisos. Tocarla vuelve a ese paso.
class PermissionStatusRow extends StatelessWidget {
  const new({
    required this.icon,
    required this.title,
    required this.status,
    required this.statusLabel,
    super.key,
    this.selected = false,
    this.onTap,
  });

  final IconData icon;
  final String title;
  final PermissionRowStatus status;
  final String statusLabel;
  final bool selected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = context.semanticColors;
    final (statusIcon, color) = switch (status) {
      PermissionRowStatus.granted => (Icons.check_circle, colors.focus),
      PermissionRowStatus.pending => (
        Icons.radio_button_unchecked,
        theme.colorScheme.onSurfaceVariant,
      ),
      PermissionRowStatus.skipped => (
        Icons.remove_circle_outline,
        colors.onBreak,
      ),
    };
    return ListTile(
      contentPadding: EdgeInsets.zero,
      selected: selected,
      leading: Icon(icon),
      title: Text(title),
      onTap: onTap,
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            statusLabel,
            style: theme.textTheme.labelMedium?.copyWith(color: color),
          ),
          const SizedBox(width: AppSpacing.xs),
          Icon(statusIcon, color: color, size: AppSizes.iconSm),
        ],
      ),
    );
  }
}
