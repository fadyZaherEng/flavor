// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flavor/flavors.dart';
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
        return F.appFlavor == Flavor.production
            ? android
            : F.appFlavor == Flavor.flutterdev
                ? androidFlutterDev
                : F.appFlavor == Flavor.flutterprod
                    ? androidFlutterProd
                    : androidDevelopment;
      case TargetPlatform.iOS:
        return F.appFlavor == Flavor.production ? ios : iosDevelopment;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
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
    apiKey: 'AIzaSyCzUEtcny0FusAEb9sYJJf1V13kIIOTvEc',
    appId: '1:327214522186:web:8de5a5de444d09a289abb3',
    messagingSenderId: '327214522186',
    projectId: 'flavor-a3582',
    authDomain: 'flavor-a3582.firebaseapp.com',
    storageBucket: 'flavor-a3582.appspot.com',
    measurementId: 'G-3V95949ZKR',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDFSdktJrpQUlfpajW8wYwwfTNmuPlCeWQ',
    appId: '1:327214522186:android:c1f46cdcaab0935089abb3',
    messagingSenderId: '327214522186',
    projectId: 'flavor-a3582',
    storageBucket: 'flavor-a3582.appspot.com',
  );

  static const FirebaseOptions androidDevelopment = FirebaseOptions(
    apiKey: 'AIzaSyDFSdktJrpQUlfpajW8wYwwfTNmuPlCeWQ',
    appId: '1:327214522186:android:adba5129284cfa4a89abb3',
    messagingSenderId: '327214522186',
    projectId: 'flavor-a3582',
    storageBucket: 'flavor-a3582.appspot.com',
  );
  static const FirebaseOptions androidFlutterProd = FirebaseOptions(
    apiKey: 'AIzaSyDFSdktJrpQUlfpajW8wYwwfTNmuPlCeWQ',
    appId: '1:327214522186:android:f39b9de6d264a2be89abb3',
    messagingSenderId: '327214522186',
    projectId: 'flavor-a3582',
    storageBucket: 'flavor-a3582.appspot.com',
  );
  static const FirebaseOptions androidFlutterDev = FirebaseOptions(
    apiKey: 'AIzaSyDFSdktJrpQUlfpajW8wYwwfTNmuPlCeWQ',
    appId: '1:327214522186:android:1ea096e3af7c6a9189abb3',
    messagingSenderId: '327214522186',
    projectId: 'flavor-a3582',
    storageBucket: 'flavor-a3582.appspot.com',
  );
  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB4VBTTyvusuboM7zdyqhE4nQEj1ydktjc',
    appId: '1:327214522186:ios:00993bd7f5b81ed689abb3',
    messagingSenderId: '327214522186',
    projectId: 'flavor-a3582',
    storageBucket: 'flavor-a3582.appspot.com',
    iosBundleId: 'com.example.flavor',
  );
  static const FirebaseOptions iosDevelopment = FirebaseOptions(
    apiKey: 'AIzaSyB4VBTTyvusuboM7zdyqhE4nQEj1ydktjc',
    appId: '1:327214522186:ios:faa7568cabc19a9b89abb3',
    messagingSenderId: '327214522186',
    projectId: 'flavor-a3582',
    storageBucket: 'flavor-a3582.appspot.com',
    iosBundleId: 'com.example.flavor',
  );
  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB4VBTTyvusuboM7zdyqhE4nQEj1ydktjc',
    appId: '1:327214522186:ios:bf64a2288d15d00989abb3',
    messagingSenderId: '327214522186',
    projectId: 'flavor-a3582',
    storageBucket: 'flavor-a3582.appspot.com',
    iosBundleId: 'com.example.flavor',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCzUEtcny0FusAEb9sYJJf1V13kIIOTvEc',
    appId: '1:327214522186:web:6d8489ae6492cb6489abb3',
    messagingSenderId: '327214522186',
    projectId: 'flavor-a3582',
    authDomain: 'flavor-a3582.firebaseapp.com',
    storageBucket: 'flavor-a3582.appspot.com',
    measurementId: 'G-9JP061SDQ0',
  );
}
