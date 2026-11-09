import 'package:enfoque/app/theme/tokens.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

/// Calendario de calor: una columna por semana, una fila por día.
class HeatmapCalendar extends StatelessWidget {
  const new({
    required this.minutesByDay,
    required this.endDay,
    required this.goalMinutes,
    required this.semanticsLabel,
    super.key,
    this.weeks = 12,
  });

  /// Minutos por día (claves a medianoche local).
  final Map<DateTime, int> minutesByDay;
  final DateTime endDay;
  final int goalMinutes;
  final int weeks;
  final String semanticsLabel;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final end = DateTime(endDay.year, endDay.month, endDay.day);
    // La última columna termina en el domingo de la semana actual.
    final lastSunday = DateTime(
      end.year,
      end.month,
      end.day + (7 - end.weekday),
    );
    final firstDay = DateTime(
      lastSunday.year,
      lastSunday.month,
      lastSunday.day - weeks * 7 + 1,
    );

    Color colorFor(DateTime day) {
      if (day.isAfter(end)) return Colors.transparent;
      final minutes = minutesByDay[day] ?? 0;
      if (minutes == 0) return scheme.surfaceContainerHighest;
      final ratio = (minutes / goalMinutes).clamp(0.25, 1.0);
      return scheme.primary.withValues(alpha: ratio);
    }

    return Semantics(
      label: semanticsLabel,
      excludeSemantics: true,
      child: FittedBox(
        alignment: Alignment.centerLeft,
        child: Row(
          children: [
            for (var w = 0; w < weeks; w++)
              Padding(
                padding: const EdgeInsets.only(right: AppSpacing.xs),
                child: Column(
                  children: [
                    for (var d = 0; d < 7; d++)
                      Padding(
                        padding: const EdgeInsets.only(bottom: AppSpacing.xs),
                        child: Container(
                          width: AppSizes.heatmapCell,
                          height: AppSizes.heatmapCell,
                          decoration: BoxDecoration(
                            color: colorFor(
                              DateTime(
                                firstDay.year,
                                firstDay.month,
                                firstDay.day + w * 7 + d,
                              ),
                            ),
                            borderRadius: BorderRadius.circular(AppSpacing.xs),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}

/// Barras de minutos por día.
class WeekBarChart extends StatelessWidget {
  const new({
    required this.values,
    required this.labels,
    required this.goalMinutes,
    required this.semanticsLabel,
    super.key,
  });

  final List<int> values;
  final List<String> labels;
  final int goalMinutes;
  final String semanticsLabel;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final maxValue = [
      goalMinutes,
      ...values,
    ].reduce((a, b) => a > b ? a : b).toDouble();
    final reduceMotion = MediaQuery.disableAnimationsOf(context);

    return Semantics(
      label: semanticsLabel,
      excludeSemantics: true,
      child: SizedBox(
        height: AppSizes.chartHeight,
        child: BarChart(
          duration: reduceMotion ? Duration.zero : AppDurations.medium,
          BarChartData(
            maxY: maxValue * 1.15,
            barTouchData: const BarTouchData(enabled: false),
            gridData: const FlGridData(show: false),
            borderData: FlBorderData(show: false),
            extraLinesData: ExtraLinesData(
              horizontalLines: [
                HorizontalLine(
                  y: goalMinutes.toDouble(),
                  color: scheme.outline,
                  dashArray: const [4, 4],
                  strokeWidth: 1,
                ),
              ],
            ),
            titlesData: FlTitlesData(
              leftTitles: const AxisTitles(),
              rightTitles: const AxisTitles(),
              topTitles: const AxisTitles(),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: AppSpacing.xl,
                  getTitlesWidget: (value, meta) => Padding(
                    padding: const EdgeInsets.only(top: AppSpacing.xs),
                    child: Text(
                      labels[value.toInt()],
                      style: theme.textTheme.labelSmall,
                    ),
                  ),
                ),
              ),
            ),
            barGroups: [
              for (var i = 0; i < values.length; i++)
                BarChartGroupData(
                  x: i,
                  barRods: [
                    BarChartRodData(
                      toY: values[i].toDouble(),
                      width: AppSpacing.lg,
                      color: values[i] >= goalMinutes
                          ? scheme.primary
                          : scheme.primary.withValues(alpha: 0.5),
                      borderRadius: BorderRadius.circular(AppSpacing.xs),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
