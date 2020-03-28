import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:pinger/model/geo_position.dart';
import 'package:pinger/model/user_settings.dart';
import 'package:pinger/store/settings_store.dart';

part 'location_store.g.dart';

@singleton
class LocationStore extends LocationStoreBase with _$LocationStore {
  final Geolocator _geolocator;
  final SettingsStore _settingsStore;

  LocationStore(this._geolocator, this._settingsStore);
}

abstract class LocationStoreBase with Store {
  Geolocator get _geolocator;
  SettingsStore get _settingsStore;

  ShareSettings _lastSettings;

  @observable
  bool hasPermission;

  @action
  void init() {
    _updatePermissionStatus();
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
        !hasPermission;
    if (shouldRequestPermission) {
      await _tryGetPermission();
      await _updatePermissionStatus();
      if (!hasPermission) {
        shareSettings = shareSettings.copyWith(attachLocation: false);
        await _settingsStore.update(
          _settingsStore.userSettings.copyWith(
            shareSettings: shareSettings,
          ),
        );
      }
      _lastSettings = shareSettings;
    }
  }

  Future<void> _tryGetPermission() async {
    try {
      await _geolocator.getCurrentPosition();
    } on PlatformException catch (e) {
      if (e.code != 'PERMISSION_DENIED') rethrow;
    }
  }

  Future<void> _updatePermissionStatus() async {
    final result = await _geolocator.checkGeolocationPermissionStatus();
    hasPermission = result == GeolocationStatus.granted;
  }

  @action
  Future<GeoPosition> getCurrentPosition() async {
    final position = await _geolocator.getCurrentPosition();
    return GeoPosition(lat: position.latitude, lon: position.longitude);
  }
}
