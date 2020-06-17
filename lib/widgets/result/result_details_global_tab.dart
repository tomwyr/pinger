import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pinger/assets.dart';
import 'package:pinger/model/ping_global.dart';
import 'package:pinger/model/ping_result.dart';
import 'package:pinger/resources.dart';
import 'package:pinger/utils/data_snap.dart';
import 'package:pinger/widgets/charts/global_distribution_chart.dart';
import 'package:pinger/widgets/common/collapsing_tab_layout.dart';
import 'package:pinger/widgets/common/dotted_map.dart';
import 'package:pinger/widgets/result/result_details_prompt_tab.dart';
import 'package:pinger/widgets/three_bounce.dart';
import 'package:pinger/widgets/view_type/view_type_button.dart';
import 'package:pinger/widgets/view_type/view_type_row.dart';
import 'package:pinger/widgets/view_type/view_types.dart';

class ResultDetailsGlobalTab extends StatelessWidget {
  final bool isSharingLocation;
  final VoidCallback onShareLocationPressed;
  final PingResult userResult;
  final DataSnap<GlobalHostResults> globalResults;
  final VoidCallback onRefreshPressed;

  const ResultDetailsGlobalTab({
    Key key,
    @required this.isSharingLocation,
    @required this.onShareLocationPressed,
    @required this.userResult,
    @required this.globalResults,
    @required this.onRefreshPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CollapsingTabLayoutItem(slivers: <Widget>[
      !isSharingLocation
          ? _buildShareLocationRequest()
          : globalResults.when(
              data: _buildResultsData,
              loading: _buildResultsLoading,
              error: _buildResultsError,
            ),
    ]);
  }

  Widget _buildShareLocationRequest() {
    return ResultDetailsPromptTab(
      image: Images.undrawTheWorldIsMine,
      title: "Enable location to see your result compared with others",
      description:
          "Your location will be used to match it with your result and to present it for other users.",
      buttonLabel: "Share location",
      onButtonPressed: onShareLocationPressed,
    );
  }

  Widget _buildResultsData(GlobalHostResults globalResults) {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: GlobalResultsDataSection(
        globalResults: globalResults,
        userResult: userResult,
        noDataBuilder: (_) => _buildNoData(),
      ),
    );
  }

  Widget _buildNoData() {
    return Column(children: <Widget>[
      Spacer(),
      Container(height: 24.0),
      Center(
        child: Image(image: Images.undrawEmpty, width: 144.0, height: 144.0),
      ),
      Container(height: 24.0),
      Center(
        child: Text(
          "There's nothing interesting here",
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
      Container(height: 24.0),
      Center(
        child: Text(
          "Check again after some time when there's data available for this host",
          style: TextStyle(fontSize: 18.0),
          textAlign: TextAlign.center,
        ),
      ),
      Container(height: 24.0),
      Spacer(),
    ]);
  }

  Widget _buildResultsLoading() {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: ThreeBounce(color: R.colors.secondary),
      ),
    );
  }

  Widget _buildResultsError() {
    return ResultDetailsPromptTab(
      image: Images.undrawServerDown,
      title: "Couldn't fetch data",
      description:
          "We could not find anything for given query but you can still use it as host",
      buttonLabel: "Try again",
      onButtonPressed: onRefreshPressed,
    );
  }
}

class GlobalResultsDataSection extends StatefulWidget {
  final GlobalHostResults globalResults;
  final PingResult userResult;
  final WidgetBuilder noDataBuilder;

  const GlobalResultsDataSection({
    Key key,
    @required this.globalResults,
    @required this.userResult,
    @required this.noDataBuilder,
  }) : super(key: key);

  @override
  _GlobalResultsDataSectionState createState() =>
      _GlobalResultsDataSectionState();
}

class _GlobalResultsDataSectionState extends State<GlobalResultsDataSection> {
  UserResultType _resultType;

  @override
  void initState() {
    super.initState();
    _resultType = UserResultType.mean;
  }

