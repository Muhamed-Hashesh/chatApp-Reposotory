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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyCRJ0ffk099HC60wboIjPa9BT4LklCFXDU',
    appId: '1:131600223460:web:821b572793e8c9b91170f1',
    messagingSenderId: '131600223460',
    projectId: 'mychat-97252',
    authDomain: 'mychat-97252.firebaseapp.com',
    storageBucket: 'mychat-97252.appspot.com',
    measurementId: 'G-GZF5QSDWYH',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAecxj5a-dOOKaTWOr1ba0pUE5ji4YwpJA',
    appId: '1:131600223460:android:b1f52bac3dd8a0d51170f1',
    messagingSenderId: '131600223460',
    projectId: 'mychat-97252',
    storageBucket: 'mychat-97252.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAdVy_AlZTuj4db8rDqN6XxhrF-3A0oeAo',
    appId: '1:131600223460:ios:febef98286f764c61170f1',
    messagingSenderId: '131600223460',
    projectId: 'mychat-97252',
    storageBucket: 'mychat-97252.appspot.com',
    iosBundleId: 'com.example.chatApplication',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCRJ0ffk099HC60wboIjPa9BT4LklCFXDU',
    appId: '1:131600223460:web:360b6adabbd4b3041170f1',
    messagingSenderId: '131600223460',
    projectId: 'mychat-97252',
    authDomain: 'mychat-97252.firebaseapp.com',
    storageBucket: 'mychat-97252.appspot.com',
    measurementId: 'G-2W8BJRRC9R',
  );
}
