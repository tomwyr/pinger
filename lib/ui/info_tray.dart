import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:pinger/di/injector.dart';
import 'package:pinger/extensions.dart';
import 'package:pinger/generated/l10n.dart';
import 'package:pinger/model/ping_session.dart';
import 'package:pinger/model/user_settings.dart';
import 'package:pinger/resources.dart';
import 'package:pinger/store/device_store.dart';
import 'package:pinger/store/ping_store.dart';
import 'package:pinger/store/settings_store.dart';
import 'package:pinger/ui/app/pinger_app.dart';
import 'package:pinger/ui/app/pinger_router.dart';
import 'package:pinger/ui/common/draggable_sheet.dart';
import 'package:pinger/utils/format_utils.dart';

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
  final SettingsStore _settingsStore = Injector.resolve();
  final DraggableSheetController _controller = DraggableSheetController();
  final ObservableStream<String> _routeObservable = ObservableStream(
    PingerApp.router.route,
    initialValue: PingerApp.router.currentRoute,
  );

  bool _shouldRestoreTray = false;
  Set<InfoTrayItem> _visibleItems = {};
  Map<InfoTrayItem, InfoTrayEntry> _entries;
  ReactionDisposer _settingsDisposer;
  ReactionDisposer _routeDisposer;

  Map<InfoTrayItem, InfoTrayEntry> _createEntries() => {
        InfoTrayItem.CONNECTIVITY: InfoTrayEntry<bool>(
          item: InfoTrayItem.CONNECTIVITY,
          valueObservable: () => _deviceStore.isNetworkEnabled,
          valueBuilder: (_) => InfoTrayConnectivityItem(),
          isVisible: (it) => it == false,
        ),
        InfoTrayItem.SESSION: InfoTrayEntry<SessionItemModel>(
          item: InfoTrayItem.SESSION,
          valueObservable: () => SessionItemModel(
            _pingStore.currentSession,
            _pingStore.pingDuration,
            _routeObservable.value,
          ),
          valueBuilder: (it) => InfoTraySessionItem(
            session: it.session,
            duration: it.duration,
            onButtonPressed: _onSessionItemButtonPressed,
            onPressed: _onSessionItemPressed,
          ),
          isVisible: (it) =>
              (it?.session?.status?.isSession ?? false) &&
              (it.route != null && it.route != PingerRoutes.SESSION),
        ),
      };

  void _onSessionItemButtonPressed() {
    final status = _pingStore.currentSession.status;
    if (status.isStarted) {
      _pingStore.pauseSession();
    } else if (status.isSessionPaused) {
      _pingStore.resumeSession();
    } else if (status.isSessionDone) {
      _pingStore.restartSession();
      _pingStore.startSession();
    }
  }

  void _onSessionItemPressed() {
    PingerApp.router.show(RouteConfig.session());
  }

  @override
  void initState() {
    super.initState();
    _entries = _createEntries()..values.forEach((it) => it.init());
    _settingsDisposer = reaction(
      (_) => _settingsStore.userSettings.traySettings,
      _onTraySettings,
      fireImmediately: true,
    );
    _routeDisposer = reaction(
      (_) => _routeObservable.value,
      _onRouteChanged,
      fireImmediately: true,
    );
  }

  @override
  void dispose() {
    _settingsDisposer();
    _routeDisposer();
    _entries.values.forEach((it) => it.dispose());
    super.dispose();
  }

  void _onTraySettings(TraySettings settings) {
    if (settings.enabled) {
      final hasVisibleItems = _entries.values.any((it) => it.visibility.value);
      _updateSheetVisibility(hasVisibleItems);
      _updateSheetExpansion(settings.autoReveal);
    } else {
      _updateSheetVisibility(false);
    }
  }

  void _onRouteChanged(String route) {
    if (route == PingerRoutes.SHEET && _controller.isVisible) {
      _shouldRestoreTray = true;
      _controller.hide();
    } else if (route != PingerRoutes.SHEET && _shouldRestoreTray) {
      _shouldRestoreTray = false;
      _controller.show();
    }
  }

  void _onVisibilityChanged(Set<InfoTrayItem> visibleItems) {
    if (visibleItems.isEmpty) {
      _updateSheetVisibility(false);
    } else {
      _updateSheetVisibility(true);
      final added = _visibleItems.toSet()..removeAll(visibleItems);
      final settings = _settingsStore.userSettings.traySettings;
      if (added.isNotEmpty && settings.autoReveal) {
        _updateSheetExpansion(true);
      }
    }
    _visibleItems = visibleItems.toSet();
  }

  void _updateSheetVisibility(bool visible) {
    if (_routeObservable.value != PingerRoutes.SHEET) {
      if (visible && !_controller.isVisible) {
        _controller.show();
      } else if (!visible && _controller.isVisible) {
        _controller.hide();
      }
    } else {
      _shouldRestoreTray = visible;
    }
  }

  void _onHandleTap() {
    final shouldExpand = _controller.sheetState == SheetState.COLLAPSING ||
        _controller.sheetState == SheetState.COLLAPSED;
    _updateSheetExpansion(shouldExpand);
  }

  void _updateSheetExpansion(bool expanded) {
    if (expanded && _controller.sheetState == SheetState.COLLAPSED) {
      _controller.expand();
    } else if (!expanded && _controller.sheetState == SheetState.EXPANDED) {
      _controller.collapse();
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
    return SeparatedDraggableSheet<InfoTrayItem>(
      controller: controller,
      duration: _animDuration,
      animateVisibility: true,
      child: child,
      items: items,
      onVisibilityChanged: onVisibilityChanged,
      contentBuilder: (_, children) => _buildTray(children),
      handleBuilder: (_) => _buildHandle(),
      separatorBuilder: (_) => _buildSeparator(),
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
            padding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 12.0),
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        width: double.infinity,
        height: 0.25,
        margin: const EdgeInsets.symmetric(vertical: 12.0),
        color: R.colors.white,
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
    final lineWidth = width / 3 + width / 2 * expansion;
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
    return Material(
      color: R.colors.none,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(children: <Widget>[
          Expanded(
            child: Text(
              S.current.infoTrayNetworkDisabled,
              style: TextStyle(color: R.colors.white),
            ),
          ),
          Container(width: 16.0),
          Icon(Icons.signal_wifi_off, color: R.colors.white),
        ]),
      ),
    );
  }
}

