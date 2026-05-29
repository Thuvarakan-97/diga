import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/auth_repository_impl.dart';
import '../../domain/repositories/auth_repository.dart';

/// Local demo session when Firebase is unavailable (desktop dev) or for quick UI testing.
final demoModeProvider = StateProvider<bool>((ref) => false);

/// Firebase user stream; yields `null` when Firebase is not initialized.
final firebaseAuthStateProvider = StreamProvider<User?>((ref) async* {
  if (Firebase.apps.isEmpty) {
    yield null;
    return;
  }
  final auth = FirebaseAuth.instance;
  yield auth.currentUser;
  yield* auth.authStateChanges();
});

final sessionAuthedProvider = Provider<bool>((ref) {
  if (ref.watch(demoModeProvider)) return true;
  if (Firebase.apps.isEmpty) return false;
  final auth = ref.watch(firebaseAuthStateProvider);
  return auth.maybeWhen(data: (u) => u != null, orElse: () => false);
});

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  if (Firebase.apps.isEmpty) {
    return _NoopAuthRepository();
  }
  return AuthRepositoryImpl(FirebaseAuth.instance, FirebaseFirestore.instance);
});

class _NoopAuthRepository implements AuthRepository {
  @override
  Future<void> registerWithEmailAndPassword({
    required String email,
    required String password,
    String? displayName,
  }) async {
    throw UnsupportedError('Firebase is not available on this platform.');
  }

  @override
  Future<void> sendPasswordResetEmail(String email) async {
    throw UnsupportedError('Firebase is not available on this platform.');
  }

  @override
  Future<void> signInWithEmailAndPassword({required String email, required String password}) async {
    throw UnsupportedError('Firebase is not available on this platform.');
  }

  @override
  Future<void> signOut() async {}
}
