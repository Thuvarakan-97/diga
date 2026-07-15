// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'DiGA LAB';

  @override
  String get splashLoading => 'Loading…';

  @override
  String get loginTitle => 'Sign in';

  @override
  String get loginHeadline => 'DiGA LAB';

  @override
  String get loginSubtitle =>
      'Educational simulation for prescribing Digital Health Applications (not a clinical tool).';

  @override
  String get loginContinueDemo => 'Continue (demo)';

  @override
  String get loginContinueWithoutAuth => 'Continue without sign-in (MVP)';

  @override
  String get authEmailLabel => 'Email';

  @override
  String get authPasswordLabel => 'Password';

  @override
  String get authPasswordConfirmLabel => 'Confirm password';

  @override
  String get authDisplayNameLabel => 'Display name (optional)';

  @override
  String get authSignInCta => 'Sign in';

  @override
  String get authCreateAccountCta => 'Create account';

  @override
  String get authRegisterTitle => 'Create account';

  @override
  String get authForgotPassword => 'Forgot password?';

  @override
  String get authNoAccountLink => 'No account yet? Register';

  @override
  String get authHaveAccountLink => 'Already have an account? Sign in';

  @override
  String get authSendReset => 'Send reset link';

  @override
  String get authResetSent =>
      'If an account exists for this email, a reset link has been sent.';

  @override
  String get validationEmailRequired => 'Please enter your email.';

  @override
  String get validationEmailInvalid => 'Please enter a valid email address.';

  @override
  String get validationPasswordRequired => 'Please enter your password.';

  @override
  String get validationPasswordMin => 'Password must be at least 8 characters.';

  @override
  String get validationPasswordMismatch => 'Passwords do not match.';

  @override
  String get demoContinueButton => 'Continue without Firebase (dev / desktop)';

  @override
  String get authSignOut => 'Sign out';

  @override
  String authSignedInAs(String email) {
    return 'Signed in as $email';
  }

  @override
  String get authDemoBanner => 'Demo mode (no Firebase on this device).';

  @override
  String get authErrorGeneric => 'Something went wrong. Please try again.';

  @override
  String get authSignInGoogle => 'Continue with Google';

  @override
  String get authOrContinueWith => 'or';

  @override
  String get authErrorEmailInUse =>
      'This email is already registered. Try signing in instead.';

  @override
  String get authErrorWrongPassword => 'Incorrect email or password.';

  @override
  String get authErrorUserNotFound => 'No account found for this email.';

  @override
  String get authErrorInvalidEmail => 'Please enter a valid email address.';

  @override
  String get authErrorWeakPassword =>
      'Password is too weak. Use at least 8 characters.';

  @override
  String get authErrorTooManyRequests =>
      'Too many attempts. Please wait and try again.';

  @override
  String get authErrorNetwork =>
      'Network error. Check your connection and try again.';

  @override
  String get authErrorGoogleCancelled => 'Google sign-in was cancelled.';

  @override
  String get authFirebaseWebSetup =>
      'Add your Web app ID in Firebase Console → Project settings → Your apps → Web, then paste the appId into lib/firebase_options.dart.';

  @override
  String get aiReportTitle => 'AI learning report';

  @override
  String get aiReportSubtitle => 'Personalized coaching from your exam answers';

  @override
  String get aiReportWeakAreas => 'Focus areas';

  @override
  String get aiReportFocusTitle => 'Missed items to review';

  @override
  String get aiReportTipsTitle => 'Teaching tips';

  @override
  String get aiReportNextStepsTitle => 'Suggested next steps';

  @override
  String get aiReportSubmitCta => 'Submit learning report';

  @override
  String get aiReportSubmitted => 'Learning report submitted';

  @override
  String get aiReportWeakPhaseGeneral => 'Review missed rationales carefully';

  @override
  String get aiReportTipPerfect1 =>
      'Strong indication and safety reasoning — keep documenting baselines explicitly.';

  @override
  String get aiReportTipPerfect2 =>
      'Try the next scenario to stretch follow-up and adherence coaching.';

  @override
  String get aiReportTipReviewWrong =>
      'Re-read rationales for missed items before moving on.';

  @override
  String get aiReportTipDiagnose =>
      'Tighten indication fit and red-flag exclusion before prescribing.';

  @override
  String get aiReportTipPrescribe =>
      'Link DiGA choice to goals, exclusions, and patient capacity.';

  @override
  String get aiReportTipFollowUp =>
      'Make follow-up timing and stop rules explicit in your plan.';

  @override
  String get aiReportTipDocumentation =>
      'Document diagnosis, rationale, goals, and review date as a mini chart note.';

  @override
  String get aiReportNextRetry =>
      'Retake this scenario after reviewing the focus items.';

  @override
  String get aiReportNextReviewCompanion =>
      'Open Prescription Companion and check the documentation checklist.';

  @override
  String get aiReportNextContinueScenarios =>
      'Continue to the next unlocked scenario when ready.';

  @override
  String aiReportSummaryExcellent(int score) {
    return 'Excellent exam ($score%). Your pathway matches key DiGA prescribing standards.';
  }

  @override
  String aiReportSummaryPassed(int score, int wrongCount) {
    return 'You passed with $score% and missed $wrongCount item(s). Strengthen the focus areas below, then continue.';
  }

  @override
  String aiReportSummaryFailed(int score, int wrongCount) {
    return 'Score $score% — below the pass mark. Review the $wrongCount missed item(s) and retry when ready.';
  }

  @override
  String get navHome => 'Home';

  @override
  String get navModules => 'Modules';

  @override
  String get navCompanion => 'Companion';

  @override
  String get navProgress => 'Progress';

  @override
  String get navProfile => 'Profile';

  @override
  String get homeTitle => 'Home';

  @override
  String get homeBodyPlaceholder => 'Dashboard (MVP placeholder)';

  @override
  String get homeGreetingMorning => 'Good morning';

  @override
  String get homeGreetingAfternoon => 'Good afternoon';

  @override
  String get homeGreetingEvening => 'Good evening';

  @override
  String get homeDoctorFallback => 'Doctor';

  @override
  String get homeDashboardSubtitle =>
      'Keep your DiGA prescribing skills sharp with short simulations and trusted reference content.';

  @override
  String get homeContinueTitle => 'Continue learning';

  @override
  String get homeContinueModule => 'Vivira';

  @override
  String get homeContinuePhase => 'Phase 2 · Prescribing';

  @override
  String get homeContinueHint =>
      'Pick up where you left off — your progress is saved.';

  @override
  String get homeContinueCta => 'Resume';

  @override
  String get homeStatsTitle => 'Your overview';

  @override
  String get homeMetricModules => 'Modules done';

  @override
  String get homeMetricAccuracy => 'Avg. accuracy';

  @override
  String get homeMetricStreak => 'Week streak';

  @override
  String get homeSectionRecommended => 'Recommended for you';

  @override
  String get homeSectionRecent => 'Recent activity';

  @override
  String get homeSeeModules => 'See all';

  @override
  String get homeRecentItem1Title => 'Completed simulation';

  @override
  String get homeRecentItem1Subtitle => 'Kalmeda · Score 88%';

  @override
  String get homeRecentItem2Title => 'Companion reviewed';

  @override
  String get homeRecentItem2Subtitle => 'Vivira · Documentation';

  @override
  String get homeEmptyActivityTitle => 'No recent activity yet';

  @override
  String get homeEmptyActivityBody =>
      'Start a module to see your simulations and reviews show up here.';

  @override
  String get homeEmptyCta => 'Browse modules';

  @override
  String get homeDuration12 => '12 min';

  @override
  String get homeDuration20 => '20 min';

  @override
  String get homeVerifiedApr2025 => 'Verified Apr 2025';

  @override
  String get homeTagEnt => 'ENT';

  @override
  String get homeTagGp => 'GP';

  @override
  String get homeTagPain => 'Pain';

  @override
  String get homeModuleDescKalmeda =>
      'Clinical scenarios: sudden hearing loss red flags, Kalmeda eligibility, and follow-up escalation.';

  @override
  String get homeModuleDescVivira =>
      'Clinical scenarios: cauda equina screening, Vivira indication, and exercise follow-up.';

  @override
  String get homeCtaStart => 'Start';

  @override
  String get homeCtaContinue => 'Continue';

  @override
  String get modulesTitle => 'DiGA modules';

  @override
  String get modulesPageTitle => 'DiGA Modules';

  @override
  String get modulesPageSubtitle =>
      'Explore and learn digital health applications';

  @override
  String get modulesSearchHint => 'Search modules, conditions…';

  @override
  String get modulesFilterAll => 'All';

  @override
  String get modulesFilterEnt => 'ENT';

  @override
  String get modulesFilterGp => 'General Practice';

  @override
  String get modulesFilterPain => 'Pain';

  @override
  String get modulesFilterMental => 'Mental Health';

  @override
  String get modulesEmptyTitle => 'No modules available yet';

  @override
  String get modulesEmptySubtitle =>
      'Try adjusting your search or filters — new DiGA learning paths are added regularly.';

  @override
  String get modulesProgressLabel => 'Your progress';

  @override
  String modulesProgressPercent(int percent) {
    return '$percent%';
  }

  @override
  String get moduleDifficultyIntro => 'Intro';

  @override
  String get moduleDifficultyStandard => 'Standard';

  @override
  String get moduleVelibraDemo => 'Velibra (demo)';

  @override
  String get moduleVelibraSubtitle => 'Mild depression';

  @override
  String get moduleVelibraDesc =>
      'Depression DiGA scenarios: choosing between apps, bipolar safety screen, severe depression plot twist.';

  @override
  String get moduleInsomniaDemo => 'Insomnia DiGA choice';

  @override
  String get moduleInsomniaSubtitle => 'Non-organic insomnia (CBT-I)';

  @override
  String get moduleInsomniaDesc =>
      'Clinical scenarios: Somnio vs HelloBetter Schlafen — shared decision-making and documentation.';

  @override
  String get moduleCardioDemo => 'CardioCoach (demo)';

  @override
  String get moduleCardioSubtitle => 'Hypertension follow-up';

  @override
  String get moduleCardioDesc =>
      'Clinical scenarios: BP targets, CardioCoach documentation, and medication + lifestyle follow-up.';

  @override
  String get moduleDuration15 => '15 min';

  @override
  String get moduleKalmedaDemo => 'Kalmeda (demo)';

  @override
  String get moduleKalmedaSubtitle => 'Tinnitus';

  @override
  String get moduleViviraDemo => 'Vivira (demo)';

  @override
  String get moduleViviraSubtitle => 'Chronic low back pain';

  @override
  String moduleDetailTitle(String moduleId) {
    return 'Module: $moduleId';
  }

  @override
  String get moduleDetailPlaceholder => 'Module details (placeholder)';

  @override
  String get moduleDetailStartSimulation => 'Start simulation';

  @override
  String get simulationPhase1Title => 'Phase 1: Diagnosis';

  @override
  String get simulationPhase2Title => 'Phase 2: Prescribing';

  @override
  String get simulationPhase3Title => 'Phase 3: Follow-up';

  @override
  String get simulationResultTitle => 'Result';

  @override
  String moduleLabel(String moduleId) {
    return 'Module: $moduleId';
  }

  @override
  String get simulationNextToPhase2 => 'Continue to phase 2';

  @override
  String get simulationNextToPhase3 => 'Continue to phase 3';

  @override
  String get simulationToResult => 'View result';

  @override
  String get simulationScorePlaceholder => 'Score / feedback (placeholder)';

  @override
  String get simulationBackToModuleList => 'Back to module list';

  @override
  String get simulationBackToScenarios => 'Back to scenarios';

  @override
  String get quizPhaseDiagnoseShort => 'Diagnosis';

  @override
  String get quizPhasePrescribeShort => 'Prescribing';

  @override
  String get quizPhaseFollowUpShort => 'Follow-up';

  @override
  String get simulationDecisionPoint => 'Decision point';

  @override
  String get simulationCorrectLabel => 'Correct';

  @override
  String get simulationIncorrectLabel => 'Incorrect';

  @override
  String get simulationYourAnswerLabel => 'Your answer';

  @override
  String get simulationCorrectAnswerLabel => 'Correct answer';

  @override
  String get simulationExplanationLabel => 'Explanation';

  @override
  String get simulationTeachingPearlLabel => 'Teaching pearl';

  @override
  String get simulationNoAnswerRecorded => 'No answer recorded';

  @override
  String get simulationXpEarned => 'XP earned';

  @override
  String simulationXpEarnedValue(int xp) {
    return '+$xp XP';
  }

  @override
  String get simulationAnswerReviewTitle => 'Answer review';

  @override
  String get simulationAnswerReviewSubtitle =>
      'Review your choices, correct answers, and clinical explanations for each phase.';

  @override
  String get simulationScoreBreakdown => 'Score breakdown';

  @override
  String get simulationBadgesUnlocked => 'Badges unlocked';

  @override
  String get simulationUnableToLoadResult => 'Unable to load result summary.';

  @override
  String simulationScoreAccuracy(int score, int accuracy) {
    return 'Score $score% | Accuracy $accuracy%';
  }

  @override
  String simulationMarks(String marks) {
    return 'Marks: $marks';
  }

  @override
  String get simulationContinueNextDomain => 'Continue in next domain';

  @override
  String get simulationContinueNextScenario => 'Continue to next scenario';

  @override
  String simulationExamPassedBanner(int score) {
    return 'Exam passed! $score%';
  }

  @override
  String simulationExamFailedBanner(int score) {
    return 'Try again! You scored $score%';
  }

  @override
  String simulationSuggestedScenario(String title) {
    return 'Suggested scenario: $title';
  }

  @override
  String get simulationExamTitle => 'Domain exam';

  @override
  String get simulationExamLoading => 'Preparing your questions…';

  @override
  String simulationQuestionProgress(int current, int total) {
    return 'Question $current of $total';
  }

  @override
  String get simulationPreviousQuestion => 'Previous';

  @override
  String get simulationNextQuestion => 'Next';

  @override
  String get simulationSubmitExam => 'Submit exam';

  @override
  String simulationExamAnsweredCount(int answered, int total) {
    return '$answered of $total answered';
  }

  @override
  String get simulationExamUnansweredWarning =>
      'Answer all questions before submitting. Use Previous to review skipped items.';

  @override
  String get companionTitle => 'Prescription companion';

  @override
  String get companionPageTitle => 'Prescription Companion';

  @override
  String get companionPageSubtitle => 'Clinical reference for DiGA prescribing';

  @override
  String get companionSelectorLabel => 'Module';

  @override
  String get companionChipKalmeda => 'Kalmeda';

  @override
  String get companionChipVivira => 'Vivira';

  @override
  String get companionEmptyTitle => 'Select a module';

  @override
  String get companionEmptyBody =>
      'Select a module to view prescription details — ICD context, eligibility, documentation, and patient guidance.';

  @override
  String get companionSectionIcd => 'ICD codes (orientation)';

  @override
  String get companionSectionEligibility => 'Eligibility criteria';

  @override
  String get companionSectionContra => 'Contraindications & cautions';

  @override
  String get companionSectionDoc => 'Documentation requirements';

  @override
  String get companionSectionPatient => 'Patient guidance';

  @override
  String get companionSectionInsurance => 'Insurance & billing notes';

  @override
  String get companionKalmedaIcdBlock =>
      'H93.1 — Chronic subjective tinnitus\nH93.A — Somatosensory tinnitus\nF45.3 — Somatoform disorders (if clinically relevant)';

  @override
  String get companionKalmedaEligibilityBlock =>
      'Educational simulation only — verify current DiGA directory and payer rules before prescribing.\nTinnitus with relevant functional impairment documented in the chart.\nStructured therapy pathway suitable for digital intervention.\nPatient able to use smartphone app and follow instructions.';

  @override
  String get companionKalmedaContraBlock =>
      'Acute treatable causes of tinnitus not yet excluded where required by pathway.\nSevere psychiatric instability without adequate supervision.\nCognitive or language barriers preventing safe app use.';

  @override
  String get companionKalmedaDocBlock =>
      'Indication and baseline symptoms recorded\nPrescription issued with therapy goals\nPatient informed about data protection and follow-up plan\nGKV prescription channel documented where applicable';

  @override
  String get companionKalmedaPatientBlock =>
      'Explain that the DiGA supports structured exercises and education — not emergency care for sudden hearing loss or neurological red flags.\nEncourage consistent app use and define a clear follow-up appointment in primary care.';

  @override
  String get companionKalmedaInsuranceBlock =>
      'Educational content — confirm eligibility and prescription rules with the patient’s insurer (e.g. GKV digital prescription workflow).';

  @override
  String get companionViviraIcdBlock =>
      'M54.5 — Low back pain\nM54.4 — Lumbago with sciatica\nM51.2 — Disc displacement (when consistent with pathway)';

  @override
  String get companionViviraEligibilityBlock =>
      'Chronic non-specific low back pain with guideline-consistent diagnostics.\nPatient suitable for progressive exercise therapy via app.\nAbility to perform home exercises and read instructions.';

  @override
  String get companionViviraContraBlock =>
      'Red flags requiring urgent in-person evaluation not yet excluded.\nSevere neurological deficit or cauda equina suspicion.\nRecent vertebral fracture or instability without clearance.';

  @override
  String get companionViviraDocBlock =>
      'Pain history, red-flag assessment, and prior therapies documented\nTherapy goals and exercise tolerance noted\nSide effects and adherence plan discussed\nReturn visit scheduled';

  @override
  String get companionViviraPatientBlock =>
      'Set expectations: gradual loading, possible temporary soreness, and when to stop and seek care.\nCombine digital therapy with activity goals that fit the patient’s daily routine.';

  @override
  String get companionViviraInsuranceBlock =>
      'Educational content — verify coverage and documentation requirements for back-pain DiGAs with the patient’s insurer.';

  @override
  String get companionBodyDefault => 'Reference content (placeholder)';

  @override
  String companionBodyFocused(String moduleId) {
    return 'Focused: $moduleId';
  }

  @override
  String get progressTitle => 'Progress';

  @override
  String get progressPageSubtitle => 'Track your DiGA learning performance';

  @override
  String get progressStatModulesDone => 'Modules completed';

  @override
  String get progressStatAvgScore => 'Average score';

  @override
  String get progressStatAccuracy => 'Accuracy';

  @override
  String get progressStatWeeklySessions => 'Sessions this week';

  @override
  String get progressOverviewTitle => 'Learning path completion';

  @override
  String progressOverviewFraction(int completed, int total) {
    return '$completed of $total modules completed';
  }

  @override
  String get progressOverviewHint =>
      'Complete all pilot modules to earn a completion badge in this demo.';

  @override
  String get progressSectionRecent => 'Recent results';

  @override
  String get progressSectionPerformance => 'Performance by module';

  @override
  String get progressSectionTrend => 'Weekly activity';

  @override
  String get progressTrendCaption =>
      'Relative study intensity by weekday (illustrative demo, not live analytics).';

  @override
  String get progressTrendDaysBlock => 'Mon|Tue|Wed|Thu|Fri|Sat|Sun';

  @override
  String get progressStatusCompleted => 'Completed';

  @override
  String get progressStatusInProgress => 'In progress';

  @override
  String get progressDateApr8 => 'Apr 8, 2025';

  @override
  String get progressDateApr5 => 'Apr 5, 2025';

  @override
  String get progressDateMar28 => 'Mar 28, 2025';

  @override
  String get progressLastActiveApr8 => 'Last active Apr 8, 2025';

  @override
  String get progressLastActiveApr5 => 'Last active Apr 5, 2025';

  @override
  String get progressLastActiveMar20 => 'Last active Mar 20, 2025';

  @override
  String progressAttemptsCount(int count) {
    return '$count attempts';
  }

  @override
  String get progressEmptyTitle => 'No learning activity yet';

  @override
  String get progressEmptyBody =>
      'Complete your first DiGA simulation to see scores, streaks, and weekly trends here.';

  @override
  String get progressEmptyCta => 'Start your first module';

  @override
  String get progressBodyPlaceholder => 'Progress (placeholder)';

  @override
  String get profileTitle => 'Profile';

  @override
  String get profilePageSubtitle => 'Manage your account and preferences';

  @override
  String get profileBodyPlaceholder => 'Profile (placeholder)';

  @override
  String get profileSectionPreferences => 'Preferences';

  @override
  String get profileSectionAccount => 'Account';

  @override
  String get profileSectionAppInfo => 'App';

  @override
  String get profileRoleDoctor => 'Doctor';

  @override
  String get profileDemoDisplayName => 'Demo learner';

  @override
  String get profileLanguageHeading => 'Language';

  @override
  String get profileLanguageDescription =>
      'Interface language for DiGA LAB (educational content only).';

  @override
  String get profileLanguageEnglish => 'English';

  @override
  String get profileLanguageGerman => 'German';

  @override
  String get profileBannerDemoTitle => 'Demo mode';

  @override
  String get profileBannerDemoBody =>
      'You are using DiGA LAB without a full cloud session. Some data may stay on this device only.';

  @override
  String get profileBannerLocalTitle => 'Local session';

  @override
  String get profileBannerLocalBody =>
      'Firebase is not available in this build. Continue exploring modules; sign-in will be enabled when cloud services are configured.';

  @override
  String get profileTilePersonalDetails => 'Personal details';

  @override
  String get profileTileNotifications => 'Notifications';

  @override
  String get profileTilePrivacy => 'Privacy & data';

  @override
  String get profileTileHelp => 'Help & support';

  @override
  String get profileTileAbout => 'About DiGA LAB';

  @override
  String get profileTileComingSoon => 'Coming soon';

  @override
  String get profileTilePersonalDetailsDesc =>
      'Name, specialty, and institution';

  @override
  String get profileTileNotificationsDesc =>
      'Module updates, streaks, and digests';

  @override
  String get profileTilePrivacyDesc => 'Export data and privacy controls';

  @override
  String get profileTileHelpDesc => 'FAQ, guides, and contact support';

  @override
  String get profileComingSoonSnack =>
      'This option will be available in a future update.';

  @override
  String get profilePersonalSubtitle =>
      'Keep your professional profile up to date for certificates and progress tracking.';

  @override
  String get profilePersonalNameLabel => 'Display name';

  @override
  String get profilePersonalSpecialtyLabel => 'Specialty';

  @override
  String get profilePersonalInstitutionLabel => 'Institution / practice';

  @override
  String get profilePersonalLicenseLabel => 'Medical license (optional)';

  @override
  String get profilePersonalSpecialtyDefault => 'General practice';

  @override
  String get profilePersonalEmailDemo => 'demo@digalab.local';

  @override
  String get profilePersonalSaveCta => 'Save changes';

  @override
  String get profilePersonalSavedSnack =>
      'Profile details saved on this device.';

  @override
  String get profileNotificationsSubtitle =>
      'Choose which learning updates and reminders you receive.';

  @override
  String get profileNotificationsBannerTitle => 'Stay on track';

  @override
  String get profileNotificationsBannerBody =>
      'Turn on module and streak alerts so you do not miss new scenarios or daily practice goals.';

  @override
  String get profileNotifModuleUpdates => 'Module updates';

  @override
  String get profileNotifModuleUpdatesDesc =>
      'New scenarios, revised content, and completion milestones.';

  @override
  String get profileNotifStreak => 'Streak reminders';

  @override
  String get profileNotifStreakDesc =>
      'Gentle nudge when your daily learning streak is at risk.';

  @override
  String get profileNotifWeeklyDigest => 'Weekly progress digest';

  @override
  String get profileNotifWeeklyDigestDesc =>
      'Summary of XP, modules completed, and weak areas.';

  @override
  String get profileNotifEmail => 'Email summaries';

  @override
  String get profileNotifEmailDesc =>
      'Optional weekly email when cloud sign-in is enabled.';

  @override
  String get profileNotifProduct => 'Product updates';

  @override
  String get profileNotifProductDesc =>
      'New features, research tips, and DiGA LAB announcements.';

  @override
  String get profilePrivacySubtitle =>
      'You control your learning data. This educational app does not replace clinical record systems.';

  @override
  String get profilePrivacyBannerTitle => 'Educational data only';

  @override
  String get profilePrivacyBannerBody =>
      'Simulation answers and progress are stored for learning purposes. No patient health data is collected in DiGA LAB.';

  @override
  String get profilePrivacyDataBody =>
      'DiGA LAB processes account identifiers, module progress, quiz scores, and gamification metrics. Data may be stored locally in demo mode or synced when Firebase is configured. You can request export or deletion when backend services are connected.';

  @override
  String get profilePrivacyExportTitle => 'Export my data';

  @override
  String get profilePrivacyExportDesc =>
      'Download a copy of your learning history (JSON).';

  @override
  String get profilePrivacyExportSnack =>
      'Export will be available when cloud sync is enabled.';

  @override
  String get profilePrivacyActivityTitle => 'Activity log';

  @override
  String get profilePrivacyActivityDesc =>
      'Recent sign-ins and module sessions on this device.';

  @override
  String get profilePrivacyActivitySnack =>
      'Activity log is available in connected mode only.';

  @override
  String get profilePrivacyDeleteTitle => 'Delete account data';

  @override
  String get profilePrivacyDeleteDesc =>
      'Remove progress and profile from this device or cloud.';

  @override
  String get profilePrivacyDeleteDialogTitle => 'Delete learning data?';

  @override
  String get profilePrivacyDeleteDialogBody =>
      'This removes your progress, XP, and saved preferences. This action cannot be undone in demo mode.';

  @override
  String get profilePrivacyCancel => 'Cancel';

  @override
  String get profilePrivacyDeleteConfirm => 'Delete';

  @override
  String get profilePrivacyDeleteDemoSnack =>
      'Demo data cleared on this device.';

  @override
  String get profileHelpSubtitle =>
      'Quick answers and ways to reach the DiGA LAB team.';

  @override
  String get profileHelpGuideTitle => 'Getting started guide';

  @override
  String get profileHelpGuideDesc => 'How modules, simulations, and XP work.';

  @override
  String get profileHelpGuideSnack =>
      'Opening the guide — available in the next content release.';

  @override
  String get profileHelpEmailTitle => 'Email support';

  @override
  String get profileHelpEmailValue => 'support@digalab.example';

  @override
  String get profileHelpEmailSnack =>
      'Support email copied to clipboard (demo).';

  @override
  String get profileHelpBugTitle => 'Report an issue';

  @override
  String get profileHelpBugDesc => 'Describe a bug or content correction.';

  @override
  String get profileHelpBugSnack =>
      'Issue report form — coming with cloud backend.';

  @override
  String get profileHelpFaqTitle => 'Frequently asked questions';

  @override
  String get profileHelpFaq1Q => 'Is DiGA LAB a certified medical device?';

  @override
  String get profileHelpFaq1A =>
      'No. DiGA LAB is an educational simulation for prescribers. Always verify DiGA product information, indications, and payer rules before clinical use.';

  @override
  String get profileHelpFaq2Q => 'Does my progress sync across devices?';

  @override
  String get profileHelpFaq2A =>
      'In demo or local mode, progress stays on this device. When you sign in with a connected account, progress can sync via Firebase.';

  @override
  String get profileHelpFaq3Q => 'How is XP calculated?';

  @override
  String get profileHelpFaq3A =>
      'You earn XP for completing modules, high quiz scores, first-attempt success, and maintaining learning streaks. Levels unlock badges and recommendations on your dashboard.';

  @override
  String profileVersionLine(String version, String buildNumber) {
    return 'Version $version · Build $buildNumber';
  }

  @override
  String get profileAppStatusLabel => 'Status';

  @override
  String get profileEnvironmentDemo => 'Demo';

  @override
  String get profileEnvironmentConnected => 'Connected';

  @override
  String get profileEnvironmentLocal => 'Local';

  @override
  String get profileSignOutHint =>
      'You will return to the sign-in screen. Your learning progress in this demo is kept on this device.';

  @override
  String get profileAboutLegalese =>
      'Educational simulation only — not a clinical decision support system.';

  @override
  String get profileAboutBody =>
      'DiGA LAB helps clinicians practise prescribing workflows for digital health applications (DiGAs). Always verify current product information, payer rules, and local regulations before clinical use.';

  @override
  String get errorRouteTitle => 'Error';

  @override
  String errorUnknownRoute(String uri) {
    return 'Route not found:\n$uri';
  }
}
