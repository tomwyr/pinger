import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pinger/assets.dart';
import 'package:pinger/model/ping_global.dart';
import 'package:pinger/model/ping_result.dart';
import 'package:pinger/widgets/collapsing_tab_layout.dart';
import 'package:pinger/widgets/dotted_map.dart';

class ResultDetailsGlobal extends StatefulWidget {
  final bool hasLocationPermission;
  final PingResult userResult;
  final PingGlobalResults globalResults;

  const ResultDetailsGlobal({
    Key key,
    @required this.hasLocationPermission,
    @required this.userResult,
    @required this.globalResults,
  }) : super(key: key);

  @override
  _ResultDetailsGlobalState createState() => _ResultDetailsGlobalState();
}

class _ResultDetailsGlobalState extends State<ResultDetailsGlobal> {
  UserResultType _resultTypeSelection;
  UserResultTypeData _resultTypeData;

  @override
  void initState() {
    super.initState();
    _changeResultType(UserResultType.mean);
  }

  void _changeResultType(UserResultType type) {
    _resultTypeSelection = type;
    _resultTypeData = UserResultTypeData.forType(
        type, widget.userResult, widget.globalResults);
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return CollapsingTabLayoutItem(slivers: <Widget>[
      SliverToBoxAdapter(
        child: widget.hasLocationPermission
            ? _buildGlobalResults()
            : _buildPermissionRequest(),
      ),
    ]);
  }

  Widget _buildGlobalResults() {
    return Column(
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
    );
  }

  Widget _buildResultSection() {
    final resultValue =
        _resultTypeData.getStatsValue(widget.userResult.stats).toInt();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text("Your result", style: TextStyle(fontSize: 18.0)),
        Container(height: 16.0),
        Text(
          "$resultValue ms",
          style: TextStyle(fontSize: 24.0),
        ),
        Container(height: 8.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Row(children: <Widget>[
            _buildResultTypeButton(UserResultType.min),
            _buildResultTypeDivider(),
            _buildResultTypeButton(UserResultType.mean),
            _buildResultTypeDivider(),
            _buildResultTypeButton(UserResultType.max),
          ]),
        ),
      ],
    );
  }

  Widget _buildResultTypeButton(UserResultType type) {
    return FlatButton(
      onPressed: () => _changeResultType(type),
      child: Text(
        _resultTypeData.typeButtonLabel,
        style: TextStyle(
          color: type == _resultTypeSelection ? Colors.black : Colors.grey,
        ),
      ),
    );
  }

  Widget _buildResultTypeDivider() =>
      Text("/", style: TextStyle(color: Colors.grey));

  List<MapDot> _getMapData() {
    return widget.globalResults.geoStats
        .map((it) =>
            MapDot(it.position, _resultTypeData.getStatsValue(it.stats)))
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
    final data = _resultTypeData.graphData;
    return (data.last.ping - data.first.ping) / labelCount;
  }

  List<FlSpot> _getGraphData() {
    return _resultTypeData.graphData
        .map((it) => FlSpot(it.ping, it.percentage))
        .toList();
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

enum UserResultType { min, mean, max }

class UserResultTypeData {
  final String typeButtonLabel;
  final List<PingGroup> graphData;
  final double Function(PingStats) getStatsValue;

  factory UserResultTypeData.forType(UserResultType type, PingResult userResult,
      PingGlobalResults globalResults) {
    switch (type) {
      case UserResultType.min:
        return UserResultTypeData(
          typeButtonLabel: "Min",
          graphData: globalResults.groupStats.min,
          getStatsValue: (stats) => stats.min,
        );
      case UserResultType.mean:
        return UserResultTypeData(
          typeButtonLabel: "Mean",
          graphData: globalResults.groupStats.mean,
          getStatsValue: (stats) => stats.mean,
        );
      case UserResultType.max:
        return UserResultTypeData(
          typeButtonLabel: "Max",
          graphData: globalResults.groupStats.max,
          getStatsValue: (stats) => stats.max,
        );
    }
    throw ArgumentError("Unrecognized $UserResultType: $type.");
  }

  UserResultTypeData({
    @required this.typeButtonLabel,
    @required this.getStatsValue,
    @required this.graphData,
  });
}
