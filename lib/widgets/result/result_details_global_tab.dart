import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pinger/assets.dart';
import 'package:pinger/model/ping_global.dart';
import 'package:pinger/model/ping_result.dart';
import 'package:pinger/resources.dart';
import 'package:pinger/widgets/charts/global_distribution_chart.dart';
import 'package:pinger/widgets/common/collapsing_tab_layout.dart';
import 'package:pinger/widgets/common/dotted_map.dart';
import 'package:pinger/widgets/result/result_details_prompt_tab.dart';
import 'package:pinger/widgets/view_type_button.dart';
import 'package:pinger/widgets/view_types.dart';

class ResultDetailsGlobalTab extends StatefulWidget {
  final bool isSharingLocation;
  final VoidCallback onShareLocationPressed;
  final PingResult userResult;
  final GlobalHostResults globalResults;

  const ResultDetailsGlobalTab({
    Key key,
    @required this.isSharingLocation,
    @required this.onShareLocationPressed,
    @required this.userResult,
    @required this.globalResults,
  }) : super(key: key);

  @override
  _ResultDetailsGlobalTabState createState() => _ResultDetailsGlobalTabState();
}

class _ResultDetailsGlobalTabState extends State<ResultDetailsGlobalTab> {
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
      widget.isSharingLocation
          ? _buildGlobalResults()
          : _buildShareLocationRequest(),
    ]);
  }

  Widget _buildGlobalResults() {
    final userResult =
        _resultTypeData.getStatsValue(widget.userResult.stats).toInt();
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 4.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ..._buildValueSection(userResult),
            ..._buildGlobalSection(
              "Results by location",
              "Ping value for others was ${_calcTypeMeanValue()} ms",
              DottedMap(
                dots: _getMapDots(),
                dotColor: ColorTween(
                  begin: R.colors.pingMin,
                  end: R.colors.pingMax,
                ),
                emptyDotColor: R.colors.gray.withOpacity(0.5),
              ),
            ),
            ..._buildGlobalSection(
              "Results by frequency",
              "Your ping was better than ${_calcFrequencyPercent(userResult)}% of others",
              Expanded(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: double.infinity,
                    minHeight: 96.0,
                  ),
                  child: _resultTypeData.values.length > 1
                      ? GlobalDistributionChart(
                          data: _groupChartData(),
                          dataCount: widget.globalResults.totalCount,
                          userResult: userResult,
                        )
                      : null,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  int _calcTypeMeanValue() {
    int totalPing = 0;
    int totalCount = 0;
    _resultTypeData.values.forEach((ping, count) {
      totalPing += ping * count;
      totalCount += count;
    });
    return (totalPing / totalCount).round();
  }

  int _calcFrequencyPercent(int userResult) {
    int lower = 0;
    int higher = 0;
    _resultTypeData.values.forEach((ping, count) {
      if (ping < userResult)
        lower += count;
      else if (ping > userResult)
        higher += count;
      else {
        lower += count ~/ 2;
        higher += count ~/ 2;
      }
    });
    return (100 - lower / (lower + higher) * 100).round();
  }

  List<Widget> _buildValueSection(int userResult) {
    return [
      Row(children: <Widget>[
        Text(
          "Your result",
          style: TextStyle(fontSize: 18.0, color: R.colors.gray),
        ),
        Spacer(),
        ...UserResultType.values.map(_buildViewTypeButton),
      ]),
      Container(height: 4.0),
      Text(
        "$userResult ms",
        style: TextStyle(fontSize: 36.0),
      ),
      Container(height: 4.0),
    ];
  }

  Widget _buildViewTypeButton(UserResultType type) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: ViewTypeButton(
        label: const {
          UserResultType.max: "Max",
          UserResultType.mean: "Mean",
          UserResultType.min: "Min",
        }[type],
        selected: _resultTypeSelection == type,
        onPressed: () => _changeResultType(type),
      ),
    );
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

  List<MapDot> _getMapDots() {
    return widget.globalResults.locationResults
        .map((it) => MapDot(
              _resultTypeData.getStatsValue(it.stats).toDouble(),
              it.location.lat,
              it.location.lon,
            ))
        .toList();
  }

  Map<int, int> _groupChartData() {
    final pings = _resultTypeData.values.keys.toList()..sort();
    final groupSpan = (pings.last - pings.first) ~/ 10;
    final groups = <int, int>{};
    _resultTypeData.values.forEach((ping, count) {
      final groupKey = ((ping ~/ groupSpan + 0.5) * groupSpan).toInt();
      groups[groupKey] ??= 0;
      groups[groupKey] += count;
    });
    return groups;
  }

  Widget _buildShareLocationRequest() {
    return ResultDetailsPromptTab(
      image: Images.undrawTheWorldIsMine,
      title: "Enable location to see your result compared with others",
      description:
          "Your location will be used to match it with your result and to present it for other users.",
      buttonLabel: "Share location",
      onButtonPressed: widget.onShareLocationPressed,
    );
  }
}

class UserResultTypeData {
  final String typeButtonLabel;
  final Map<int, int> values;
  final int Function(PingStats) getStatsValue;

  factory UserResultTypeData.forType(UserResultType type, PingResult userResult,
      GlobalHostResults globalResults) {
    switch (type) {
      case UserResultType.min:
        return UserResultTypeData(
          typeButtonLabel: "Min",
          values: globalResults.valueResults.min,
          getStatsValue: (stats) => stats.min,
        );
      case UserResultType.mean:
        return UserResultTypeData(
          typeButtonLabel: "Mean",
          values: globalResults.valueResults.mean,
          getStatsValue: (stats) => stats.mean,
        );
      case UserResultType.max:
        return UserResultTypeData(
          typeButtonLabel: "Max",
          values: globalResults.valueResults.max,
          getStatsValue: (stats) => stats.max,
        );
    }
    throw ArgumentError("Unrecognized $UserResultType: $type.");
  }

  UserResultTypeData({
    @required this.typeButtonLabel,
    @required this.getStatsValue,
    @required this.values,
  });
}
