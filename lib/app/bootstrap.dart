import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

import '../firebase_options.dart';

/// Initializes Firebase when supported on the current platform.
///
/// On desktop/web in development, Firebase may be skipped; use demo sign-in on the login screen.
Future<void> bootstrapFirebase() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Firebase.apps.isNotEmpty) return;

  try {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        await Firebase.initializeApp(options: DefaultFirebaseOptions.android);
        break;
      case TargetPlatform.iOS:
        await Firebase.initializeApp();
        break;
      default:
        if (kDebugMode) {
          debugPrint('Firebase: skipped on $defaultTargetPlatform (not configured).');
        }
    }
  } on UnsupportedError catch (e) {
    if (kDebugMode) {
      debugPrint('Firebase: $e');
    }
  } catch (e, st) {
    if (kDebugMode) {
      debugPrint('Firebase init failed: $e\n$st');
    }
  }
}
