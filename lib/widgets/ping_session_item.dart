import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:pinger/model/ping_session.dart';
import 'package:pinger/utils/format_utils.dart';

class PingSessionItem extends StatelessWidget {
  final PingSession session;
  final VoidCallback onTap;

  const PingSessionItem({
    Key key,
    @required this.session,
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
              session.results.values.length.toString(),
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
              FormatUtils.getDurationLabel(session.duration),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
      trailing: PingSessionItemTrailing(session: session),
    );
  }
}

class PingSessionItemTrailing extends StatelessWidget {
  final PingSession session;

  const PingSessionItemTrailing({Key key, @required this.session})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        PingSessionSummaryChart(results: session.results),
        SizedBox(
          width: 48.0,
          child: Text(
            FormatUtils.getSinceNowLabel(session.timestamp),
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey),
          ),
        ),
      ],
    );
  }
}

class PingSessionSummaryChart extends StatelessWidget {
  final PingResults results;
  final double width;
  final double height;
  final double barWidth;

  const PingSessionSummaryChart({
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
                (index) => FlSpot(index.toDouble(), results.values[index]),
              ),
            ),
          ],
        )),
      ]),
    );
  }

  BarChartGroupData _buildBarData(int index, double value) {
    return BarChartGroupData(x: index, barRods: [
      BarChartRodData(
        y: value,
        width: barWidth,
        color: Colors.lightBlue.withOpacity(0.25),
        borderRadius: BorderRadius.zero,
      ),
    ]);
  }
}
