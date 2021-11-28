import 'package:flutter/material.dart';

import 'package:pinger/generated/l10n.dart';
import 'package:pinger/resources.dart';
import 'package:pinger/ui/shared/tiles/host_icon_tile.dart';

class ResultsGroupTile extends StatelessWidget {
  const ResultsGroupTile({
    Key? key,
    required this.host,
    required this.resultsCount,
    this.onPressed,
  }) : super(key: key);

  final String host;
  final int resultsCount;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      key: ValueKey(host),
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        side: R.styles.outlineButtonBorder,
      ),
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const Spacer(),
          HostIconTile(host: host),
          const Spacer(),
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
          const Spacer(),
        ],
      ),
    );
  }
}
