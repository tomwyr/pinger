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
  final StreamController<String?> _routeController = StreamController.broadcast();

  @override
  void pop<T>([T? result]) => navigator!.pop(result);

  @override
  Future<T?> show<T>(RouteConfig config) async {
    if (config is _PageRouteConfig) {
      switch (config.name) {
        case PingerRoutes.init:
        case PingerRoutes.intro:
        case PingerRoutes.settings:
        case PingerRoutes.archive:
        case PingerRoutes.favorites:
        case PingerRoutes.recents:
          return _push(config);
        case PingerRoutes.search:
        case PingerRoutes.session:
          return _pushOnHome(config);
        case PingerRoutes.home:
          return _replace(config);
        case PingerRoutes.results:
          if (currentRoute == PingerRoutes.archive) {
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
        (it) => it.settings.name == PingerRoutes.home,
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
          settings.name == PingerRoutes.init ? const InitPage() : settings.arguments as Widget,
    );
  }
}

class RouteConfig {
  RouteConfig._(this.name);

  factory RouteConfig.home() => _PageRouteConfig(PingerRoutes.home, const HomePage());

  factory RouteConfig.intro() => _PageRouteConfig(PingerRoutes.intro, const IntroPage());

  factory RouteConfig.settings() => _PageRouteConfig(PingerRoutes.settings, const SettingsPage());

  factory RouteConfig.archive() => _PageRouteConfig(PingerRoutes.archive, const ArchivePage());

  factory RouteConfig.results(PingResult? result) =>
      _PageRouteConfig(PingerRoutes.results, ResultDetailsPage(result: result));

  factory RouteConfig.favorites() =>
      _PageRouteConfig(PingerRoutes.favorites, const FavoritesPage());

  factory RouteConfig.recents() => _PageRouteConfig(PingerRoutes.recents, const RecentsPage());

  factory RouteConfig.search([String? initialQuery]) =>
      _PageRouteConfig(PingerRoutes.search, SearchPage(initialQuery: initialQuery));

  factory RouteConfig.session() => _PageRouteConfig(PingerRoutes.session, const SessionPage());

  factory RouteConfig.sheet(RoutePageBuilder builder) =>
      _SheetRouteConfig(PingerRoutes.sheet, builder);

  final String name;
}

class _PageRouteConfig extends RouteConfig {
  _PageRouteConfig(String name, this.widget) : super._(name);

  final Widget widget;
}

class _SheetRouteConfig extends RouteConfig {
  _SheetRouteConfig(String name, this.builder) : super._(name);

  final RoutePageBuilder builder;
}

class PingerRoutes {
  PingerRoutes._();

  static const init = '/';
  static const home = '/home';
  static const intro = '/intro';
  static const settings = '/settings';
  static const archive = '/archive';
  static const results = '/results';
  static const favorites = '/favorites';
  static const recents = '/recents';
  static const search = '/search';
  static const session = '/session';
  static const sheet = '/sheet';
}

class PingerTransitions {
  PingerTransitions._();

  static Widget blurBackground(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    const blurSigma = 3.0;

    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: animation.value * blurSigma,
              sigmaY: animation.value * blurSigma,
            ),
            child: Container(color: R.colors.none),
          ),
        ),
        child,
      ],
    );
  }
}
