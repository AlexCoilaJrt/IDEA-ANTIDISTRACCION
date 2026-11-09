import 'dart:math' as math;
import 'dart:typed_data';

import 'package:enfoque/app/theme/semantic_colors.dart';
import 'package:enfoque/app/theme/tokens.dart';
import 'package:flutter/material.dart';

/// Componentes del diseño "Enfoque" (DESIGN.md). Sin estado ni Riverpod.

/// Logo: círculo índigo con el punto menta.
class BrandMark extends StatelessWidget {
  const new({super.key, this.size = 36});

  final double size;

  @override
  Widget build(BuildContext context) => Container(
    width: size,
    height: size,
    decoration: const BoxDecoration(
      color: AppColors.indigo,
      shape: BoxShape.circle,
    ),
    alignment: Alignment.center,
    child: Container(
      width: size * 0.32,
      height: size * 0.32,
      decoration: const BoxDecoration(
        color: AppColors.mint,
        shape: BoxShape.circle,
      ),
    ),
  );
}

/// Cabecera de las pestañas: logo, "Enfoque", sección y racha.
class BrandHeader extends StatelessWidget {
  const new({
    required this.title,
    required this.section,
    super.key,
    this.trailing = const [],
  });

  final String title;

  /// Nombre de la pestaña, en menta debajo del título.
  final String section;
  final List<Widget> trailing;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.lg,
        AppSpacing.sm,
        AppSpacing.sm,
        AppSpacing.sm,
      ),
      child: Row(
        children: [
          const BrandMark(),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(title, style: theme.textTheme.headlineSmall),
                Text(
                  section,
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: context.semanticColors.focus,
                  ),
                ),
              ],
            ),
          ),
          ...trailing,
        ],
      ),
    );
  }
}

/// Píldora con el fuego y los días de racha ("12 d").
class StreakChip extends StatelessWidget {
  const new({required this.label, required this.semanticsLabel, super.key});

  final String label;
  final String semanticsLabel;

  @override
  Widget build(BuildContext context) {
    final fire = context.semanticColors.streak;
    return Semantics(
      label: semanticsLabel,
      excludeSemantics: true,
      child: Container(
        constraints: const BoxConstraints(
          minHeight: AppSizes.minTouchTarget - 8,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.xs,
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceContainerHigh,
          borderRadius: BorderRadius.circular(AppRadius.circle),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.local_fire_department_outlined,
              color: fire,
              size: AppSizes.iconSm,
            ),
            const SizedBox(width: AppSpacing.xs),
            Text(label, style: Theme.of(context).textTheme.labelLarge),
          ],
        ),
      ),
    );
  }
}

/// Etiqueta de materia con su color.
class SubjectTag extends StatelessWidget {
  const new({required this.label, super.key, this.filled = false});

  final String label;

  /// Relleno sólido (tarjeta principal) o tinte al 20 %.
  final bool filled;

  @override
  Widget build(BuildContext context) {
    final color = AppColors.subject(label);
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.xs,
      ),
      decoration: BoxDecoration(
        color: filled ? color : color.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(AppRadius.sm),
      ),
      child: Text(
        label,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context).textTheme.labelLarge?.copyWith(
          color: filled ? Colors.white : Color.lerp(color, Colors.white, 0.35),
        ),
      ),
    );
  }
}

/// Píldora de estado ("Bloqueo activo", "En vivo"...).
class StatusPill extends StatelessWidget {
  const new({
    required this.label,
    required this.color,
    super.key,
    this.icon,
    this.dot = false,
    this.uppercase = false,
  });

  final String label;
  final Color color;
  final IconData? icon;
  final bool dot;
  final bool uppercase;

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(
      horizontal: AppSpacing.md,
      vertical: AppSpacing.xs + 2,
    ),
    decoration: BoxDecoration(
      color: color.withValues(alpha: 0.14),
      borderRadius: BorderRadius.circular(AppRadius.circle),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (dot)
          Container(
            width: AppSpacing.sm,
            height: AppSpacing.sm,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          )
        else if (icon != null)
          Icon(icon, size: AppSizes.iconSm - 4, color: color),
        if (dot || icon != null) const SizedBox(width: AppSpacing.sm),
        Flexible(
          child: Text(
            uppercase ? label.toUpperCase() : label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.labelLarge
                ?.copyWith(color: color, letterSpacing: uppercase ? 1.2 : null),
          ),
        ),
      ],
    ),
  );
}

