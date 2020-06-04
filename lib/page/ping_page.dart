import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pinger/assets.dart';
import 'package:pinger/di/injector.dart';
import 'package:pinger/extensions.dart';
import 'package:pinger/model/ping_session.dart';
import 'package:pinger/page/home_page.dart';
import 'package:pinger/page/search_page.dart';
import 'package:pinger/store/favorites_store.dart';
import 'package:pinger/store/ping_store.dart';
import 'package:pinger/widgets/common/fade_out.dart';
import 'package:pinger/widgets/pinger_bottom_sheet.dart';
import 'package:pinger/widgets/session/session_host_button.dart';
import 'package:pinger/widgets/session/session_host_header.dart';
import 'package:pinger/widgets/session/session_ping_button.dart';
import 'package:pinger/widgets/session/session_summary_section.dart';
import 'package:pinger/widgets/session/session_values_section.dart';
import 'package:pinger/widgets/settings/settings_sections.dart';
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
      body: SafeArea(
        child: Observer(builder: (_) {
          final session = _pingStore.currentSession;
          final sessionDuration = _pingStore.pingDuration;
          final isFavorite = _favoritesStore.isFavorite(session.host.name);
          final didChangeSettings = _pingStore.didChangeSettings;
          final isExpanded =
              session.status.isInitial || session.status.isQuickCheckDone;
          return Column(children: <Widget>[
            _buildHeader(
              session,
              isFavorite,
              isExpanded,
              didChangeSettings,
            ),
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
            _buildPingButton(session),
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
            initialQuery: session.host.name,
          )),
        ),
        SessionHostButton(
          icon: Icons.bookmark,
          label: "Favorite",
          enabled: true,
          active: isFavorite,
          onPressed: () => isFavorite
              ? _favoritesStore.removeFavorites([session.host.name])
              : _favoritesStore.addFavorite(session.host.name),
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
      title: "Ping settings",
      subtitle: "Changes will be applied only for current sesion",
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
        Image(
          image: Images.undrawRunnerStart,
          width: 144.0,
          height: 144.0,
        ),
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
      ),
    ]);
  }

  Widget _buildPingButton(PingSession session) {
    return Observer(
      builder: (_) => Padding(
        padding: const EdgeInsets.only(bottom: 24.0, top: 12.0),
        child: SessionPingButton(
          session: session,
          pingDuration: _pingStore.pingDuration,
          canArchive: _pingStore.canArchive,
          onQuickCheckStart: _pingStore.startQuickCheck,
          onQuickCheckStop: _pingStore.stopQuickCheck,
          onSessionStart: _pingStore.startSession,
          onSessionPause: _pingStore.pauseSession,
          onSessionResume: _pingStore.resumeSession,
          onSessionStop: _pingStore.stopSession,
          onRestart: _pingStore.restart,
          onResultArchive: _pingStore.saveResult,
        ),
      ),
    );
  }
}
