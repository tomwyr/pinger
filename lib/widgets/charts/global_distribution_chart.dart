import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:pinger/resources.dart';

class GlobalDistributionChart extends StatelessWidget {
  final double minX;
  final double maxX;
  final double minY;
  final double maxY;
  final List<FlSpot> spots;

  const GlobalDistributionChart._({
    Key key,
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
    final entries = data.entries.toList()
      ..sort((e1, e2) => e1.key.compareTo(e2.key));
    final spots = entries
        .map((it) => FlSpot(it.key.toDouble(), it.value / dataCount * 100))
        .toList();
    final xStep = (spots.last.x - spots.first.x) / 10;
    return GlobalDistributionChart._(
      key: key,
      minX: max(0, spots.first.x - xStep),
      maxX: spots.last.x + xStep,
      minY: 0.0,
      maxY: (spots.map((it) => it.y).fold(0.0, max) / 10).ceil() * 10.0,
      spots: spots,
    );
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
          dotData: FlDotData(show: false),
          isCurved: true,
          curveSmoothness: 0.2,
          colors: [R.colors.primaryLight],
          spots: spots,
        ),
      ],
    ));
  }
}
