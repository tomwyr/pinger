import 'package:injectable/injectable.dart';
import 'package:location/location.dart';
import 'package:mobx/mobx.dart';
import 'package:pinger/model/geo_position.dart';
import 'package:pinger/model/user_settings.dart';
import 'package:pinger/store/settings_store.dart';

part 'location_store.g.dart';

@singleton
class LocationStore extends LocationStoreBase with _$LocationStore {
  final Location _location;
  final SettingsStore _settingsStore;

  LocationStore(this._location, this._settingsStore);
}

abstract class LocationStoreBase with Store {
  Location get _location;
  SettingsStore get _settingsStore;

  ShareSettings _lastSettings;

  @observable
  bool canAccessLocation;

  @action
  Future<void> init() async {
    await _updateAccessStatus();
    autorun((_) {
      if (_settingsStore.userSettings == null) return;
      _requestPermissionIfGotEnabled();
    });
  }

  @action
  Future<void> _requestPermissionIfGotEnabled() async {
    var shareSettings = _settingsStore.userSettings.shareSettings;
    final shouldRequestPermission = shareSettings != _lastSettings &&
        shareSettings.shareResults &&
        shareSettings.attachLocation &&
        !canAccessLocation;
    if (shouldRequestPermission) {
      await _tryGetAccess();
      await _updateAccessStatus();
      if (!canAccessLocation) {
        shareSettings = shareSettings.copyWith(attachLocation: false);
        await _settingsStore.updateSettings(
          _settingsStore.userSettings.copyWith(
            shareSettings: shareSettings,
          ),
        );
      }
      _lastSettings = shareSettings;
    }
  }

  Future<void> _tryGetAccess() async {
    await _location.requestPermission();
    await _location.requestService();
  }

  Future<void> _updateAccessStatus() async {
    final isPermissionGranted =
        await _location.hasPermission() == PermissionStatus.granted;
    final isServiceEnabled = await _location.serviceEnabled();
    canAccessLocation = isPermissionGranted && isServiceEnabled;
  }

  @action
  Future<GeoPosition> getCurrentPosition() async {
    final result = await _location.getLocation();
    return GeoPosition(lat: result.latitude, lon: result.longitude);
  }
}
