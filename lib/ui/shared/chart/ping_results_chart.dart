import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:pinger/extensions.dart';
import 'package:pinger/resources.dart';

class PingResultsChart extends StatelessWidget {
  final List<int> values;
  final int maxValue;
  final int dotsCount;
  final double startX;
  final double valueLabelSize;
  final double valueLabelMargin;

  PingResultsChart({
    Key key,
    @required this.values,
    @required this.maxValue,
    @required this.startX,
    @required this.dotsCount,
    @required this.valueLabelSize,
    @required this.valueLabelMargin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dotsSpacing = (dotsCount / 10).ceilToDouble();
    final titlesHorizontalInterval = dotsSpacing;
    final endX = startX + dotsCount - 1;
    final titlesVerticalInterval = maxValue != null
        ? (maxValue / min(dotsCount, 8)).clamp(1.0, double.infinity)
        : null;
    final maxY = (titlesVerticalInterval != null
            ? maxValue + titlesVerticalInterval / 2
            : null)
        ?.ceilToDouble();
    return LineChart(
      LineChartData(
        minX: startX - dotsSpacing,
        maxX: endX + dotsSpacing,
        minY: 0.0,
        maxY: maxY ?? 0.0,
        clipData: FlClipData.horizontal(),
        axisTitleData: FlAxisTitleData(show: false),
        borderData: FlBorderData(show: false),
        titlesData: FlTitlesData(
          leftTitles: SideTitles(
            showTitles: true,
            reservedSize: valueLabelSize,
            margin: valueLabelMargin,
            interval: titlesVerticalInterval?.ceilToDouble(),
            getTitles: (it) => it.toInt().toString(),
            textStyle: R.styles.chartLabel,
          ),
          bottomTitles: SideTitles(
            showTitles: true,
            getTitles: (it) => it >= startX && it <= endX && it % 1.0 == 0.0
                ? (it + 1.5).toInt().toString()
                : null,
            interval: titlesHorizontalInterval,
            textStyle: R.styles.chartLabel,
          ),
        ),
        gridData: FlGridData(
          show: true,
          getDrawingHorizontalLine: (_) =>
              FlLine(color: R.colors.grayLight, strokeWidth: 1.0),
          getDrawingVerticalLine: (_) =>
              FlLine(color: R.colors.grayLight, strokeWidth: 1.0),
          drawHorizontalLine: values.isNotEmpty,
          drawVerticalLine: values.isNotEmpty,
          horizontalInterval: titlesVerticalInterval,
          verticalInterval: titlesHorizontalInterval,
        ),
        lineTouchData: LineTouchData(
          enabled: true,
          touchTooltipData: LineTouchTooltipData(
            tooltipRoundedRadius: 8.0,
            tooltipBottomMargin: 32.0,
            tooltipBgColor: R.colors.canvas.withOpacity(0.85),
            getTooltipItems: (it) => it
                .map((spot) => values[spot.spotIndex] != null
                    ? LineTooltipItem(
                        spot.y.toInt().toString(),
                        TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: R.colors.secondary,
                        ))
                    : null)
                .toList(),
          ),
        ),
        lineBarsData: [
          if (values.isNotEmpty)
            LineChartBarData(
              dotData: FlDotData(
                show: true,
                getDotPainter: (_, __, ___, ____) => FlDotCirclePainter(
                  color: R.colors.secondary,
                  strokeWidth: 0.0,
                  radius: 2.5,
                ),
              ),
              isCurved: true,
              preventCurveOverShooting: true,
              colors: [R.colors.primaryLight],
              spots: values
                  .mapIndexed((i, e) => FlSpot(i.toDouble(), e?.toDouble()))
                  .toList(),
            ),
          if (values.isNotEmpty)
            LineChartBarData(
              dotData: FlDotData(
                show: true,
                checkToShowDot: (it, __) => it.isNotNull(),
                getDotPainter: (_, __, ___, ____) => FlDotCirclePainter(
                  color: R.colors.gray,
                  strokeWidth: 0.0,
                  radius: 2.5,
                ),
              ),
              colors: [R.colors.none],
              spots: values
                  .mapIndexed(
                      (i, e) => FlSpot(i.toDouble(), e == null ? 0.0 : null))
                  .toList(),
            ),
        ],
      ),
    );
  }
}
