// Firebase project `diga-411dd`.
//
// Web: Firebase Console → Project settings → Your apps → Add Web app → copy `appId`
// into [webAppId] below (or pass --dart-define=FIREBASE_WEB_APP_ID=... when running).
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;

abstract final class DefaultFirebaseOptions {
  /// Replace after registering the Web app in Firebase Console (or use dart-define).
  static const webAppId = String.fromEnvironment(
    'FIREBASE_WEB_APP_ID',
    defaultValue: '1:316098402821:web:be8462ed62376e9b599a6c',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDDDX0ygt4a_BiYcBMjAHW4VzDkdDyMDno',
    appId: '1:316098402821:android:79ca185d90f6c2c3599a6c',
    messagingSenderId: '316098402821',
    projectId: 'diga-411dd',
    storageBucket: 'diga-411dd.firebasestorage.app',
  );

  static FirebaseOptions get web => FirebaseOptions(
        apiKey: 'AIzaSyDDDX0ygt4a_BiYcBMjAHW4VzDkdDyMDno',
        appId: webAppId,
        messagingSenderId: '316098402821',
        projectId: 'diga-411dd',
        authDomain: 'diga-411dd.firebaseapp.com',
        storageBucket: 'diga-411dd.firebasestorage.app',
      );

  static bool get isWebConfigured =>
      webAppId.isNotEmpty && !webAppId.contains('CONFIGURE_IN_FIREBASE_CONSOLE');
}
