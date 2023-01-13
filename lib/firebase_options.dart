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
    apiKey: 'AIzaSyAnOexaBnLKNAe39cXojpgmmB_JukflXGA',
    appId: '1:45199130539:web:ef99498c1d5fef90fbdcee',
    messagingSenderId: '45199130539',
    projectId: 'flutter-finvest',
    authDomain: 'flutter-finvest.firebaseapp.com',
    databaseURL: 'https://flutter-finvest-default-rtdb.firebaseio.com',
    storageBucket: 'flutter-finvest.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCW4F8ulwNQBqsDWczbqSx-iHyD_z_8sFU',
    appId: '1:45199130539:android:fbb2e31ec66c62dafbdcee',
    messagingSenderId: '45199130539',
    projectId: 'flutter-finvest',
    databaseURL: 'https://flutter-finvest-default-rtdb.firebaseio.com',
    storageBucket: 'flutter-finvest.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCfAPoa3OZ6VA2t_VLdyXqSMbP3UKmyuv8',
    appId: '1:45199130539:ios:e68eb16a3a76c0b7fbdcee',
    messagingSenderId: '45199130539',
    projectId: 'flutter-finvest',
    databaseURL: 'https://flutter-finvest-default-rtdb.firebaseio.com',
    storageBucket: 'flutter-finvest.appspot.com',
    iosClientId: '45199130539-0ns480kto48rtrhftd6gr5pobmcan1th.apps.googleusercontent.com',
    iosBundleId: 'com.example.finvest',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCfAPoa3OZ6VA2t_VLdyXqSMbP3UKmyuv8',
    appId: '1:45199130539:ios:e68eb16a3a76c0b7fbdcee',
    messagingSenderId: '45199130539',
    projectId: 'flutter-finvest',
    databaseURL: 'https://flutter-finvest-default-rtdb.firebaseio.com',
    storageBucket: 'flutter-finvest.appspot.com',
    iosClientId: '45199130539-0ns480kto48rtrhftd6gr5pobmcan1th.apps.googleusercontent.com',
    iosBundleId: 'com.example.finvest',
  );
}