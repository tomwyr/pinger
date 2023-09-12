import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:pinger/extensions.dart';
import 'package:pinger/resources.dart';

class ResultSummaryChart extends StatelessWidget {
  const ResultSummaryChart({
    Key? key,
    required this.minIndex,
    required this.maxIndex,
    required this.values,
  }) : super(key: key);

  final int minIndex;
  final int maxIndex;
  final List<int?> values;

  @override
  Widget build(BuildContext context) {
    return LineChart(LineChartData(
      titlesData: const FlTitlesData(show: false),
      borderData: FlBorderData(show: false),
      gridData: const FlGridData(show: false),
      lineTouchData: const LineTouchData(enabled: false),
      lineBarsData: [
        LineChartBarData(
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: true,
            getDotPainter: (_, __, ___, ____) => FlDotCirclePainter(
              color: R.colors.secondary,
              strokeWidth: 0.0,
            ),
            checkToShowDot: (it, _) => it.x == minIndex || it.x == maxIndex,
          ),
          isCurved: true,
          preventCurveOverShooting: true,
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: [
                R.colors.primaryLight.withOpacity(0.7),
                R.colors.primaryLight.withOpacity(0.2),
                R.colors.primaryLight.withOpacity(0.0),
              ],
              stops: const [0.0, 0.7, 1.0],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          color: R.colors.primaryLight,
          spots: values
              .mapIndexed(
                (i, e) => e != null ? FlSpot(i.toDouble(), e.toDouble()) : null,
              )
              .whereNotNull()
              .toList(),
        ),
        // Add invisible line to prevent chart from being cut if there are values on the edges
        LineChartBarData(
          color: R.colors.none,
          spots: values
              .mapIndexed((i, _) => FlSpot(i.toDouble(), values[minIndex]!.toDouble()))
              .toList(),
        ),
      ],
    ));
  }
}
