import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pinger/assets.dart';
import 'package:pinger/di/injector.dart';
import 'package:pinger/extensions.dart';
import 'package:pinger/model/ping_session.dart';
import 'package:pinger/page/search_page.dart';
import 'package:pinger/resources.dart';
import 'package:pinger/store/favorites_store.dart';
import 'package:pinger/store/ping_store.dart';
import 'package:pinger/widgets/common/fade_out.dart';
import 'package:pinger/widgets/session/session_host_button.dart';
import 'package:pinger/widgets/session/session_host_header.dart';
import 'package:pinger/widgets/session/session_ping_button.dart';
import 'package:pinger/widgets/session/session_summary_section.dart';
import 'package:pinger/widgets/session/session_values_section.dart';
import 'package:pinger/widgets/settings/settings_sections.dart';
import 'package:pinger/widgets/sheet/pinger_bottom_sheet.dart';
import 'package:pinger/widgets/view_types.dart';

class PingPage extends StatefulWidget {
  @override
  _PingPageState createState() => _PingPageState();
}

class _PingPageState extends State<PingPage> {
  final Duration _animDuration = Duration(milliseconds: 500);
  final PingStore _pingStore = Injector.resolve();
  final FavoritesStore _favoritesStore = Injector.resolve();

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
          final canArchive = _pingStore.canArchiveResult;
          final isFavorite = _favoritesStore.isFavorite(session.host);
          final didChangeSettings = _pingStore.didChangeSettings;
          final status = session.status;
          final isExpanded = status.isInitial || status.isQuickCheckDone;
          final prevStatus = _pingStore.prevStatus;
          return Column(children: <Widget>[
            _buildHeader(session, isFavorite, isExpanded, didChangeSettings),
            Expanded(
              child: Align(
                alignment: Alignment.topCenter,
                child: AnimatedSwitcher(
                  duration: _animDuration,
                  child: session.status.isInitial
                      ? _buildStartPrompt()
                      : _buildResults(session, sessionDuration, isExpanded),
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
          icon: Icons.edit,
          label: "Edit",
          enabled: true,
          active: false,
          onPressed: () => pushReplacement(SearchPage(
            initialQuery: session.host,
          )),
        ),
        SessionHostButton(
          icon: Icons.bookmark,
          label: "Favorite",
          enabled: true,
          active: isFavorite,
          onPressed: () => isFavorite
              ? _favoritesStore.removeFavorites([session.host])
              : _favoritesStore.addFavorite(session.host),
        ),
        SessionHostButton(
          icon: Icons.tune,
          label: "Adjust",
          enabled: true,
          active: didChangeSettings,
          onPressed: _showSettingsSheet,
        ),
      ],
    );
  }

  void _showSettingsSheet() async {
    await PingerBottomSheet.show(
      context,
      rejectLabel: "RESET",
      title: Text("Ping settings", style: R.styles.bottomSheetTitle),
      subtitle: Text(
        "Changes will be applied only for current sesion",
        style: R.styles.bottomSheetSubitle,
      ),
      onRejectPressed: _pingStore.clearSettings,
      onAcceptPressed: pop,
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
      padding: const EdgeInsets.symmetric(horizontal: 48.0),
      child: Column(children: <Widget>[
        Spacer(),
        Image(image: Images.undrawRunnerStart, width: 144.0, height: 144.0),
        Spacer(),
        Text(
          "Tap button to start pinging",
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        Container(height: 24.0),
        Text(
          "Long press the button to quickly ping the host just a several times",
          style: TextStyle(fontSize: 18.0),
          textAlign: TextAlign.center,
        ),
        Spacer(),
      ]),
    );
  }

  Widget _buildResults(
      PingSession session, Duration sessionDuration, bool isExpanded) {
    return Column(children: <Widget>[
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
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
            hasFixedHeight: value == PingValuesType.gauge,
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
    final showArchive = status.isDone || prevStatus.isDone;
    return SessionPingButton(
      isExpanded:
          status.isSessionPaused || (status.isSessionDone && canArchive),
      primaryIcon: status.isQuickCheckStarted
          ? Icons.lens
          : status.isSessionDone
              ? Icons.undo
              : status.isSessionStarted ? Icons.pause : Icons.play_arrow,
      secondaryIcon: showArchive ? Icons.archive : Icons.stop,
      onPrimaryPressed: status.isSessionDone
          ? _pingStore.restartSession
          : status.isSessionPaused
              ? _pingStore.resumeSession
              : status.isSessionStarted
                  ? _pingStore.pauseSession
                  : _pingStore.startSession,
      onPrimaryLongPressStart: status.isInitial || status.isQuickCheckDone
          ? _pingStore.startQuickCheck
          : null,
      onPrimaryLongPressEnd:
          status.isQuickCheckStarted ? _pingStore.stopQuickCheck : null,
      onSecondaryPressed: !showArchive
          ? _pingStore.restartSession
          : canArchive ? _pingStore.archiveResult : null,
    );
  }
}
