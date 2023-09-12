import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:pinger/resources.dart';

class GlobalDistributionChart extends StatelessWidget {
  const GlobalDistributionChart._({
    Key? key,
    required this.highlightIndex,
    required this.minX,
    required this.maxX,
    required this.minY,
    required this.maxY,
    required this.spots,
    required this.getLabelX,
    required this.getLabelY,
  }) : super(key: key);

  factory GlobalDistributionChart({
    Key? key,
    required Map<int, int> values,
    required int dataCount,
    required int userResult,
  }) {
    final firstGroupSize = _calcFistGroupSize(values);
    final spots = _groupChartData(values, firstGroupSize)
        .map((it) => FlSpot(it.value.toDouble(), it.count / dataCount * 100))
        .toList()
      ..sort((e1, e2) => e1.x.compareTo(e2.x));
    final highlightIndex = _insertUserResultSpot(userResult, firstGroupSize, spots);
    return GlobalDistributionChart._(
      key: key,
      highlightIndex: highlightIndex,
      minX: spots.first.x,
      maxX: spots.last.x,
      minY: 0.0,
      maxY: (spots.map((it) => it.y).fold(0.0, max) / 10).ceil() * 10.0,
      spots: spots,
      getLabelX: (it) => Text(
        it == 0.0 ? "0" : pow(_logBase, it + firstGroupSize - 1).toStringAsFixed(0),
        style: R.styles.chartLabel,
      ),
      getLabelY: (it) => Text(
        it.toInt().toString(),
        style: R.styles.chartLabel,
      ),
    );
  }

  static const double _logBase = 1.25;

  final int highlightIndex;
  final double minX;
  final double maxX;
  final double minY;
  final double maxY;
  final List<FlSpot> spots;
  final Widget Function(double) getLabelX;
  final Widget Function(double) getLabelY;

  static int _calcFistGroupSize(Map<int, int> values) {
    final maxValue = values.keys.reduce(max);
    if (maxValue == 0) return 0;
    return _calcResultLog(log(maxValue)).toInt();
  }

  static List<PingValueCount> _groupChartData(Map<int, int> values, int firstSize) {
    final groups = <int, int>{};
    values.forEach((value, count) {
      final groupKey =
          value > 0 ? max(_calcResultLog(value).round(), firstSize) - firstSize + 1 : 0;
      final groupCount = groups[groupKey] ?? 0;
      groups[groupKey] = groupCount + count;
    });
    return groups.entries.map((it) => PingValueCount(it.key, it.value)).toList();
  }

  static int _insertUserResultSpot(int value, int firstGroupSize, List<FlSpot> spots) {
    final valueX = value > 0 ? _calcResultLog(value) - firstGroupSize + 1 : 0.0;
    var spot = FlSpot.nullSpot;
    var index = spots.indexWhere((it) => it.x >= valueX);
    if (index == 0) {
      spot = spots.first;
    } else if (index == -1) {
      index = spots.length - 1;
      spot = spots.last;
    } else if (spots[index].x == valueX) {
      spot = spots[index];
    } else {
      final s1 = spots[index - 1], s2 = spots[index];
      final x = valueX.clamp(spots.first.x, spots.last.x);
      final y = s1.y + (s2.y - s1.y) * (valueX - s1.x) / (s2.x - s1.x);
      spot = FlSpot(x, y);
    }
    spots.insert(index, spot);
    return index;
  }

  static double _calcResultLog(num value) => log(value) / log(_logBase);

  @override
  Widget build(BuildContext context) {
    return LineChart(LineChartData(
      minX: minX,
      maxX: maxX,
      minY: minY,
      maxY: maxY,
      titlesData: FlTitlesData(
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: (maxY - minY) / 4,
            getTitlesWidget: (value, meta) => getLabelY(value),
          ),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: (maxX - minX) / 6,
            getTitlesWidget: (value, meta) => getLabelX(value),
          ),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      ),
      borderData: FlBorderData(show: false),
      gridData: const FlGridData(show: false),
      lineTouchData: const LineTouchData(enabled: false),
      lineBarsData: [
        LineChartBarData(
          isStrokeCapRound: true,
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
          color: R.colors.primaryLight,
          spots: spots,
        ),
      ],
    ));
  }
}

class PingValueCount {
  PingValueCount(this.value, this.count);

  final int value;
  final int count;
}
