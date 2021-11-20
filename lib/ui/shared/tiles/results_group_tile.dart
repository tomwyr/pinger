import 'package:flutter/material.dart';
import 'package:pinger/generated/l10n.dart';
import 'package:pinger/resources.dart';
import 'package:pinger/ui/shared/tiles/host_icon_tile.dart';

class ResultsGroupTile extends StatelessWidget {
  final String host;
  final int resultsCount;
  final VoidCallback? onPressed;

  const ResultsGroupTile({
    Key? key,
    required this.host,
    required this.resultsCount,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      key: ValueKey(host),
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        side: R.styles.outlineButtonBorder,
        // TODO verify where to apply colors
        // highlightedBorderColor: R.styles.outlineButtonBorder.color,
      ),
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Spacer(),
          HostIconTile(host: host),
          Spacer(),
          Text(
            host,
            maxLines: 1,
            softWrap: false,
            overflow: TextOverflow.fade,
          ),
          Container(height: 12.0),
          Text(
            S.current.resultsGroupCount(resultsCount),
            style: TextStyle(fontSize: 12.0, color: R.colors.gray),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
