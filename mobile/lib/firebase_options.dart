// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBSrzk81fDemMcHFDszV0IahN8eEUkPKjA',
    appId: '1:35379423863:android:074b3ae36c762aa59c7472',
    messagingSenderId: '35379423863',
    projectId: 'pinger-855aa',
    databaseURL: 'https://pinger-855aa.firebaseio.com',
    storageBucket: 'pinger-855aa.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBgf_Q4lVy6NN2GwsPDa7AzD9olnt_U32Y',
    appId: '1:35379423863:ios:9c2e269734499a359c7472',
    messagingSenderId: '35379423863',
    projectId: 'pinger-855aa',
    databaseURL: 'https://pinger-855aa.firebaseio.com',
    storageBucket: 'pinger-855aa.appspot.com',
    iosClientId: '35379423863-eqdpjv2jn1lkmak8u71hv4mm4il2ga6j.apps.googleusercontent.com',
    iosBundleId: 'com.tomwyr.pinger',
  );
}
