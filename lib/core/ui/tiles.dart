import 'dart:typed_data';

import 'package:enfoque/app/theme/semantic_colors.dart';
import 'package:enfoque/app/theme/tokens.dart';
import 'package:flutter/material.dart';

/// Indicador de racha con su color semántico.
class StreakBadge extends StatelessWidget {
  const new({required this.label, required this.active, super.key});

  /// Texto ya traducido, por ejemplo "5 días".
  final String label;

  /// Si hoy ya cuenta para la racha.
  final bool active;

  @override
  Widget build(BuildContext context) {
    final colors = context.semanticColors;
    final scheme = Theme.of(context).colorScheme;
    final bg = active ? colors.streak : scheme.surfaceContainerHighest;
    final fg = active ? colors.onStreak : scheme.onSurfaceVariant;
    return Container(
      constraints: const BoxConstraints(minHeight: AppSizes.minTouchTarget),
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
        vertical: AppSpacing.sm,
      ),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(AppRadius.circle),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.local_fire_department, color: fg, size: AppSizes.iconMd),
          const SizedBox(width: AppSpacing.sm),
          Text(
            label,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(color: fg),
          ),
        ],
      ),
    );
  }
}

/// Dato destacado de las estadísticas.
class StatTile extends StatelessWidget {
  const new({
    required this.label,
    required this.value,
    super.key,
    this.icon,
    this.color,
  });

  final String label;
  final String value;
  final IconData? icon;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Semantics(
          label: '$label: $value',
          excludeSemantics: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (icon != null)
                Icon(
                  icon,
                  color: color ?? theme.colorScheme.primary,
                  size: AppSizes.iconMd,
                ),
              const SizedBox(height: AppSpacing.sm),
              Text(
                value,
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                label,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Grilla de [StatTile] cuyas filas crecen con el contenido (texto grande).
class StatGrid extends StatelessWidget {
  const new({required this.columns, required this.children, super.key});

  final int columns;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final rows = <Widget>[];
    for (var i = 0; i < children.length; i += columns) {
      final cells = <Widget>[];
      for (var c = 0; c < columns; c++) {
        if (c > 0) cells.add(const SizedBox(width: AppSpacing.sm));
        final index = i + c;
        cells.add(
          Expanded(
            child: index < children.length
                ? children[index]
                : const SizedBox.shrink(),
          ),
        );
      }
      if (rows.isNotEmpty) rows.add(const SizedBox(height: AppSpacing.sm));
      rows.add(
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: cells,
          ),
        ),
      );
    }
    return Column(children: rows);
  }
}

/// Fila con interruptor para permitir o bloquear una app.
class AppToggleTile extends StatelessWidget {
  const new({
    required this.label,
    required this.value,
    required this.onChanged,
    super.key,
    this.subtitle,
    this.icon,
  });

  final String label;
  final String? subtitle;
  final Uint8List? icon;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return SwitchListTile(
      value: value,
      onChanged: onChanged,
      contentPadding: EdgeInsets.zero,
      title: Text(label),
      subtitle: subtitle == null ? null : Text(subtitle!),
      secondary: SizedBox.square(
        dimension: AppSizes.appIcon,
        child: icon == null
            ? Icon(Icons.android, color: scheme.onSurfaceVariant)
            : ClipRRect(
                borderRadius: BorderRadius.circular(AppRadius.sm),
                child: Image.memory(icon!, gaplessPlayback: true),
              ),
      ),
    );
  }
}
