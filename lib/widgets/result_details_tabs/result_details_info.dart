import 'package:flutter/material.dart';
import 'package:pinger/model/ping_result.dart';
import 'package:pinger/utils/format_utils.dart';
import 'package:pinger/widgets/collapsing_tab_layout.dart';

class ResultDetailsInfo extends StatelessWidget {
  final PingResult result;

  const ResultDetailsInfo({Key key, @required this.result}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CollapsingTabLayoutItem(slivers: <Widget>[
      SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildHeader("Info"),
              _buildItem(
                  "Date", FormatUtils.getTimestampLabel(result.startTime)),
              _buildItem("Host IP", result.host.ip ?? "-"),
              _buildItem(
                  "Total time", FormatUtils.getDurationLabel(result.duration)),
              _buildHeader("Settings"),
              _buildItem("Count", "${result.settings.count}x"),
              _buildItem("Packet size", "${result.settings.packetSize}B"),
              _buildItem("Send interval", "${result.settings.interval}s"),
              _buildItem("Timeout", "${result.settings.timeout}s"),
            ],
          ),
        ),
      )
    ]);
  }

  Widget _buildHeader(String name) {
    return Padding(
      padding: const EdgeInsets.only(top: 18.0, bottom: 6.0),
      child: Text(
        name,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
      ),
    );
  }

  Widget _buildItem(String name, String value) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 16.0),
      child: Row(children: <Widget>[
        Text(name, style: TextStyle(color: Colors.grey, fontSize: 18.0)),
        Spacer(),
        Text(value, style: TextStyle(fontSize: 18.0)),
      ]),
    );
  }
}
