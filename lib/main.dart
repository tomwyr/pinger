import 'package:flutter/material.dart';
import 'package:pinger/di/injector.dart';
import 'package:pinger/page/home_page.dart';
import 'package:pinger/resources.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Injector.configure();
  runApp(PingerApp());
}

class PingerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: R.themes.app,
      title: 'Pinger',
      home: HomePage(),
    );
  }
}
