import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:pinger/di/injector.dart';
import 'package:pinger/generated/l10n.dart';
import 'package:pinger/resources.dart';
import 'package:pinger/store/hosts_store.dart';
import 'package:pinger/store/settings_store.dart';
import 'package:pinger/ui/page/init_page.dart';
import 'package:pinger/ui/permissions_sheet.dart';
import 'package:pinger/ui/shared/tiles/host_icon_tile.dart';

class PingerApp extends StatefulWidget {
  static final _navigatorKey = GlobalKey<NavigatorState>();
  static NavigatorState get navigator => _navigatorKey.currentState;

  @override
  _PingerAppState createState() => _PingerAppState();
}

class _PingerAppState extends State<PingerApp> {
  final SettingsStore _settingsStore = Injector.resolve();

  @override
  void initState() {
    super.initState();
    reaction(
      (_) => _settingsStore.userSettings.nightMode,
      (it) => setState(() => R.load(it ? Brightness.dark : Brightness.light)),
      fireImmediately: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => MaterialApp(
        localizationsDelegates: [
          GlobalWidgetsLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          S.delegate,
        ],
        navigatorKey: PingerApp._navigatorKey,
        supportedLocales: S.delegate.supportedLocales,
        theme: R.themes.app,
        themeMode: R.themes.mode,
        title: _settingsStore.appInfo.name,
        builder: (_, child) => PermissionsSheet(
          child: HostIconProvider(
            getIcon: Injector.resolve<HostsStore>().getFavicon,
            child: child,
          ),
        ),
        home: InitPage(),
      ),
    );
  }
}
