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
    apiKey: 'AIzaSyDBGul4jL03o5BWuFmIr7jhHSNbjfL5H0U',
    appId: '1:183986639944:web:89a8c3503f7306d8de347d',
    messagingSenderId: '183986639944',
    projectId: 'mymedic-e1823',
    authDomain: 'mymedic-e1823.firebaseapp.com',
    storageBucket: 'mymedic-e1823.appspot.com',
    measurementId: 'G-J9ZQ8LDJ6M',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDRvc9SHTxDu276yV-gpABEWc5YWulydgY',
    appId: '1:183986639944:android:1c93ddd71ee2e781de347d',
    messagingSenderId: '183986639944',
    projectId: 'mymedic-e1823',
    storageBucket: 'mymedic-e1823.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDKW54Yx1Mj_m8LnF8vJBJfNfHJFbyP5L0',
    appId: '1:183986639944:ios:23f499902672dc4dde347d',
    messagingSenderId: '183986639944',
    projectId: 'mymedic-e1823',
    storageBucket: 'mymedic-e1823.appspot.com',
    iosClientId: '183986639944-frq28mb6tk2hk1ttbbdmiufq4o5b3ll6.apps.googleusercontent.com',
    iosBundleId: 'com.example.application1',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDKW54Yx1Mj_m8LnF8vJBJfNfHJFbyP5L0',
    appId: '1:183986639944:ios:23f499902672dc4dde347d',
    messagingSenderId: '183986639944',
    projectId: 'mymedic-e1823',
    storageBucket: 'mymedic-e1823.appspot.com',
    iosClientId: '183986639944-frq28mb6tk2hk1ttbbdmiufq4o5b3ll6.apps.googleusercontent.com',
    iosBundleId: 'com.example.application1',
  );
}
