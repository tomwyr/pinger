import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pinger/di/injector.dart';
import 'package:pinger/extensions.dart';
import 'package:pinger/page/hosts_page.dart';
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
    return Observer(builder: (_) {
      final stats = _hostsStore.stats;
      final hosts = _favoritesStore.items.toList()
        ..sort((e1, e2) {
          if (!stats.containsKey(e1)) return 1;
          if (!stats.containsKey(e2)) return -1;
          return stats[e2].pingCount.compareTo(stats[e1].pingCount);
        });
      return HostsPage(
        title: "Favorites",
        hosts: hosts,
        getTrailingLabel: (it) => "${stats[it]?.pingCount ?? 0} x",
        removeHosts: _favoritesStore.removeFavorites,
        onHostSelected: (it) {
          _pingStore.initSession(it);
          push(PingPage());
        },
      );
    });
  }
}
