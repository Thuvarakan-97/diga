import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/auth_repository_impl.dart';
import '../../domain/repositories/auth_repository.dart';

/// Local demo session when Firebase is unavailable (desktop dev) or for quick UI testing.
final demoModeProvider = StateProvider<bool>((ref) => false);

/// Whether Firebase was initialized on this platform.
final firebaseReadyProvider = Provider<bool>((ref) => Firebase.apps.isNotEmpty);

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

enum AuthSessionStatus { loading, authed, guest }

final authSessionStatusProvider = Provider<AuthSessionStatus>((ref) {
  if (ref.watch(demoModeProvider)) return AuthSessionStatus.authed;
  if (Firebase.apps.isEmpty) return AuthSessionStatus.guest;
  final auth = ref.watch(firebaseAuthStateProvider);
  return auth.when(
    loading: () => AuthSessionStatus.loading,
    data: (user) => user != null ? AuthSessionStatus.authed : AuthSessionStatus.guest,
    error: (error, stackTrace) => AuthSessionStatus.guest,
  );
});

final sessionAuthedProvider = Provider<bool>((ref) {
  return ref.watch(authSessionStatusProvider) == AuthSessionStatus.authed;
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
  Future<void> signInWithGoogle() async {
    throw UnsupportedError('Firebase is not available on this platform.');
  }

  @override
  Future<void> signOut() async {}
}
