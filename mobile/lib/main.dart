import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinger/di/injector.dart';
import 'package:pinger/firebase_options.dart';
import 'package:pinger/ui/app/pinger_app.dart';

const appEnvironment = String.fromEnvironment("APP_ENV");

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await Injector.configure(appEnvironment);
  runApp(const PingerApp());
}
