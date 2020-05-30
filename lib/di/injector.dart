import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:pinger/di/injector.iconfig.dart';
import 'package:pinger/store/archive_store.dart';
import 'package:pinger/store/favorites_store.dart';
import 'package:pinger/store/hosts_store.dart';
import 'package:pinger/store/location_store.dart';
import 'package:pinger/store/notification_store.dart';
import 'package:pinger/store/ping_store.dart';
import 'package:pinger/store/settings_store.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class Injector {
  static Future<void> configure() async {
    await _initInjectable();
    resolve<SettingsStore>().init();
    resolve<ArchiveStore>().init();
    resolve<FavoritesStore>().init();
    resolve<HostsStore>().init();
    resolve<PingStore>().init();
    resolve<LocationStore>().init();
    resolve<NotificationStore>().init();
  }

  static T resolve<T>([String instanceName]) =>
      GetIt.instance.get<T>(instanceName: instanceName);
}

@module
abstract class InjectorModule {
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  Geolocator get geolocator => Geolocator();

  Firestore get firestore => Firestore.instance;
}

@injectableInit
Future<void> _initInjectable() => $initGetIt(GetIt.instance);
