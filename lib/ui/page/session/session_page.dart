import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pinger/assets.dart';
import 'package:pinger/di/injector.dart';
import 'package:pinger/generated/l10n.dart';
import 'package:pinger/model/ping_session.dart';
import 'package:pinger/resources.dart';
import 'package:pinger/store/hosts_store.dart';
import 'package:pinger/store/ping_store.dart';
import 'package:pinger/ui/app/pinger_app.dart';
import 'package:pinger/ui/app/pinger_router.dart';
import 'package:pinger/ui/common/fade_out.dart';
import 'package:pinger/ui/page/base_page.dart';
import 'package:pinger/ui/page/session/session_host_button.dart';
import 'package:pinger/ui/page/session/session_host_header.dart';
import 'package:pinger/ui/page/session/session_ping_button.dart';
import 'package:pinger/ui/page/session/session_summary_section.dart';
import 'package:pinger/ui/page/session/session_values/session_values_section.dart';
import 'package:pinger/ui/page/settings/settings_sections.dart';
import 'package:pinger/ui/shared/info_section.dart';
import 'package:pinger/ui/shared/sheet/pinger_bottom_sheet.dart';
import 'package:pinger/ui/shared/view_type/view_types.dart';

class SessionPage extends StatefulWidget {
  @override
  _SessionPageState createState() => _SessionPageState();
}

class _SessionPageState extends BaseState<SessionPage> {
  final Duration _animDuration = Duration(milliseconds: 500);
  final PingStore _pingStore = Injector.resolve();
  final HostsStore _hostsStore = Injector.resolve();

  ValueNotifier<PingValuesType> _viewType = ValueNotifier(PingValuesType.gauge);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Ignore resize caused by hiding keyboard
      // when navigating back from search page.
      resizeToAvoidBottomPadding: false,
      body: SafeArea(
        child: Observer(builder: (_) {
          final session = _pingStore.currentSession;
          final sessionDuration = _pingStore.pingDuration;
          final prevSession = _pingStore.prevSession;
          final canArchive = _pingStore.canArchiveResult;
          final isFavorite = _hostsStore.favorites.contains(session.host);
          final didChangeSettings = _pingStore.didChangeSettings;
          final status = session.status;
          final prevStatus = _pingStore.prevStatus;
          return Column(children: <Widget>[
            _buildHeader(
              session,
              isFavorite,
              status.isInitial,
              didChangeSettings,
            ),
            Expanded(
              child: Align(
                alignment: Alignment.topCenter,
                child: AnimatedSwitcher(
                  duration: _animDuration,
                  child: session.status.isInitial && prevSession == null
                      ? _buildStartPrompt()
                      : _buildResults(
                          session.status.isInitial ? prevSession : session,
                          sessionDuration,
                          status.isInitial,
                        ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 24.0, top: 12.0),
              child: _buildPingButton(status, prevStatus, canArchive),
            ),
          ]);
        }),
      ),
    );
  }

  Widget _buildHeader(PingSession session, bool isFavorite, bool isExpanded,
      bool didChangeSettings) {
    return SessionHostHeader(
      session: session,
      isExpanded: isExpanded,
      animDuration: _animDuration,
      buttons: [
        SessionHostButton(
          icon: Icons.search,
          label: S.current.sessionSearchButtonLabel,
          enabled: true,
          active: false,
          onPressed: () =>
              PingerApp.router.show(RouteConfig.search(session.host)),
        ),
        SessionHostButton(
          icon: Icons.bookmark,
          label: S.current.sessionFavoriteButtonLabel,
          enabled: true,
          active: isFavorite,
          onPressed: () => isFavorite
              ? _hostsStore.removeFavorites([session.host])
              : _hostsStore.addFavorite(session.host),
        ),
        SessionHostButton(
          icon: Icons.tune,
          label: S.current.sessionAdjustButtonLabel,
          enabled: true,
          active: didChangeSettings,
          onPressed: _showSettingsSheet,
        ),
      ],
    );
  }

