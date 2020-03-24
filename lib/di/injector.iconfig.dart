// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:shared_preferences/shared_preferences.dart';
import 'package:pinger/di/injector.dart';
import 'package:geolocator/geolocator.dart';
import 'package:pinger/service/pinger_prefs.dart';
import 'package:pinger/service/ping_service.dart';
import 'package:pinger/store/archive_store.dart';
import 'package:pinger/store/favorites_store.dart';
import 'package:pinger/store/hosts_store.dart';
import 'package:pinger/store/location_store.dart';
import 'package:pinger/store/settings_store.dart';
import 'package:pinger/store/ping_store.dart';
import 'package:get_it/get_it.dart';

Future<void> $initGetIt(GetIt g, {String environment}) async {
  final injectorModule = _$InjectorModule();
  final sharedPreferences = await injectorModule.prefs;
  g.registerFactory<SharedPreferences>(() => sharedPreferences);
  g.registerFactory<Geolocator>(() => injectorModule.geolocator);
  g.registerFactory<PingService>(() => PingService());

  //Eager singletons must be registered in the right order
  g.registerSingleton<PingerPrefs>(PingerPrefs(g<SharedPreferences>()));
  g.registerSingleton<ArchiveStore>(ArchiveStore(g<PingerPrefs>()));
  g.registerSingleton<FavoritesStore>(FavoritesStore(g<PingerPrefs>()));
  g.registerSingleton<HostsStore>(HostsStore(g<PingerPrefs>()));
  g.registerSingleton<LocationStore>(LocationStore(g<Geolocator>()));
  g.registerSingleton<SettingsStore>(SettingsStore(g<PingerPrefs>()));
  g.registerSingleton<PingStore>(PingStore(
    g<PingService>(),
    g<SettingsStore>(),
    g<ArchiveStore>(),
    g<HostsStore>(),
  ));
}

class _$InjectorModule extends InjectorModule {}
