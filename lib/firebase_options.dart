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
    apiKey: 'AIzaSyAZ-6sPATfaVvYCPccRsaogtCqEMNUJVGo',
    appId: '1:698351693923:web:580d02afdfb00484e80856',
    messagingSenderId: '698351693923',
    projectId: 'electricityusage-32cb1',
    authDomain: 'electricityusage-32cb1.firebaseapp.com',
    storageBucket: 'electricityusage-32cb1.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBFBQe8VSfT_Pkoac6prP3iPiqjzqL8w3k',
    appId: '1:698351693923:android:9fce4f84e3e6582ce80856',
    messagingSenderId: '698351693923',
    projectId: 'electricityusage-32cb1',
    storageBucket: 'electricityusage-32cb1.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyABf6DJ4Mf8cMAKImXoWmf8f0518q8LFMc',
    appId: '1:698351693923:ios:2c4622cf483511b3e80856',
    messagingSenderId: '698351693923',
    projectId: 'electricityusage-32cb1',
    storageBucket: 'electricityusage-32cb1.appspot.com',
    iosClientId: '698351693923-o3f08hk2a1rnqmq09da3kje3bkl2fkvp.apps.googleusercontent.com',
    iosBundleId: 'com.Ninja.electricityUsage',
  );
}
