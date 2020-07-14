import 'package:injectable/injectable.dart';
import 'package:location/location.dart' show Location, LocationAccuracy;
import 'package:mobx/mobx.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pinger/model/geo_position.dart';
import 'package:pinger/model/user_settings.dart';
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

  @observable
  bool hasPermission = false;

  @observable
  bool isServiceEnabled = false;

  @computed
  bool get canAccessLocation => hasPermission && isServiceEnabled;

  @action
  Future<void> init() async {
    _location.changeSettings(accuracy: LocationAccuracy.balanced);
    _lifecycleNotifier.register(LifecycleAware(
      onResumed: _updateAccessStatus,
    ));
    _updateAccessStatus();
    reaction(
      (_) => _settingsStore.userSettings.shareSettings,
      _verifyCanShowLocation,
      fireImmediately: true,
    );
  }

  void _verifyCanShowLocation(ShareSettings settings) async {
    if (settings.shareResults) {
      if (settings.attachLocation && !canAccessLocation) {
        await Permission.location.request();
        await _updateAccessStatus();
      }
    }
    if (!settings.shareResults || (settings.attachLocation && !hasPermission)) {
      await _settingsStore.updateSettings(
        _settingsStore.userSettings.copyWith.shareSettings(
          attachLocation: false,
        ),
      );
    }
  }

  @action
  Future<void> _updateAccessStatus() async {
    final permissionStatus = await Permission.location.status.isGranted;
    if (permissionStatus != hasPermission) hasPermission = permissionStatus;
    final isEnabled = (await Permission.location.serviceStatus).isEnabled;
    if (isEnabled != isServiceEnabled) isServiceEnabled = isEnabled;
  }

  @action
  Future<GeoPosition> getCurrentPosition() async {
    final result = await _location.getLocation();
    return GeoPosition(lat: result.latitude, lon: result.longitude);
  }
}
