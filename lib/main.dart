import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinger/di/injector.dart';
import 'package:pinger/ui/pinger_app.dart';

const APP_ENV = String.fromEnvironment("APP_ENV");

void main() async {
  FlutterError.onError = Crashlytics.instance.recordFlutterError;
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await Injector.configure(APP_ENV);
  runApp(PingerApp());
}
