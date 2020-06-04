import 'package:flutter/material.dart';
import 'package:pinger/page/splash_page.dart';
import 'package:pinger/resources.dart';

void main() => runApp(PingerApp());

class PingerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: R.themes.app,
      title: 'Pinger',
      home: SplashPage(),
    );
  }
}
