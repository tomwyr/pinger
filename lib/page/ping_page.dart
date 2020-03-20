import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pinger/assets.dart';
import 'package:pinger/di/injector.dart';
import 'package:pinger/extensions.dart';
import 'package:pinger/model/ping_session.dart';
import 'package:pinger/page/result_details/result_details_tabs/result_details_results.dart';
import 'package:pinger/page/search_page.dart';
import 'package:pinger/store/favorites_store.dart';
import 'package:pinger/store/ping_store.dart';
import 'package:pinger/utils/format_utils.dart';
import 'package:pinger/widgets/pinger_app_bar.dart';

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
    return Column(children: <Widget>[
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
            StreamBuilder(
              stream: Stream.periodic(Duration(seconds: 1)),
              builder: (_, __) => Text(
                _getDurationLabel(session.startTime, session.endTime),
                style: TextStyle(fontSize: 18.0),
              ),
            ),
          ],
        ),
      ),
    ]);
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

  String _getDurationLabel(DateTime startTime, DateTime endTime) {
    final duration = (endTime ?? DateTime.now()).difference(startTime);
    return FormatUtils.getDurationLabel(duration);
  }

  Widget _buildSessionResults(PingSession session) {
    return ResultDetailsResults(
      values: session.values,
      stats: session.stats,
    );
  }

  Widget _buildPingButton(PingSession session) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: GestureDetector(
        onLongPressStart: (_) => _pingStore.startQuickCheck(),
        onLongPressEnd: (_) => _pingStore.stopQuickCheck(),
        child: FloatingActionButton(
          child: Icon(Icons.play_arrow),
          onPressed: () {},
        ),
      ),
    );
  }
}
