import 'package:flutter/material.dart';
import 'package:pinger/model/ping_result.dart';
import 'package:pinger/resources.dart';
import 'package:pinger/ui/shared/chart/result_tile_chart.dart';
import 'package:pinger/ui/shared/tiles/host_icon_tile.dart';
import 'package:pinger/utils/format_utils.dart';

enum ResultTileType {
  regular,
  detailed,
}

class ResultTile extends StatelessWidget {
  const ResultTile({
    super.key,
    required this.result,
    this.onPressed,
    this.type = ResultTileType.regular,
  });

  final PingResult? result;
  final VoidCallback? onPressed;
  final ResultTileType type;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      key: ValueKey(result!.id),
      height: 56.0,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.only(left: 12.0),
          side: R.styles.outlineButtonBorder,
        ),
        onPressed: onPressed,
        child: LayoutBuilder(
          builder: (_, constraints) => Row(children: <Widget>[
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: _buildTypeContent(),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: LayoutBuilder(
                  builder: (_, constraints) => ResultTileChart(
                    values: result!.values,
                    min: result!.stats.min,
                    mean: result!.stats.mean,
                    max: result!.stats.max,
                    barWidth: constraints.maxWidth / 3,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 48.0,
              child: Text(
                FormatUtils.getSinceNowLabel(result!.startTime),
                style: TextStyle(fontSize: 12.0, color: R.colors.gray),
                textAlign: TextAlign.center,
              ),
            ),
          ]),
        ),
      ),
    );
  }

  Widget _buildTypeContent() {
    return type == ResultTileType.regular
        ? Row(children: <Widget>[
            HostIconTile(host: result!.host),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(left: 18.0, right: 12.0),
                child: Text(
                  result!.host,
                  maxLines: 1,
                  softWrap: false,
                  overflow: TextOverflow.fade,
                  style: TextStyle(color: R.colors.primary),
                ),
              ),
            ),
          ])
        : Row(children: <Widget>[
            _buildDetail(
              Icons.compare_arrows,
              result!.values.length.toString(),
            ),
            Container(width: 16.0),
            _buildDetail(
              Icons.timer,
              FormatUtils.getDurationLabel(result!.duration),
            ),
          ]);
  }

  Widget _buildDetail(IconData icon, String label) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: 56.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(width: 8.0),
          Icon(icon, size: 16.0, color: R.colors.gray),
          Container(width: 8.0),
          Text(label, textAlign: TextAlign.left),
        ],
      ),
    );
  }
}
