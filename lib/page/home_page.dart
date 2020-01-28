import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pinger/extensions.dart';
import 'package:pinger/page/archive_page.dart';
import 'package:pinger/page/intro_page.dart';
import 'package:pinger/page/ping_page.dart';
import 'package:pinger/page/search_page.dart';
import 'package:pinger/page/settings_page.dart';
import 'package:pinger/store/favorites_store.dart';
import 'package:pinger/store/history_store.dart';
import 'package:pinger/store/ping_store.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _historyStore = HistoryStore();
  final _favoritesStore = FavoritesStore();
  final _pingStore = PingStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Padding(
        padding: EdgeInsets.all(32.0),
        child: Observer(builder: (_) {
          final history = _historyStore.items;
          final favorites = _favoritesStore.items;
          final ping = _pingStore.value;
          if (history.isEmpty && favorites.isEmpty && ping == null) {
            return _buildNoSuggestions();
          } else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildSearchBar(),
                if (ping != null) ..._buildCurrentPing(ping),
                ..._buildFavorites(favorites),
                ..._buildHistory(history),
              ],
            );
          }
        }),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.tune),
        onPressed: () => push(SettingsPage()),
      ),
      title: Text("Pinger"),
      centerTitle: true,
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.unarchive),
          onPressed: () => push(ArchivePage()),
        ),
      ],
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
        Image.asset('assets/box_empty.png', height: 144.0),
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

  List<Widget> _buildCurrentPing(Ping ping) {
    return [
      _buildSectionTitle('Current'),
      Row(children: [
        Image.network(
          'https://www.netflix.com/favicon.ico',
          width: 24.0,
          height: 24.0,
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: Text(ping.host),
          ),
        ),
        GestureDetector(
          onTap: () => push(PingPage()),
          child: Text(
            'Go back',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ]),
    ];
  }

  List<Widget> _buildFavorites(List<FavoriteItem> favorites) {
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
        ListView(
          shrinkWrap: true,
          children: favorites
              .map((it) => Padding(
                    padding: EdgeInsets.symmetric(vertical: 4.0),
                    child: Row(children: <Widget>[
                      Expanded(child: Text(it.host)),
                      Text('${it.pingCount}'),
                    ]),
                  ))
              .toList(),
        ),
    ];
  }

  List<Widget> _buildHistory(List<HistoryItem> history) {
    return [
      _buildSectionTitle(
        'Recent',
        icon: history.isNotEmpty ? Icons.history : null,
      ),
      if (history.isEmpty)
        DottedBorder(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Latest host will show up here after you ping one',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey),
          ),
        )
      else
        ListView(
          shrinkWrap: true,
          children: history
              .map((it) => Padding(
                    padding: EdgeInsets.symmetric(vertical: 4.0),
                    child: Row(children: [
                      Expanded(child: Text(it.host)),
                      Text(_getTimestampLabel(it.timestamp)),
                    ]),
                  ))
              .toList(),
        ),
    ];
  }

  String _getTimestampLabel(DateTime timestamp) {
    final diff = DateTime.now().difference(timestamp);
    if (diff.inDays >= 7) return '${diff.inDays ~/ 7} w';
    if (diff.inHours >= 24) return '${diff.inHours ~/ 24} d';
    if (diff.inMinutes >= 60) return '${diff.inMinutes ~/ 60} h';
    if (diff.inSeconds >= 60) return '${diff.inSeconds ~/ 60} m';
    return '${diff.inSeconds} s';
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
