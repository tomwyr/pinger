import 'package:flutter/material.dart';
import 'package:pinger/extensions.dart';
import 'package:pinger/model/ping_session.dart';
import 'package:pinger/page/session_details/session_details_page.dart';
import 'package:pinger/widgets/collapsing_tab_layout.dart';
import 'package:pinger/widgets/ping_session_item.dart';
import 'package:pinger/widgets/separated_sliver_list.dart';

class SessionDetailsMore extends StatefulWidget {
  final List<PingSession> sessions;

  const SessionDetailsMore({Key key, @required this.sessions})
      : super(key: key);

  @override
  _SessionDetailsMoreState createState() => _SessionDetailsMoreState();
}

class _SessionDetailsMoreState extends State<SessionDetailsMore> {
  @override
  Widget build(BuildContext context) {
    return CollapsingTabLayoutItem(slivers: <Widget>[
      SeparatedSliverList(
        itemCount: widget.sessions.length,
        itemBuilder: (_, index) {
          final item = widget.sessions[index];
          return PingSessionItem(
            session: item,
            onTap: () => push(SessionDetailsPage(session: item)),
          );
        },
        separatorBuilder: (_, __) => Divider(),
      )
    ]);
  }
}
