import 'package:flutter/material.dart';
import 'package:pinger/resources.dart';
import 'package:pinger/widgets/tiles/host_icon_tile.dart';

class ResultsGroupTile extends StatelessWidget {
  final String host;
  final int resultsCount;
  final VoidCallback onPressed;

  const ResultsGroupTile({
    Key key,
    @required this.host,
    @required this.resultsCount,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      borderSide: R.styles.outlineButtonBorder,
      highlightedBorderColor: R.styles.outlineButtonBorder.color,
      onPressed: onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          HostIconTile(),
          Container(height: 24.0),
          Text(host),
          Container(height: 12.0),
          Text(
            "$resultsCount results",
            style: TextStyle(fontSize: 12.0, color: R.colors.gray),
          ),
        ],
      ),
    );
  }
}
