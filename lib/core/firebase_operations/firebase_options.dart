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
    apiKey: 'AIzaSyDprGh369pPh0T4rdQ_qSTXVqVV9SFKmss',
    appId: '1:1088671119928:web:2a3a157cab1e5d079644cd',
    messagingSenderId: '1088671119928',
    projectId: 'chat-mani',
    authDomain: 'chat-mani.firebaseapp.com',
    storageBucket: 'chat-mani.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC9qcDvI8fn8MSI03FcjYX5L_9XQFjnMCs',
    appId: '1:1088671119928:android:9f98f5e92bddeef69644cd',
    messagingSenderId: '1088671119928',
    projectId: 'chat-mani',
    storageBucket: 'chat-mani.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBbYMwkJ7_KXu1ERBBLQQAnrs75Tx5PVsc',
    appId: '1:1088671119928:ios:4dd1b5a8e9cb7f749644cd',
    messagingSenderId: '1088671119928',
    projectId: 'chat-mani',
    storageBucket: 'chat-mani.firebasestorage.app',
    iosBundleId: 'mani.whts.whatsappDesign',
  );
}
