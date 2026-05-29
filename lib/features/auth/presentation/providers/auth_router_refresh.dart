import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart' show ChangeNotifier;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'auth_providers.dart';

/// Notifies [GoRouter] when demo mode or Firebase auth session changes.
final authRouterRefreshProvider = Provider<AuthRouterRefresh>((ref) {
  final notifier = AuthRouterRefresh(ref);
  ref.onDispose(notifier.dispose);
  return notifier;
});

class AuthRouterRefresh extends ChangeNotifier {
  AuthRouterRefresh(this._ref) {
    _ref.listen<bool>(demoModeProvider, (previous, next) => notifyListeners());
    _ref.listen<AsyncValue<User?>>(firebaseAuthStateProvider, (previous, next) => notifyListeners());
  }

  final Ref _ref;
}
