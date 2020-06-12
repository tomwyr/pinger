import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pinger/di/injector.dart';
import 'package:pinger/page/init_page.dart';
import 'package:pinger/resources.dart';
import 'package:pinger/store/settings_store.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Injector.configure();
  runApp(PingerApp());
}

class PingerApp extends StatefulWidget {
  @override
  _PingerAppState createState() => _PingerAppState();
}

class _PingerAppState extends State<PingerApp> {
  @override
  void initState() {
    super.initState();
    final settingsStore = Injector.resolve<SettingsStore>();
    autorun((_) {
      final brightness = settingsStore.userSettings.nightMode
          ? Brightness.dark
          : Brightness.light;
      if (R.load(brightness)) setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: R.themes.app,
      themeMode: R.themes.mode,
      title: 'Pinger',
      home: InitPage(),
    );
  }
}