  @override
  Widget build(BuildContext context) {
    final userValue = _getStatsValue(widget.userResult.stats);
    final globalValues = _getGlobalValues(widget.globalResults);
    return Padding(
      padding: const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ..._buildValueSection(userValue),
          if (globalValues.isEmpty)
            widget.noDataBuilder(context)
          else
            ..._buildResultsData(userValue, globalValues),
        ],
      ),
    );
  }

  List<Widget> _buildResultsData(int userValue, Map<int, int> globalValues) {
    return [
      ..._buildGlobalSection(
        "Results by location",
        "Ping value for others was ${_calcTypeMeanValue(globalValues)} ms",
        DottedMap(
          dots: _getMapDots(widget.globalResults),
          dotColor: ColorTween(
            begin: R.colors.pingMin,
            end: R.colors.pingMax,
          ),
          emptyDotColor: R.colors.gray.withOpacity(0.5),
        ),
      ),
      ..._buildGlobalSection(
        "Results by frequency",
        "Your ping was better than ${_calcFrequencyPercent(userValue, globalValues)}% of others",
        Expanded(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: double.infinity,
              minHeight: 96.0,
            ),
            child: globalValues.length > 1
                ? GlobalDistributionChart(
                    data: _groupChartData(globalValues),
                    dataCount: widget.globalResults.totalCount,
                    userResult: userValue,
                  )
                : null,
          ),
        ),
      )
    ];
  }

  Map<int, int> _getGlobalValues(GlobalHostResults globalResults) {
    switch (_resultType) {
      case UserResultType.min:
        return globalResults.valueResults.min;
      case UserResultType.mean:
        return globalResults.valueResults.mean;
      case UserResultType.max:
        return globalResults.valueResults.max;
    }
    throw StateError("Unhandled $UserResultType: $_resultType.");
  }

  int _calcTypeMeanValue(Map<int, int> values) {
    int totalPing = 0;
    int totalCount = 0;
    values.forEach((ping, count) {
      totalPing += ping * count;
      totalCount += count;
    });
    return (totalPing / totalCount).round();
  }

  int _calcFrequencyPercent(int userValue, Map<int, int> globalValues) {
    int lower = 0;
    int higher = 0;
    globalValues.forEach((ping, count) {
      if (ping < userValue)
        lower += count;
      else if (ping > userValue)
        higher += count;
      else {
        lower += count ~/ 2;
        higher += count ~/ 2;
      }
    });
    return (100 - lower / (lower + higher) * 100).round();
  }

  List<Widget> _buildValueSection(int userValue) {
    return [
      SizedBox(
        height: ViewTypeButton.height,
        child: Row(children: <Widget>[
          Text(
            "Your result",
            style: TextStyle(fontSize: 18.0, color: R.colors.gray),
          ),
          Expanded(
            child: ViewTypeRow(
              types: const {
                UserResultType.max: "Max",
                UserResultType.mean: "Mean",
                UserResultType.min: "Min",
              },
              selection: _resultType,
              onChanged: (it) => setState(() => _resultType = it),
            ),
          ),
        ]),
      ),
      Container(height: 4.0),
      Text(
        "$userValue ms",
        style: TextStyle(fontSize: 36.0),
      ),
      Container(height: 4.0),
    ];
  }

  List<Widget> _buildGlobalSection(
      String title, String description, Widget content) {
    return [
      Container(height: 12.0),
      Text(title, style: TextStyle(color: R.colors.gray, fontSize: 18.0)),
      Container(height: 4.0),
      Text(description, style: TextStyle(fontWeight: FontWeight.bold)),
      Container(height: 16.0),
      content,
      Container(height: 8.0),
    ];
  }

  List<MapDot> _getMapDots(GlobalHostResults globalResults) {
    return globalResults.locationResults
        .map((it) => MapDot(
              _getStatsValue(it.stats).toDouble(),
              it.location.lat,
              it.location.lon,
            ))
        .toList();
  }

  int _getStatsValue(PingStats stats) {
    switch (_resultType) {
      case UserResultType.min:
        return stats.min;
      case UserResultType.mean:
        return stats.mean;
      case UserResultType.max:
        return stats.max;
    }
    throw StateError("Unhandled $UserResultType: $_resultType.");
  }

  Map<int, int> _groupChartData(Map<int, int> values) {
    final pings = values.keys.toList()..sort();
    final groupsCount = min(10, pings.last - pings.first);
    final groupSpan = (pings.last - pings.first) ~/ groupsCount;
    final groups = <int, int>{};
    values.forEach((ping, count) {
      final groupKey = ((ping ~/ groupSpan + 0.5) * groupSpan).toInt();
      groups[groupKey] ??= 0;
      groups[groupKey] += count;
    });
    return groups;
  }
}
