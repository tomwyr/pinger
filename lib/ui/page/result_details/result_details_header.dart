import 'package:flutter/material.dart';

import 'package:pinger/generated/l10n.dart';
import 'package:pinger/model/ping_result.dart';
import 'package:pinger/resources.dart';
import 'package:pinger/ui/common/collapsing_tile.dart';
import 'package:pinger/ui/page/result_details/result_details_summary_chart.dart';
import 'package:pinger/ui/shared/tiles/host_icon_tile.dart';
import 'package:pinger/utils/format_utils.dart';

class ResultDetailsHeader extends StatelessWidget {
  const ResultDetailsHeader({
    Key? key,
    required this.result,
    required this.expansion,
    required this.minExtent,
    required this.maxExtent,
  }) : super(key: key);

  final PingResult? result;
  final double expansion;
  final double minExtent;
  final double maxExtent;

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
              child: Text(
                S.current.resultPageTitle,
                style: R.styles.appBarTitle,
              ),
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
          margin: EdgeInsets.only(
            left: 56.0 - 32.0 * expansion,
            right: 72.0 - 48.0 * expansion,
          ),
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
        SizedBox(
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
        size: const Size.square(kToolbarHeight),
        child: Center(
          child: HostIconTile.expansion(
            host: result!.host,
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
              result!.host,
              maxLines: 1,
              softWrap: false,
              overflow: TextOverflow.fade,
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
          S.current.pingSummaryCountLabel,
          result!.values.length.toString(),
        ),
        _buildSummaryItem(
          S.current.pingSummaryDurationLabel,
          FormatUtils.getDurationLabel(result!.duration),
        ),
        _buildSummaryItem(
          S.current.pingSummaryDateLabel,
          FormatUtils.getTimestampLabel(result!.startTime),
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
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
          ),
          Container(height: 4.0),
          Text(label, style: TextStyle(color: R.colors.gray)),
        ],
      ),
    );
  }
}
