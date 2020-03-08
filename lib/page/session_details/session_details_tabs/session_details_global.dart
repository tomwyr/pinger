import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pinger/assets.dart';
import 'package:pinger/model/ping_global.dart';
import 'package:pinger/model/ping_session.dart';
import 'package:pinger/widgets/dotted_map.dart';

part 'session_details_global.freezed.dart';

class SessionDetailsGlobal extends StatefulWidget {
  final bool hasLocationPermission;
  final PingResults userResult;
  final PingGlobalResults globalResults;

  const SessionDetailsGlobal({
    Key key,
    @required this.hasLocationPermission,
    @required this.userResult,
    @required this.globalResults,
  }) : super(key: key);

  @override
  _SessionDetailsGlobalState createState() => _SessionDetailsGlobalState();
}

class _SessionDetailsGlobalState extends State<SessionDetailsGlobal> {
  UserResultType _resultTypeSelection = UserResultType.mean();

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: widget.hasLocationPermission
          ? _buildGlobalResults()
          : _buildPermissionRequest(),
    );
  }

  Widget _buildGlobalResults() {
    return Column(children: <Widget>[
      Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(height: 12.0),
          _buildResultSection(),
          Container(height: 24.0),
          Text("Mean value for others was 286 ms"),
          Container(height: 18.0),
          DottedMap(dots: _getMapData()),
          Container(height: 36.0),
          Text("Your ping was better than 45% of others"),
          Container(height: 18.0),
          _buildDistributionGraph(),
          Container(height: 12.0),
        ],
      )
    ]);
  }

  Widget _buildResultSection() {
    final selectedResult = _resultTypeSelection.when(
      min: () => widget.userResult.stats.min,
      mean: () => widget.userResult.stats.mean,
      max: () => widget.userResult.stats.max,
    );
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text("Your result", style: TextStyle(fontSize: 18.0)),
        Container(height: 16.0),
        Text(
          "${selectedResult.toInt()} ms",
          style: TextStyle(fontSize: 24.0),
        ),
        Container(height: 8.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Row(children: <Widget>[
            _buildResultTypeButton(UserResultType.min()),
            _buildResultTypeDivider(),
            _buildResultTypeButton(UserResultType.mean()),
            _buildResultTypeDivider(),
            _buildResultTypeButton(UserResultType.max()),
          ]),
        ),
      ],
    );
  }

  Widget _buildResultTypeButton(UserResultType type) {
    return FlatButton(
      onPressed: () => setState(() => _resultTypeSelection = type),
      child: Text(
        type.when(min: () => "Min", mean: () => "Mean", max: () => "Max"),
        style: TextStyle(
          color: type == _resultTypeSelection ? Colors.black : Colors.grey,
        ),
      ),
    );
  }

  Widget _buildResultTypeDivider() =>
      Text("/", style: TextStyle(color: Colors.grey));

  List<MapDot> _getMapData() {
    final double Function(PingStats) getStatsValue = _resultTypeSelection.when(
      min: () => (stats) => stats.min,
      mean: () => (stats) => stats.mean,
      max: () => (stats) => stats.max,
    );
    return widget.globalResults.geoStats
        .map((it) => MapDot(it.position, getStatsValue(it.stats)))
        .toList();
  }

  Widget _buildDistributionGraph() {
    return SizedBox(
      height: 144.0,
      child: LineChart(LineChartData(
        titlesData: FlTitlesData(
          leftTitles: SideTitles(),
          bottomTitles: SideTitles(
            showTitles: true,
            interval: _getGraphLabelsInterval(8),
            getTitles: (it) => it.toStringAsFixed(0),
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
            preventCurveOverShooting: true,
            colors: [Colors.lightBlue],
            spots: _getGraphData(),
          ),
        ],
      )),
    );
  }

  double _getGraphLabelsInterval(int labelCount) {
    final stats = widget.globalResults.groupStats;
    final data = _resultTypeSelection.when(
        min: () => stats.min, mean: () => stats.mean, max: () => stats.max);
    return (data.last.ping - data.first.ping) / labelCount;
  }

  List<FlSpot> _getGraphData() {
    final stats = widget.globalResults.groupStats;
    final data = _resultTypeSelection.when(
        min: () => stats.min, mean: () => stats.mean, max: () => stats.max);
    return data.map((it) => FlSpot(it.ping, it.percentage)).toList();
  }

  Widget _buildPermissionRequest() {
    return Padding(
      padding: const EdgeInsets.all(36.0),
      child: Column(children: <Widget>[
        Image(image: Images.globeLocation, width: 164.0, height: 164.0),
        Container(height: 48.0),
        Text(
          "Enable location to see your result compared with others",
          style: TextStyle(fontSize: 18.0),
          textAlign: TextAlign.center,
        ),
        Container(height: 16.0),
        Text(
          "Your location will be used to match it with your result and to present it on a world map for other users",
          textAlign: TextAlign.center,
        ),
        Container(height: 48.0),
        RaisedButton(
          child: Text("Grant permission"),
          onPressed: () {
            //
          },
        ),
      ]),
    );
  }
}

@freezed
abstract class UserResultType with _$UserResultType {
  const factory UserResultType.min() = UserResultMin;
  const factory UserResultType.mean() = UserResultMean;
  const factory UserResultType.max() = UserResultMax;
}
