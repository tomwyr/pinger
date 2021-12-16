import 'package:flutter/material.dart';

import 'package:pinger/assets.dart';
import 'package:pinger/generated/l10n.dart';
import 'package:pinger/model/ping_global.dart';
import 'package:pinger/model/ping_result.dart';
import 'package:pinger/resources.dart';
import 'package:pinger/ui/common/collapsing_tab_layout.dart';
import 'package:pinger/ui/common/dotted_map.dart';
import 'package:pinger/ui/page/result_details/result_details_tab/result_details_prompt_tab.dart';
import 'package:pinger/ui/shared/chart/global_distribution_chart.dart';
import 'package:pinger/ui/shared/info_section.dart';
import 'package:pinger/ui/shared/three_bounce.dart';
import 'package:pinger/ui/shared/view_type/view_type_button.dart';
import 'package:pinger/ui/shared/view_type/view_type_row.dart';
import 'package:pinger/ui/shared/view_type/view_types.dart';
import 'package:pinger/utils/data_snap.dart';

class ResultDetailsGlobalTab extends StatelessWidget {
  const ResultDetailsGlobalTab({
    Key? key,
    required this.isSharingLocation,
    required this.onShareLocationPressed,
    required this.userResult,
    required this.globalResults,
    required this.onRefreshPressed,
  }) : super(key: key);

  final bool isSharingLocation;
  final VoidCallback onShareLocationPressed;
  final PingResult? userResult;
  final DataSnap<GlobalHostResults>? globalResults;
  final VoidCallback onRefreshPressed;

  @override
  Widget build(BuildContext context) {
    return CollapsingTabLayoutItem(slivers: <Widget>[
      if (!isSharingLocation)
        ResultDetailsPromptTab(
          image: Images.undrawTheWorldIsMine,
          title: S.current.enableLocationPromptTitle,
          description: S.current.enableLocationPromptDesc,
          buttonLabel: S.current.shareLocationButtonLabel,
          onButtonPressed: onShareLocationPressed,
        )
      else
        globalResults!.when(
          data: (data) => SliverFillRemaining(
            hasScrollBody: false,
            child: GlobalResultsDataSection(
              globalResults: data,
              userResult: userResult,
            ),
          ),
          loading: () => SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: ThreeBounce(color: R.colors.secondary),
            ),
          ),
          error: () => ResultDetailsPromptTab(
            image: Images.undrawServerDown,
            title: S.current.dataFetchFailedTitle,
            description: S.current.dataFetchFailedDesc,
            buttonLabel: S.current.tryAgainButtonLabel,
            onButtonPressed: onRefreshPressed,
          ),
        ),
    ]);
  }
}

class GlobalResultsDataSection extends StatefulWidget {
  const GlobalResultsDataSection({
    Key? key,
    required this.globalResults,
    required this.userResult,
  }) : super(key: key);

  final GlobalHostResults globalResults;
  final PingResult? userResult;

  @override
  _GlobalResultsDataSectionState createState() => _GlobalResultsDataSectionState();
}

class _GlobalResultsDataSectionState extends State<GlobalResultsDataSection> {
  var _resultType = UserResultType.mean;

  @override
  Widget build(BuildContext context) {
    final userValue = _getStatsValue(widget.userResult!.stats);
    final globalValues = _getGlobalValues(widget.globalResults);
    return Padding(
      padding: const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ..._buildValueSection(userValue),
          if (globalValues.isEmpty)
            _buildNoData()
          else
            ..._buildResultsData(userValue, globalValues),
        ],
      ),
    );
  }

  Widget _buildNoData() {
    return Expanded(
      child: InfoSection(
        image: Images.undrawEmpty,
        title: S.current.nothingToShowTitle,
        description: S.current.resultGlobalEmptyDesc,
      ),
    );
  }

  List<Widget> _buildResultsData(int userValue, Map<int, int> globalValues) {
    return [
      ..._buildGlobalSection(
        S.current.pingGlobalByLocationSubtitle,
        S.current.pingGlobalByLocationDesc(
          _calcTypeMeanValue(globalValues),
        ),
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
        S.current.pingGlobalByFrequencySubtitle,
        S.current.pingGlobalByFrequencyDesc(
          _calcFrequencyPercent(userValue, globalValues),
        ),
        Expanded(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              minWidth: double.infinity,
              minHeight: 96.0,
            ),
            child: globalValues.length > 1
                ? GlobalDistributionChart(
                    values: globalValues,
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
      if (ping < userValue) {
        lower += count;
      } else if (ping > userValue) {
        higher += count;
      } else {
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
            S.current.pingGlobalYourResult,
            style: TextStyle(fontSize: 18.0, color: R.colors.gray),
          ),
          Expanded(
            child: ViewTypeRow(
              labeledTypes: {
                UserResultType.min: S.current.viewTypeMin,
                UserResultType.mean: S.current.viewTypeMean,
                UserResultType.max: S.current.viewTypeMax,
              },
              selection: _resultType,
              onChanged: (dynamic it) => setState(() => _resultType = it),
            ),
          ),
        ]),
      ),
      Container(height: 4.0),
      Text(
        S.current.pingValueLabel(userValue),
        style: const TextStyle(fontSize: 36.0),
      ),
      Container(height: 4.0),
    ];
  }

  List<Widget> _buildGlobalSection(String title, String description, Widget content) {
    return [
      Container(height: 12.0),
      Text(title, style: TextStyle(color: R.colors.gray, fontSize: 18.0)),
      Container(height: 4.0),
      Text(description, style: const TextStyle(fontWeight: FontWeight.bold)),
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
  }
}
