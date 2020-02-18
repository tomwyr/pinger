import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:pinger/di/injector.iconfig.dart';
import 'package:pinger/store/settings_store.dart';
import 'package:shared_preferences/shared_preferences.dart';

@registerModule
abstract class Injector {
  static Future<void> configure() async {
    await _initInjectable();
    await resolve<SettingsStore>().init();
  }

  static T resolve<T>([String instanceName]) =>
      GetIt.instance.get<T>(instanceName);

  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
}

@injectableInit
Future<void> _initInjectable() => $initGetIt(GetIt.instance);
