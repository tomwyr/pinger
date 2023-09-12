import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:pinger/extensions.dart';
import 'package:pinger/resources.dart';

class ResultTileChart extends StatelessWidget {
  const ResultTileChart({
    Key? key,
    required this.values,
    required this.min,
    required this.mean,
    required this.max,
    required this.barWidth,
  }) : super(key: key);

  final Radius barRadius = const Radius.circular(2.0);

  final List<int?> values;
  final int min;
  final int mean;
  final int max;
  final double barWidth;

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      BarChart(BarChartData(
        groupsSpace: 0.0,
        borderData: FlBorderData(show: false),
        titlesData: const FlTitlesData(show: false),
        barTouchData: BarTouchData(enabled: false),
        gridData: const FlGridData(show: false),
        barGroups: [
          _buildBarData(0, min, barWidth),
          _buildBarData(1, mean, barWidth),
          _buildBarData(2, max, barWidth),
        ],
      )),
      LineChart(LineChartData(
        titlesData: const FlTitlesData(show: false),
        borderData: FlBorderData(show: false),
        gridData: const FlGridData(show: false),
        lineTouchData: const LineTouchData(enabled: false),
        lineBarsData: [
          LineChartBarData(
            dotData: const FlDotData(show: false),
            isCurved: true,
            preventCurveOverShooting: true,
            color: R.colors.secondary,
            barWidth: 1.0,
            spots: values
                .mapIndexed(
                  (i, e) => e != null ? FlSpot(i.toDouble(), e.toDouble()) : null,
                )
                .whereNotNull()
                .toList(),
          ),
        ],
      )),
    ]);
  }

  BarChartGroupData _buildBarData(int index, int value, double width) {
    return BarChartGroupData(x: index, barRods: [
      BarChartRodData(
        toY: value.toDouble(),
        width: width,
        color: R.colors.primaryLight.withOpacity(0.5),
        borderRadius: BorderRadius.only(
          topLeft: barRadius,
          topRight: barRadius,
          bottomLeft: index == 0 ? barRadius : Radius.zero,
          bottomRight: index == 2 ? barRadius : Radius.zero,
        ),
      ),
    ]);
  }
}
