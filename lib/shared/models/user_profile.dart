import 'model_json.dart';

/// Authenticated doctor profile stored in Firestore (`users/{uid}`).
class UserProfile {
  const UserProfile({
    required this.uid,
    required this.email,
    this.displayName,
    this.medicalSpecialty,
    this.institution,
    this.preferredLocale,
    required this.createdAt,
    required this.updatedAt,
  });

  final String uid;
  final String email;
  final String? displayName;
  final String? medicalSpecialty;
  final String? institution;

  /// BCP-47 tag, e.g. `de` — UI can localize later from this default.
  final String? preferredLocale;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      uid: readString(json, 'uid'),
      email: readString(json, 'email'),
      displayName: readStringOrNull(json, 'displayName'),
      medicalSpecialty: readStringOrNull(json, 'medicalSpecialty'),
      institution: readStringOrNull(json, 'institution'),
      preferredLocale: readStringOrNull(json, 'preferredLocale'),
      createdAt: readDateTime(json, 'createdAt'),
      updatedAt: readDateTime(json, 'updatedAt'),
    );
  }

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'email': email,
        if (displayName != null) 'displayName': displayName,
        if (medicalSpecialty != null) 'medicalSpecialty': medicalSpecialty,
        if (institution != null) 'institution': institution,
        if (preferredLocale != null) 'preferredLocale': preferredLocale,
        'createdAt': createdAt.toUtc().toIso8601String(),
        'updatedAt': updatedAt.toUtc().toIso8601String(),
      };

  UserProfile copyWith({
    String? uid,
    String? email,
    String? displayName,
    String? medicalSpecialty,
    String? institution,
    String? preferredLocale,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return UserProfile(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      displayName: displayName ?? this.displayName,
      medicalSpecialty: medicalSpecialty ?? this.medicalSpecialty,
      institution: institution ?? this.institution,
      preferredLocale: preferredLocale ?? this.preferredLocale,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
