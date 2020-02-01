// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'injector.dart';

// **************************************************************************
// InjectorGenerator
// **************************************************************************

class _$Injector extends Injector {
  void _configure() {
    final Container container = Container();
    container.registerFactory((c) => PingerPrefs(c<SharedPreferences>()));
    container.registerSingleton((c) => HistoryStore());
    container.registerSingleton((c) => FavoritesStore());
    container.registerSingleton((c) => PingStore());
    container.registerSingleton((c) => HostsStore());
  }
}
