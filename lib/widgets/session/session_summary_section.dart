import 'package:flutter/material.dart';
import 'package:pinger/model/ping_result.dart';
import 'package:pinger/resources.dart';

class SessionSummarySection extends StatelessWidget {
  final List<int> values;
  final PingStats stats;

  const SessionSummarySection({
    Key key,
    @required this.values,
    @required this.stats,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final totalCount = values.length;
    final successCount = values.where((it) => it != null).length;
    final failedCount = totalCount - successCount;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          "Summary",
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        Container(height: 12.0),
        Text(
          "Progress",
          style: TextStyle(fontWeight: FontWeight.bold, color: R.colors.gray),
        ),
        Container(height: 8.0),
        Row(children: <Widget>[
          _buildSummaryItem("Success", R.colors.pingSuccessful, successCount),
          _buildSummaryItem("Failed", R.colors.pingFailed, failedCount),
          _buildSummaryItem("Total", R.colors.pingTotal, totalCount),
        ]),
        Container(height: 12.0),
        Text(
          "Ping",
          style: TextStyle(fontWeight: FontWeight.bold, color: R.colors.gray),
        ),
        Container(height: 8.0),
        Row(children: <Widget>[
          _buildSummaryItem("Min", R.colors.pingMin, stats?.min),
          _buildSummaryItem("Mean", R.colors.pingMean, stats?.mean),
          _buildSummaryItem("Max", R.colors.pingMax, stats?.max),
        ])
      ],
    );
  }

  Widget _buildSummaryItem(String label, Color color, int value) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  width: 12.0,
                  height: 8.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0),
                    border: Border.all(color: color),
                  ),
                ),
                Container(width: 8.0),
                Text(
                  value?.toString() ?? "-",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                ),
              ],
            ),
            Text(label, style: TextStyle(color: R.colors.gray)),
          ],
        ),
      ),
    );
  }
}
