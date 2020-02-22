// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:shared_preferences/shared_preferences.dart';
import 'package:pinger/service/pinger_prefs.dart';
import 'package:pinger/store/archive_store.dart';
import 'package:pinger/store/favorites_store.dart';
import 'package:pinger/store/history_store.dart';
import 'package:pinger/store/hosts_store.dart';
import 'package:pinger/store/ping_store.dart';
import 'package:pinger/store/settings_store.dart';
import 'package:get_it/get_it.dart';

Future<void> $initGetIt(GetIt g, {String environment}) async {
  final sharedPreferences = await SharedPreferences.getInstance();
  g.registerFactory<SharedPreferences>(() => sharedPreferences);
  _registerEagerSingletons(g, environment);
}

// Eager singletons must be registered in the right order
void _registerEagerSingletons(GetIt g, String environment) {
  g.registerSingleton<PingerPrefs>(PingerPrefs(
    g<SharedPreferences>(),
  ));
  g.registerSingleton<ArchiveStore>(ArchiveStore(
    g<PingerPrefs>(),
  ));
  g.registerSingleton<FavoritesStore>(FavoritesStore());
  g.registerSingleton<HistoryStore>(HistoryStore());
  g.registerSingleton<HostsStore>(HostsStore());
  g.registerSingleton<PingStore>(PingStore());
  g.registerSingleton<SettingsStore>(SettingsStore(
    g<PingerPrefs>(),
  ));
}
