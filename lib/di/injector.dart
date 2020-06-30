import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:location/location.dart';
import 'package:package_info/package_info.dart';
import 'package:pinger/di/injector.iconfig.dart';
import 'package:pinger/store/hosts_store.dart';
import 'package:pinger/store/location_store.dart';
import 'package:pinger/store/notification_store.dart';
import 'package:pinger/store/ping_store.dart';
import 'package:pinger/store/results_store.dart';
import 'package:pinger/store/settings_store.dart';
import 'package:pinger/utils/local_notifications.dart';
import 'package:pinger/utils/notification_messages.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class Injector {
  static Future<void> configure() async {
    await _initInjectable();
    resolve<SettingsStore>().init();
    resolve<ResultsStore>().init();
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
  Future<SharedPreferences> get sharedPreferences =>
      SharedPreferences.getInstance();

  @preResolve
  Future<PackageInfo> get packageInfo => PackageInfo.fromPlatform();

  Location get location => Location.instance;

  Firestore get firestore => Firestore.instance;

  LocalNotifications get localNotifications => LocalNotifications()
    ..initialize(InitializationSettings(
      AndroidInitializationSettings('ic_notification'),
      IOSInitializationSettings(
        requestAlertPermission: false,
        requestBadgePermission: false,
        requestSoundPermission: false,
      ),
    ));

  NotificationMessages get notificationLocalizations => NotificationMessages();
}

@injectableInit
Future<void> _initInjectable() => $initGetIt(GetIt.instance);
