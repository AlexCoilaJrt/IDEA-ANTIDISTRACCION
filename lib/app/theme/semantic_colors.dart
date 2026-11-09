import 'package:enfoque/app/theme/tokens.dart';
import 'package:flutter/material.dart';

/// Colores con significado propio de la app.
@immutable
class SemanticColors extends ThemeExtension<SemanticColors> {
  const new({
    required this.focus,
    required this.onFocus,
    required this.onBreak,
    required this.onOnBreak,
    required this.away,
    required this.onAway,
    required this.streak,
    required this.onStreak,
  });

  static const light = SemanticColors(
    focus: Color(0xFF1B7F4B),
    onFocus: Color(0xFFFFFFFF),
    onBreak: Color(0xFF8A5A00),
    onOnBreak: Color(0xFFFFFFFF),
    away: Color(0xFFB3412F),
    onAway: Color(0xFFFFFFFF),
    streak: Color(0xFFB34A00),
    onStreak: Color(0xFFFFFFFF),
  );

  /// Estados del diseño: concentrado (menta), descanso (ámbar),
  /// distraído/salió (coral) y racha (naranja fuego).
  static const dark = SemanticColors(
    focus: AppColors.mint,
    onFocus: AppColors.onMint,
    onBreak: AppColors.amber,
    onOnBreak: AppColors.onMint,
    away: AppColors.coral,
    onAway: AppColors.onMint,
    streak: AppColors.fire,
    onStreak: AppColors.onMint,
  );

  final Color focus;
  final Color onFocus;
  final Color onBreak;
  final Color onOnBreak;
  final Color away;
  final Color onAway;
  final Color streak;
  final Color onStreak;

  @override
  SemanticColors copyWith({
    Color? focus,
    Color? onFocus,
    Color? onBreak,
    Color? onOnBreak,
    Color? away,
    Color? onAway,
    Color? streak,
    Color? onStreak,
  }) {
    return SemanticColors(
      focus: focus ?? this.focus,
      onFocus: onFocus ?? this.onFocus,
      onBreak: onBreak ?? this.onBreak,
      onOnBreak: onOnBreak ?? this.onOnBreak,
      away: away ?? this.away,
      onAway: onAway ?? this.onAway,
      streak: streak ?? this.streak,
      onStreak: onStreak ?? this.onStreak,
    );
  }

  @override
  SemanticColors lerp(SemanticColors? other, double t) {
    if (other == null) return this;
    Color l(Color a, Color b) => Color.lerp(a, b, t)!;
    return SemanticColors(
      focus: l(focus, other.focus),
      onFocus: l(onFocus, other.onFocus),
      onBreak: l(onBreak, other.onBreak),
      onOnBreak: l(onOnBreak, other.onOnBreak),
      away: l(away, other.away),
      onAway: l(onAway, other.onAway),
      streak: l(streak, other.streak),
      onStreak: l(onStreak, other.onStreak),
    );
  }
}

extension SemanticColorsX on BuildContext {
  SemanticColors get semanticColors =>
      Theme.of(this).extension<SemanticColors>() ?? SemanticColors.dark;
}
