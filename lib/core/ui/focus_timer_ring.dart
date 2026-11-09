import 'dart:math' as math;

import 'package:enfoque/app/theme/tokens.dart';
import 'package:flutter/material.dart';

/// Anillo del temporizador: estado en mayúsculas con punto, tiempo en
/// números tabulares y una línea debajo. En enfoque proyecta un brillo menta.
class FocusTimerRing extends StatelessWidget {
  const new({
    required this.progress,
    required this.timeText,
    required this.label,
    required this.color,
    required this.semanticsLabel,
    super.key,
    this.caption,
    this.glow = false,
  });

  /// Entre 0 y 1.
  final double progress;
  final String timeText;

  /// Estado ("Concentrado", "Descanso").
  final String label;
  final String? caption;
  final Color color;
  final String semanticsLabel;

  /// Aura del estado "Concentrado" (DESIGN.md: Active Focus Aura).
  final bool glow;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final reduceMotion = MediaQuery.disableAnimationsOf(context);

    return Semantics(
      label: semanticsLabel,
      liveRegion: true,
      excludeSemantics: true,
      child: Container(
        width: AppSizes.timerRing,
        height: AppSizes.timerRing,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: RadialGradient(
            colors: [
              color.withValues(alpha: glow ? 0.12 : 0.04),
              Colors.transparent,
            ],
          ),
          boxShadow: glow
              ? [
                  BoxShadow(
                    color: color.withValues(alpha: 0.15),
                    blurRadius: 32,
                  ),
                ]
              : null,
        ),
        child: TweenAnimationBuilder<double>(
          tween: Tween(end: progress.clamp(0, 1)),
          duration: reduceMotion ? Duration.zero : AppDurations.slow,
          builder: (context, value, _) => CustomPaint(
            painter: _RingPainter(
              progress: value,
              color: color,
              track: theme.colorScheme.surfaceContainerHigh,
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.xxl),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Se achica si el estado es largo ("DESCANSO LARGO").
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: AppSpacing.sm,
                            height: AppSpacing.sm,
                            decoration: BoxDecoration(
                              color: color,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: AppSpacing.sm),
                          Text(
                            label.toUpperCase(),
                            style: theme.textTheme.labelLarge?.copyWith(
                              color: color,
                              letterSpacing: 2,
                            ),
                          ),
                        ],
                      ),
                    ),
                    FittedBox(
                      child: Text(
                        timeText,
                        style: theme.textTheme.displayLarge,
                      ),
                    ),
                    if (caption != null)
                      Text(
                        caption!,
                        textAlign: TextAlign.center,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _RingPainter extends CustomPainter {
  new({required this.progress, required this.color, required this.track});

  final double progress;
  final Color color;
  final Color track;

  @override
  void paint(Canvas canvas, Size size) {
    const stroke = AppSizes.timerStroke;
    final arcRect = (Offset.zero & size).deflate(stroke / 2);
    final base = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = stroke
      ..strokeCap = StrokeCap.round;
    canvas.drawArc(arcRect, 0, math.pi * 2, false, base..color = track);
    if (progress > 0) {
      canvas.drawArc(
        arcRect,
        -math.pi / 2,
        math.pi * 2 * progress,
        false,
        base..color = color,
      );
    }
  }

  @override
  bool shouldRepaint(_RingPainter old) =>
      old.progress != progress || old.color != color || old.track != track;
}
