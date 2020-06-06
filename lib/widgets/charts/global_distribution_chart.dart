import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:pinger/resources.dart';

class GlobalDistributionChart extends StatelessWidget {
  final double highlightX;
  final double minX;
  final double maxX;
  final double minY;
  final double maxY;
  final List<FlSpot> spots;

  const GlobalDistributionChart._({
    Key key,
    @required this.highlightX,
    @required this.minX,
    @required this.maxX,
    @required this.minY,
    @required this.maxY,
    @required this.spots,
  }) : super(key: key);

  factory GlobalDistributionChart({
    Key key,
    @required Map<int, int> data,
    @required int dataCount,
    @required int userResult,
  }) {
    final spots = data.entries
        .map((it) => FlSpot(it.key.toDouble(), it.value / dataCount * 100))
        .toList()
          ..sort((e1, e2) => e1.x.compareTo(e2.x));
    _insertUserResultSpot(userResult, spots);
    final xStep = (spots.last.x - spots.first.x) / 10;
    return GlobalDistributionChart._(
      key: key,
      highlightX: userResult.toDouble(),
      minX: max(0, spots.first.x - xStep),
      maxX: spots.last.x + xStep,
      minY: 0.0,
      maxY: (spots.map((it) => it.y).fold(0.0, max) / 10).ceil() * 10.0,
      spots: spots,
    );
  }

  static void _insertUserResultSpot(int userResult, List<FlSpot> spots) {
    final index = spots.indexWhere((it) => it.x >= userResult) ?? 0;
    var value = spots[index].y.toDouble();
    // Skip interpolation if user result lies exactly at
    // index or entry at index is last element of data.
    if (spots[index].x != userResult &&
        index != 0 &&
        index != spots.length - 1) {
      final s1 = spots[index - 1], s2 = spots[index];
      value = s1.y + (s2.y - s1.y) * (userResult - s1.x) / (s2.x - s1.x);
    }
    spots.insert(index, FlSpot(userResult.toDouble(), value));
  }

  @override
  Widget build(BuildContext context) {
    return LineChart(LineChartData(
      minX: minX,
      maxX: maxX,
      minY: minY,
      maxY: maxY,
      titlesData: FlTitlesData(
        leftTitles: SideTitles(
          showTitles: true,
          interval: (maxY - minY) / 4,
          getTitles: (it) => it.toInt().toString(),
          textStyle: R.styles.chartLabel,
        ),
        bottomTitles: SideTitles(
          showTitles: true,
          interval: (maxX - minX) / 5,
          getTitles: (it) => it.toStringAsFixed(0),
          textStyle: R.styles.chartLabel,
        ),
      ),
      axisTitleData: FlAxisTitleData(show: false),
      borderData: FlBorderData(show: false),
      gridData: FlGridData(show: false),
      lineTouchData: LineTouchData(enabled: false),
      lineBarsData: [
        LineChartBarData(
          isStrokeCapRound: true,
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
          dotData: FlDotData(
            show: true,
            checkToShowDot: (spot, _) => spot.x == highlightX,
            getDotPainter: (spot, __, ___, ____) => FlDotCirclePainter(
              color: R.colors.secondary,
              strokeWidth: 0.0,
            ),
          ),
          isCurved: true,
          curveSmoothness: 0.2,
          colors: [R.colors.primaryLight],
          spots: spots,
        ),
      ],
    ));
  }
}
