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
    apiKey: 'AIzaSyDD0Xdh-vQZn3XJnA17kpZ_GstpmrflaAA',
    appId: '1:474934669567:web:91768a4a347a0c69ec1cca',
    messagingSenderId: '474934669567',
    projectId: 'appbase-d33b9',
    authDomain: 'appbase-d33b9.firebaseapp.com',
    storageBucket: 'appbase-d33b9.appspot.com',
    measurementId: 'G-YKBH18B9FM',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA1k9cxchmE2fgZDmOxgSfHfwXww6mx2B8',
    appId: '1:474934669567:android:d623e74705f911f2ec1cca',
    messagingSenderId: '474934669567',
    projectId: 'appbase-d33b9',
    storageBucket: 'appbase-d33b9.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAYnDmUKqlBozPl5v7pXaIpvopvlIUWri4',
    appId: '1:474934669567:ios:0f93fa6b691624c5ec1cca',
    messagingSenderId: '474934669567',
    projectId: 'appbase-d33b9',
    storageBucket: 'appbase-d33b9.appspot.com',
    iosClientId: '474934669567-lg3qlj1fnfufakf11v9r4hisp3j0bo5l.apps.googleusercontent.com',
    iosBundleId: 'com.example.auth.auth',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAYnDmUKqlBozPl5v7pXaIpvopvlIUWri4',
    appId: '1:474934669567:ios:0f93fa6b691624c5ec1cca',
    messagingSenderId: '474934669567',
    projectId: 'appbase-d33b9',
    storageBucket: 'appbase-d33b9.appspot.com',
    iosClientId: '474934669567-lg3qlj1fnfufakf11v9r4hisp3j0bo5l.apps.googleusercontent.com',
    iosBundleId: 'com.example.auth.auth',
  );
}
