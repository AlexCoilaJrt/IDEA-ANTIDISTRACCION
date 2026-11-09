import 'package:flutter/material.dart';

/// Tokens del sistema de diseño (CLAUDE.md §8). Ninguna pantalla define
/// colores, tamaños o estilos sueltos: todo sale de aquí o del tema.
abstract final class AppColors {
  static const seed = Color(0xFF5B5BD6);
}

/// Escala de espaciado de 4.
abstract final class AppSpacing {
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 12;
  static const double lg = 16;
  static const double xl = 24;
  static const double xxl = 32;
  static const double xxxl = 48;
}

abstract final class AppRadius {
  static const double sm = 8;
  static const double md = 16;
  static const double lg = 28;
  static const double circle = 999;
}

abstract final class AppDurations {
  static const fast = Duration(milliseconds: 150);
  static const medium = Duration(milliseconds: 250);
  static const slow = Duration(milliseconds: 400);
}

abstract final class AppSizes {
  /// Objetivo táctil mínimo (accesibilidad).
  static const double minTouchTarget = 48;
  static const double timerRing = 260;
  static const double timerStroke = 12;
  static const double iconSm = 20;
  static const double iconMd = 24;
  static const double iconLg = 40;
  static const double iconXl = 64;
  static const double appIcon = 40;
  static const double heatmapCell = 14;
  static const double chartHeight = 180;
  static const double maxContentWidth = 560;
}
