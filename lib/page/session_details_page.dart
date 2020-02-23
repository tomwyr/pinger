import 'package:flutter/material.dart';
import 'package:pinger/model/ping_session.dart';

class SessionDetailsPage extends StatefulWidget {
  final PingSession session;

  const SessionDetailsPage({Key key, @required this.session}) : super(key: key);

  @override
  _SessionDetailsPageState createState() => _SessionDetailsPageState();
}

class _SessionDetailsPageState extends State<SessionDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Details for ${widget.session.host}"),
      ),
    );
  }
}
