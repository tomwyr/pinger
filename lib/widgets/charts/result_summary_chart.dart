import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
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
          colors: [R.colors.primaryLight],
          spots: List.generate(
            values.length,
            (index) => FlSpot(index.toDouble(), values[index].toDouble()),
          ),
        ),
      ],
    ));
  }
}
