import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:pinger/extensions.dart';
import 'package:pinger/resources.dart';

class ResultSummaryChart extends StatelessWidget {
  const ResultSummaryChart({
    Key key,
    @required this.minIndex,
    @required this.maxIndex,
    @required this.values,
  }) : super(key: key);

  final int minIndex;
  final int maxIndex;
  final List<int> values;

  @override
  Widget build(BuildContext context) {
    return LineChart(LineChartData(
      titlesData: FlTitlesData(show: false),
      axisTitleData: FlAxisTitleData(show: false),
      borderData: FlBorderData(show: false),
      gridData: FlGridData(show: false),
      lineTouchData: LineTouchData(enabled: false),
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
            colors: [
              R.colors.primaryLight.withOpacity(0.7),
              R.colors.primaryLight.withOpacity(0.2),
              R.colors.primaryLight.withOpacity(0.0),
            ],
            gradientColorStops: [0.0, 0.7, 1.0],
            gradientFrom: const Offset(0.0, 0.0),
            gradientTo: const Offset(0.0, 1.0),
          ),
          colors: [R.colors.primaryLight],
          spots: values
              .mapIndexed((i, e) => FlSpot(i.toDouble(), e?.toDouble()))
              .toList(),
        ),
        // Add invisible line to prevent chart from being cut if there are values on the edges
        LineChartBarData(
          colors: [R.colors.none],
          spots: values
              .mapIndexed(
                  (i, _) => FlSpot(i.toDouble(), values[minIndex].toDouble()))
              .toList(),
        ),
      ],
    ));
  }
}
