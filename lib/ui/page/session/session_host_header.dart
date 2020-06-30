import 'package:flutter/material.dart';
import 'package:pinger/generated/l10n.dart';
import 'package:pinger/model/ping_session.dart';
import 'package:pinger/ui/common/collapsing_header.dart';
import 'package:pinger/ui/shared/tiles/host_icon_tile.dart';

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
      title: S.current.sessionPageTitle,
      builder: (_, expansion, content) => Padding(
        padding: EdgeInsets.only(
          left: 32.0 * expansion,
          right: 12.0 + 20 * expansion,
        ),
        child: content,
      ),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(width: 8.0),
          HostIconTile(host: session.host, isRaised: isExpanded),
          Container(width: 20.0),
          Flexible(
            child: TweenAnimationBuilder<double>(
              duration: animDuration,
              tween: Tween(begin: fontSize, end: fontSize),
              builder: (_, value, __) => Text(
                session.host,
                maxLines: 1,
                softWrap: false,
                overflow: TextOverflow.fade,
                style: TextStyle(fontSize: value),
              ),
            ),
          ),
          Container(width: 8.0),
        ],
      ),
      bottom: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 24.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: buttons,
        ),
      ),
    );
  }
}
