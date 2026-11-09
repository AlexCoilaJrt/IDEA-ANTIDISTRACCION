import 'package:enfoque/app/theme/tokens.dart';
import 'package:flutter/material.dart';

/// Estado vacío con icono, título y mensaje.
class EmptyState extends StatelessWidget {
  const new({
    required this.title,
    required this.message,
    super.key,
    this.icon = Icons.inbox_outlined,
    this.action,
  });

  final String title;
  final String message;
  final IconData icon;
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.xxl),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: AppSizes.iconXl,
              color: theme.colorScheme.onSurfaceVariant,
            ),
            const SizedBox(height: AppSpacing.lg),
            Text(
              title,
              style: theme.textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              message,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
            if (action != null) ...[
              const SizedBox(height: AppSpacing.xl),
              action!,
            ],
          ],
        ),
      ),
    );
  }
}

/// Estado de error con botón para reintentar.
class ErrorState extends StatelessWidget {
  const new({
    required this.message,
    required this.retryLabel,
    required this.onRetry,
    super.key,
  });

  final String message;
  final String retryLabel;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.xxl),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.error_outline,
              size: AppSizes.iconXl,
              color: theme.colorScheme.error,
            ),
            const SizedBox(height: AppSpacing.lg),
            Text(
              message,
              style: theme.textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppSpacing.xl),
            OutlinedButton(onPressed: onRetry, child: Text(retryLabel)),
          ],
        ),
      ),
    );
  }
}

/// Estado de carga.
class LoadingState extends StatelessWidget {
  const new({required this.label, super.key});

  final String label;

  @override
  Widget build(BuildContext context) => Center(
    child: Semantics(label: label, child: const CircularProgressIndicator()),
  );
}
