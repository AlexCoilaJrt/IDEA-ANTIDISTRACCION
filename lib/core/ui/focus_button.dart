import 'package:enfoque/app/theme/tokens.dart';
import 'package:flutter/material.dart';

enum FocusButtonVariant { primary, secondary, text }

/// Botón principal de la app. Muestra un indicador mientras [loading].
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
    final child = loading
        ? const SizedBox.square(
            dimension: AppSizes.iconSm,
            child: CircularProgressIndicator(strokeWidth: 2),
          )
        : Text(label);
    final iconWidget = icon == null || loading
        ? null
        : Icon(icon, size: AppSizes.iconSm);

    return switch (variant) {
      FocusButtonVariant.primary =>
        iconWidget == null
            ? FilledButton(onPressed: onTap, child: child)
            : FilledButton.icon(
                onPressed: onTap,
                icon: iconWidget,
                label: child,
              ),
      FocusButtonVariant.secondary =>
        iconWidget == null
            ? OutlinedButton(onPressed: onTap, child: child)
            : OutlinedButton.icon(
                onPressed: onTap,
                icon: iconWidget,
                label: child,
              ),
      FocusButtonVariant.text => TextButton(
        style: TextButton.styleFrom(
          minimumSize: const Size.fromHeight(AppSizes.minTouchTarget),
        ),
        onPressed: onTap,
        child: child,
      ),
    };
  }
}