  void _showSettingsSheet() async {
    await PingerBottomSheet.show(
      rejectLabel: S.current.resetButtonLabel,
      title: Text(
        S.current.pingSettingsSheetTitle,
        style: R.styles.bottomSheetTitle,
      ),
      subtitle: Text(
        S.current.pingSettingsSheetSubtitle,
        style: R.styles.bottomSheetSubtitle,
      ),
      onRejectPressed: _pingStore.clearSettings,
      onAcceptPressed: PingerApp.router.pop,
      builder: (_) => Observer(
        builder: (_) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 24.0),
          child: PingSettingsSection(
            showHeader: false,
            settings: _pingStore.currentSession.settings,
            onChanged: _pingStore.updateSettings,
          ),
        ),
      ),
    );
  }

  Widget _buildStartPrompt() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(48.0, 0.0, 48.0, 8.0),
      child: InfoSection(
        image: Images.undrawRunnerStart,
        title: S.current.sessionStartPromptTitle,
        description: S.current.sessionStartPromptDesc,
        risksOverflow: true,
      ),
    );
  }

  Widget _buildResults(
      PingSession session, Duration sessionDuration, bool isExpanded) {
    return Column(children: <Widget>[
      Padding(
        padding: const EdgeInsets.fromLTRB(32.0, 0.0, 32.0, 8.0),
        child: SessionSummarySection(
          values: session.values,
          stats: session.stats,
        ),
      ),
      Expanded(
        child: ValueListenableBuilder<PingValuesType>(
          valueListenable: _viewType,
          builder: (_, value, __) => FadeOut(
            duration: _animDuration,
            visible: !isExpanded,
            child: SessionValuesSection(
              session: session,
              sessionDuration: sessionDuration,
              viewType: value,
              onViewTypeChanged: (it) => _viewType.value = it,
            ),
          ),
        ),
      ),
    ]);
  }

  Widget _buildPingButton(
      PingStatus status, PingStatus prevStatus, bool canArchive) {
    final showArchive = status.isSessionDone || prevStatus.isSessionDone;
    final secondaryIcon = showArchive ? Icons.archive : Icons.stop;
    switch (status) {
      case PingStatus.initial:
        return SessionPingButton(
          isExpanded: false,
          primaryIcon: Icons.play_arrow,
          onPrimaryPressed: _pingStore.startSession,
          onSecondaryPressed: null,
          secondaryIcon: secondaryIcon,
          onPrimaryLongPressStart: _pingStore.startQuickCheck,
          onPrimaryLongPressEnd: null,
        );
      case PingStatus.quickCheck:
        return SessionPingButton(
          isExpanded: false,
          primaryIcon: Icons.lens,
          secondaryIcon: secondaryIcon,
          onPrimaryPressed: null,
          onSecondaryPressed: null,
          onPrimaryLongPressStart: null,
          onPrimaryLongPressEnd: _pingStore.stopQuickCheck,
        );
      case PingStatus.sessionStarted:
        return SessionPingButton(
          isExpanded: true,
          primaryIcon: Icons.pause,
          secondaryIcon: secondaryIcon,
          onPrimaryPressed: _pingStore.pauseSession,
          onSecondaryPressed: _pingStore.stopSession,
          onPrimaryLongPressStart: null,
          onPrimaryLongPressEnd: null,
        );
      case PingStatus.sessionPaused:
        return SessionPingButton(
          isExpanded: true,
          primaryIcon: Icons.play_arrow,
          secondaryIcon: Icons.stop,
          onPrimaryPressed: _pingStore.resumeSession,
          onSecondaryPressed: _pingStore.stopSession,
          onPrimaryLongPressStart: null,
          onPrimaryLongPressEnd: null,
        );
      case PingStatus.sessionDone:
        return SessionPingButton(
          isExpanded: canArchive,
          primaryIcon: Icons.undo,
          secondaryIcon: secondaryIcon,
          onPrimaryPressed: _pingStore.restartSession,
          onSecondaryPressed: canArchive ? _pingStore.archiveResult : null,
          onPrimaryLongPressStart: null,
          onPrimaryLongPressEnd: null,
        );
    }
    throw StateError("Unhandled session status: $status");
  }
}
