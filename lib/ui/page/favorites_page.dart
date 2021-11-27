import 'package:flutter/material.dart';

import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:pinger/di/injector.dart';
import 'package:pinger/generated/l10n.dart';
import 'package:pinger/store/hosts_store.dart';
import 'package:pinger/store/ping_store.dart';
import 'package:pinger/ui/page/base_page.dart';
import 'package:pinger/ui/page/hosts_page.dart';
import 'package:pinger/utils/host_tap_handler.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends BaseState<FavoritesPage> with HostTapHandler {
  final PingStore _pingStore = Injector.resolve();
  final HostsStore _hostsStore = Injector.resolve();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      final stats = _hostsStore.localStats;
      final hosts = _hostsStore.favorites!.toList()
        ..sort((e1, e2) {
          if (!stats!.containsKey(e1)) return 1;
          if (!stats.containsKey(e2)) return -1;
          return stats[e2]!.pingCount.compareTo(stats[e1]!.pingCount);
        });
      return HostsPage(
        title: S.current.favoritesPageTitle,
        hosts: hosts,
        getTrailingLabel: (it) => S.current.pingCountLabel(stats![it]?.pingCount ?? 0),
        removeHosts: _hostsStore.removeFavorites,
        onHostSelected: (it) => onHostTap(_pingStore, it),
      );
    });
  }
}
