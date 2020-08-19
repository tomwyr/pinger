// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:pinger/config.dart';
import 'package:pinger/di/injector.dart';
import 'package:connectivity/connectivity.dart';
import 'package:pinger/service/favicon_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_local_notifications/src/flutter_local_notifications_plugin.dart';
import 'package:pinger/utils/lifecycle_notifier.dart';
import 'package:location/location.dart';
import 'package:pinger/utils/notification_messages.dart';
import 'package:pinger/service/notifications_manager.dart';
import 'package:package_info/package_info.dart';
import 'package:pinger/service/ping_service.dart';
import 'package:pinger/service/pinger_api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pinger/service/pinger_prefs.dart';
import 'package:pinger/store/results_store.dart';
import 'package:pinger/store/settings_store.dart';
import 'package:pinger/store/permission_store.dart';
import 'package:pinger/store/device_store.dart';
import 'package:pinger/store/hosts_store.dart';
import 'package:pinger/store/ping_store.dart';
import 'package:get_it/get_it.dart';

Future<void> $initGetIt(GetIt g, {String environment}) async {
  final injectorModule = _$InjectorModule();
  g.registerFactory<Connectivity>(() => injectorModule.connectivity);
  g.registerFactory<Firestore>(() => injectorModule.firestore);
  g.registerFactory<FlutterLocalNotificationsPlugin>(
      () => injectorModule.localNotifications);
  g.registerFactory<LifecycleNotifier>(() => LifecycleNotifier());
  g.registerFactory<Location>(() => injectorModule.location);
  g.registerFactory<NotificationMessages>(
      () => injectorModule.notificationLocalizations);
  g.registerFactory<NotificationsManager>(() => NotificationsManager(
      g<FlutterLocalNotificationsPlugin>(), g<NotificationMessages>()));
  final packageInfo = await injectorModule.packageInfo;
  g.registerFactory<PackageInfo>(() => packageInfo);
  g.registerFactory<PingCommand>(() => PingCommand.create());
  g.registerFactory<PingService>(() => PingService(g<PingCommand>()));
  g.registerFactory<PingerApi>(() => PingerApi(g<Firestore>()));
  final sharedPreferences = await injectorModule.sharedPreferences;
  g.registerFactory<SharedPreferences>(() => sharedPreferences);

  //Register test Dependencies --------
  if (environment == 'test') {
    g.registerFactory<AppConfig>(() => TestConfig());
  }

  //Register dev Dependencies --------
  if (environment == 'dev') {
    g.registerFactory<AppConfig>(() => DevConfig());
  }

  //Register prod Dependencies --------
  if (environment == 'prod') {
    g.registerFactory<AppConfig>(() => ProdConfig());
  }

  //Eager singletons must be registered in the right order
  g.registerSingleton<FaviconService>(FaviconService.create());
  g.registerSingleton<PingerPrefs>(PingerPrefs(g<SharedPreferences>()));
  g.registerSingleton<ResultsStore>(
      ResultsStore(g<PingerPrefs>(), g<PingerApi>()));
  g.registerSingleton<SettingsStore>(SettingsStore(
    g<PackageInfo>(),
    g<PingerPrefs>(),
    g<AppConfig>(),
  ));
  g.registerSingleton<PermissionStore>(
      NotificationPermissionStore(g<SettingsStore>(), g<LifecycleNotifier>()),
      instanceName: 'notification');
  g.registerSingleton<PermissionStore>(
      LocationPermissionStore(g<SettingsStore>(), g<LifecycleNotifier>()),
      instanceName: 'location');
  g.registerSingleton<DeviceStore>(DeviceStore(
    g<Connectivity>(),
    g<Location>(),
    g<NotificationsManager>(),
    g<SettingsStore>(),
    g<PermissionStore>(instanceName: 'notification'),
  ));
  g.registerSingleton<HostsStore>(HostsStore(
    g<PingerPrefs>(),
    g<PingerApi>(),
    g<FaviconService>(),
    g<DeviceStore>(),
  ));
  g.registerSingleton<PingStore>(PingStore(
    g<PingerPrefs>(),
    g<PingerApi>(),
    g<PingService>(),
    g<SettingsStore>(),
    g<ResultsStore>(),
    g<HostsStore>(),
    g<DeviceStore>(),
    g<PermissionStore>(instanceName: 'location'),
  ));
}

class _$InjectorModule extends InjectorModule {}
