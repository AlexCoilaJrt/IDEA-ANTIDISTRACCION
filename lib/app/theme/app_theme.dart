import 'package:enfoque/app/theme/semantic_colors.dart';
import 'package:enfoque/app/theme/tokens.dart';
import 'package:flutter/material.dart';

/// Tema Material 3. Modo oscuro primero.
abstract final class AppTheme {
  static ThemeData light({ColorScheme? dynamicScheme}) => _build(
    dynamicScheme ?? ColorScheme.fromSeed(seedColor: AppColors.seed),
    SemanticColors.light,
  );

  static ThemeData dark({ColorScheme? dynamicScheme}) => _build(
    dynamicScheme ??
        ColorScheme.fromSeed(
          seedColor: AppColors.seed,
          brightness: Brightness.dark,
        ),
    SemanticColors.dark,
  );

  static ThemeData _build(ColorScheme scheme, SemanticColors semantic) {
    final base = ThemeData(colorScheme: scheme, useMaterial3: true);
    final shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppRadius.md),
    );
    return base.copyWith(
      extensions: [semantic],
      scaffoldBackgroundColor: scheme.surface,
      cardTheme: CardThemeData(
        shape: shape,
        elevation: 0,
        color: scheme.surfaceContainerLow,
        margin: EdgeInsets.zero,
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          minimumSize: const Size.fromHeight(AppSizes.minTouchTarget),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.lg),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          minimumSize: const Size.fromHeight(AppSizes.minTouchTarget),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.lg),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.md),
        ),
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        showDragHandle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(AppRadius.lg),
          ),
        ),
      ),
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: FadeForwardsPageTransitionsBuilder(),
        },
      ),
    );
  }
}
