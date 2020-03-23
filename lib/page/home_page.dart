import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pinger/assets.dart';
import 'package:pinger/di/injector.dart';
import 'package:pinger/extensions.dart';
import 'package:pinger/model/host_stats.dart';
import 'package:pinger/model/ping_session.dart';
import 'package:pinger/page/favorites_page.dart';
import 'package:pinger/page/intro_page.dart';
import 'package:pinger/page/ping_page.dart';
import 'package:pinger/page/recents_page.dart';
import 'package:pinger/page/search_page.dart';
import 'package:pinger/store/favorites_store.dart';
import 'package:pinger/store/hosts_store.dart';
import 'package:pinger/store/ping_store.dart';
import 'package:pinger/utils/format_utils.dart';
import 'package:pinger/widgets/pinger_app_bar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with PingerAppBar {
  final HostsStore _hostsStore = Injector.resolve();
  final FavoritesStore _favoritesStore = Injector.resolve();
  final PingStore _pingStore = Injector.resolve();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Padding(
        padding: EdgeInsets.all(32.0),
        child: Observer(builder: (_) {
          final stats = _hostsStore.stats;
          final favorites = _favoritesStore.items;
          final ping = _pingStore.currentSession;
          if (stats.isEmpty && favorites.isEmpty && ping == null) {
            return _buildNoSuggestions();
          } else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildSearchBar(),
                if (ping != null) ..._buildCurrentPing(ping),
                ..._buildFavorites(favorites, stats),
                ..._buildHistory(stats),
              ],
            );
          }
        }),
      ),
    );
  }

  Widget _buildNoSuggestions() {
    return Column(children: <Widget>[
      _buildSearchBar(),
      Spacer(),
      _buildNoSuggestionsInfo(),
      Spacer(),
      RaisedButton(
        child: Text("Show intro"),
        onPressed: () => push(IntroPage()),
      ),
    ]);
  }

  Widget _buildNoSuggestionsInfo() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Image(image: Images.boxEmpty, height: 144.0),
        Container(height: 24.0),
        Text(
          "Looks like there's nothing here yet",
          style: TextStyle(fontSize: 18.0),
        ),
        Container(height: 24.0),
        Text(
          "Use search field above to choose host to ping or see intro explaining app concept",
          style: TextStyle(fontSize: 14.0),
        ),
      ],
    );
  }

  List<Widget> _buildCurrentPing(PingSession session) {
    return [
      _buildSectionTitle('Current'),
      InkWell(
        onTap: () => push(PingPage()),
        child: Row(children: [
          Image.network(
            'https://www.netflix.com/favicon.ico',
            width: 24.0,
            height: 24.0,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              child: Text(session.host.name),
            ),
          ),
          Text(
            'Go back',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ]),
      ),
    ];
  }

  List<Widget> _buildFavorites(List<String> favorites, List<HostStats> stats) {
    return [
      _buildSectionTitle(
        'Favorites',
        icon: favorites.isNotEmpty ? Icons.compare_arrows : null,
      ),
      if (favorites.isEmpty)
        DottedBorder(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Bookmark pinged hosts to access them easily',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey),
          ),
        )
      else
        InkWell(
          onTap: favorites.isNotEmpty ? () => push(FavoritesPage()) : null,
          child: ListView(
            shrinkWrap: true,
            children: favorites
                .map((it) => Padding(
                      padding: EdgeInsets.symmetric(vertical: 4.0),
                      child: Row(children: <Widget>[
                        Expanded(child: Text(it)),
                        Text(_getFavoriteValueLabel(it, stats)),
                      ]),
                    ))
                .toList(),
          ),
        ),
    ];
  }

  String _getFavoriteValueLabel(String host, List<HostStats> stats) {
    final pingCount = stats
            .firstWhere((it) => it.host == host, orElse: () => null)
            ?.pingCount ??
        0;
    return "$pingCount x";
  }

  List<Widget> _buildHistory(List<HostStats> stats) {
    return [
      _buildSectionTitle(
        'Recents',
        icon: stats.isNotEmpty ? Icons.history : null,
      ),
      if (stats.isEmpty)
        DottedBorder(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Latest host will show up here after you ping one',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey),
          ),
        )
      else
        InkWell(
          onTap: stats.isNotEmpty ? () => push(RecentsPage()) : null,
          child: ListView(
            shrinkWrap: true,
            children: stats
                .map((it) => Padding(
                      padding: EdgeInsets.symmetric(vertical: 4.0),
                      child: Row(children: [
                        Expanded(child: Text(it.host)),
                        Text(FormatUtils.getSinceNowLabel(it.pingTime)),
                      ]),
                    ))
                .toList(),
          ),
        ),
    ];
  }

  Widget _buildSectionTitle(String title, {IconData icon}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Row(children: <Widget>[
        Expanded(
          child: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
          ),
        ),
        if (icon != null) Icon(icon)
      ]),
    );
  }

  Widget _buildSearchBar() {
    return Stack(
      alignment: Alignment.centerLeft,
      children: <Widget>[
        OutlineButton(
          onPressed: () => push(SearchPage()),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32.0),
          ),
          child: Container(
            height: 48.0,
            width: double.infinity,
            padding: EdgeInsets.only(left: 48.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Enter host to ping...',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 48.0,
          height: 48.0,
          child: RawMaterialButton(
            fillColor: Colors.blue,
            shape: CircleBorder(),
            child: Icon(Icons.search, color: Colors.white),
            onPressed: () => push(SearchPage()),
          ),
        ),
      ],
    );
  }
}
