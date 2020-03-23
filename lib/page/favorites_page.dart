import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pinger/di/injector.dart';
import 'package:pinger/extensions.dart';
import 'package:pinger/model/host_stats.dart';
import 'package:pinger/page/ping_page.dart';
import 'package:pinger/store/favorites_store.dart';
import 'package:pinger/store/hosts_store.dart';
import 'package:pinger/store/ping_store.dart';

class FavoritesPage extends StatefulWidget {
  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  final FavoritesStore _favoritesStore = Injector.resolve();
  final PingStore _pingStore = Injector.resolve();
  final HostsStore _hostsStore = Injector.resolve();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CloseButton(),
        title: Text("Favorite hosts"),
      ),
      body: Observer(builder: (_) {
        final favoriteHosts = _favoritesStore.items;
        final stats = _hostsStore.stats;
        return ListView.builder(
          itemCount: favoriteHosts.length,
          itemBuilder: (_, index) {
            final item = favoriteHosts[index];
            return ListTile(
              title: Text(item),
              trailing: Text(_getFavoriteValueLabel(item, stats)),
              onTap: () {
                _pingStore.initSession(item);
                pushReplacement(PingPage());
              },
            );
          },
        );
      }),
    );
  }

  String _getFavoriteValueLabel(String host, List<HostStats> stats) {
    final pingCount = stats
            .firstWhere((it) => it.host == host, orElse: () => null)
            ?.pingCount ??
        0;
    return "$pingCount x";
  }
}
