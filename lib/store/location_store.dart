import 'package:injectable/injectable.dart';
import 'package:location/location.dart' show Location, LocationAccuracy;
import 'package:mobx/mobx.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pinger/model/geo_position.dart';
import 'package:pinger/store/permission_store.dart';
import 'package:pinger/store/settings_store.dart';
import 'package:pinger/utils/lifecycle_notifier.dart';

part 'location_store.g.dart';

@singleton
class LocationStore extends LocationStoreBase with _$LocationStore {
  final LifecycleNotifier _lifecycleNotifier;
  final Location _location;
  final SettingsStore _settingsStore;

  LocationStore(this._lifecycleNotifier, this._location, this._settingsStore);
}

abstract class LocationStoreBase with Store {
  LifecycleNotifier get _lifecycleNotifier;
  Location get _location;
  SettingsStore get _settingsStore;

  PermissionStore _permissionStore;

  PermissionStore get permissionStore => _permissionStore;

  bool get canAccessLocation => _permissionStore.canAccessService;

  @action
  Future<void> init() async {
    _permissionStore = PermissionStore(
      _lifecycleNotifier,
      Permission.locationWhenInUse,
      () => _settingsStore.userSettings.shareSettings.attachLocation,
      (it) => _settingsStore.updateSettings(
        _settingsStore.userSettings.copyWith.shareSettings(
          attachLocation: it,
        ),
      ),
    );
    await _permissionStore.init();
    await _location.changeSettings(accuracy: LocationAccuracy.balanced);
  }

  @action
  Future<GeoPosition> getCurrentPosition() async {
    final result = await _location.getLocation();
    return GeoPosition(lat: result.latitude, lon: result.longitude);
  }
}
