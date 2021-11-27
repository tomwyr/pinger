import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:location/location.dart';
import 'package:package_info/package_info.dart';
import 'package:pinger/di/injector.config.dart';
import 'package:pinger/store/device_store.dart';
import 'package:pinger/store/hosts_store.dart';
import 'package:pinger/store/permission_store.dart';
import 'package:pinger/store/ping_store.dart';
import 'package:pinger/store/results_store.dart';
import 'package:pinger/store/settings_store.dart';
import 'package:pinger/utils/notification_messages.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class Injector {
  static Future<void> configure(String environment) async {
    await _initInjectable(environment);
    resolve<SettingsStore>().init();
    resolve<ResultsStore>().init();
    resolve<HostsStore>().init();
    resolve<PingStore>().init();
    resolve<DeviceStore>().init();
    resolve<PermissionStore>(PermissionStore.location).init();
    resolve<PermissionStore>(PermissionStore.notification).init();
  }

  static T resolve<T extends Object>([String? instanceName]) =>
      GetIt.instance.get(instanceName: instanceName);
}

@module
abstract class InjectorModule {
  @preResolve
  Future<SharedPreferences> get sharedPreferences =>
      SharedPreferences.getInstance();

  @preResolve
  Future<PackageInfo> get packageInfo => PackageInfo.fromPlatform();

  Location get location => Location.instance;

  FirebaseFirestore get firestore => FirebaseFirestore.instance;

  FlutterLocalNotificationsPlugin get localNotifications =>
      FlutterLocalNotificationsPlugin()
        ..initialize(InitializationSettings(
          android: AndroidInitializationSettings('ic_notification'),
          iOS: IOSInitializationSettings(
            requestAlertPermission: false,
            requestBadgePermission: false,
            requestSoundPermission: false,
          ),
        ));

  NotificationMessages get notificationLocalizations => NotificationMessages();

  Connectivity get connectivity => Connectivity();
}

@injectableInit
Future<void> _initInjectable(String environment) =>
    $initGetIt(GetIt.instance, environment: environment);
