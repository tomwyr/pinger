import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:pinger/resources.dart';

class GlobalDistributionChart extends StatelessWidget {
  final int highlightIndex;
  final double minX;
  final double maxX;
  final double minY;
  final double maxY;
  final List<FlSpot> spots;

  const GlobalDistributionChart._({
    Key key,
    @required this.highlightIndex,
    @required this.minX,
    @required this.maxX,
    @required this.minY,
    @required this.maxY,
    @required this.spots,
  }) : super(key: key);

  factory GlobalDistributionChart({
    Key key,
    @required List<PingValueCount> data,
    @required int dataCount,
    @required int userResult,
  }) {
    final spots = data
        .map((it) => FlSpot(it.value.toDouble(), it.count / dataCount * 100))
        .toList()
          ..sort((e1, e2) => e1.x.compareTo(e2.x));
    final highlightIndex = _insertUserResultSpot(userResult, spots);
    return GlobalDistributionChart._(
      key: key,
      highlightIndex: highlightIndex,
      minX: spots.first.x,
      maxX: spots.last.x,
      minY: 0.0,
      maxY: (spots.map((it) => it.y).fold(0.0, max) / 10).ceil() * 10.0,
      spots: spots,
    );
  }

  static int _insertUserResultSpot(int result, List<FlSpot> spots) {
    var spot = FlSpot.nullSpot;
    var index = spots.indexWhere((it) => it.x >= result);
    if (index == 0) {
      spot = spots.first;
    } else if (index == -1) {
      index = spots.length - 1;
      spot = spots.last;
    } else if (spots[index].x == result) {
      spot = spots[index];
    } else {
      final s1 = spots[index - 1], s2 = spots[index];
      final x = result.toDouble().clamp(spots.first.x, spots.last.x);
      final y = s1.y + (s2.y - s1.y) * (result - s1.x) / (s2.x - s1.x);
      spot = FlSpot(x, y);
    }
    spots.insert(index, spot);
    return index;
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
            checkToShowDot: (spot, data) => spot == data.spots[highlightIndex],
            getDotPainter: (spot, __, ___, ____) => FlDotCirclePainter(
              color: R.colors.secondary,
              strokeWidth: 0.0,
            ),
          ),
          isCurved: true,
          curveSmoothness: 0.2,
          preventCurveOverShooting: true,
          colors: [R.colors.primaryLight],
          spots: spots,
        ),
      ],
    ));
  }
}

class PingValueCount {
  final int value;
  final int count;

  PingValueCount(this.value, this.count);
}