class InfoTraySessionItem extends StatelessWidget {
  final PingSession session;
  final Duration duration;
  final VoidCallback onButtonPressed;
  final VoidCallback onPressed;
  final Duration animDuration = const Duration(milliseconds: 1000);

  const InfoTraySessionItem({
    Key key,
    @required this.session,
    @required this.duration,
    @required this.onButtonPressed,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (session == null) return Container();
    return Material(
      color: R.colors.none,
      child: SizedBox(
        width: double.infinity,
        height: 112.0,
        child: Row(children: <Widget>[
          Expanded(child: _buildSessionInfo()),
          Container(width: 12.0),
          _buildButton(),
        ]),
      ),
    );
  }

  Widget _buildSessionInfo() {
    return InkWell(
      onTap: onPressed,
      child: Column(children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Stack(children: <Widget>[
              Align(
                alignment: Alignment.bottomLeft,
                child: _buildResultsChart(),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: _buildProgressIndicator(),
              ),
            ]),
          ),
        ),
        Container(height: 8.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: _buildTextInfo(),
        ),
      ]),
    );
  }

  Widget _buildResultsChart() {
    if (session.values.isNullOrEmpty) return Container();
    final gapWidth = max(50.0 / session.settings.count, 0.1);
    return LayoutBuilder(builder: (_, constraints) {
      final barsSpace =
          constraints.maxWidth - ((session.settings.count - 1) * gapWidth);
      final barWidth = barsSpace / session.settings.count;
      return Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          for (var item in session.values) ...[
            TweenAnimationBuilder<double>(
              duration: animDuration,
              tween: Tween(
                begin: 0.0,
                end: item != null
                    ? item / session.stats.max * constraints.maxHeight
                    : constraints.maxHeight,
              ),
              builder: (_, value, __) => Container(
                width: barWidth,
                height: value,
                color:
                    item != null ? Colors.white : Colors.white.withOpacity(0.3),
              ),
            ),
            Container(width: gapWidth),
          ]
        ]..removeLast(),
      );
    });
  }

  Widget _buildProgressIndicator() {
    final progress = (session.values?.length ?? 0.0) / session.settings.count;
    final dotSize = 6.0;
    return FractionalTranslation(
      translation: Offset(0.0, 0.5),
      child: SizedBox(
        height: dotSize,
        child: Stack(children: [
          Align(
            alignment: Alignment.centerLeft,
            child: _buildProgressBar(progress),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: _buildProgressDot(progress, dotSize),
          ),
        ]),
      ),
    );
  }

  Widget _buildProgressBar(double progress) {
    return Container(
      width: double.infinity,
      height: 2.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2.0),
        color: R.colors.white,
      ),
      alignment: Alignment.centerLeft,
      child: TweenAnimationBuilder<double>(
        duration: animDuration,
        tween: Tween(begin: progress, end: progress),
        builder: (_, value, child) => FractionallySizedBox(
          widthFactor: value,
          child: child,
        ),
        child: Container(
          width: double.infinity,
          height: 2.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2.0),
            color: R.colors.secondary,
          ),
        ),
      ),
    );
  }

  Widget _buildProgressDot(double progress, double size) {
    return TweenAnimationBuilder<double>(
      duration: animDuration,
      tween: Tween(begin: 0.0, end: progress * 2.0 - 1.0),
      builder: (_, value, child) => Align(
        alignment: Alignment(value, 0.0),
        child: FractionalTranslation(
          translation: Offset(value / 2, 0.0),
          child: child,
        ),
      ),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: R.colors.secondary,
          boxShadow: [
            BoxShadow(
              color: R.colors.secondary,
              blurRadius: 4.0,
              spreadRadius: 0.5,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextInfo() {
    final style = TextStyle(color: R.colors.white);
    final sideWidth = 48.0;
    return Row(children: <Widget>[
      SizedBox(
        width: sideWidth,
        child: Text(
          duration != null ? FormatUtils.getDurationLabel(duration) : "",
          style: style,
          textAlign: TextAlign.start,
        ),
      ),
      Expanded(
        child: Text(
          session.host,
          style: style,
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.fade,
          softWrap: false,
        ),
      ),
      SizedBox(
        width: sideWidth,
        child: Text(
          session.values != null
              ? "${session.values.length}/${session.settings.count}"
              : "",
          textAlign: TextAlign.end,
          style: style,
        ),
      ),
    ]);
  }

  Widget _buildButton() {
    if (!session.status.isSession) return Container();
    return SizedBox.fromSize(
      size: Size.square(56.0),
      child: Stack(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: R.colors.secondary, width: 3.0),
            ),
          ),
          Center(
            child: IconButton(
              onPressed: onButtonPressed,
              icon: Icon(
                session.status.isSessionStarted
                    ? Icons.pause
                    : session.status.isSessionPaused
                        ? Icons.play_arrow
                        : Icons.undo,
                color: R.colors.secondary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SessionItemModel {
  final PingSession session;
  final Duration duration;
  final String route;

  SessionItemModel(this.session, this.duration, this.route);
}
