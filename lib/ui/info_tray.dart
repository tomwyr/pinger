import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pinger/di/injector.dart';
import 'package:pinger/model/ping_session.dart';
import 'package:pinger/resources.dart';
import 'package:pinger/store/device_store.dart';
import 'package:pinger/store/ping_store.dart';
import 'package:pinger/ui/common/draggable_sheet.dart';
import 'package:pinger/ui/common/fade_out.dart';

enum InfoTrayItem { CONNECTIVITY, SESSION }

class InfoTray extends StatefulWidget {
  final Widget child;

  const InfoTray({Key key, @required this.child}) : super(key: key);

  @override
  _InfoTrayState createState() => _InfoTrayState();
}

class _InfoTrayState extends State<InfoTray>
    with SingleTickerProviderStateMixin {
  final PingStore _pingStore = Injector.resolve();
  final DeviceStore _deviceStore = Injector.resolve();

  final DraggableSheetController _controller = DraggableSheetController();
  final Duration _animDuration = const Duration(milliseconds: 500);
  final Set<InfoTrayItem> _visibleItems = {};

  void _onItemValue(InfoTrayItem item, bool visible) async {
    final didChange =
        visible ? _visibleItems.add(item) : _visibleItems.remove(item);
    if (didChange) {
      if (_visibleItems.isNotEmpty && !_controller.isVisible) {
        _controller.show();
      } else if (_visibleItems.isEmpty && _controller.isVisible) {
        _controller.hide();
      }
    }
  }

  void _onHandleTap() {
    if (_controller.currentExpansion == 1.0) {
      _controller.collapse();
    } else if (_controller.currentExpansion == 0.0) {
      _controller.expand();
    }
  }

  @override
  Widget build(BuildContext context) {
    return InfoTraySheet(
      controller: _controller,
      onHandleTap: _onHandleTap,
      child: widget.child,
      items: <Widget>[
        _buildItem<bool>(
          item: InfoTrayItem.CONNECTIVITY,
          valueObservable: () => _deviceStore.isNetworkEnabled,
          isVisible: (it) => it == false,
          builder: (_) => _buildConnectivityItem(),
        ),
        _buildItem<PingSession>(
          item: InfoTrayItem.SESSION,
          valueObservable: () => _pingStore.currentSession,
          isVisible: (it) => it?.status?.isSession ?? false,
          builder: (_) => _buildSessionItem(),
        ),
      ],
    );
  }

  Widget _buildItem<T>({
    @required InfoTrayItem item,
    @required ValueGetter<T> valueObservable,
    @required bool Function(T value) isVisible,
    @required Widget builder(T value),
  }) {
    return Observer(builder: (_) {
      final value = valueObservable();
      final visible = isVisible(value);
      Future(() => _onItemValue(item, visible));
      return FadeOut(
        visible: visible,
        duration: _animDuration,
        child: builder(value),
      );
    });
  }

  Widget _buildConnectivityItem() {
    return Row(children: <Widget>[
      Expanded(
        child: Text(
          "Connection seems to be disabled. Go to settings and enable wifi/mobile in order to be able to ping a host",
          style: TextStyle(color: R.colors.white),
        ),
      ),
      Container(width: 12.0),
      Icon(Icons.signal_wifi_off, color: R.colors.white),
    ]);
  }

  Widget _buildSessionItem() {
    return Text(
      "Session is running",
      style: TextStyle(color: R.colors.white),
    );
  }
}

class InfoTraySheet extends StatelessWidget {
  static const _handleWidth = 64.0;
  static const _handleHeight = 32.0;
  static const _borderRadius = 12.0;
  static const _padding = EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 12.0);

  final DraggableSheetController controller;
  final VoidCallback onHandleTap;
  final Widget child;
  final List<Widget> items;

  const InfoTraySheet({
    Key key,
    @required this.controller,
    @required this.onHandleTap,
    @required this.child,
    @required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: DraggableSheet(
        controller: controller,
        child: child,
        handleBuilder: (_) => _buildHandle(),
        contentBuilder: (_) => _buildTray(),
      ),
    );
  }

  Widget _buildHandle() {
    return Padding(
      padding: _padding.copyWith(bottom: 0.0),
      child: SizedBox(
        height: _handleHeight,
        child: LayoutBuilder(
          builder: (_, constraints) => StreamBuilder<double>(
            stream: controller.expansion,
            initialData: controller.currentExpansion,
            builder: (_, snapshot) => Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: _handleHeight * (1.0 - snapshot.data / 2),
                width: _handleWidth +
                    (constraints.maxWidth - _handleWidth) * snapshot.data,
                child: GestureDetector(
                  onTap: onHandleTap,
                  child: DecoratedBox(
                    decoration: _buildDecoration(
                      expansion: snapshot.data,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(_handleWidth),
                      ),
                    ),
                    child: CustomPaint(
                      painter: InfoTrayHandlePainter(
                        expansion: snapshot.data,
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
      ),
    );
  }

  Widget _buildTray() {
    return Padding(
      padding: _padding.copyWith(top: 0.0),
      child: StreamBuilder<double>(
        initialData: controller.currentExpansion,
        stream: controller.expansion,
        builder: (_, snapshot) => DecoratedBox(
          decoration: _buildDecoration(
            expansion: snapshot.data,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(_borderRadius * (1.0 - snapshot.data) * 2),
              bottom: Radius.circular(_borderRadius),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 4.0, 16.0, 12.0),
            child: Column(children: items),
          ),
        ),
      ),
    );
  }

  BoxDecoration _buildDecoration({
    @required double expansion,
    @required BorderRadiusGeometry borderRadius,
  }) {
    final color = ColorTween(
      begin: R.colors.secondary,
      end: R.colors.primaryLight,
    ).transform(expansion);
    return BoxDecoration(
      color: color,
      boxShadow: [
        BoxShadow(
          color: color,
          blurRadius: 4.0,
          spreadRadius: 1.0,
        )
      ],
      borderRadius: borderRadius,
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
