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
    apiKey: 'AIzaSyAsFBBSEt_ElqED_bM3tVXcj4Q7y08iWk0',
    appId: '1:1007710823475:web:bd84f01c8a86ddc876af46',
    messagingSenderId: '1007710823475',
    projectId: 'projectmain-86657',
    authDomain: 'projectmain-86657.firebaseapp.com',
    storageBucket: 'projectmain-86657.appspot.com',
    measurementId: 'G-SZ0WG2ZSQY',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAyhYaQ8k0P5n9Fbi0aJVrBsTAOPnL6CTk',
    appId: '1:1007710823475:android:e037a339605af91f76af46',
    messagingSenderId: '1007710823475',
    projectId: 'projectmain-86657',
    storageBucket: 'projectmain-86657.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDRpS5v9zSyJz5TUq1pWIUeCFw2wYWHPFk',
    appId: '1:1007710823475:ios:3ad0f4fb0afc5b7076af46',
    messagingSenderId: '1007710823475',
    projectId: 'projectmain-86657',
    storageBucket: 'projectmain-86657.appspot.com',
    iosClientId: '1007710823475-ff7po9lclhve9l9a3b5dmcpm1vp16vn4.apps.googleusercontent.com',
    iosBundleId: 'com.example.project',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDRpS5v9zSyJz5TUq1pWIUeCFw2wYWHPFk',
    appId: '1:1007710823475:ios:6d1e6de0c045201976af46',
    messagingSenderId: '1007710823475',
    projectId: 'projectmain-86657',
    storageBucket: 'projectmain-86657.appspot.com',
    iosClientId: '1007710823475-mcnp0f3drisdo5uprr6hpu1lgg11mcaa.apps.googleusercontent.com',
    iosBundleId: 'com.samuel.joseph',
  );
}
