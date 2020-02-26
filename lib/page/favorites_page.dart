import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pinger/di/injector.dart';
import 'package:pinger/extensions.dart';
import 'package:pinger/page/ping_page.dart';
import 'package:pinger/store/favorites_store.dart';
import 'package:pinger/store/ping_store.dart';

class FavoritesPage extends StatefulWidget {
  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  final FavoritesStore _favoritesStore = Injector.resolve();
  final PingStore _pingStore = Injector.resolve();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CloseButton(),
        title: Text("Favorite hosts"),
      ),
      body: Observer(builder: (_) {
        final favoriteHosts = _favoritesStore.items;
        return ListView.builder(
          itemCount: favoriteHosts.length,
          itemBuilder: (_, index) {
            final item = favoriteHosts[index];
            return ListTile(
              title: Text(item.host),
              trailing: Text('${item.pingCount} x'),
              onTap: () {
                _pingStore.start(item.host);
                pushReplacement(PingPage());
              },
            );
          },
        );
      }),
    );
  }
}
