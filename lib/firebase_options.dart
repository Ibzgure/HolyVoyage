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
    apiKey: 'AIzaSyBVhsjDIMVfe_b-zWuDcF7xVXmdMKvqmnI',
    appId: '1:582708922241:web:04fe206e93ba098baaca80',
    messagingSenderId: '582708922241',
    projectId: 'holy-voyage',
    authDomain: 'holy-voyage.firebaseapp.com',
    databaseURL: 'https://holy-voyage-default-rtdb.firebaseio.com',
    storageBucket: 'holy-voyage.firebasestorage.app',
    measurementId: 'G-741PH7DC1C',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDjcydbek07zNdjo41e0Wv3xpJRBx0RVdA',
    appId: '1:582708922241:android:1e8713b350f9f2dfaaca80',
    messagingSenderId: '582708922241',
    projectId: 'holy-voyage',
    databaseURL: 'https://holy-voyage-default-rtdb.firebaseio.com',
    storageBucket: 'holy-voyage.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCjHyjhyMrofk7iUl3SJAm4UmiVBG4oJLk',
    appId: '1:582708922241:ios:12daeb92b6b80578aaca80',
    messagingSenderId: '582708922241',
    projectId: 'holy-voyage',
    databaseURL: 'https://holy-voyage-default-rtdb.firebaseio.com',
    storageBucket: 'holy-voyage.firebasestorage.app',
    iosBundleId: 'com.example.flutterApplication1',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCjHyjhyMrofk7iUl3SJAm4UmiVBG4oJLk',
    appId: '1:582708922241:ios:12daeb92b6b80578aaca80',
    messagingSenderId: '582708922241',
    projectId: 'holy-voyage',
    databaseURL: 'https://holy-voyage-default-rtdb.firebaseio.com',
    storageBucket: 'holy-voyage.firebasestorage.app',
    iosBundleId: 'com.example.flutterApplication1',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBVhsjDIMVfe_b-zWuDcF7xVXmdMKvqmnI',
    appId: '1:582708922241:web:94aac8b5f542e031aaca80',
    messagingSenderId: '582708922241',
    projectId: 'holy-voyage',
    authDomain: 'holy-voyage.firebaseapp.com',
    databaseURL: 'https://holy-voyage-default-rtdb.firebaseio.com',
    storageBucket: 'holy-voyage.firebasestorage.app',
    measurementId: 'G-P3782ETQZB',
  );
}
