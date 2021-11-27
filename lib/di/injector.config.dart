// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:cloud_firestore/cloud_firestore.dart' as _i6;
import 'package:connectivity/connectivity.dart' as _i4;
import 'package:flutter_local_notifications/flutter_local_notifications.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:location/location.dart' as _i9;
import 'package:package_info/package_info.dart' as _i12;
import 'package:shared_preferences/shared_preferences.dart' as _i15;

import '../config.dart' as _i3;
import '../service/favicon_service.dart' as _i5;
import '../service/notifications_manager.dart' as _i11;
import '../service/ping_service.dart' as _i13;
import '../service/pinger_api.dart' as _i14;
import '../service/pinger_prefs.dart' as _i17;
import '../service/vibration.dart' as _i16;
import '../store/device_store.dart' as _i21;
import '../store/hosts_store.dart' as _i22;
import '../store/permission_store.dart' as _i20;
import '../store/ping_store.dart' as _i23;
import '../store/results_store.dart' as _i18;
import '../store/settings_store.dart' as _i19;
import '../utils/lifecycle_notifier.dart' as _i8;
import '../utils/notification_messages.dart' as _i10;
import 'injector.dart' as _i24;

const String _dev = 'dev';
const String _prod = 'prod';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final injectorModule = _$InjectorModule();
  gh.factory<_i3.AppConfig>(() => _i3.DevConfig(), registerFor: {_dev});
  gh.factory<_i3.AppConfig>(() => _i3.ProdConfig(), registerFor: {_prod});
  gh.factory<_i4.Connectivity>(() => injectorModule.connectivity);
  gh.singleton<_i5.FaviconService>(_i5.FaviconService.create());
  gh.factory<_i6.FirebaseFirestore>(() => injectorModule.firestore);
  gh.factory<_i7.FlutterLocalNotificationsPlugin>(() => injectorModule.localNotifications);
  gh.factory<_i8.LifecycleNotifier>(() => _i8.LifecycleNotifier());
  gh.factory<_i9.Location>(() => injectorModule.location);
  gh.factory<_i10.NotificationMessages>(() => injectorModule.notificationLocalizations);
  gh.factory<_i11.NotificationsManager>(() => _i11.NotificationsManager(
      get<_i7.FlutterLocalNotificationsPlugin>(), get<_i10.NotificationMessages>()));
  await gh.factoryAsync<_i12.PackageInfo>(() => injectorModule.packageInfo, preResolve: true);
  gh.factory<_i13.PingCommand>(() => _i13.PingCommand.create());
  gh.factory<_i13.PingService>(() => _i13.PingService(get<_i13.PingCommand>()));
  gh.factory<_i14.PingerApi>(() => _i14.PingerApi(get<_i6.FirebaseFirestore>()));
  await gh.factoryAsync<_i15.SharedPreferences>(() => injectorModule.sharedPreferences,
      preResolve: true);
  gh.factory<_i16.Vibration>(() => _i16.Vibration());
  gh.singleton<_i17.PingerPrefs>(_i17.PingerPrefs(get<_i15.SharedPreferences>()));
  gh.singleton<_i18.ResultsStore>(
      _i18.ResultsStore(get<_i17.PingerPrefs>(), get<_i14.PingerApi>()));
  gh.singleton<_i19.SettingsStore>(
      _i19.SettingsStore(get<_i12.PackageInfo>(), get<_i17.PingerPrefs>(), get<_i3.AppConfig>()));
  gh.singleton<_i20.PermissionStore>(
      _i20.NotificationPermissionStore(get<_i19.SettingsStore>(), get<_i8.LifecycleNotifier>()),
      instanceName: 'notification');
  gh.singleton<_i20.PermissionStore>(
      _i20.LocationPermissionStore(get<_i19.SettingsStore>(), get<_i8.LifecycleNotifier>()),
      instanceName: 'location');
  gh.singleton<_i21.DeviceStore>(_i21.DeviceStore(
      get<_i8.LifecycleNotifier>(),
      get<_i4.Connectivity>(),
      get<_i9.Location>(),
      get<_i16.Vibration>(),
      get<_i11.NotificationsManager>(),
      get<_i19.SettingsStore>(),
      get<_i20.PermissionStore>(instanceName: 'notification')));
  gh.singleton<_i22.HostsStore>(_i22.HostsStore(get<_i17.PingerPrefs>(), get<_i14.PingerApi>(),
      get<_i5.FaviconService>(), get<_i21.DeviceStore>()));
  gh.singleton<_i23.PingStore>(_i23.PingStore(
      get<_i17.PingerPrefs>(),
      get<_i14.PingerApi>(),
      get<_i13.PingService>(),
      get<_i19.SettingsStore>(),
      get<_i18.ResultsStore>(),
      get<_i22.HostsStore>(),
      get<_i21.DeviceStore>(),
      get<_i20.PermissionStore>(instanceName: 'location')));
  return get;
}

class _$InjectorModule extends _i24.InjectorModule {}
