import 'package:flutter/material.dart';
import 'package:pinger/model/ping_result.dart';
import 'package:pinger/resources.dart';
import 'package:pinger/utils/format_utils.dart';
import 'package:pinger/widgets/common/collapsing_tile.dart';
import 'package:pinger/widgets/result/result_details_summary_chart.dart';
import 'package:pinger/widgets/tiles/host_icon_tile.dart';

class ResultDetailsHeader extends StatelessWidget {
  final PingResult result;
  final double expansion;
  final double minExtent;
  final double maxExtent;

  ResultDetailsHeader({
    @required this.result,
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
            margin: const EdgeInsets.symmetric(horizontal: 48.0),
            child: Center(
              child: Text("Result details", style: R.styles.appBarTitle),
            ),
          ),
        ),
      ),
      Positioned(
        top: minExtent * expansion,
        left: 24.0,
        right: 24.0,
        child: _buildCollapsingContent(),
      ),
    ]);
  }

  Widget _buildCollapsingContent() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(height: 16.0 * expansion),
        Container(
          height: kToolbarHeight * (1 + expansion),
          margin: const EdgeInsets.symmetric(horizontal: 48.0),
          padding: const EdgeInsets.only(right: 12.0),
          child: _buildHostTile(),
        ),
        Container(height: 16.0),
        Opacity(
          opacity: expansion,
          child: ResultDetailsSummaryChart(
            height: 96.0,
            padding: 24.0,
            result: result,
          ),
        ),
        Container(height: 16.0),
        Container(
          height: 64.0,
          child: Opacity(
            opacity: expansion,
            child: _buildSummaryRow(),
          ),
        ),
        Container(height: 16.0),
      ],
    );
  }

  Widget _buildHostTile() {
    return CollapsingTile(
      expansion: expansion,
      avatar: SizedBox.fromSize(
        size: Size.square(kToolbarHeight),
        child: Center(
          child: HostIconTile.expansion(
            expansion: expansion,
          ),
        ),
      ),
      label: SizedBox(
        height: kToolbarHeight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              result.host.name,
              style: TextStyle(fontSize: 18.0 + 6.0 * expansion),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        _buildSummaryItem(
          "Ping count",
          result.values.length.toString(),
        ),
        _buildSummaryItem(
          "Duration",
          FormatUtils.getDurationLabel(result.duration),
        ),
        _buildSummaryItem(
          "Date",
          FormatUtils.getTimestampLabel(result.startTime),
        ),
      ],
    );
  }

  Widget _buildSummaryItem(String label, String value) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            value,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
          ),
          Container(height: 4.0),
          Text(label, style: TextStyle(color: R.colors.gray)),
        ],
      ),
    );
  }
}
