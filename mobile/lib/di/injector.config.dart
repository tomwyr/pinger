// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i6;
import 'package:connectivity/connectivity.dart' as _i4;
import 'package:flutter_local_notifications/flutter_local_notifications.dart'
    as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:location/location.dart' as _i9;
import 'package:package_info/package_info.dart' as _i12;
import 'package:pinger/config.dart' as _i3;
import 'package:pinger/di/injector.dart' as _i24;
import 'package:pinger/service/favicon_service.dart' as _i5;
import 'package:pinger/service/notifications_manager.dart' as _i11;
import 'package:pinger/service/ping_service.dart' as _i13;
import 'package:pinger/service/pinger_api.dart' as _i14;
import 'package:pinger/service/pinger_prefs.dart' as _i17;
import 'package:pinger/service/vibration.dart' as _i16;
import 'package:pinger/store/device_store.dart' as _i21;
import 'package:pinger/store/hosts_store.dart' as _i22;
import 'package:pinger/store/permission_store.dart' as _i20;
import 'package:pinger/store/ping_store.dart' as _i23;
import 'package:pinger/store/results_store.dart' as _i18;
import 'package:pinger/store/settings_store.dart' as _i19;
import 'package:pinger/utils/lifecycle_notifier.dart' as _i8;
import 'package:pinger/utils/notification_messages.dart' as _i10;
import 'package:shared_preferences/shared_preferences.dart' as _i15;

const String _dev = 'dev';
const String _prod = 'prod';

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final injectorModule = _$InjectorModule();
    gh.factory<_i3.AppConfig>(
      () => _i3.DevConfig(),
      registerFor: {_dev},
    );
    gh.factory<_i3.AppConfig>(
      () => _i3.ProdConfig(),
      registerFor: {_prod},
    );
    gh.factory<_i4.Connectivity>(() => injectorModule.connectivity);
    gh.factory<_i5.FaviconService>(() => _i5.FaviconService.create());
    gh.factory<_i6.FirebaseFirestore>(() => injectorModule.firestore);
    gh.factory<_i7.FlutterLocalNotificationsPlugin>(
        () => injectorModule.localNotifications);
    gh.factory<_i8.LifecycleNotifier>(() => _i8.LifecycleNotifier());
    gh.factory<_i9.Location>(() => injectorModule.location);
    gh.factory<_i10.NotificationMessages>(
        () => injectorModule.notificationLocalizations);
    gh.factory<_i11.NotificationsManager>(() => _i11.NotificationsManager(
          gh<_i7.FlutterLocalNotificationsPlugin>(),
          gh<_i10.NotificationMessages>(),
        ));
    await gh.factoryAsync<_i12.PackageInfo>(
      () => injectorModule.packageInfo,
      preResolve: true,
    );
    gh.factory<_i13.PingCommand>(() => _i13.PingCommand.create());
    gh.factory<_i13.PingService>(
        () => _i13.PingService(gh<_i13.PingCommand>()));
    gh.factory<_i14.PingerApi>(
        () => _i14.PingerApi(gh<_i6.FirebaseFirestore>()));
    await gh.factoryAsync<_i15.SharedPreferences>(
      () => injectorModule.sharedPreferences,
      preResolve: true,
    );
    gh.factory<_i16.Vibration>(() => _i16.Vibration());
    gh.singleton<_i17.PingerPrefs>(
        _i17.PingerPrefs(gh<_i15.SharedPreferences>()));
    gh.singleton<_i18.ResultsStore>(_i18.ResultsStore(
      gh<_i17.PingerPrefs>(),
      gh<_i14.PingerApi>(),
    ));
    gh.singleton<_i19.SettingsStore>(_i19.SettingsStore(
      gh<_i12.PackageInfo>(),
      gh<_i17.PingerPrefs>(),
      gh<_i3.AppConfig>(),
    ));
    gh.singleton<_i20.PermissionStore>(
      _i20.NotificationPermissionStore(
        gh<_i19.SettingsStore>(),
        gh<_i8.LifecycleNotifier>(),
      ),
      instanceName: 'notification',
    );
    gh.singleton<_i20.PermissionStore>(
      _i20.LocationPermissionStore(
        gh<_i19.SettingsStore>(),
        gh<_i8.LifecycleNotifier>(),
      ),
      instanceName: 'location',
    );
    gh.singleton<_i21.DeviceStore>(_i21.DeviceStore(
      gh<_i8.LifecycleNotifier>(),
      gh<_i4.Connectivity>(),
      gh<_i9.Location>(),
      gh<_i16.Vibration>(),
      gh<_i11.NotificationsManager>(),
      gh<_i19.SettingsStore>(),
      gh<_i20.PermissionStore>(instanceName: 'notification'),
      gh<_i20.PermissionStore>(instanceName: 'location'),
    ));
    gh.singleton<_i22.HostsStore>(_i22.HostsStore(
      gh<_i17.PingerPrefs>(),
      gh<_i14.PingerApi>(),
      gh<_i5.FaviconService>(),
      gh<_i21.DeviceStore>(),
    ));
    gh.singleton<_i23.PingStore>(_i23.PingStore(
      gh<_i17.PingerPrefs>(),
      gh<_i14.PingerApi>(),
      gh<_i13.PingService>(),
      gh<_i19.SettingsStore>(),
      gh<_i18.ResultsStore>(),
      gh<_i22.HostsStore>(),
      gh<_i21.DeviceStore>(),
      gh<_i20.PermissionStore>(instanceName: 'location'),
    ));
    return this;
  }
}

class _$InjectorModule extends _i24.InjectorModule {}
