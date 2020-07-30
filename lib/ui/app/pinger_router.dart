import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pinger/model/ping_result.dart';
import 'package:pinger/ui/page/archive_page.dart';
import 'package:pinger/ui/page/favorites_page.dart';
import 'package:pinger/ui/page/home/home_page.dart';
import 'package:pinger/ui/page/init_page.dart';
import 'package:pinger/ui/page/intro_page.dart';
import 'package:pinger/ui/page/recents_page.dart';
import 'package:pinger/ui/page/result_details/result_details_page.dart';
import 'package:pinger/ui/page/search_page.dart';
import 'package:pinger/ui/page/session/session_page.dart';
import 'package:pinger/ui/page/settings/settings_page.dart';

abstract class PingerRouter {
  BuildContext get overlayContext;

  String get currentRoute;

  Stream<String> get route;

  Future<T> show<T>(RouteConfig config);

  void pop<T>([T result]);
}

class PingerNavigatorRouter extends NavigatorObserver implements PingerRouter {
  @override
  BuildContext get overlayContext => navigator.overlay.context;

  @override
  String get currentRoute => _currentRoute;
  String _currentRoute;

  @override
  Stream<String> get route => _routeController.stream;
  StreamController<String> _routeController = StreamController.broadcast();

  @override
  void pop<T>([T result]) => navigator.pop(result);

  @override
  Future<T> show<T>(RouteConfig config) async {
    switch (config.name) {
      case PingerRoutes.INIT:
      case PingerRoutes.HOME:
      case PingerRoutes.INTRO:
      case PingerRoutes.SETTINGS:
      case PingerRoutes.ARCHIVE:
      case PingerRoutes.FAVORITES:
      case PingerRoutes.RECENTS:
        return _push(config);
      case PingerRoutes.SEARCH:
      case PingerRoutes.SESSION:
        return _pushOnHome(config);
      case PingerRoutes.RESULTS:
        if (currentRoute == PingerRoutes.ARCHIVE) {
          return _push(config);
        }
        return _replace(config);
    }
    throw ArgumentError("Unhandled route config: $config");
  }

  Future<T> _push<T>(RouteConfig config) =>
      navigator.pushNamed(config.name, arguments: config.widget);

  Future<T> _replace<T>(RouteConfig config) =>
      navigator.pushReplacementNamed(config.name, arguments: config.widget);

  Future<T> _pushOnHome<T>(RouteConfig config) =>
      navigator.pushNamedAndRemoveUntil(
        config.name,
        (it) => it.settings.name == PingerRoutes.HOME,
        arguments: config.widget,
      );

  @override
  void didPush(Route route, Route previousRoute) => _onRouteChanged(route);

  @override
  void didPop(Route route, Route previousRoute) =>
      _onRouteChanged(previousRoute);

  @override
  void didReplace({Route newRoute, Route oldRoute}) =>
      _onRouteChanged(newRoute);

  void _onRouteChanged(Route activeRoute) {
    _currentRoute = activeRoute.settings.name;
    _routeController.add(_currentRoute);
  }

  void dispose() {
    _routeController.close();
  }

  Route generateRoute(RouteSettings settings) {
    final isInitial =
        settings.name == PingerRoutes.INIT && settings.arguments == null;
    return MaterialPageRoute(
      settings: RouteSettings(name: settings.name),
      builder: (_) =>
          isInitial ? RouteConfig.init().widget : settings.arguments,
    );
  }
}

class RouteConfig {
  final String name;
  final Widget widget;

  RouteConfig._(this.name, this.widget);

  factory RouteConfig.init() => RouteConfig._(PingerRoutes.INIT, InitPage());

  factory RouteConfig.home() => RouteConfig._(PingerRoutes.HOME, HomePage());

  factory RouteConfig.intro() => RouteConfig._(PingerRoutes.INTRO, IntroPage());

  factory RouteConfig.settings() =>
      RouteConfig._(PingerRoutes.SETTINGS, SettingsPage());

  factory RouteConfig.archive() =>
      RouteConfig._(PingerRoutes.ARCHIVE, ArchivePage());

  factory RouteConfig.results(PingResult result) =>
      RouteConfig._(PingerRoutes.RESULTS, ResultDetailsPage(result: result));

  factory RouteConfig.favorites() =>
      RouteConfig._(PingerRoutes.FAVORITES, FavoritesPage());

  factory RouteConfig.recents() =>
      RouteConfig._(PingerRoutes.RECENTS, RecentsPage());

  factory RouteConfig.search([String initialQuery]) => RouteConfig._(
      PingerRoutes.SEARCH, SearchPage(initialQuery: initialQuery));

  factory RouteConfig.session() =>
      RouteConfig._(PingerRoutes.SESSION, SessionPage());

  @override
  String toString() => "$RouteConfig($name, $widget)";
}

class PingerRoutes {
  PingerRoutes._();

  static const INIT = '/';
  static const HOME = '/home';
  static const INTRO = '/intro';
  static const SETTINGS = '/settings';
  static const ARCHIVE = '/archive';
  static const RESULTS = '/results';
  static const FAVORITES = '/favorites';
  static const RECENTS = '/recents';
  static const SEARCH = '/search';
  static const SESSION = '/session';
}
