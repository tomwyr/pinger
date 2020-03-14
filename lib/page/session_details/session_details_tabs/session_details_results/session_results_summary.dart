import 'package:flutter/material.dart';
import 'package:pinger/model/ping_session.dart';

class SessionResultsSummary extends StatelessWidget {
  final PingResults results;

  const SessionResultsSummary({Key key, @required this.results})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final resultsCount = results.values.length;
    final successCount = results.values.where((it) => it != null).length;
    final failedCount = resultsCount - successCount;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Row(children: <Widget>[
          _buildSummaryItem(
              "Success", "$successCount", successCount / resultsCount),
          _buildSummaryItem(
              "Failed", "$failedCount", failedCount / resultsCount),
          _buildSummaryItem("Total", "$resultsCount", 1.0),
        ]),
        Row(children: <Widget>[
          _buildSummaryItem("Min", "${results.stats.min.round()} ms",
              results.stats.min / results.stats.max),
          _buildSummaryItem("Mean", "${results.stats.mean.round()} ms",
              results.stats.mean / results.stats.max),
          _buildSummaryItem("Max", "${results.stats.max.round()} ms", 1.0),
        ]),
      ],
    );
  }

  Widget _buildSummaryItem(String label, String value, double barProgress) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(label, style: TextStyle(color: Colors.grey)),
            Container(height: 4.0),
            _buildItemBar(barProgress, value),
          ],
        ),
      ),
    );
  }

  Stack _buildItemBar(double barProgress, String value) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: <Widget>[
        LayoutBuilder(
          builder: (_, constraints) => Container(
            height: 32.0,
            width: barProgress * constraints.maxWidth,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.0),
              color: Colors.lightBlue[100],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(value),
        ),
      ],
    );
  }
}
