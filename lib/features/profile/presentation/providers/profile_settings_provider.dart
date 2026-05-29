import 'package:flutter_riverpod/flutter_riverpod.dart';

class NotificationPreferences {
  const NotificationPreferences({
    this.moduleUpdates = true,
    this.streakReminders = true,
    this.weeklyProgressDigest = true,
    this.productUpdates = false,
    this.emailSummaries = true,
  });

  final bool moduleUpdates;
  final bool streakReminders;
  final bool weeklyProgressDigest;
  final bool productUpdates;
  final bool emailSummaries;

  NotificationPreferences copyWith({
    bool? moduleUpdates,
    bool? streakReminders,
    bool? weeklyProgressDigest,
    bool? productUpdates,
    bool? emailSummaries,
  }) {
    return NotificationPreferences(
      moduleUpdates: moduleUpdates ?? this.moduleUpdates,
      streakReminders: streakReminders ?? this.streakReminders,
      weeklyProgressDigest: weeklyProgressDigest ?? this.weeklyProgressDigest,
      productUpdates: productUpdates ?? this.productUpdates,
      emailSummaries: emailSummaries ?? this.emailSummaries,
    );
  }
}

class NotificationPreferencesController extends StateNotifier<NotificationPreferences> {
  NotificationPreferencesController() : super(const NotificationPreferences());

  void setModuleUpdates(bool value) => state = state.copyWith(moduleUpdates: value);
  void setStreakReminders(bool value) => state = state.copyWith(streakReminders: value);
  void setWeeklyDigest(bool value) => state = state.copyWith(weeklyProgressDigest: value);
  void setProductUpdates(bool value) => state = state.copyWith(productUpdates: value);
  void setEmailSummaries(bool value) => state = state.copyWith(emailSummaries: value);
}

final notificationPreferencesProvider =
    StateNotifierProvider<NotificationPreferencesController, NotificationPreferences>(
  (ref) => NotificationPreferencesController(),
);

class PersonalDetailsDraft {
  const PersonalDetailsDraft({
    this.displayName = '',
    this.email = '',
    this.specialty = '',
    this.institution = '',
    this.licenseNumber = '',
  });

  final String displayName;
  final String email;
  final String specialty;
  final String institution;
  final String licenseNumber;

  PersonalDetailsDraft copyWith({
    String? displayName,
    String? email,
    String? specialty,
    String? institution,
    String? licenseNumber,
  }) {
    return PersonalDetailsDraft(
      displayName: displayName ?? this.displayName,
      email: email ?? this.email,
      specialty: specialty ?? this.specialty,
      institution: institution ?? this.institution,
      licenseNumber: licenseNumber ?? this.licenseNumber,
    );
  }
}

class PersonalDetailsController extends StateNotifier<PersonalDetailsDraft> {
  PersonalDetailsController() : super(const PersonalDetailsDraft());

  void hydrate({
    required String displayName,
    required String email,
    String specialty = 'General practice',
    String institution = '',
    String licenseNumber = '',
  }) {
    state = PersonalDetailsDraft(
      displayName: displayName,
      email: email,
      specialty: specialty,
      institution: institution,
      licenseNumber: licenseNumber,
    );
  }

  void updateDisplayName(String v) => state = state.copyWith(displayName: v);
  void updateSpecialty(String v) => state = state.copyWith(specialty: v);
  void updateInstitution(String v) => state = state.copyWith(institution: v);
  void updateLicenseNumber(String v) => state = state.copyWith(licenseNumber: v);
}

final personalDetailsProvider = StateNotifierProvider<PersonalDetailsController, PersonalDetailsDraft>(
  (ref) => PersonalDetailsController(),
);
