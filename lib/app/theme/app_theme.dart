import 'package:enfoque/app/theme/semantic_colors.dart';
import 'package:enfoque/app/theme/tokens.dart';
import 'package:flutter/material.dart';

/// Tema Material 3 del diseño "Enfoque": modo oscuro primero, Plus Jakarta
/// Sans, botones píldora, tarjetas de 16 y hojas de 28.
abstract final class AppTheme {
  static const fontFamily = 'PlusJakartaSans';

  /// Esquema oscuro tomado tal cual de DESIGN.md.
  static const darkScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: AppColors.indigoLight,
    onPrimary: AppColors.onIndigoLight,
    primaryContainer: AppColors.indigo,
    onPrimaryContainer: Color(0xFFEDEAFF),
    secondary: Color(0xFF41DEB7),
    onSecondary: Color(0xFF00382B),
    secondaryContainer: Color(0xFF00C19C),
    onSecondaryContainer: Color(0xFF004939),
    tertiary: Color(0xFFFFB68D),
    onTertiary: Color(0xFF532200),
    tertiaryContainer: Color(0xFFAE4F00),
    onTertiaryContainer: Color(0xFFFFE8DD),
    error: Color(0xFFFFB4AB),
    onError: Color(0xFF690005),
    errorContainer: Color(0xFF93000A),
    onErrorContainer: Color(0xFFFFDAD6),
    surface: AppColors.surface,
    onSurface: AppColors.onSurface,
    onSurfaceVariant: AppColors.onSurfaceVariant,
    surfaceDim: AppColors.surface,
    surfaceBright: Color(0xFF393841),
    surfaceContainerLowest: AppColors.surfaceLowest,
    surfaceContainerLow: AppColors.surfaceLow,
    surfaceContainer: AppColors.surfaceContainer,
    surfaceContainerHigh: AppColors.surfaceHigh,
    surfaceContainerHighest: AppColors.surfaceHighest,
    outline: AppColors.outline,
    outlineVariant: AppColors.outlineVariant,
    inverseSurface: AppColors.onSurface,
    onInverseSurface: Color(0xFF302F38),
    inversePrimary: Color(0xFF4E4EC9),
    surfaceTint: AppColors.indigoLight,
  );

  static ThemeData dark() => _build(darkScheme, SemanticColors.dark);

  /// El diseño es oscuro; el claro se deriva de la misma marca.
  static ThemeData light() => _build(
    ColorScheme.fromSeed(seedColor: AppColors.seed),
    SemanticColors.light,
  );

  static TextTheme _textTheme(TextTheme base, Color color) {
    TextStyle? s(
      TextStyle? t,
      double size,
      FontWeight weight,
      double height, [
      double spacing = 0,
    ]) => t?.copyWith(
      fontFamily: fontFamily,
      fontSize: size,
      fontWeight: weight,
      height: height / size,
      letterSpacing: spacing * size,
      color: color,
    );
    return base.copyWith(
      // display-timer: 64/72, 700, -0.02em, números tabulares.
      displayLarge: s(
        base.displayLarge,
        64,
        FontWeight.w700,
        72,
        -0.02,
      )?.copyWith(fontFeatures: const [FontFeature.tabularFigures()]),
      displayMedium: s(
        base.displayMedium,
        48,
        FontWeight.w700,
        56,
        -0.02,
      )?.copyWith(fontFeatures: const [FontFeature.tabularFigures()]),
      displaySmall: s(base.displaySmall, 36, FontWeight.w700, 44, -0.01),
      headlineLarge: s(base.headlineLarge, 32, FontWeight.w600, 40, -0.01),
      headlineMedium: s(base.headlineMedium, 24, FontWeight.w600, 32, -0.005),
      headlineSmall: s(base.headlineSmall, 20, FontWeight.w600, 28),
      titleLarge: s(base.titleLarge, 20, FontWeight.w600, 28),
      titleMedium: s(base.titleMedium, 16, FontWeight.w600, 24),
      titleSmall: s(base.titleSmall, 14, FontWeight.w600, 20),
      bodyLarge: s(base.bodyLarge, 16, FontWeight.w400, 24),
      bodyMedium: s(base.bodyMedium, 14, FontWeight.w400, 20),
      bodySmall: s(base.bodySmall, 12, FontWeight.w400, 16),
      labelLarge: s(base.labelLarge, 14, FontWeight.w600, 20, 0.01),
      labelMedium: s(base.labelMedium, 12, FontWeight.w600, 16, 0.02),
      labelSmall: s(base.labelSmall, 11, FontWeight.w500, 16, 0.03),
    );
  }

  static ThemeData _build(ColorScheme scheme, SemanticColors semantic) {
    final base = ThemeData(
      colorScheme: scheme,
      useMaterial3: true,
      fontFamily: fontFamily,
    );
    final dark = scheme.brightness == Brightness.dark;
    final cardColor = dark
        ? AppColors.surfaceContainer
        : scheme.surfaceContainerLow;
    final pill = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppRadius.circle),
    );
    final textTheme = _textTheme(base.textTheme, scheme.onSurface);

    return base.copyWith(
      extensions: [semantic],
      textTheme: textTheme,
      scaffoldBackgroundColor: scheme.surface,
      appBarTheme: AppBarTheme(
        backgroundColor: scheme.surface,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        titleTextStyle: textTheme.headlineSmall,
      ),
      cardTheme: CardThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.md),
        ),
        elevation: 0,
        color: cardColor,
        margin: EdgeInsets.zero,
        clipBehavior: Clip.antiAlias,
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          minimumSize: const Size.fromHeight(AppSizes.primaryButton),
          shape: pill,
          backgroundColor: AppColors.indigo,
          foregroundColor: Colors.white,
          textStyle: textTheme.titleMedium,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          minimumSize: const Size.fromHeight(AppSizes.minTouchTarget),
          shape: pill,
          backgroundColor: dark ? AppColors.surfaceHigh : null,
          foregroundColor: scheme.onSurface,
          side: BorderSide.none,
          textStyle: textTheme.labelLarge,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          shape: pill,
          textStyle: textTheme.labelLarge,
        ),
      ),
      chipTheme: ChipThemeData(
        shape: pill,
        side: BorderSide.none,
        backgroundColor: cardColor,
        selectedColor: AppColors.indigo,
        labelStyle: textTheme.labelLarge,
        secondaryLabelStyle: textTheme.labelLarge?.copyWith(
          color: Colors.white,
        ),
        checkmarkColor: Colors.white,
      ),
      segmentedButtonTheme: SegmentedButtonThemeData(
        style: SegmentedButton.styleFrom(
          backgroundColor: cardColor,
          selectedBackgroundColor: AppColors.indigo,
          selectedForegroundColor: Colors.white,
          side: BorderSide.none,
          shape: pill,
          textStyle: textTheme.labelLarge,
        ),
      ),
      switchTheme: SwitchThemeData(
        thumbColor: const WidgetStatePropertyAll(Colors.white),
        trackColor: WidgetStateProperty.resolveWith(
          (s) => s.contains(WidgetState.selected)
              ? AppColors.mint
              : (dark ? AppColors.surfaceHigh : scheme.surfaceContainerHighest),
        ),
        trackOutlineColor: const WidgetStatePropertyAll(Colors.transparent),
      ),
      sliderTheme: SliderThemeData(
        activeTrackColor: AppColors.indigo,
        thumbColor: dark ? AppColors.indigoLight : AppColors.indigo,
        inactiveTrackColor: dark ? AppColors.surfaceHigh : null,
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: AppColors.mint,
        linearTrackColor: dark ? AppColors.surfaceHigh : null,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: cardColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.md),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.md),
          borderSide: const BorderSide(color: AppColors.indigo, width: 2),
        ),
      ),
      navigationBarTheme: NavigationBarThemeData(
        height: AppSizes.navBar,
        backgroundColor: scheme.surface,
        surfaceTintColor: Colors.transparent,
        indicatorColor: AppColors.indigo,
        indicatorShape: pill,
        labelTextStyle: WidgetStateProperty.resolveWith(
          (s) => textTheme.labelMedium?.copyWith(
            color: s.contains(WidgetState.selected)
                ? scheme.onSurface
                : scheme.onSurface.withValues(alpha: 0.5),
          ),
        ),
        iconTheme: WidgetStateProperty.resolveWith(
          (s) => IconThemeData(
            color: s.contains(WidgetState.selected)
                ? Colors.white
                : scheme.onSurface.withValues(alpha: 0.5),
          ),
        ),
      ),
      bottomSheetTheme: BottomSheetThemeData(
        showDragHandle: true,
        backgroundColor: dark ? AppColors.surfaceHigh : null,
        modalBackgroundColor: dark ? AppColors.surfaceHigh : null,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(AppRadius.lg),
          ),
        ),
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: dark ? AppColors.surfaceHigh : null,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.lg),
        ),
      ),
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.md),
        ),
      ),
      dividerTheme: DividerThemeData(
        color: dark ? AppColors.surfaceHigh : null,
      ),
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: FadeForwardsPageTransitionsBuilder(),
        },
      ),
    );
  }
}
