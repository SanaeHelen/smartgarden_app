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
    apiKey: 'AIzaSyBHxe48Z2xCDF3UZOR5DOWcXfdxoMvdeaE',
    appId: '1:1092335549244:web:2eed7b0e30fc98f6b23c39',
    messagingSenderId: '1092335549244',
    projectId: 'irrigation-intelligente-b8c1b',
    authDomain: 'irrigation-intelligente-b8c1b.firebaseapp.com',
    databaseURL: 'https://irrigation-intelligente-b8c1b-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'irrigation-intelligente-b8c1b.appspot.com',
    measurementId: 'G-9GD7H2V917',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAK3ye5-9lw_Q5A73PniJb3-ByF8IZD0qg',
    appId: '1:1092335549244:android:8e2e39da0b6ca394b23c39',
    messagingSenderId: '1092335549244',
    projectId: 'irrigation-intelligente-b8c1b',
    databaseURL: 'https://irrigation-intelligente-b8c1b-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'irrigation-intelligente-b8c1b.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA7gKAH46BegTApjgkwdh-_DwQKziMThO0',
    appId: '1:1092335549244:ios:eb11d7f2220935fbb23c39',
    messagingSenderId: '1092335549244',
    projectId: 'irrigation-intelligente-b8c1b',
    databaseURL: 'https://irrigation-intelligente-b8c1b-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'irrigation-intelligente-b8c1b.appspot.com',
    iosClientId: '1092335549244-jfkopvgcspnlu9h7b068n2bg12jenqi3.apps.googleusercontent.com',
    iosBundleId: 'com.example.flapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA7gKAH46BegTApjgkwdh-_DwQKziMThO0',
    appId: '1:1092335549244:ios:85dcccfa5c858444b23c39',
    messagingSenderId: '1092335549244',
    projectId: 'irrigation-intelligente-b8c1b',
    databaseURL: 'https://irrigation-intelligente-b8c1b-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'irrigation-intelligente-b8c1b.appspot.com',
    iosClientId: '1092335549244-nimeavq1t9gb4crgc944632tm5e109hc.apps.googleusercontent.com',
    iosBundleId: 'com.example.flapp.RunnerTests',
  );
}