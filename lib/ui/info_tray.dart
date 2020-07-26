import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:pinger/di/injector.dart';
import 'package:pinger/model/ping_session.dart';
import 'package:pinger/resources.dart';
import 'package:pinger/store/device_store.dart';
import 'package:pinger/store/ping_store.dart';
import 'package:pinger/ui/common/draggable_sheet.dart';

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

  Map<InfoTrayItem, InfoTrayEntry> _entries;
  Map<InfoTrayItem, InfoTrayEntry> _createEntries() => {
        InfoTrayItem.CONNECTIVITY: InfoTrayEntry<bool>(
          item: InfoTrayItem.CONNECTIVITY,
          valueObservable: () => _deviceStore.isNetworkEnabled,
          valueBuilder: (_) => InfoTrayConnectivityItem(),
          isVisible: (it) => it == false,
        ),
        InfoTrayItem.SESSION: InfoTrayEntry<PingSession>(
          item: InfoTrayItem.SESSION,
          valueObservable: () => _pingStore.currentSession,
          valueBuilder: (it) => InfoTraySessionItem(session: it),
          isVisible: (it) => it?.status?.isSession ?? false,
        ),
      };

  @override
  void initState() {
    super.initState();
    _entries = _createEntries()..values.forEach((it) => it.init());
  }

  @override
  void dispose() {
    _entries.values.forEach((it) => it.dispose());
    super.dispose();
  }

  void _onVisibilityChanged(Set<InfoTrayItem> visibleItems) {
    if (visibleItems.isNotEmpty && !_controller.isVisible) {
      _controller.show();
    } else if (visibleItems.isEmpty && _controller.isVisible) {
      _controller.hide();
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
      onVisibilityChanged: _onVisibilityChanged,
      onHandleTap: _onHandleTap,
      items: _entries.values.toList(),
      child: widget.child,
    );
  }
}

class InfoTraySheet extends StatelessWidget {
  static const _handleWidth = 64.0;
  static const _handleHeight = 32.0;
  static const _borderRadius = 12.0;
  static const _padding = EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 12.0);
  static const _animDuration = Duration(milliseconds: 500);

  final DraggableSheetController controller;
  final VoidCallback onHandleTap;
  final ValueChanged<Set<InfoTrayItem>> onVisibilityChanged;
  final List<InfoTrayEntry> items;
  final Widget child;

  const InfoTraySheet({
    Key key,
    @required this.controller,
    @required this.onHandleTap,
    @required this.onVisibilityChanged,
    @required this.items,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SeparatedDraggableSheet<InfoTrayItem>(
        controller: controller,
        duration: _animDuration,
        child: child,
        items: items,
        onVisibilityChanged: onVisibilityChanged,
        contentBuilder: (_, children) => _buildTray(children),
        handleBuilder: (_) => _buildHandle(),
        separatorBuilder: (_) => _buildSeparator(),
      ),
    );
  }

  Widget _buildTray(List<Widget> children) {
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: children,
            ),
          ),
        ),
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

  Widget _buildSeparator() {
    return Container(
      width: double.infinity,
      height: 0.25,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      color: R.colors.white,
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

enum InfoTrayItem { CONNECTIVITY, SESSION }

class InfoTrayEntry<T> implements SeparatedItem<InfoTrayItem> {
  InfoTrayEntry({
    @required this.item,
    @required this.valueObservable,
    @required this.valueBuilder,
    @required this.isVisible,
  });

  final InfoTrayItem item;
  final ValueGetter<T> valueObservable;
  final Widget Function(T value) valueBuilder;
  final bool Function(T value) isVisible;
  final ValueNotifier<bool> visibility = ValueNotifier(null);

  ReactionDisposer _reactionDisposer;

  void init() {
    _reactionDisposer = reaction(
      (_) => isVisible(valueObservable()),
      (it) => visibility.value = it,
      fireImmediately: true,
    );
  }

  void dispose() {
    _reactionDisposer();
    visibility.dispose();
  }

  @override
  InfoTrayItem get value => item;

  @override
  WidgetBuilder get builder =>
      (_) => Observer(builder: (_) => valueBuilder(valueObservable()));
}

class InfoTrayConnectivityItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
}

class InfoTraySessionItem extends StatelessWidget {
  final PingSession session;

  const InfoTraySessionItem({
    Key key,
    @required this.session,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "Session is running",
      style: TextStyle(color: R.colors.white),
    );
  }
}
