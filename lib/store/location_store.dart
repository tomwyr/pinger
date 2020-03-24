import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:pinger/model/geo_position.dart';

part 'location_store.g.dart';

@singleton
class LocationStore extends LocationStoreBase with _$LocationStore {
  final Geolocator _geolocator;

  LocationStore(this._geolocator);
}

abstract class LocationStoreBase with Store {
  Geolocator get _geolocator;

  @observable
  bool hasPermission;

  @action
  Future<void> init() async {
    await _checkPermissionStatus();
  }

  @action
  Future<void> requestPermission() async {
    await _geolocator.getCurrentPosition();
    await _checkPermissionStatus();
  }

  Future<void> _checkPermissionStatus() async {
    final result = await _geolocator.checkGeolocationPermissionStatus();
    hasPermission = result == GeolocationStatus.granted;
  }

  @action
  Future<GeoPosition> getCurrentPosition() async {
    final position = await _geolocator.getCurrentPosition();
    return GeoPosition(lat: position.latitude, lon: position.longitude);
  }
}
