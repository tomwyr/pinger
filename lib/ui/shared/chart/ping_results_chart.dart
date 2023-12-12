import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:pinger/extensions.dart';
import 'package:pinger/resources.dart';

class PingResultsChart extends StatelessWidget {
  const PingResultsChart({
    super.key,
    required this.values,
    required this.maxValue,
    required this.startX,
    required this.dotsCount,
    required this.valueLabelSize,
    required this.valueLabelMargin,
  });

  final List<int?>? values;
  final int? maxValue;
  final int dotsCount;
  final double? startX;
  final double valueLabelSize;
  final double valueLabelMargin;

  @override
  Widget build(BuildContext context) {
    final dotsSpacing = (dotsCount / 10).ceilToDouble();
    final titlesHorizontalInterval = dotsSpacing;
    final endX = startX! + dotsCount - 1;
    final titlesVerticalInterval =
        maxValue != null ? (maxValue! / min(dotsCount, 8)).clamp(1.0, double.infinity) : null;
    final maxY = (titlesVerticalInterval != null ? maxValue! + titlesVerticalInterval / 2 : null)
        ?.ceilToDouble();
    return LineChart(
      LineChartData(
        minX: startX! - dotsSpacing,
        maxX: endX + dotsSpacing,
        minY: 0.0,
        maxY: maxY ?? 0.0,
        clipData: const FlClipData.horizontal(),
        borderData: FlBorderData(show: false),
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: valueLabelSize,
              interval: titlesVerticalInterval?.ceilToDouble(),
              getTitlesWidget: (value, meta) => Padding(
                padding: EdgeInsets.all(valueLabelMargin),
                child: Text(
                  value.toInt().toString(),
                  style: R.styles.chartLabel,
                ),
              ),
            ),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              interval: titlesHorizontalInterval,
              getTitlesWidget: (value, meta) => Text(
                value >= startX! && value <= endX && value % 1.0 == 0.0
                    ? (value + 1.5).toInt().toString()
                    : '',
                style: R.styles.chartLabel,
              ),
            ),
          ),
          topTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
        ),
        gridData: FlGridData(
          show: true,
          getDrawingHorizontalLine: (_) => FlLine(color: R.colors.grayLight, strokeWidth: 1.0),
          getDrawingVerticalLine: (_) => FlLine(color: R.colors.grayLight, strokeWidth: 1.0),
          drawHorizontalLine: values!.isNotEmpty,
          drawVerticalLine: values!.isNotEmpty,
          horizontalInterval: titlesVerticalInterval,
          verticalInterval: titlesHorizontalInterval,
        ),
        lineTouchData: LineTouchData(
          enabled: true,
          touchTooltipData: LineTouchTooltipData(
            tooltipRoundedRadius: 8.0,
            tooltipPadding: const EdgeInsets.only(bottom: 32.0),
            tooltipBgColor: R.colors.canvas.withOpacity(0.85),
            getTooltipItems: (it) => it
                .map((spot) => values![spot.spotIndex] != null
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
          if (values!.isNotEmpty)
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
              color: R.colors.primaryLight,
              spots: values!
                  .mapIndexed((i, e) => e != null ? FlSpot(i.toDouble(), e.toDouble()) : null)
                  .whereNotNull()
                  .toList(),
            ),
          if (values!.isNotEmpty)
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
              color: R.colors.none,
              spots: values!
                  .mapIndexed(
                    (i, e) => e == null ? FlSpot(i.toDouble(), 0.0) : null,
                  )
                  .whereNotNull()
                  .toList(),
            ),
        ],
      ),
    );
  }
}