/// Métrica con icono en círculo, valor grande y etiqueta.
class MetricTile extends StatelessWidget {
  const new({
    required this.icon,
    required this.value,
    required this.label,
    required this.color,
    super.key,
    this.badge,
  });

  final IconData icon;
  final String value;
  final String label;
  final Color color;

  /// Texto pequeño arriba a la derecha (p. ej. "+18 %").
  final String? badge;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      child: Semantics(
        label: '$label: $value',
        excludeSemantics: true,
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: AppSizes.appIcon,
                    height: AppSizes.appIcon,
                    decoration: BoxDecoration(
                      color: color.withValues(alpha: 0.14),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(icon, color: color, size: AppSizes.iconSm),
                  ),
                  const Spacer(),
                  if (badge != null)
                    // Se achica en vez de cortarse ("+217%").
                    Flexible(
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        alignment: Alignment.centerRight,
                        child: Text(
                          badge!,
                          maxLines: 1,
                          style: theme.textTheme.labelMedium?.copyWith(
                            color: color,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: AppSpacing.lg),
              FittedBox(
                fit: BoxFit.scaleDown,
                alignment: Alignment.centerLeft,
                child: Text(
                  value,
                  style: theme.textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                    fontFeatures: const [FontFeature.tabularFigures()],
                  ),
                ),
              ),
              // Una palabra larga se achica en vez de partirse.
              FittedBox(
                fit: BoxFit.scaleDown,
                alignment: Alignment.centerLeft,
                child: Text(
                  label,
                  maxLines: 1,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Barras de la semana en forma de cápsula (L a D).
class WeekBars extends StatelessWidget {
  const new({
    required this.values,
    required this.labels,
    required this.semanticsLabel,
    super.key,
    this.highlight,
  });

  final List<int> values;
  final List<String> labels;

  /// Índice resaltado en índigo (hoy).
  final int? highlight;
  final String semanticsLabel;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final maxValue = values.fold(1, math.max);
    return Semantics(
      label: semanticsLabel,
      excludeSemantics: true,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          for (var i = 0; i < values.length; i++)
            Column(
              children: [
                Container(
                  width: AppSizes.weekBarWidth,
                  height: AppSizes.weekBarHeight,
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.surfaceContainerHighest,
                    borderRadius: BorderRadius.circular(AppRadius.circle),
                  ),
                  child: values[i] == 0
                      ? null
                      : FractionallySizedBox(
                          heightFactor: (values[i] / maxValue).clamp(0.12, 1),
                          child: Container(
                            decoration: BoxDecoration(
                              color: i == highlight
                                  ? AppColors.indigo
                                  : AppColors.mint.withValues(alpha: 0.55),
                              borderRadius: BorderRadius.circular(
                                AppRadius.circle,
                              ),
                            ),
                          ),
                        ),
                ),
                const SizedBox(height: AppSpacing.sm),
                Text(
                  labels[i],
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: i == highlight
                        ? theme.colorScheme.onSurface
                        : theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}

/// Calendario del mes con intensidad según minutos estudiados.
class MonthCalendar extends StatelessWidget {
  const new({
    required this.month,
    required this.today,
    required this.minutesByDay,
    required this.weekdayInitials,
    required this.lessLabel,
    required this.moreLabel,
    required this.semanticsLabel,
    super.key,
  });

  /// Cualquier día del mes a mostrar.
  final DateTime month;
  final DateTime today;
  final Map<DateTime, int> minutesByDay;

  /// "L", "M", "X", "J", "V", "S", "D".
  final List<String> weekdayInitials;
  final String lessLabel;
  final String moreLabel;
  final String semanticsLabel;

  /// Niveles: 0, <1 h, <2 h, <3 h, 3 h o más.
  static int level(int minutes) => switch (minutes) {
    0 => 0,
    < 60 => 1,
    < 120 => 2,
    < 180 => 3,
    _ => 4,
  };

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final first = DateTime(month.year, month.month);
    final daysInMonth = DateTime(month.year, month.month + 1, 0).day;
    final leading = first.weekday - 1;
    final cells = leading + daysInMonth;
    final rows = (cells / 7).ceil();
    final todayDate = DateTime(today.year, today.month, today.day);

    Color fill(int lvl) => switch (lvl) {
      0 => theme.colorScheme.surfaceContainerHigh,
      1 => AppColors.indigoLight.withValues(alpha: 0.25),
      2 => AppColors.indigoLight.withValues(alpha: 0.45),
      3 => AppColors.indigoLight.withValues(alpha: 0.7),
      _ => AppColors.indigoLight,
    };

    return Semantics(
      label: semanticsLabel,
      excludeSemantics: true,
      child: Column(
        children: [
          Row(
            children: [
              for (final d in weekdayInitials)
                Expanded(
                  child: Center(
                    child: Text(
                      d,
                      style: theme.textTheme.labelMedium?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),
          for (var r = 0; r < rows; r++)
            Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.xs),
              child: Row(
                children: [
                  for (var c = 0; c < 7; c++)
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppSpacing.xs / 2,
                        ),
                        child: Builder(
                          builder: (context) {
                            final dayNumber = r * 7 + c - leading + 1;
                            if (dayNumber < 1 || dayNumber > daysInMonth) {
                              return const SizedBox(
                                height: AppSizes.calendarCell,
                              );
                            }
                            final date = DateTime(
                              month.year,
                              month.month,
                              dayNumber,
                            );
                            final future = date.isAfter(todayDate);
                            final lvl = level(minutesByDay[date] ?? 0);
                            return Container(
                              height: AppSizes.calendarCell,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: future ? Colors.transparent : fill(lvl),
                                borderRadius: BorderRadius.circular(
                                  AppRadius.sm,
                                ),
                                border: date == todayDate
                                    ? Border.all(
                                        color: AppColors.mint,
                                        width: 1.5,
                                      )
                                    : null,
                              ),
                              child: Text(
                                '$dayNumber',
                                style: theme.textTheme.labelMedium?.copyWith(
                                  color: future
                                      ? theme.colorScheme.onSurfaceVariant
                                            .withValues(alpha: 0.4)
                                      : lvl >= 3
                                      ? AppColors.onIndigoLight
                                      : theme.colorScheme.onSurface,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                ],
              ),
            ),
          const SizedBox(height: AppSpacing.sm),
          Row(
            children: [
              Text(lessLabel, style: theme.textTheme.bodySmall),
              const Spacer(),
              for (var l = 1; l <= 4; l++)
                Container(
                  width: AppSpacing.md,
                  height: AppSpacing.md,
                  margin: const EdgeInsets.only(left: AppSpacing.xs),
                  decoration: BoxDecoration(
                    color: fill(l),
                    borderRadius: BorderRadius.circular(AppRadius.xs),
                  ),
                ),
              const Spacer(),
              Text(moreLabel, style: theme.textTheme.bodySmall),
            ],
          ),
        ],
      ),
    );
  }
}

/// App permitida: icono en círculo y nombre debajo.
class AppBubble extends StatelessWidget {
  const new({required this.label, required this.onTap, super.key, this.icon});

  final String label;
  final Uint8List? icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Semantics(
      button: true,
      label: label,
      excludeSemantics: true,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppRadius.md),
        child: SizedBox(
          width: AppSizes.appBubble + AppSpacing.xl,
          child: Column(
            children: [
              Container(
                width: AppSizes.appBubble,
                height: AppSizes.appBubble,
                padding: const EdgeInsets.all(AppSpacing.md),
                decoration: BoxDecoration(
                  color: theme.colorScheme.surfaceContainerHigh,
                  shape: BoxShape.circle,
                ),
                child: icon == null
                    ? Icon(
                        Icons.apps,
                        color: theme.colorScheme.onSurfaceVariant,
                      )
                    : Image.memory(icon!, gaplessPlayback: true),
              ),
              const SizedBox(height: AppSpacing.sm),
              Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: theme.textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Puntos de paginación de la bienvenida.
class PageDots extends StatelessWidget {
  const new({required this.count, required this.index, super.key});

  final int count;
  final int index;

  @override
  Widget build(BuildContext context) {
    final reduce = MediaQuery.disableAnimationsOf(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (var i = 0; i < count; i++)
          AnimatedContainer(
            duration: reduce ? Duration.zero : AppDurations.medium,
            margin: const EdgeInsets.symmetric(horizontal: AppSpacing.xs),
            width: i == index ? AppSpacing.xxl + AppSpacing.lg : AppSpacing.md,
            height: AppSpacing.md - 2,
            decoration: BoxDecoration(
              color: i == index
                  ? AppColors.indigo
                  : Theme.of(context).colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(AppRadius.circle),
            ),
          ),
      ],
    );
  }
}

/// Ilustración de la bienvenida: teléfono con un icono dentro de anillos.
class OnboardingIllustration extends StatelessWidget {
  const new({required this.icon, required this.accent, super.key});

  final IconData icon;
  final Color accent;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    const size = AppSizes.illustration;
    return ExcludeSemantics(
      child: SizedBox.square(
        dimension: size,
        child: CustomPaint(
          painter: _RingsPainter(
            dashColor: accent.withValues(alpha: 0.5),
            fill: scheme.surfaceContainerLow,
            ring: scheme.surfaceContainerHigh,
            dot1: AppColors.indigoLight,
            dot2: AppColors.mint,
          ),
          child: Center(
            child: Container(
              width: size * 0.4,
              height: size * 0.6,
              decoration: BoxDecoration(
                color: scheme.surfaceContainerLowest,
                borderRadius: BorderRadius.circular(AppRadius.lg),
                border: Border.all(color: scheme.outlineVariant, width: 3),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(AppSpacing.sm),
                    decoration: BoxDecoration(
                      color: AppColors.indigo.withValues(alpha: 0.35),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.check,
                      color: AppColors.indigoLight,
                      size: AppSizes.iconSm,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.xs),
                  Icon(icon, color: accent, size: AppSizes.iconXl * 0.9),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _RingsPainter extends CustomPainter {
  new({
    required this.dashColor,
    required this.fill,
    required this.ring,
    required this.dot1,
    required this.dot2,
  });

  final Color dashColor;
  final Color fill;
  final Color ring;
  final Color dot1;
  final Color dot2;

  @override
  void paint(Canvas canvas, Size size) {
    final c = size.center(Offset.zero);
    final r = size.width / 2;
    canvas
      ..drawCircle(c, r * 0.86, Paint()..color = fill)
      ..drawCircle(
        c,
        r * 0.7,
        Paint()
          ..color = ring
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1.5,
      );
    // Anillo exterior punteado.
    final dash = Paint()
      ..color = dashColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;
    const segments = 48;
    for (var i = 0; i < segments; i += 2) {
      canvas.drawArc(
        Rect.fromCircle(center: c, radius: r * 0.98),
        i * 2 * math.pi / segments,
        math.pi / segments,
        false,
        dash,
      );
    }
    canvas
      ..drawCircle(c + Offset(-r * 0.58, -r * 0.35), 4, Paint()..color = dot1)
      ..drawCircle(c + Offset(r * 0.6, -r * 0.45), 3.5, Paint()..color = dot2)
      ..drawCircle(c + Offset(r * 0.65, r * 0.27), 4, Paint()..color = dot1)
      ..drawCircle(c + Offset(-r * 0.6, r * 0.35), 3, Paint()..color = dot2);
  }

  @override
  bool shouldRepaint(_RingsPainter old) => false;
}

/// Cápsulas de progreso de bloques (0/4).
class BlockSegments extends StatelessWidget {
  const new({required this.total, required this.done, super.key});

  final int total;
  final int done;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        for (var i = 0; i < total; i++)
          Expanded(
            child: Container(
              height: AppSpacing.xs + 2,
              margin: const EdgeInsets.only(right: AppSpacing.sm),
              decoration: BoxDecoration(
                color: i < done
                    ? AppColors.mint
                    : theme.colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(AppRadius.circle),
              ),
            ),
          ),
        Text('$done/$total', style: theme.textTheme.labelMedium),
      ],
    );
  }
}
