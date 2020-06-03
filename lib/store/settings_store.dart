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
  PingerPrefs get _pingerPrefs;

  @observable
  UserSettings userSettings;

  @observable
  bool didShowIntro;

  @action
  void init() {
    didShowIntro = _pingerPrefs.getDidShowIntro() ?? false;
    var settings = _pingerPrefs.getUserSettings();
    if (settings == null) {
      settings = _createDefaultSettings();
      _pingerPrefs.saveUserSettings(settings);
    }
    userSettings = settings;
  }

  UserSettings _createDefaultSettings() => UserSettings(
        nightMode: false,
        rememberHost: true,
        showSystemNotification: false,
        shareSettings: ShareSettings(
          shareResults: true,
          attachLocation: false,
        ),
        pingSettings: PingSettings(
          count: 10,
          packetSize: 24,
          interval: 1,
          timeout: 30,
        ),
      );

  @action
  Future<void> updateSettings(UserSettings settings) async {
    await _pingerPrefs.saveUserSettings(settings);
    userSettings = settings;
  }

  @action
  Future<void> notifyDidShowIntro() async {
    await _pingerPrefs.setDidShowIntro(true);
    didShowIntro = true;
  }
}
