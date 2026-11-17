import '../../../../shared/models/user_profile.dart';

/// Email/password authentication + user document bootstrap in Firestore.
abstract class AuthRepository {
  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<void> registerWithEmailAndPassword({
    required String email,
    required String password,
    String? displayName,
  });

  Future<void> signOut();

  Future<void> sendPasswordResetEmail(String email);

  Future<void> signInWithGoogle();

  Future<UserProfile?> getCurrentUserProfile();

  Future<void> updateCurrentUserProfile({
    required String displayName,
    required String medicalSpecialty,
    required String institution,
    required String licenseNumber,
  });
}
