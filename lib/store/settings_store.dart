import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:pinger/model/user_settings.dart';
import 'package:pinger/service/pinger_prefs.dart';

part 'settings_store.g.dart';

@singleton
class SettingsStore extends SettingsStoreBase with _$SettingsStore {
  final PingerPrefs _pingerPrefs;

  SettingsStore(this._pingerPrefs);
}

abstract class SettingsStoreBase with Store {
  PingerPrefs _pingerPrefs;

  @observable
  UserSettings userSettings;

  @action
  Future<void> init() async {
    var settings = _pingerPrefs.getUserSettings();
    if (settings == null) {
      settings = _createDefaultSettings();
      await _pingerPrefs.saveUserSettings(settings);
    }
    userSettings = settings;
  }

  UserSettings _createDefaultSettings() => UserSettings(
        nightModeEnabled: false,
        rememberHost: true,
        showSystemNotification: false,
        shareSettings: ShareSettings(
          attachLocation: true,
          shareResults: false,
        ),
        pingSettings: PingSettings(
          count: 10,
          packetSize: 24,
          sendInterval: 2,
          timeout: 30,
        ),
      );

  @action
  Future<void> update(UserSettings settings) async {
    await _pingerPrefs.saveUserSettings(settings);
    userSettings = settings;
  }
}
