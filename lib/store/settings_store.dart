import 'package:mobx/mobx.dart';
import 'package:pinger/model/user_settings.dart';

part 'settings_store.g.dart';

class SettingsStore = SettingsStoreBase with _$SettingsStore;

abstract class SettingsStoreBase with Store {
  @observable
  UserSettings userSettings = UserSettings(
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
  void update(UserSettings newSettings) {
    userSettings = newSettings;
  }
}
