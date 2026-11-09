import 'dart:math' as math;

import 'package:enfoque/app/theme/tokens.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

/// Un tramo de color dentro de una barra o de la dona.
typedef ChartSlice = ({Color color, int value});

/// Barras apiladas por materia (horas de estudio).
class StackedBarChart extends StatelessWidget {
  const new({
    required this.bars,
    required this.labels,
    required this.semanticsLabel,
    super.key,
    this.highlight,
  });

  /// Tramos de cada barra, de abajo hacia arriba.
  final List<List<ChartSlice>> bars;

  /// Etiqueta bajo cada barra (vacía para no mostrarla).
  final List<String> labels;
  final int? highlight;
  final String semanticsLabel;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final totals = [for (final b in bars) b.fold(0, (a, s) => a + s.value)];
    final maxValue = math.max(1, totals.fold(0, math.max)).toDouble();
    final reduceMotion = MediaQuery.disableAnimationsOf(context);
    final width = (AppSizes.weekBarWidth * 7 / bars.length).clamp(4.0, 22.0);

    return Semantics(
      label: semanticsLabel,
      excludeSemantics: true,
      child: SizedBox(
        height: AppSizes.chartHeight,
        child: BarChart(
          duration: reduceMotion ? Duration.zero : AppDurations.medium,
          BarChartData(
            maxY: maxValue * 1.1,
            barTouchData: const BarTouchData(enabled: false),
            gridData: const FlGridData(show: false),
            borderData: FlBorderData(show: false),
            titlesData: FlTitlesData(
              leftTitles: const AxisTitles(),
              rightTitles: const AxisTitles(),
              topTitles: const AxisTitles(),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: AppSpacing.xl,
                  getTitlesWidget: (value, meta) {
                    final i = value.toInt();
                    return Padding(
                      padding: const EdgeInsets.only(top: AppSpacing.xs),
                      child: Text(
                        labels[i],
                        style: theme.textTheme.labelMedium?.copyWith(
                          color: i == highlight
                              ? AppColors.mint
                              : theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            barGroups: [
              for (var i = 0; i < bars.length; i++)
                BarChartGroupData(
                  x: i,
                  barRods: [
                    _rod(
                      bars[i],
                      totals[i],
                      width,
                      theme.colorScheme.surfaceContainerHighest,
                      maxValue,
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }

  static BarChartRodData _rod(
    List<ChartSlice> slices,
    int total,
    double width,
    Color empty,
    double maxValue,
  ) {
    final radius = BorderRadius.circular(width / 2.5);
    if (total == 0) {
      // Barra mínima para que el día vacío se vea.
      return BarChartRodData(
        toY: maxValue * 0.04,
        width: width,
        color: empty,
        borderRadius: radius,
      );
    }
    var from = 0.0;
    final items = <BarChartRodStackItem>[];
    for (final s in slices) {
      items.add(BarChartRodStackItem(from, from + s.value, s.color));
      from += s.value;
    }
    return BarChartRodData(
      toY: total.toDouble(),
      width: width,
      borderRadius: radius,
      rodStackItems: items,
      color: Colors.transparent,
    );
  }
}

/// Dona de minutos por materia con un número en el centro.
class SubjectDonut extends StatelessWidget {
  const new({
    required this.slices,
    required this.centerValue,
    required this.centerLabel,
    required this.semanticsLabel,
    super.key,
  });

  final List<ChartSlice> slices;
  final String centerValue;
  final String centerLabel;
  final String semanticsLabel;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Semantics(
      label: semanticsLabel,
      excludeSemantics: true,
      child: SizedBox.square(
        dimension: AppSizes.donut,
        child: Stack(
          alignment: Alignment.center,
          children: [
            PieChart(
              duration: Duration.zero,
              PieChartData(
                startDegreeOffset: -90,
                sectionsSpace: 2,
                centerSpaceRadius: AppSizes.donut / 2 - 14,
                sections: [
                  for (final s in slices)
                    PieChartSectionData(
                      value: s.value.toDouble(),
                      color: s.color,
                      radius: 14,
                      showTitle: false,
                    ),
                ],
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(centerValue, style: theme.textTheme.headlineSmall),
                Text(centerLabel, style: theme.textTheme.bodySmall),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
