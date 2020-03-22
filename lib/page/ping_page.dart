import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pinger/assets.dart';
import 'package:pinger/di/injector.dart';
import 'package:pinger/extensions.dart';
import 'package:pinger/model/ping_session.dart';
import 'package:pinger/page/search_page.dart';
import 'package:pinger/store/favorites_store.dart';
import 'package:pinger/store/ping_store.dart';
import 'package:pinger/utils/format_utils.dart';
import 'package:pinger/widgets/pinger_app_bar.dart';
import 'package:pinger/widgets/result_details_tabs/result_details_results.dart';

class PingPage extends StatefulWidget {
  @override
  _PingPageState createState() => _PingPageState();
}

class _PingPageState extends State<PingPage> with PingerAppBar {
  final PingStore _pingStore = Injector.resolve();
  final FavoritesStore _favoritesStore = Injector.resolve();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(elevation: 0.0),
      body: Observer(builder: (_) {
        final session = _pingStore.currentSession;
        final isFavorite = _favoritesStore.isFavorite(session.host.name);
        return Column(children: <Widget>[
          _buildHostCard(session, isFavorite),
          Expanded(child: _buildContent(session)),
          _buildPingButton(session),
        ]);
      }),
    );
  }

  Widget _buildPingButton(PingSession session) {
    return Observer(
      builder: (_) => PingButton(
        session: session,
        pingDuration: _pingStore.pingDuration,
        isArchived: _pingStore.isArchived,
        onQuickCheckStart: _pingStore.startQuickCheck,
        onQuickCheckStop: _pingStore.stopQuickCheck,
        onSessionStart: _pingStore.startSession,
        onSessionPause: _pingStore.pauseSession,
        onSessionResume: _pingStore.resumeSession,
        onSessionStop: _pingStore.stopSession,
        onRestart: _pingStore.restart,
        onResultArchive: _pingStore.saveResult,
        onResultDelete: _pingStore.deleteResult,
      ),
    );
  }

  Widget _buildHostCard(PingSession session, bool isFavorite) {
    return Material(
      elevation: 4.0,
      child: ListTile(
        contentPadding: EdgeInsets.only(left: 24.0),
        leading: Icon(Icons.language),
        title: Text(
          session.host.name,
          style: TextStyle(fontSize: 24),
        ),
        subtitle: Text(
          "174.16.8.22",
          style: TextStyle(color: Colors.grey, fontSize: 18.0),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () => pushReplacement(SearchPage()),
            ),
            IconButton(
              icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
              onPressed: () => isFavorite
                  ? _favoritesStore.removeFavorite(session.host.name)
                  : _favoritesStore.addFavorite(session.host.name),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContent(PingSession session) {
    switch (session.status) {
      case PingStatus.initial:
        return _buildStartPrompt();
      case PingStatus.quickCheckStarted:
      case PingStatus.quickCheckDone:
        return _buildQuickCheckResults(session);
      case PingStatus.sessionStarted:
      case PingStatus.sessionPaused:
      case PingStatus.sessionDone:
        return _buildSessionResults(session);
    }
    throw StateError("Unknown status of ping session: ${session.status}");
  }

  Widget _buildStartPrompt() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 48.0),
      child: Column(children: <Widget>[
        Spacer(),
        Image(
          image: Images.screenPulse,
          width: 144.0,
          height: 144.0,
        ),
        Spacer(),
        Text(
          "Tap button to start pinging",
          style: TextStyle(fontSize: 18.0),
          textAlign: TextAlign.center,
        ),
        Container(height: 24.0),
        Text(
          "Long press the button to quickly ping the host just a several times",
          textAlign: TextAlign.center,
        ),
        Spacer(),
      ]),
    );
  }

  Widget _buildQuickCheckResults(PingSession session) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(children: <Widget>[
        ResultDetailsSummary(values: session.values, stats: session.stats),
        Text("Results", style: TextStyle(fontWeight: FontWeight.bold)),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                _getValueLabel(
                    session.values.isNotEmpty ? session.values.last : null),
                style: TextStyle(fontSize: 36.0),
              ),
              Text(
                _getDeltaLabel(session.values),
                style: TextStyle(fontSize: 24.0, color: Colors.grey),
              ),
              Observer(
                builder: (_) => Text(
                  FormatUtils.getDurationLabel(_pingStore.pingDuration),
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }

  String _getValueLabel(double value) =>
      value != null ? "${value.round()} ms" : "-";

  String _getDeltaLabel(List<double> values) {
    if (values.length > 1 && values.last != null) {
      final previous = values.reversed
          .skip(1)
          .firstWhere((it) => it != null, orElse: () => null);
      if (previous != null) {
        final delta = (values.last - previous).round();
        return delta < 0 ? "$delta" : "+$delta";
      }
    }
    return "-";
  }

  Widget _buildSessionResults(PingSession session) {
    return ResultDetailsResults(
      values: session.values,
      stats: session.stats,
      scrollBuilder: (slivers) => CustomScrollView(slivers: slivers),
    );
  }
}

class PingButton extends StatelessWidget {
  final PingSession session;
  final Duration pingDuration;
  final bool isArchived;
  final VoidCallback onQuickCheckStart;
  final VoidCallback onQuickCheckStop;
  final VoidCallback onSessionStart;
  final VoidCallback onSessionPause;
  final VoidCallback onSessionResume;
  final VoidCallback onSessionStop;
  final VoidCallback onRestart;
  final VoidCallback onResultArchive;
  final VoidCallback onResultDelete;

  const PingButton({
    Key key,
    @required this.session,
    @required this.pingDuration,
    @required this.isArchived,
    @required this.onQuickCheckStart,
    @required this.onQuickCheckStop,
    @required this.onSessionStart,
    @required this.onSessionPause,
    @required this.onSessionResume,
    @required this.onSessionStop,
    @required this.onRestart,
    @required this.onResultArchive,
    @required this.onResultDelete,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final primary = _buildPrimaryButton();
    final secondary = _buildSecondaryButton();
    return SizedBox(
      height: 96.0,
      child: Row(children: <Widget>[
        Spacer(),
        if (secondary != null) ...[
          secondary,
          SizedBox(width: 24.0),
        ],
        primary,
        Spacer(),
      ]),
    );
  }

  Widget _buildSecondaryButton() {
    switch (session.status) {
      case PingStatus.initial:
      case PingStatus.quickCheckDone:
      case PingStatus.quickCheckStarted:
      case PingStatus.sessionStarted:
        return null;
      case PingStatus.sessionPaused:
        return _buildFloatingButton(
          icon: Icons.stop,
          mini: true,
          iconColor: Colors.black,
          backgroundColor: Colors.white,
          onTap: onSessionStop,
        );
      case PingStatus.sessionDone:
        return _buildFloatingButton(
          icon: Icons.archive,
          mini: true,
          backgroundColor: Colors.white,
          iconColor: isArchived ? Colors.red : Colors.black,
          onTap: isArchived ? onResultDelete : onResultArchive,
        );
    }
    throw StateError("Unknown status of ping session: ${session.status}");
  }

  Widget _buildPrimaryButton() {
    switch (session.status) {
      case PingStatus.initial:
      case PingStatus.quickCheckDone:
        return _buildFloatingButton(
          icon: Icons.play_arrow,
          onTap: onSessionStart,
          onLongPressStart: onQuickCheckStart,
        );
      case PingStatus.quickCheckStarted:
        return _buildFloatingButton(
          icon: Icons.lens,
          onTap: onSessionPause,
          onLongPressEnd: onQuickCheckStop,
        );
      case PingStatus.sessionStarted:
        return _buildExpandedButton(
          button: _buildFloatingButton(
            elevation: 2.0,
            icon: Icons.pause,
            onTap: onSessionPause,
            onLongPress: onSessionStop,
          ),
        );
      case PingStatus.sessionPaused:
        return _buildFloatingButton(
          icon: Icons.play_arrow,
          onTap: onSessionResume,
        );
      case PingStatus.sessionDone:
        return _buildFloatingButton(
          icon: Icons.undo,
          onTap: onRestart,
        );
    }
    throw StateError("Unknown status of ping session: ${session.status}");
  }

  Widget _buildExpandedButton({@required Widget button}) {
    return Material(
      elevation: 4.0,
      borderRadius: BorderRadius.circular(28.0),
      child: Row(children: <Widget>[
        SizedBox(
          width: 48.0,
          child: StreamBuilder(
            stream: Stream.periodic(Duration(seconds: 1)),
            builder: (_, __) => Text(
              FormatUtils.getDurationLabel(pingDuration),
              style: TextStyle(fontSize: 12.0),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        button,
        SizedBox(
          width: 48.0,
          child: Text(
            "${session.values.length}/0",
            style: TextStyle(fontSize: 12.0),
            textAlign: TextAlign.center,
          ),
        ),
      ]),
    );
  }

  Widget _buildFloatingButton({
    @required IconData icon,
    Color iconColor,
    Color backgroundColor,
    double elevation = 4.0,
    bool mini = false,
    VoidCallback onTap,
    VoidCallback onLongPress,
    VoidCallback onLongPressStart,
    VoidCallback onLongPressEnd,
  }) {
    return GestureDetector(
      onTap: onTap,
      onLongPress: onLongPress,
      onLongPressStart: (_) => onLongPressStart(),
      onLongPressEnd: (_) => onLongPressEnd(),
      child: FloatingActionButton(
        mini: mini,
        backgroundColor: backgroundColor,
        elevation: elevation,
        child: Icon(icon, color: iconColor),
        onPressed: null,
      ),
    );
  }
}
