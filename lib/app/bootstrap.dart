import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

import '../firebase_options.dart';

/// Initializes Firebase when supported on the current platform.
Future<bool> bootstrapFirebase() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Firebase.apps.isNotEmpty) return true;

  try {
    // Web must be checked first: on Chrome/Edge, [defaultTargetPlatform] is the
    // host OS (e.g. Windows), not a web-specific value.
    if (kIsWeb) {
      if (!DefaultFirebaseOptions.isWebConfigured) {
        debugPrint(
          'Firebase Web: set web app ID in lib/firebase_options.dart '
          '(Firebase Console → Project settings → Web app → appId).',
        );
        return false;
      }
      await Firebase.initializeApp(options: DefaultFirebaseOptions.web);
      return true;
    }

    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        await Firebase.initializeApp(options: DefaultFirebaseOptions.android);
        return true;
      case TargetPlatform.iOS:
        await Firebase.initializeApp();
        return true;
      default:
        if (kDebugMode) {
          debugPrint('Firebase: skipped on $defaultTargetPlatform.');
        }
        return false;
    }
  } on UnsupportedError catch (e) {
    if (kDebugMode) debugPrint('Firebase: $e');
    return false;
  } catch (e, st) {
    if (kDebugMode) debugPrint('Firebase init failed: $e\n$st');
    return false;
  }
}
