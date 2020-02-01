import 'package:kiwi/kiwi.dart';
import 'package:pinger/service/pinger_prefs.dart';
import 'package:pinger/store/favorites_store.dart';
import 'package:pinger/store/history_store.dart';
import 'package:pinger/store/hosts_store.dart';
import 'package:pinger/store/ping_store.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'injector.g.dart';

abstract class Injector {
  static Container _container;

  static Future<void> setUp() async {
    _container = Container();
    final prefs = await SharedPreferences.getInstance();
    _container.registerInstance(prefs);
    _$Injector()._configure();
  }

  static T resolve<T>([String name]) => _container.resolve(name);

  @Register.factory(PingerPrefs)
  @Register.singleton(HistoryStore)
  @Register.singleton(FavoritesStore)
  @Register.singleton(PingStore)
  @Register.singleton(HostsStore)
  // ignore: unused_element
  void _configure();
}
