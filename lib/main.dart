import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';

import 'package:pinger/di/injector.dart';
import 'package:pinger/ui/app/pinger_app.dart';

const appEnvironment = String.fromEnvironment("APP_ENV");

void main() async {
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await Injector.configure(appEnvironment);
  runApp(const PingerApp());
}
