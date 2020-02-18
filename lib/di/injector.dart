import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:pinger/di/injector.iconfig.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectableInit
Future<void> _initInjectable() => $initGetIt(GetIt.instance);

@registerModule
abstract class Injector {
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  static Future<void> configure() => _initInjectable();

  static T resolve<T>([String instanceName]) => GetIt.instance.get<T>(instanceName);
}
