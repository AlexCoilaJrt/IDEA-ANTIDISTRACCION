import 'dart:math' as math;

import 'package:enfoque/app/theme/tokens.dart';
import 'package:flutter/material.dart';

/// Anillo de progreso con el tiempo restante en números tabulares.
class FocusTimerRing extends StatelessWidget {
  const new({
    required this.progress,
    required this.timeText,
    required this.label,
    required this.color,
    required this.semanticsLabel,
    super.key,
    this.caption,
  });

  /// Entre 0 y 1.
  final double progress;
  final String timeText;
  final String label;
  final String? caption;
  final Color color;
  final String semanticsLabel;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final reduceMotion = MediaQuery.disableAnimationsOf(context);
    final timeStyle = theme.textTheme.displayMedium?.copyWith(
      fontWeight: FontWeight.w600,
      fontFeatures: const [FontFeature.tabularFigures()],
      color: theme.colorScheme.onSurface,
    );

    return Semantics(
      label: semanticsLabel,
      liveRegion: true,
      excludeSemantics: true,
      child: SizedBox.square(
        dimension: AppSizes.timerRing,
        child: TweenAnimationBuilder<double>(
          tween: Tween(end: progress.clamp(0, 1)),
          duration: reduceMotion ? Duration.zero : AppDurations.slow,
          builder: (context, value, _) => CustomPaint(
            painter: _RingPainter(
              progress: value,
              color: color,
              track: theme.colorScheme.surfaceContainerHighest,
            ),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    label,
                    style: theme.textTheme.titleMedium?.copyWith(color: color),
                  ),
                  FittedBox(child: Text(timeText, style: timeStyle)),
                  if (caption != null)
                    Text(
                      caption!,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                ],
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
    final rect = Offset.zero & size;
    final arcRect = rect.deflate(stroke / 2);
    final base = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = stroke
      ..strokeCap = StrokeCap.round;
    canvas
      ..drawArc(arcRect, 0, math.pi * 2, false, base..color = track)
      ..drawArc(
        arcRect,
        -math.pi / 2,
        math.pi * 2 * progress,
        false,
        base..color = color,
      );
  }

  @override
  bool shouldRepaint(_RingPainter old) =>
      old.progress != progress || old.color != color || old.track != track;
}
