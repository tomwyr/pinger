import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pinger/di/injector.dart';
import 'package:pinger/model/ping_session.dart';
import 'package:pinger/model/user_settings.dart';
import 'package:pinger/store/device_store.dart';
import 'package:pinger/store/ping_store.dart';
import 'package:pinger/store/settings_store.dart';
import 'package:pinger/ui/app/pinger_app.dart';
import 'package:pinger/ui/app/pinger_router.dart';
import 'package:pinger/ui/common/draggable_sheet.dart';
import 'package:pinger/ui/info_tray/info_tray_entry.dart';
import 'package:pinger/ui/info_tray/info_tray_sheet.dart';
import 'package:pinger/ui/info_tray/items/info_tray_connectivity_item.dart';
import 'package:pinger/ui/info_tray/items/info_tray_session_item.dart';

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

  Set<InfoTrayItem> _visibleItems = {};
  ReactionDisposer _settingsDisposer;
  Map<InfoTrayItem, InfoTrayEntry> _entries;

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
  }

  @override
  void dispose() {
    _settingsDisposer();
    _entries.values.forEach((it) => it.dispose());
    super.dispose();
  }

  void _onTraySettings(TraySettings settings) {
    if (settings.enabled) {
      final hasVisibleItems = _entries.values.any((it) => it.visibility.value);
      if (hasVisibleItems && !_controller.isVisible) {
        _controller.show();
      } else if (!hasVisibleItems && _controller.isVisible) {
        _controller.hide();
      }
      final state = _controller.sheetState;
      if (settings.autoReveal && state == SheetState.COLLAPSED) {
        _controller.expand();
      } else if (!settings.autoReveal && state == SheetState.EXPANDED) {
        _controller.collapse();
      }
    } else if (_controller.isVisible) {
      _controller.hide();
    }
  }

  void _onVisibilityChanged(Set<InfoTrayItem> visibleItems) {
    if (visibleItems.isEmpty) {
      if (_controller.isVisible) _controller.hide();
    } else {
      if (!_controller.isVisible) _controller.show();
      final added = _visibleItems.toSet()..removeAll(visibleItems);
      final settings = _settingsStore.userSettings.traySettings;
      final state = _controller.sheetState;
      if (added.isNotEmpty &&
          settings.autoReveal &&
          state == SheetState.COLLAPSED) _controller.expand();
    }
    _visibleItems = visibleItems.toSet();
  }

  void _onHandleTap() {
    if (_controller.sheetState == SheetState.EXPANDED) {
      _controller.collapse();
    } else if (_controller.sheetState == SheetState.COLLAPSED) {
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

enum InfoTrayItem { CONNECTIVITY, SESSION }

class SessionItemModel {
  final PingSession session;
  final Duration duration;
  final String route;

  SessionItemModel(this.session, this.duration, this.route);
}
