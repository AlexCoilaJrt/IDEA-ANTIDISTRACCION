import 'package:enfoque/app/theme/tokens.dart';
import 'package:flutter/material.dart';

/// Resumen de una sesión en una lista.
class SessionCard extends StatelessWidget {
  const new({
    required this.title,
    required this.minutesLabel,
    required this.statusLabel,
    required this.statusColor,
    super.key,
    this.detail,
  });

  /// Fecha y hora ya formateadas.
  final String title;
  final String minutesLabel;
  final String statusLabel;
  final Color statusColor;
  final String? detail;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Row(
          children: [
            Container(
              width: AppSpacing.xs,
              height: AppSizes.iconLg,
              decoration: BoxDecoration(
                color: statusColor,
                borderRadius: BorderRadius.circular(AppRadius.circle),
              ),
            ),
            const SizedBox(width: AppSpacing.md),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: theme.textTheme.titleSmall),
                  Text(
                    detail == null ? statusLabel : '$statusLabel · $detail',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
            Text(minutesLabel, style: theme.textTheme.titleMedium),
          ],
        ),
      ),
    );
  }
}
