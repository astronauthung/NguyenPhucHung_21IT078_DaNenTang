// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
    apiKey: 'AIzaSyBdg-Nh5UqowTbWnS6TNMYIGL5G9RRhJQA',
    appId: '1:269667220393:web:264d98a3b9c6ea3999e2b8',
    messagingSenderId: '269667220393',
    projectId: 'algriculture-8fafd',
    authDomain: 'algriculture-8fafd.firebaseapp.com',
    storageBucket: 'algriculture-8fafd.appspot.com',
    measurementId: 'G-E7MGZY2Q9X',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBULvAR8YtgVTS-rCssvmQy14OsokXsDMI',
    appId: '1:269667220393:android:0d3633cf09a274b899e2b8',
    messagingSenderId: '269667220393',
    projectId: 'algriculture-8fafd',
    storageBucket: 'algriculture-8fafd.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBmLgFLFaZ70Sbta5zQ4zXJV5XbvK1xfaA',
    appId: '1:269667220393:ios:ff9ad2d3d13e216999e2b8',
    messagingSenderId: '269667220393',
    projectId: 'algriculture-8fafd',
    storageBucket: 'algriculture-8fafd.appspot.com',
    iosBundleId: 'com.example.midternNguyenphuchung',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBmLgFLFaZ70Sbta5zQ4zXJV5XbvK1xfaA',
    appId: '1:269667220393:ios:ff9ad2d3d13e216999e2b8',
    messagingSenderId: '269667220393',
    projectId: 'algriculture-8fafd',
    storageBucket: 'algriculture-8fafd.appspot.com',
    iosBundleId: 'com.example.midternNguyenphuchung',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBdg-Nh5UqowTbWnS6TNMYIGL5G9RRhJQA',
    appId: '1:269667220393:web:18e2a309a40ff96099e2b8',
    messagingSenderId: '269667220393',
    projectId: 'algriculture-8fafd',
    authDomain: 'algriculture-8fafd.firebaseapp.com',
    storageBucket: 'algriculture-8fafd.appspot.com',
    measurementId: 'G-62JMJJKZYV',
  );

}