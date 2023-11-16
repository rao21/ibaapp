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
    apiKey: 'AIzaSyDOXXfpuvvlTH4b0_jwz8ka5HxqsqDrsV0',
    appId: '1:640558348662:web:27201dfb7a3bbf72dae257',
    messagingSenderId: '640558348662',
    projectId: 'ibacoursemt',
    authDomain: 'ibacoursemt.firebaseapp.com',
    storageBucket: 'ibacoursemt.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDXFxHWNBMtM6B8bN4q2F9ptW_9cSPiyNM',
    appId: '1:640558348662:android:4e559c185d45a033dae257',
    messagingSenderId: '640558348662',
    projectId: 'ibacoursemt',
    storageBucket: 'ibacoursemt.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAHoSollDJzSJRJOx9hPnhxP3AXBfq6S3k',
    appId: '1:640558348662:ios:24c3099422cffe65dae257',
    messagingSenderId: '640558348662',
    projectId: 'ibacoursemt',
    storageBucket: 'ibacoursemt.appspot.com',
    iosBundleId: 'com.example.ibaapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAHoSollDJzSJRJOx9hPnhxP3AXBfq6S3k',
    appId: '1:640558348662:ios:aadb52dc965995abdae257',
    messagingSenderId: '640558348662',
    projectId: 'ibacoursemt',
    storageBucket: 'ibacoursemt.appspot.com',
    iosBundleId: 'com.example.ibaapp.RunnerTests',
  );
}