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
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCIJXOpx8s1V2ChpeYku_gK6b2Q3lnS0p4',
    appId: '1:919828128791:web:036e5cb183f57e7ef9e852',
    messagingSenderId: '919828128791',
    projectId: 'flutter-alarm-clock',
    authDomain: 'flutter-alarm-clock.firebaseapp.com',
    storageBucket: 'flutter-alarm-clock.appspot.com',
    measurementId: 'G-KLZRNWQ1E4',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDAaNu-SKqrVQKi7OZY_2rfNtG9VDtP4tw',
    appId: '1:919828128791:android:fcb1a35b979d8de7f9e852',
    messagingSenderId: '919828128791',
    projectId: 'flutter-alarm-clock',
    storageBucket: 'flutter-alarm-clock.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBuOpEGSsX6RvYmUIOiGcYuzgwgWU2OFDQ',
    appId: '1:919828128791:ios:db72d962c300ffc0f9e852',
    messagingSenderId: '919828128791',
    projectId: 'flutter-alarm-clock',
    storageBucket: 'flutter-alarm-clock.appspot.com',
    iosClientId: '919828128791-eiur97fn5u917hlqu6f3furfruo7ap26.apps.googleusercontent.com',
    iosBundleId: 'com.example.alarmClock',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBuOpEGSsX6RvYmUIOiGcYuzgwgWU2OFDQ',
    appId: '1:919828128791:ios:db72d962c300ffc0f9e852',
    messagingSenderId: '919828128791',
    projectId: 'flutter-alarm-clock',
    storageBucket: 'flutter-alarm-clock.appspot.com',
    iosClientId: '919828128791-eiur97fn5u917hlqu6f3furfruo7ap26.apps.googleusercontent.com',
    iosBundleId: 'com.example.alarmClock',
  );
}
