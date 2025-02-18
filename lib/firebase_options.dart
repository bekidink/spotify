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
    apiKey: 'AIzaSyAScbiUS6Wi53WVlsjl_5vjcaslKkYSTcE',
    appId: '1:1025212784811:web:d020530ed8f8b30de2d7ee',
    messagingSenderId: '1025212784811',
    projectId: 'spotifyapp123',
    authDomain: 'spotifyapp123.firebaseapp.com',
    storageBucket: 'spotifyapp123.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAeyYOSBRkUyz8r-lck7jrghNs0xLtGxPU',
    appId: '1:1025212784811:android:2fedf3ead6d9dadce2d7ee',
    messagingSenderId: '1025212784811',
    projectId: 'spotifyapp123',
    storageBucket: 'spotifyapp123.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB21Ky5HFyH7PtU78XWRnLKSM0EUWc11HQ',
    appId: '1:1025212784811:ios:8973c59ec22cd379e2d7ee',
    messagingSenderId: '1025212784811',
    projectId: 'spotifyapp123',
    storageBucket: 'spotifyapp123.appspot.com',
    iosBundleId: 'com.example.spotify',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB21Ky5HFyH7PtU78XWRnLKSM0EUWc11HQ',
    appId: '1:1025212784811:ios:8973c59ec22cd379e2d7ee',
    messagingSenderId: '1025212784811',
    projectId: 'spotifyapp123',
    storageBucket: 'spotifyapp123.appspot.com',
    iosBundleId: 'com.example.spotify',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAScbiUS6Wi53WVlsjl_5vjcaslKkYSTcE',
    appId: '1:1025212784811:web:e3d61b52a753c584e2d7ee',
    messagingSenderId: '1025212784811',
    projectId: 'spotifyapp123',
    authDomain: 'spotifyapp123.firebaseapp.com',
    storageBucket: 'spotifyapp123.appspot.com',
  );
}
