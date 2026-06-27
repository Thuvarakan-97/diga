import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../core/constants/firestore_paths.dart';
import '../../../../shared/models/user_profile.dart';
import '../../domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this._auth, this._firestore);

  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;

  bool get _firebaseReady => Firebase.apps.isNotEmpty;

  @override
  Future<void> signInWithEmailAndPassword({required String email, required String password}) async {
    _assertFirebase();
    final cred = await _auth.signInWithEmailAndPassword(email: email.trim(), password: password);
    await _ensureUserProfileDoc(cred.user);
    await _logAnalytics('sign_in', const {'method': 'password'});
  }

  @override
  Future<void> signInWithGoogle() async {
    _assertFirebase();
    final UserCredential cred;
    if (kIsWeb) {
      cred = await _auth.signInWithPopup(GoogleAuthProvider());
    } else {
      final googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        throw FirebaseAuthException(
          code: 'google-sign-in-cancelled',
          message: 'Google sign-in was cancelled.',
        );
      }
      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      cred = await _auth.signInWithCredential(credential);
    }
    await _ensureUserProfileDoc(cred.user);
    await _logAnalytics('sign_in', const {'method': 'google'});
  }

  @override
  Future<void> registerWithEmailAndPassword({
    required String email,
    required String password,
    String? displayName,
  }) async {
    _assertFirebase();
    final cred = await _auth.createUserWithEmailAndPassword(email: email.trim(), password: password);
    if (displayName != null && displayName.trim().isNotEmpty) {
      await cred.user?.updateDisplayName(displayName.trim());
    }
    await _writeUserProfile(cred.user!, displayName: displayName?.trim());
    await _logAnalytics('sign_up', const {'method': 'password'});
  }

  @override
  Future<void> signOut() async {
    if (!_firebaseReady) return;
    if (!kIsWeb) {
      await GoogleSignIn().signOut();
    }
    await _auth.signOut();
    await _logAnalytics('sign_out');
  }

  @override
  Future<void> sendPasswordResetEmail(String email) async {
    _assertFirebase();
    await _auth.sendPasswordResetEmail(email: email.trim());
  }

  void _assertFirebase() {
    if (!_firebaseReady) {
      throw StateError('Firebase is not initialized on this device.');
    }
  }

  Future<void> _ensureUserProfileDoc(User? user) async {
    if (user == null) return;
    final ref = _firestore.doc(FirestorePaths.userDoc(user.uid));
    final snap = await ref.get();
    if (snap.exists) return;
    await _writeUserProfile(user, displayName: user.displayName);
  }

  Future<void> _writeUserProfile(User user, {String? displayName}) async {
    final now = DateTime.now().toUtc();
    final profile = UserProfile(
      uid: user.uid,
      email: user.email ?? '',
      displayName: displayName ?? user.displayName,
      preferredLocale: null,
      createdAt: now,
      updatedAt: now,
    );
    await _firestore.doc(FirestorePaths.userDoc(user.uid)).set(profile.toJson(), SetOptions(merge: true));
  }

  Future<void> _logAnalytics(String name, [Map<String, Object>? params]) async {
    if (!_firebaseReady) return;
    try {
      if (params == null) {
        await FirebaseAnalytics.instance.logEvent(name: name);
      } else {
        await FirebaseAnalytics.instance.logEvent(name: name, parameters: params);
      }
    } catch (e, st) {
      if (kDebugMode) {
        debugPrint('Analytics: $e $st');
      }
    }
  }
}
