import 'package:flutter/material.dart';
import 'package:pinger/di/injector.dart';
import 'package:pinger/page/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Injector.setUp();
  runApp(PingerApp());
}

class PingerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pinger',
      home: HomePage(),
    );
  }
}
