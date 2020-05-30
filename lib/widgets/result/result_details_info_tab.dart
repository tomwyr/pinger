import 'package:flutter/material.dart';
import 'package:pinger/model/ping_result.dart';
import 'package:pinger/resources.dart';
import 'package:pinger/utils/format_utils.dart';
import 'package:pinger/widgets/common/collapsing_tab_layout.dart';

class ResultDetailsInfoTab extends StatelessWidget {
  final PingResult result;

  const ResultDetailsInfoTab({Key key, @required this.result})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CollapsingTabLayoutItem(slivers: <Widget>[
      SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildHeader("Info"),
              _buildItem(
                "Date",
                FormatUtils.getTimestampLabel(result.startTime, showTime: true),
              ),
              _buildItem("Host IP", result.host.ip ?? "-"),
              _buildItem(
                  "Total time", FormatUtils.getDurationLabel(result.duration)),
              Container(height: 24.0),
              _buildHeader("Settings"),
              _buildItem("Count", "${result.settings.count} x"),
              _buildItem("Packet size", "${result.settings.packetSize} B"),
              _buildItem("Send interval", "${result.settings.interval} s"),
              _buildItem("Timeout", "${result.settings.timeout} s"),
            ],
          ),
        ),
      )
    ]);
  }

  Widget _buildHeader(String name) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        name,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
      ),
    );
  }

  Widget _buildItem(String name, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(children: <Widget>[
        Text(name, style: TextStyle(color: R.colors.gray, fontSize: 18.0)),
        Spacer(),
        Text(value, style: TextStyle(fontSize: 18.0)),
      ]),
    );
  }
}
