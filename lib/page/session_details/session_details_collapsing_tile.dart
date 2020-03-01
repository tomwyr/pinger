import 'package:dotted_border/dotted_border.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:pinger/model/ping_session.dart';
import 'package:pinger/utils/format_utils.dart';
import 'package:pinger/widgets/collapsing_tile.dart';

class SessionSummaryCollapsingTile extends StatelessWidget {
  final PingSession session;
  final double expansion;
  final double minExtent;
  final double maxExtent;

  SessionSummaryCollapsingTile({
    @required this.session,
    @required this.expansion,
    @required this.minExtent,
    @required this.maxExtent,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Align(
        alignment: Alignment.topCenter,
        child: Opacity(
          opacity: expansion,
          child: Container(
            height: minExtent,
            margin: EdgeInsets.symmetric(horizontal: 48.0),
            child: Center(
              child: Text(
                "Session details",
                style: Theme.of(context).textTheme.title,
              ),
            ),
          ),
        ),
      ),
      Positioned(
        top: minExtent * expansion,
        left: 24.0,
        right: 24.0,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(height: 16.0 * expansion),
            Container(
              height: 56.0 * (1 + expansion),
              margin: EdgeInsets.symmetric(horizontal: 48.0),
              padding: EdgeInsets.only(right: 12.0),
              child: CollapsingTile(
                expansion: expansion,
                avatar: Container(
                  width: 56.0,
                  height: 56.0,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    elevation: 4.0 * expansion,
                    child: Image.network(session.host.avatarUrl),
                  ),
                ),
                label: Container(
                  height: 56.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        session.host.name,
                        style: TextStyle(fontSize: 18.0 + 6.0 * expansion),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(height: 16.0),
            Container(
              height: 96.0 + 2 * 24.0,
              child: Opacity(
                opacity: expansion,
                child: Builder(builder: (_) {
                  final chartHeight = 96.0;
                  final chartPadding = 24.0;
                  return SizedBox(
                    height: chartHeight + 2 * chartPadding,
                    child: LayoutBuilder(builder: (_, constraints) {
                      final chartSize = Size(constraints.maxWidth, chartHeight);
                      final meanLineTop = chartPadding +
                          chartSize.height *
                              (1 - session.results.mean / session.results.max);
                      return Stack(
                        overflow: Overflow.visible,
                        children: <Widget>[
                          _buildChart(chartPadding),
                          _buildChartMeanLine(
                              chartSize, chartPadding, meanLineTop),
                          ..._buildChartLabels(
                              chartSize, chartPadding, meanLineTop),
                        ],
                      );
                    }),
                  );
                }),
              ),
            ),
            Container(height: 16.0),
            Container(
              height: 64.0,
              child: Opacity(
                opacity: expansion,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    _buildSummaryItem(
                      Icons.compare_arrows,
                      session.results.values.length.toString(),
                    ),
                    _buildSummaryItem(
                      Icons.timer,
                      FormatUtils.getDurationLabel(session.duration),
                    ),
                    _buildSummaryItem(
                      Icons.calendar_today,
                      FormatUtils.getTimestampLabel(session.timestamp),
                    ),
                  ],
                ),
              ),
            ),
            Container(height: 16.0),
          ],
        ),
      ),
    ]);
  }

  Widget _buildChart(double chartPadding) {
    final minIndex =
        session.results.values.indexWhere((it) => it == session.results.min);
    final maxIndex =
        session.results.values.indexWhere((it) => it == session.results.max);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: chartPadding),
      child: LayoutBuilder(
        builder: (_, constraints) => SizedBox(
          width: constraints.maxWidth,
          child: LineChart(LineChartData(
            titlesData: FlTitlesData(show: false),
            axisTitleData: FlAxisTitleData(show: false),
            borderData: FlBorderData(show: false),
            gridData: FlGridData(show: false),
            lineTouchData: LineTouchData(enabled: false),
            lineBarsData: [
              LineChartBarData(
                dotData: FlDotData(
                  show: true,
                  dotColor: Colors.pink,
                  checkToShowDot: (it) => it.x == minIndex || it.x == maxIndex,
                ),
                isCurved: true,
                preventCurveOverShooting: true,
                colors: [Colors.lightBlue],
                spots: List.generate(
                  session.results.values.length,
                  (index) =>
                      FlSpot(index.toDouble(), session.results.values[index]),
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }

  Widget _buildChartMeanLine(
      Size chartSize, double chartPadding, double meanLineTop) {
    return Positioned(
      top: meanLineTop,
      left: 0.0,
      right: 0.0,
      child: DottedBorder(
        customPath: Path()..lineTo(chartSize.width, 0.0),
        color: Colors.pink,
        dashPattern: [4, 4],
        strokeWidth: 2.0,
        child: Container(),
      ),
    );
  }

  List<Widget> _buildChartLabels(
      Size chartSize, double chartPadding, double meanLineTop) {
    final labelSize = Size(64.0, 18.0);
    final pingCount = session.results.values.length;
    final indexMin = session.results.values.indexOf(session.results.min);
    final indexMax = session.results.values.indexOf(session.results.max);
    return [
      Positioned(
        top: 0.0,
        left: chartSize.width * (indexMax / (pingCount - 1)) -
            labelSize.width / 2,
        child: _buildLabel(session.results.max, labelSize),
      ),
      Positioned(
        top: meanLineTop - labelSize.height / 2,
        left: 0.0,
        right: 0.0,
        child: _buildLabel(session.results.mean, labelSize),
      ),
      Positioned(
        bottom: 0.0,
        left: chartSize.width * (indexMin / (pingCount - 1)) -
            labelSize.width / 2,
        child: _buildLabel(session.results.min, labelSize),
      ),
    ];
  }

  Widget _buildLabel(double value, Size size) {
    return SizedBox.fromSize(
      size: size,
      child: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 2.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.0),
            border: Border.all(color: Colors.pink),
            color: Colors.pink[100],
          ),
          child: Text(
            " ${value.round()} ms",
            style: TextStyle(color: Colors.pink, fontSize: 12.0),
          ),
        ),
      ),
    );
  }

  Widget _buildSummaryItem(IconData icon, String label) {
    return Expanded(
      child: Row(
        children: <Widget>[
          Icon(icon, color: Colors.lightBlue),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 12.0),
              child: Text(label, style: TextStyle(fontSize: 18.0)),
            ),
          ),
        ],
      ),
    );
  }
}
