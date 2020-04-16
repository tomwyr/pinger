import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:pinger/model/ping_result.dart';
import 'package:pinger/utils/format_utils.dart';

class PingResultItem extends StatelessWidget {
  final PingResult result;
  final VoidCallback onTap;

  const PingResultItem({
    Key key,
    @required this.result,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 4.0),
            child: Icon(Icons.compare_arrows),
          ),
          Container(
            width: 32.0,
            margin: EdgeInsets.only(left: 4.0),
            child: Text(
              result.values.length.toString(),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Icon(Icons.timer),
          ),
          Container(
            width: 48.0,
            margin: EdgeInsets.only(left: 4.0),
            child: Text(
              FormatUtils.getDurationLabel(result.duration),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
      trailing: PingResultItemTrailing(result: result),
    );
  }
}

class PingResultItemTrailing extends StatelessWidget {
  final PingResult result;

  const PingResultItemTrailing({Key key, @required this.result})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        PingResultSummaryChart(results: result),
        SizedBox(
          width: 48.0,
          child: Text(
            FormatUtils.getSinceNowLabel(result.startTime),
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey),
          ),
        ),
      ],
    );
  }
}

class PingResultSummaryChart extends StatelessWidget {
  final PingResult results;
  final double width;
  final double height;
  final double barWidth;

  const PingResultSummaryChart({
    Key key,
    @required this.results,
    this.width = 96.0,
    this.height = 40.0,
  })  : this.barWidth = width / 3,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Stack(children: <Widget>[
        BarChart(BarChartData(
          groupsSpace: 0.0,
          borderData: FlBorderData(show: false),
          axisTitleData: FlAxisTitleData(show: false),
          titlesData: FlTitlesData(show: false),
          barGroups: [
            _buildBarData(0, results.stats.min),
            _buildBarData(1, results.stats.mean),
            _buildBarData(2, results.stats.max),
          ],
        )),
        LineChart(LineChartData(
          titlesData: FlTitlesData(show: false),
          axisTitleData: FlAxisTitleData(show: false),
          borderData: FlBorderData(show: false),
          gridData: FlGridData(show: false),
          lineBarsData: [
            LineChartBarData(
              dotData: FlDotData(show: false),
              isCurved: true,
              preventCurveOverShooting: true,
              colors: [Colors.lightBlue],
              spots: List.generate(
                results.values.length,
                (index) => FlSpot(
                  index.toDouble(),
                  results.values[index].toDouble(),
                ),
              ),
            ),
          ],
        )),
      ]),
    );
  }

  BarChartGroupData _buildBarData(int index, int value) {
    return BarChartGroupData(x: index, barRods: [
      BarChartRodData(
        y: value.toDouble(),
        width: barWidth,
        color: Colors.lightBlue.withOpacity(0.25),
        borderRadius: BorderRadius.zero,
      ),
    ]);
  }
}
