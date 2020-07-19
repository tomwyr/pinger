import 'package:flutter/material.dart';
import 'package:pinger/model/ping_session.dart';
import 'package:pinger/resources.dart';
import 'package:pinger/ui/common/fade_out.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

enum InfoTrayMode { HIDDEN, AUTO_EXPAND, MANUAL_EXPAND }

class InfoTray extends StatefulWidget {
  final Widget child;

  const InfoTray({Key key, @required this.child}) : super(key: key);

  @override
  _InfoTrayState createState() => _InfoTrayState();
}

class _InfoTrayState extends State<InfoTray>
    with SingleTickerProviderStateMixin {
  final _handleWidth = 64.0;
  final _handleHeight = 32.0;
  final _borderRadius = 12.0;
  final _trayExpansion = ValueNotifier(0.0);
  final _controller = SheetController();

  void _onHandleTap() {
    final state = _controller.state;
    if (state.isCollapsed) {
      _controller.expand();
    } else if (state.isExpanded) {
      _controller.collapse();
    }
  }

  void _onSheetSnap(SheetState state, double snap) {
    //
  }

  @override
  Widget build(BuildContext context) {
    return SlidingSheet(
      padding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 12.0),
      color: R.colors.none,
      duration: const Duration(milliseconds: 500),
      controller: _controller,
      listener: (it) => _trayExpansion.value = it.progress,
      snapSpec: SnapSpec(
        onSnap: _onSheetSnap,
        initialSnap: SnapSpec.headerSnap,
        snappings: [
          SnapSpec.headerSnap,
          SnapSpec.expanded,
        ],
      ),
      headerBuilder: (_, __) => _buildHandle(),
      builder: (_, __) => _buildTray(),
      body: widget.child,
    );
  }

  Widget _buildHandle() {
    return GestureDetector(
      onTap: _onHandleTap,
      child: SizedBox(
        height: _handleHeight,
        child: LayoutBuilder(
          builder: (_, constraints) => ValueListenableBuilder<double>(
            valueListenable: _trayExpansion,
            builder: (_, value, __) => Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: _handleHeight * (1.0 - value / 2),
                width: _handleWidth +
                    (constraints.maxWidth - _handleWidth) * value,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: ColorTween(
                      begin: R.colors.secondary,
                      end: R.colors.primaryLight,
                    ).transform(value),
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(_handleWidth),
                    ),
                  ),
                  child: CustomPaint(
                    painter: InfoTrayHandlePainter(
                      expansion: value,
                      color: R.colors.white,
                      width: 24.0,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTray() {
    return Material(
      child: ValueListenableBuilder<double>(
        valueListenable: _trayExpansion,
        builder: (_, value, child) => DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(_borderRadius * (1.0 - value) * 2),
              bottom: Radius.circular(_borderRadius),
            ),
            color: ColorTween(
              begin: R.colors.secondary,
              end: R.colors.primaryLight,
            ).transform(value),
          ),
          child: child,
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 4.0, 16.0, 12.0),
          child: Column(children: <Widget>[
            ConnectivityInfo(enabled: true),
            SessionInfo(session: null),
          ]),
        ),
      ),
    );
  }
}

class InfoTrayHandlePainter extends CustomPainter {
  final Color color;
  final double expansion;
  final double width;
  final double strokeWidth = 2.0;

  InfoTrayHandlePainter({
    @required this.color,
    @required this.expansion,
    @required this.width,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final lineWidth = width / 3 + width / 6 * expansion;
    final lineHeight = size.height / 6 * (1.0 - expansion);
    final startX = size.width / 2 - lineWidth;
    final startY = (size.height + lineHeight) / 2 + (2.0 * (1.0 - expansion));
    final path = Path()
      ..moveTo(startX, startY)
      ..relativeLineTo(lineWidth, -lineHeight)
      ..relativeLineTo(lineWidth, lineHeight);
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeJoin = StrokeJoin.round
      ..strokeCap = StrokeCap.round
      ..color = color
      ..strokeWidth = strokeWidth;
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(InfoTrayHandlePainter old) =>
      old.color != color ||
      old.expansion != expansion ||
      old.width != width ||
      old.strokeWidth != strokeWidth;
}

class ConnectivityInfo extends StatelessWidget {
  final bool enabled;

  const ConnectivityInfo({Key key, @required this.enabled}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeOut(
      visible: enabled,
      duration: const Duration(milliseconds: 500),
      child: Row(children: <Widget>[
        Expanded(
          child: Text(
            "Connection seems to be disabled. Go to settings and enable wifi/mobile in order to be able to ping a host",
            style: TextStyle(color: R.colors.white),
          ),
        ),
        Container(width: 12.0),
        Icon(Icons.signal_wifi_off, color: R.colors.white),
      ]),
    );
  }
}

class SessionInfo extends StatelessWidget {
  final PingSession session;

  const SessionInfo({Key key, @required this.session}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
