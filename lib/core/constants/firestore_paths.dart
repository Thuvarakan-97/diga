/// Firestore collection and document paths (keep aligned with security rules).
abstract final class FirestorePaths {
  static const users = 'users';

  static String userDoc(String uid) => '$users/$uid';
}
