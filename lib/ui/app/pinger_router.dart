import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:pinger/model/ping_result.dart';
import 'package:pinger/resources.dart';
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
  String? get currentRoute;

  Stream<String?> get route;

  Future<T?> show<T>(RouteConfig config);

  void pop<T>([T? result]);
}

class PingerNavigatorRouter extends NavigatorObserver implements PingerRouter {
  @override
  String? get currentRoute => _currentRoute;
  String? _currentRoute;

  @override
  Stream<String?> get route => _routeController.stream;
  StreamController<String?> _routeController = StreamController.broadcast();

  @override
  void pop<T>([T? result]) => navigator!.pop(result);

  @override
  Future<T?> show<T>(RouteConfig config) async {
    if (config is _PageRouteConfig) {
      switch (config.name) {
        case PingerRoutes.INIT:
        case PingerRoutes.INTRO:
        case PingerRoutes.SETTINGS:
        case PingerRoutes.ARCHIVE:
        case PingerRoutes.FAVORITES:
        case PingerRoutes.RECENTS:
          return _push(config);
        case PingerRoutes.SEARCH:
        case PingerRoutes.SESSION:
          return _pushOnHome(config);
        case PingerRoutes.HOME:
          return _replace(config);
        case PingerRoutes.RESULTS:
          if (currentRoute == PingerRoutes.ARCHIVE) {
            return _push(config);
          }
          return _replace(config);
      }
    } else if (config is _SheetRouteConfig) {
      return _showSheet(config);
    }
    throw ArgumentError("Unhandled route config with name: ${config.name}");
  }

  Future<T?> _push<T>(_PageRouteConfig config) =>
      navigator!.pushNamed(config.name, arguments: config.widget);

  Future<T?> _replace<T>(_PageRouteConfig config) =>
      navigator!.pushReplacementNamed(config.name, arguments: config.widget);

  Future<T?> _pushOnHome<T>(_PageRouteConfig config) => navigator!.pushNamedAndRemoveUntil(
        config.name,
        (it) => it.settings.name == PingerRoutes.HOME,
        arguments: config.widget,
      );

  Future<T?> _showSheet<T>(_SheetRouteConfig config) => showGeneralDialog(
        context: navigator!.overlay!.context,
        routeSettings: RouteSettings(name: config.name),
        barrierDismissible: false,
        barrierLabel: "PingerSheet",
        transitionDuration: const Duration(milliseconds: 300),
        transitionBuilder: PingerTransitions.blurBackground,
        pageBuilder: config.builder,
      );

  @override
  void didPush(Route route, Route? previousRoute) => _onRouteChanged(route);

  @override
  void didPop(Route route, Route? previousRoute) => _onRouteChanged(previousRoute!);

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) => _onRouteChanged(newRoute!);

  void _onRouteChanged(Route activeRoute) {
    _currentRoute = activeRoute.settings.name;
    _routeController.add(_currentRoute);
  }

  void dispose() {
    _routeController.close();
  }

  Route generateRoute(RouteSettings settings) {
    return MaterialPageRoute(
      settings: RouteSettings(name: settings.name),
      builder: (_) =>
          settings.name == PingerRoutes.INIT ? InitPage() : settings.arguments as Widget,
    );
  }
}

class RouteConfig {
  final String name;

  RouteConfig._(this.name);

  factory RouteConfig.home() => _PageRouteConfig(PingerRoutes.HOME, HomePage());

  factory RouteConfig.intro() => _PageRouteConfig(PingerRoutes.INTRO, IntroPage());

  factory RouteConfig.settings() => _PageRouteConfig(PingerRoutes.SETTINGS, SettingsPage());

  factory RouteConfig.archive() => _PageRouteConfig(PingerRoutes.ARCHIVE, ArchivePage());

  factory RouteConfig.results(PingResult? result) =>
      _PageRouteConfig(PingerRoutes.RESULTS, ResultDetailsPage(result: result));

  factory RouteConfig.favorites() => _PageRouteConfig(PingerRoutes.FAVORITES, FavoritesPage());

  factory RouteConfig.recents() => _PageRouteConfig(PingerRoutes.RECENTS, RecentsPage());

  factory RouteConfig.search([String? initialQuery]) =>
      _PageRouteConfig(PingerRoutes.SEARCH, SearchPage(initialQuery: initialQuery));

  factory RouteConfig.session() => _PageRouteConfig(PingerRoutes.SESSION, SessionPage());

  factory RouteConfig.sheet(RoutePageBuilder builder) =>
      _SheetRouteConfig(PingerRoutes.SHEET, builder);
}

class _PageRouteConfig extends RouteConfig {
  final Widget widget;

  _PageRouteConfig(String name, this.widget) : super._(name);
}

class _SheetRouteConfig extends RouteConfig {
  final RoutePageBuilder builder;

  _SheetRouteConfig(String name, this.builder) : super._(name);
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
  static const SHEET = '/sheet';
}

class PingerTransitions {
  PingerTransitions._();

  static RouteTransitionsBuilder blurBackground = (_, animation, __, child) {
    final _blurSigma = 3.0;
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: animation.value * _blurSigma,
              sigmaY: animation.value * _blurSigma,
            ),
            child: Container(color: R.colors.none),
          ),
        ),
        child,
      ],
    );
  };
}
