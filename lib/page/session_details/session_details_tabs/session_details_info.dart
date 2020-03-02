import 'package:flutter/material.dart';
import 'package:pinger/model/ping_session.dart';
import 'package:pinger/utils/format_utils.dart';

class SessionDetailsInfo extends StatelessWidget {
  final PingSession session;

  const SessionDetailsInfo({Key key, @required this.session}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildHeader("Info"),
            _buildItem(
                "Date", FormatUtils.getTimestampLabel(session.timestamp)),
            _buildItem("Host IP", session.host.ip),
            _buildItem(
                "Total time", FormatUtils.getDurationLabel(session.duration)),
            _buildHeader("Settings"),
            _buildItem("Count", "${session.settings.count}x"),
            _buildItem("Packet size", "${session.settings.packetSize}B"),
            _buildItem("Send interval", "${session.settings.sendInterval}s"),
            _buildItem("Timeout", "${session.settings.timeout}s"),
          ],
        ),
      ),
    );
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
