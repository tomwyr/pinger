import 'package:flutter/material.dart';
import 'package:pinger/model/ping_session.dart';
import 'package:pinger/resources.dart';
import 'package:pinger/widgets/common/collapsing_header.dart';
import 'package:pinger/widgets/tiles/host_icon_tile.dart';

class SessionHostHeader extends StatelessWidget {
  final PingSession session;
  final bool isExpanded;
  final Duration animDuration;
  final List<Widget> buttons;

  const SessionHostHeader({
    Key key,
    @required this.session,
    @required this.isExpanded,
    @required this.buttons,
    @required this.animDuration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fontSize = isExpanded ? 24.0 : 18.0;
    return CollapsingHeader(
      isExpanded: isExpanded,
      duration: animDuration,
      title: "Session",
      host: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          HostIconTile(isRaised: isExpanded),
          Container(width: 20.0),
          TweenAnimationBuilder<double>(
            duration: animDuration,
            tween: Tween(begin: fontSize, end: fontSize),
            builder: (_, value, __) => Text(
              session.host.name,
              style: TextStyle(fontSize: value),
            ),
          ),
        ],
      ),
      bottom: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          if (session.host.ip != null)
            Align(
              alignment: Alignment.center,
              child: Text(
                session.host.ip,
                style: TextStyle(
                  fontSize: 18.0,
                  color: R.colors.gray,
                ),
              ),
            ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 32.0, vertical: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: buttons,
            ),
          ),
        ],
      ),
    );
  }
}
