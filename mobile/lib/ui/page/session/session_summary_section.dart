import 'package:flutter/material.dart';
import 'package:pinger/generated/l10n.dart';
import 'package:pinger/model/ping_result.dart';
import 'package:pinger/resources.dart';

class SessionSummarySection extends StatelessWidget {
  const SessionSummarySection({
    super.key,
    required this.values,
    required this.stats,
  });

  final List<int?>? values;
  final PingStats? stats;

  @override
  Widget build(BuildContext context) {
    final totalCount = values!.length;
    final successCount = values!.where((it) => it != null).length;
    final failedCount = totalCount - successCount;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          S.current.sessionSummarySubtitle,
          style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        Container(height: 12.0),
        Text(
          S.current.sessionPingCountsSubtitle,
          style: TextStyle(fontWeight: FontWeight.bold, color: R.colors.gray),
        ),
        Container(height: 8.0),
        Row(children: <Widget>[
          _buildSummaryItem(
            S.current.pingSuccessCountLabel,
            R.colors.pingSuccessful,
            successCount,
          ),
          _buildSummaryItem(
            S.current.pingFailedCountLabel,
            R.colors.pingFailed,
            failedCount,
          ),
          _buildSummaryItem(
            S.current.pingTotalCountLabel,
            R.colors.pingTotal,
            totalCount,
          ),
        ]),
        Container(height: 12.0),
        Text(
          S.current.sessionPingValuesSubtitle,
          style: TextStyle(fontWeight: FontWeight.bold, color: R.colors.gray),
        ),
        Container(height: 8.0),
        Row(children: <Widget>[
          _buildSummaryItem(
            S.current.pingMinCountLabel,
            R.colors.pingMin,
            stats?.min,
          ),
          _buildSummaryItem(
            S.current.pingMeanCountLabel,
            R.colors.pingMean,
            stats?.mean,
          ),
          _buildSummaryItem(
            S.current.pingMaxValueLabel,
            R.colors.pingMax,
            stats?.max,
          ),
        ])
      ],
    );
  }

  Widget _buildSummaryItem(String label, Color color, int? value) {
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
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
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
