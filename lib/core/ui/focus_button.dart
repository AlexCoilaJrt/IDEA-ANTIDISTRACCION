import 'package:enfoque/app/theme/tokens.dart';
import 'package:flutter/material.dart';

enum FocusButtonVariant {
  /// Índigo con texto blanco ("Empezar ahora").
  primary,

  /// Menta con texto oscuro ("Volver a estudiar", "Seguir estudiando").
  mint,

  /// Superficie elevada ("Con código", "Continuar").
  secondary,

  /// Fantasma coral ("Salir y perder la racha").
  danger,

  /// Solo texto ("Salir antes").
  text,
}

/// Botón tipo píldora del diseño. Muestra un indicador mientras [loading].
class FocusButton extends StatelessWidget {
  const new({
    required this.label,
    required this.onPressed,
    super.key,
    this.icon,
    this.loading = false,
    this.variant = FocusButtonVariant.primary,
  });

  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;
  final bool loading;
  final FocusButtonVariant variant;

  @override
  Widget build(BuildContext context) {
    final onTap = loading ? null : onPressed;
    final scheme = Theme.of(context).colorScheme;
    final child = loading
        ? const SizedBox.square(
            dimension: AppSizes.iconSm,
            child: CircularProgressIndicator(strokeWidth: 2),
          )
        : Text(label, textAlign: TextAlign.center);

    Widget withIcon(Widget content) => icon == null || loading
        ? content
        : Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: AppSizes.iconSm),
              const SizedBox(width: AppSpacing.sm),
              Flexible(child: content),
            ],
          );

    return switch (variant) {
      FocusButtonVariant.primary => FilledButton(
        onPressed: onTap,
        child: withIcon(child),
      ),
      FocusButtonVariant.mint => FilledButton(
        style: FilledButton.styleFrom(
          backgroundColor: AppColors.mint,
          foregroundColor: AppColors.onMint,
        ),
        onPressed: onTap,
        child: withIcon(child),
      ),
      FocusButtonVariant.secondary => FilledButton(
        style: FilledButton.styleFrom(
          backgroundColor: scheme.surfaceContainerHigh,
          foregroundColor: scheme.onSurface,
        ),
        onPressed: onTap,
        child: withIcon(child),
      ),
      FocusButtonVariant.danger => OutlinedButton(
        style: OutlinedButton.styleFrom(
          minimumSize: const Size.fromHeight(AppSizes.primaryButton),
          foregroundColor: AppColors.coral,
          backgroundColor: AppColors.coral.withValues(alpha: 0.1),
          side: const BorderSide(color: AppColors.coral),
        ),
        onPressed: onTap,
        child: withIcon(child),
      ),
      FocusButtonVariant.text => TextButton(
        style: TextButton.styleFrom(
          minimumSize: const Size.fromHeight(AppSizes.minTouchTarget),
          foregroundColor: scheme.onSurfaceVariant,
        ),
        onPressed: onTap,
        child: withIcon(child),
      ),
    };
  }
}
