import 'package:flutter/material.dart';

/// Tokens del sistema de diseño "Enfoque" (stitch_enfoque_focus_app_design_
/// prompts/enfoque/DESIGN.md). Ninguna pantalla define colores, tamaños o
/// estilos sueltos: todo sale de aquí o del tema.
abstract final class AppColors {
  static const seed = Color(0xFF5B5BD6);

  // Superficies (oscuro, M3 tonal).
  static const surface = Color(0xFF13131B);
  static const surfaceLowest = Color(0xFF0D0D15);
  static const surfaceLow = Color(0xFF1B1B23);
  static const surfaceContainer = Color(0xFF1F1F27);
  static const surfaceHigh = Color(0xFF292932);
  static const surfaceHighest = Color(0xFF34343D);
  static const onSurface = Color(0xFFE4E1ED);
  static const onSurfaceVariant = Color(0xFFC7C4D6);
  static const outline = Color(0xFF918F9F);
  static const outlineVariant = Color(0xFF464553);

  // Marca y acentos.
  static const indigo = Color(0xFF5B5BD6);
  static const indigoLight = Color(0xFFC1C1FF);
  static const onIndigoLight = Color(0xFF1B119B);
  static const mint = Color(0xFF3DDBB4);
  static const onMint = Color(0xFF0F0F17);
  static const fire = Color(0xFFFF8A3D);
  static const amber = Color(0xFFF5B544);
  static const coral = Color(0xFFFF6B6B);

  /// Colores de materias; se asignan según el nombre.
  static const subjects = [
    Color(0xFF3B82F6), // azul (Cálculo)
    Color(0xFF8B5CF6), // violeta (Física)
    Color(0xFF10B981), // verde (Historia)
    Color(0xFFEC4899), // rosa (Inglés)
    Color(0xFFF59E0B), // ámbar
    Color(0xFF06B6D4), // cian
  ];

  /// Palabras clave → color del diseño (Cálculo azul, Física violeta,
  /// Historia verde, Inglés rosa).
  static const _subjectKeywords = <String, int>{
    'cálculo': 0,
    'calculo': 0,
    'matem': 0,
    'álgebra': 0,
    'algebra': 0,
    'estadíst': 0,
    'estadist': 0,
    'geometr': 0,
    'física': 1,
    'fisica': 1,
    'químic': 1,
    'quimic': 1,
    'cienc': 1,
    'biolog': 1,
    'historia': 2,
    'social': 2,
    'geograf': 2,
    'filosof': 2,
    'econom': 2,
    'inglés': 3,
    'ingles': 3,
    'idioma': 3,
    'lengua': 3,
    'francés': 3,
    'literat': 3,
    'comunicac': 3,
    'program': 5,
    'informát': 5,
    'informat': 5,
    'comput': 5,
    'software': 5,
  };

  /// Color de una materia: mismo nombre, mismo color.
  static Color subject(String? name) {
    final key = name?.trim().toLowerCase() ?? '';
    if (key.isEmpty) return indigo;
    for (final e in _subjectKeywords.entries) {
      if (key.contains(e.key)) return subjects[e.value];
    }
    var hash = 0;
    for (final unit in key.codeUnits) {
      hash = (hash * 31 + unit) & 0x7fffffff;
    }
    return subjects[hash % subjects.length];
  }

  /// Colores para varias materias a la vez sin repetir mientras alcancen:
  /// respeta el color propio y, si choca, usa el siguiente libre.
  static Map<String, Color> subjectsWithoutClashes(Iterable<String> names) {
    final result = <String, Color>{};
    final used = <Color>{};
    for (final name in names) {
      if (result.containsKey(name)) continue;
      var color = subject(name);
      if (used.contains(color) && used.length < subjects.length) {
        color = subjects.firstWhere((c) => !used.contains(c));
      }
      used.add(color);
      result[name] = color;
    }
    return result;
  }
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
  static const double xs = 4;
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

  /// Botón principal tipo píldora.
  static const double primaryButton = 56;
  static const double timerRing = 280;
  static const double timerStroke = 12;
  static const double iconSm = 20;
  static const double iconMd = 24;
  static const double iconLg = 40;
  static const double iconXl = 64;
  static const double appIcon = 40;
  static const double appBubble = 56;
  static const double heatmapCell = 14;
  static const double calendarCell = 36;
  static const double chartHeight = 180;
  static const double weekBarHeight = 96;
  static const double weekBarWidth = 22;
  static const double donut = 120;
  static const double navBar = 80;
  static const double maxContentWidth = 560;
  static const double illustration = 240;
}
