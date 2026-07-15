import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_de.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('de'),
    Locale('en'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'DiGA LAB'**
  String get appTitle;

  /// No description provided for @splashLoading.
  ///
  /// In en, this message translates to:
  /// **'Loading…'**
  String get splashLoading;

  /// No description provided for @loginTitle.
  ///
  /// In en, this message translates to:
  /// **'Sign in'**
  String get loginTitle;

  /// No description provided for @loginHeadline.
  ///
  /// In en, this message translates to:
  /// **'DiGA LAB'**
  String get loginHeadline;

  /// No description provided for @loginSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Educational simulation for prescribing Digital Health Applications (not a clinical tool).'**
  String get loginSubtitle;

  /// No description provided for @loginContinueDemo.
  ///
  /// In en, this message translates to:
  /// **'Continue (demo)'**
  String get loginContinueDemo;

  /// No description provided for @loginContinueWithoutAuth.
  ///
  /// In en, this message translates to:
  /// **'Continue without sign-in (MVP)'**
  String get loginContinueWithoutAuth;

  /// No description provided for @authEmailLabel.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get authEmailLabel;

  /// No description provided for @authPasswordLabel.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get authPasswordLabel;

  /// No description provided for @authPasswordConfirmLabel.
  ///
  /// In en, this message translates to:
  /// **'Confirm password'**
  String get authPasswordConfirmLabel;

  /// No description provided for @authDisplayNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Display name (optional)'**
  String get authDisplayNameLabel;

  /// No description provided for @authSignInCta.
  ///
  /// In en, this message translates to:
  /// **'Sign in'**
  String get authSignInCta;

  /// No description provided for @authCreateAccountCta.
  ///
  /// In en, this message translates to:
  /// **'Create account'**
  String get authCreateAccountCta;

  /// No description provided for @authRegisterTitle.
  ///
  /// In en, this message translates to:
  /// **'Create account'**
  String get authRegisterTitle;

  /// No description provided for @authForgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot password?'**
  String get authForgotPassword;

  /// No description provided for @authNoAccountLink.
  ///
  /// In en, this message translates to:
  /// **'No account yet? Register'**
  String get authNoAccountLink;

  /// No description provided for @authHaveAccountLink.
  ///
  /// In en, this message translates to:
  /// **'Already have an account? Sign in'**
  String get authHaveAccountLink;

  /// No description provided for @authSendReset.
  ///
  /// In en, this message translates to:
  /// **'Send reset link'**
  String get authSendReset;

  /// No description provided for @authResetSent.
  ///
  /// In en, this message translates to:
  /// **'If an account exists for this email, a reset link has been sent.'**
  String get authResetSent;

  /// No description provided for @validationEmailRequired.
  ///
  /// In en, this message translates to:
  /// **'Please enter your email.'**
  String get validationEmailRequired;

  /// No description provided for @validationEmailInvalid.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email address.'**
  String get validationEmailInvalid;

  /// No description provided for @validationPasswordRequired.
  ///
  /// In en, this message translates to:
  /// **'Please enter your password.'**
  String get validationPasswordRequired;

  /// No description provided for @validationPasswordMin.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 8 characters.'**
  String get validationPasswordMin;

  /// No description provided for @validationPasswordMismatch.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match.'**
  String get validationPasswordMismatch;

  /// No description provided for @demoContinueButton.
  ///
  /// In en, this message translates to:
  /// **'Continue without Firebase (dev / desktop)'**
  String get demoContinueButton;

  /// No description provided for @authSignOut.
  ///
  /// In en, this message translates to:
  /// **'Sign out'**
  String get authSignOut;

  /// No description provided for @authSignedInAs.
  ///
  /// In en, this message translates to:
  /// **'Signed in as {email}'**
  String authSignedInAs(String email);

  /// No description provided for @authDemoBanner.
  ///
  /// In en, this message translates to:
  /// **'Demo mode (no Firebase on this device).'**
  String get authDemoBanner;

  /// No description provided for @authErrorGeneric.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong. Please try again.'**
  String get authErrorGeneric;

  /// No description provided for @authSignInGoogle.
  ///
  /// In en, this message translates to:
  /// **'Continue with Google'**
  String get authSignInGoogle;

  /// No description provided for @authOrContinueWith.
  ///
  /// In en, this message translates to:
  /// **'or'**
  String get authOrContinueWith;

  /// No description provided for @authErrorEmailInUse.
  ///
  /// In en, this message translates to:
  /// **'This email is already registered. Try signing in instead.'**
  String get authErrorEmailInUse;

  /// No description provided for @authErrorWrongPassword.
  ///
  /// In en, this message translates to:
  /// **'Incorrect email or password.'**
  String get authErrorWrongPassword;

  /// No description provided for @authErrorUserNotFound.
  ///
  /// In en, this message translates to:
  /// **'No account found for this email.'**
  String get authErrorUserNotFound;

  /// No description provided for @authErrorInvalidEmail.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email address.'**
  String get authErrorInvalidEmail;

  /// No description provided for @authErrorWeakPassword.
  ///
  /// In en, this message translates to:
  /// **'Password is too weak. Use at least 8 characters.'**
  String get authErrorWeakPassword;

  /// No description provided for @authErrorTooManyRequests.
  ///
  /// In en, this message translates to:
  /// **'Too many attempts. Please wait and try again.'**
  String get authErrorTooManyRequests;

  /// No description provided for @authErrorNetwork.
  ///
  /// In en, this message translates to:
  /// **'Network error. Check your connection and try again.'**
  String get authErrorNetwork;

  /// No description provided for @authErrorGoogleCancelled.
  ///
  /// In en, this message translates to:
  /// **'Google sign-in was cancelled.'**
  String get authErrorGoogleCancelled;

  /// No description provided for @authFirebaseWebSetup.
  ///
  /// In en, this message translates to:
  /// **'Add your Web app ID in Firebase Console → Project settings → Your apps → Web, then paste the appId into lib/firebase_options.dart.'**
  String get authFirebaseWebSetup;

  /// No description provided for @aiReportTitle.
  ///
  /// In en, this message translates to:
  /// **'AI learning report'**
  String get aiReportTitle;

  /// No description provided for @aiReportSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Personalized coaching from your exam answers'**
  String get aiReportSubtitle;

  /// No description provided for @aiReportWeakAreas.
  ///
  /// In en, this message translates to:
  /// **'Focus areas'**
  String get aiReportWeakAreas;

  /// No description provided for @aiReportFocusTitle.
  ///
  /// In en, this message translates to:
  /// **'Missed items to review'**
  String get aiReportFocusTitle;

  /// No description provided for @aiReportTipsTitle.
  ///
  /// In en, this message translates to:
  /// **'Teaching tips'**
  String get aiReportTipsTitle;

  /// No description provided for @aiReportNextStepsTitle.
  ///
  /// In en, this message translates to:
  /// **'Suggested next steps'**
  String get aiReportNextStepsTitle;

  /// No description provided for @aiReportSubmitCta.
  ///
  /// In en, this message translates to:
  /// **'Submit learning report'**
  String get aiReportSubmitCta;

  /// No description provided for @aiReportSubmitted.
  ///
  /// In en, this message translates to:
  /// **'Learning report submitted'**
  String get aiReportSubmitted;

  /// No description provided for @aiReportWeakPhaseGeneral.
  ///
  /// In en, this message translates to:
  /// **'Review missed rationales carefully'**
  String get aiReportWeakPhaseGeneral;

  /// No description provided for @aiReportTipPerfect1.
  ///
  /// In en, this message translates to:
  /// **'Strong indication and safety reasoning — keep documenting baselines explicitly.'**
  String get aiReportTipPerfect1;

  /// No description provided for @aiReportTipPerfect2.
  ///
  /// In en, this message translates to:
  /// **'Try the next scenario to stretch follow-up and adherence coaching.'**
  String get aiReportTipPerfect2;

  /// No description provided for @aiReportTipReviewWrong.
  ///
  /// In en, this message translates to:
  /// **'Re-read rationales for missed items before moving on.'**
  String get aiReportTipReviewWrong;

  /// No description provided for @aiReportTipDiagnose.
  ///
  /// In en, this message translates to:
  /// **'Tighten indication fit and red-flag exclusion before prescribing.'**
  String get aiReportTipDiagnose;

  /// No description provided for @aiReportTipPrescribe.
  ///
  /// In en, this message translates to:
  /// **'Link DiGA choice to goals, exclusions, and patient capacity.'**
  String get aiReportTipPrescribe;

  /// No description provided for @aiReportTipFollowUp.
  ///
  /// In en, this message translates to:
  /// **'Make follow-up timing and stop rules explicit in your plan.'**
  String get aiReportTipFollowUp;

  /// No description provided for @aiReportTipDocumentation.
  ///
  /// In en, this message translates to:
  /// **'Document diagnosis, rationale, goals, and review date as a mini chart note.'**
  String get aiReportTipDocumentation;

  /// No description provided for @aiReportNextRetry.
  ///
  /// In en, this message translates to:
  /// **'Retake this scenario after reviewing the focus items.'**
  String get aiReportNextRetry;

  /// No description provided for @aiReportNextReviewCompanion.
  ///
  /// In en, this message translates to:
  /// **'Open Prescription Companion and check the documentation checklist.'**
  String get aiReportNextReviewCompanion;

  /// No description provided for @aiReportNextContinueScenarios.
  ///
  /// In en, this message translates to:
  /// **'Continue to the next unlocked scenario when ready.'**
  String get aiReportNextContinueScenarios;

  /// No description provided for @aiReportSummaryExcellent.
  ///
  /// In en, this message translates to:
  /// **'Excellent exam ({score}%). Your pathway matches key DiGA prescribing standards.'**
  String aiReportSummaryExcellent(int score);

  /// No description provided for @aiReportSummaryPassed.
  ///
  /// In en, this message translates to:
  /// **'You passed with {score}% and missed {wrongCount} item(s). Strengthen the focus areas below, then continue.'**
  String aiReportSummaryPassed(int score, int wrongCount);

  /// No description provided for @aiReportSummaryFailed.
  ///
  /// In en, this message translates to:
  /// **'Score {score}% — below the pass mark. Review the {wrongCount} missed item(s) and retry when ready.'**
  String aiReportSummaryFailed(int score, int wrongCount);

  /// No description provided for @navHome.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get navHome;

  /// No description provided for @navModules.
  ///
  /// In en, this message translates to:
  /// **'Modules'**
  String get navModules;

  /// No description provided for @navCompanion.
  ///
  /// In en, this message translates to:
  /// **'Companion'**
  String get navCompanion;

  /// No description provided for @navProgress.
  ///
  /// In en, this message translates to:
  /// **'Progress'**
  String get navProgress;

  /// No description provided for @navProfile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get navProfile;

  /// No description provided for @homeTitle.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get homeTitle;

  /// No description provided for @homeBodyPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'Dashboard (MVP placeholder)'**
  String get homeBodyPlaceholder;

  /// No description provided for @homeGreetingMorning.
  ///
  /// In en, this message translates to:
  /// **'Good morning'**
  String get homeGreetingMorning;

  /// No description provided for @homeGreetingAfternoon.
  ///
  /// In en, this message translates to:
  /// **'Good afternoon'**
  String get homeGreetingAfternoon;

  /// No description provided for @homeGreetingEvening.
  ///
  /// In en, this message translates to:
  /// **'Good evening'**
  String get homeGreetingEvening;

  /// No description provided for @homeDoctorFallback.
  ///
  /// In en, this message translates to:
  /// **'Doctor'**
  String get homeDoctorFallback;

  /// No description provided for @homeDashboardSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Keep your DiGA prescribing skills sharp with short simulations and trusted reference content.'**
  String get homeDashboardSubtitle;

  /// No description provided for @homeContinueTitle.
  ///
  /// In en, this message translates to:
  /// **'Continue learning'**
  String get homeContinueTitle;

  /// No description provided for @homeContinueModule.
  ///
  /// In en, this message translates to:
  /// **'Vivira'**
  String get homeContinueModule;

  /// No description provided for @homeContinuePhase.
  ///
  /// In en, this message translates to:
  /// **'Phase 2 · Prescribing'**
  String get homeContinuePhase;

  /// No description provided for @homeContinueHint.
  ///
  /// In en, this message translates to:
  /// **'Pick up where you left off — your progress is saved.'**
  String get homeContinueHint;

  /// No description provided for @homeContinueCta.
  ///
  /// In en, this message translates to:
  /// **'Resume'**
  String get homeContinueCta;

  /// No description provided for @homeStatsTitle.
  ///
  /// In en, this message translates to:
  /// **'Your overview'**
  String get homeStatsTitle;

  /// No description provided for @homeMetricModules.
  ///
  /// In en, this message translates to:
  /// **'Modules done'**
  String get homeMetricModules;

  /// No description provided for @homeMetricAccuracy.
  ///
  /// In en, this message translates to:
  /// **'Avg. accuracy'**
  String get homeMetricAccuracy;

  /// No description provided for @homeMetricStreak.
  ///
  /// In en, this message translates to:
  /// **'Week streak'**
  String get homeMetricStreak;

  /// No description provided for @homeSectionRecommended.
  ///
  /// In en, this message translates to:
  /// **'Recommended for you'**
  String get homeSectionRecommended;

  /// No description provided for @homeSectionRecent.
  ///
  /// In en, this message translates to:
  /// **'Recent activity'**
  String get homeSectionRecent;

  /// No description provided for @homeSeeModules.
  ///
  /// In en, this message translates to:
  /// **'See all'**
  String get homeSeeModules;

  /// No description provided for @homeRecentItem1Title.
  ///
  /// In en, this message translates to:
  /// **'Completed simulation'**
  String get homeRecentItem1Title;

  /// No description provided for @homeRecentItem1Subtitle.
  ///
  /// In en, this message translates to:
  /// **'Kalmeda · Score 88%'**
  String get homeRecentItem1Subtitle;

  /// No description provided for @homeRecentItem2Title.
  ///
  /// In en, this message translates to:
  /// **'Companion reviewed'**
  String get homeRecentItem2Title;

  /// No description provided for @homeRecentItem2Subtitle.
  ///
  /// In en, this message translates to:
  /// **'Vivira · Documentation'**
  String get homeRecentItem2Subtitle;

  /// No description provided for @homeEmptyActivityTitle.
  ///
  /// In en, this message translates to:
  /// **'No recent activity yet'**
  String get homeEmptyActivityTitle;

  /// No description provided for @homeEmptyActivityBody.
  ///
  /// In en, this message translates to:
  /// **'Start a module to see your simulations and reviews show up here.'**
  String get homeEmptyActivityBody;

  /// No description provided for @homeEmptyCta.
  ///
  /// In en, this message translates to:
  /// **'Browse modules'**
  String get homeEmptyCta;

  /// No description provided for @homeDuration12.
  ///
  /// In en, this message translates to:
  /// **'12 min'**
  String get homeDuration12;

  /// No description provided for @homeDuration20.
  ///
  /// In en, this message translates to:
  /// **'20 min'**
  String get homeDuration20;

  /// No description provided for @homeVerifiedApr2025.
  ///
  /// In en, this message translates to:
  /// **'Verified Apr 2025'**
  String get homeVerifiedApr2025;

  /// No description provided for @homeTagEnt.
  ///
  /// In en, this message translates to:
  /// **'ENT'**
  String get homeTagEnt;

  /// No description provided for @homeTagGp.
  ///
  /// In en, this message translates to:
  /// **'GP'**
  String get homeTagGp;

  /// No description provided for @homeTagPain.
  ///
  /// In en, this message translates to:
  /// **'Pain'**
  String get homeTagPain;

  /// No description provided for @homeModuleDescKalmeda.
  ///
  /// In en, this message translates to:
  /// **'Clinical scenarios: sudden hearing loss red flags, Kalmeda eligibility, and follow-up escalation.'**
  String get homeModuleDescKalmeda;

  /// No description provided for @homeModuleDescVivira.
  ///
  /// In en, this message translates to:
  /// **'Clinical scenarios: cauda equina screening, Vivira indication, and exercise follow-up.'**
  String get homeModuleDescVivira;

  /// No description provided for @homeCtaStart.
  ///
  /// In en, this message translates to:
  /// **'Start'**
  String get homeCtaStart;

  /// No description provided for @homeCtaContinue.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get homeCtaContinue;

  /// No description provided for @modulesTitle.
  ///
  /// In en, this message translates to:
  /// **'DiGA modules'**
  String get modulesTitle;

  /// No description provided for @modulesPageTitle.
  ///
  /// In en, this message translates to:
  /// **'DiGA Modules'**
  String get modulesPageTitle;

  /// No description provided for @modulesPageSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Explore and learn digital health applications'**
  String get modulesPageSubtitle;

  /// No description provided for @modulesSearchHint.
  ///
  /// In en, this message translates to:
  /// **'Search modules, conditions…'**
  String get modulesSearchHint;

  /// No description provided for @modulesFilterAll.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get modulesFilterAll;

  /// No description provided for @modulesFilterEnt.
  ///
  /// In en, this message translates to:
  /// **'ENT'**
  String get modulesFilterEnt;

  /// No description provided for @modulesFilterGp.
  ///
  /// In en, this message translates to:
  /// **'General Practice'**
  String get modulesFilterGp;

  /// No description provided for @modulesFilterPain.
  ///
  /// In en, this message translates to:
  /// **'Pain'**
  String get modulesFilterPain;

  /// No description provided for @modulesFilterMental.
  ///
  /// In en, this message translates to:
  /// **'Mental Health'**
  String get modulesFilterMental;

  /// No description provided for @modulesEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'No modules available yet'**
  String get modulesEmptyTitle;

  /// No description provided for @modulesEmptySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Try adjusting your search or filters — new DiGA learning paths are added regularly.'**
  String get modulesEmptySubtitle;

  /// No description provided for @modulesProgressLabel.
  ///
  /// In en, this message translates to:
  /// **'Your progress'**
  String get modulesProgressLabel;

  /// No description provided for @modulesProgressPercent.
  ///
  /// In en, this message translates to:
  /// **'{percent}%'**
  String modulesProgressPercent(int percent);

  /// No description provided for @moduleDifficultyIntro.
  ///
  /// In en, this message translates to:
  /// **'Intro'**
  String get moduleDifficultyIntro;

  /// No description provided for @moduleDifficultyStandard.
  ///
  /// In en, this message translates to:
  /// **'Standard'**
  String get moduleDifficultyStandard;

  /// No description provided for @moduleVelibraDemo.
  ///
  /// In en, this message translates to:
  /// **'Velibra (demo)'**
  String get moduleVelibraDemo;

  /// No description provided for @moduleVelibraSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Mild depression'**
  String get moduleVelibraSubtitle;

  /// No description provided for @moduleVelibraDesc.
  ///
  /// In en, this message translates to:
  /// **'Depression DiGA scenarios: choosing between apps, bipolar safety screen, severe depression plot twist.'**
  String get moduleVelibraDesc;

  /// No description provided for @moduleInsomniaDemo.
  ///
  /// In en, this message translates to:
  /// **'Insomnia DiGA choice'**
  String get moduleInsomniaDemo;

  /// No description provided for @moduleInsomniaSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Non-organic insomnia (CBT-I)'**
  String get moduleInsomniaSubtitle;

  /// No description provided for @moduleInsomniaDesc.
  ///
  /// In en, this message translates to:
  /// **'Clinical scenarios: Somnio vs HelloBetter Schlafen — shared decision-making and documentation.'**
  String get moduleInsomniaDesc;

  /// No description provided for @moduleCardioDemo.
  ///
  /// In en, this message translates to:
  /// **'CardioCoach (demo)'**
  String get moduleCardioDemo;

  /// No description provided for @moduleCardioSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Hypertension follow-up'**
  String get moduleCardioSubtitle;

  /// No description provided for @moduleCardioDesc.
  ///
  /// In en, this message translates to:
  /// **'Clinical scenarios: BP targets, CardioCoach documentation, and medication + lifestyle follow-up.'**
  String get moduleCardioDesc;

  /// No description provided for @moduleDuration15.
  ///
  /// In en, this message translates to:
  /// **'15 min'**
  String get moduleDuration15;

  /// No description provided for @moduleKalmedaDemo.
  ///
  /// In en, this message translates to:
  /// **'Kalmeda (demo)'**
  String get moduleKalmedaDemo;

  /// No description provided for @moduleKalmedaSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Tinnitus'**
  String get moduleKalmedaSubtitle;

  /// No description provided for @moduleViviraDemo.
  ///
  /// In en, this message translates to:
  /// **'Vivira (demo)'**
  String get moduleViviraDemo;

  /// No description provided for @moduleViviraSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Chronic low back pain'**
  String get moduleViviraSubtitle;

  /// No description provided for @moduleDetailTitle.
  ///
  /// In en, this message translates to:
  /// **'Module: {moduleId}'**
  String moduleDetailTitle(String moduleId);

  /// No description provided for @moduleDetailPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'Module details (placeholder)'**
  String get moduleDetailPlaceholder;

  /// No description provided for @moduleDetailStartSimulation.
  ///
  /// In en, this message translates to:
  /// **'Start simulation'**
  String get moduleDetailStartSimulation;

  /// No description provided for @simulationPhase1Title.
  ///
  /// In en, this message translates to:
  /// **'Phase 1: Diagnosis'**
  String get simulationPhase1Title;

  /// No description provided for @simulationPhase2Title.
  ///
  /// In en, this message translates to:
  /// **'Phase 2: Prescribing'**
  String get simulationPhase2Title;

  /// No description provided for @simulationPhase3Title.
  ///
  /// In en, this message translates to:
  /// **'Phase 3: Follow-up'**
  String get simulationPhase3Title;

  /// No description provided for @simulationResultTitle.
  ///
  /// In en, this message translates to:
  /// **'Result'**
  String get simulationResultTitle;

  /// No description provided for @moduleLabel.
  ///
  /// In en, this message translates to:
  /// **'Module: {moduleId}'**
  String moduleLabel(String moduleId);

  /// No description provided for @simulationNextToPhase2.
  ///
  /// In en, this message translates to:
  /// **'Continue to phase 2'**
  String get simulationNextToPhase2;

  /// No description provided for @simulationNextToPhase3.
  ///
  /// In en, this message translates to:
  /// **'Continue to phase 3'**
  String get simulationNextToPhase3;

  /// No description provided for @simulationToResult.
  ///
  /// In en, this message translates to:
  /// **'View result'**
  String get simulationToResult;

  /// No description provided for @simulationScorePlaceholder.
  ///
  /// In en, this message translates to:
  /// **'Score / feedback (placeholder)'**
  String get simulationScorePlaceholder;

  /// No description provided for @simulationBackToModuleList.
  ///
  /// In en, this message translates to:
  /// **'Back to module list'**
  String get simulationBackToModuleList;

  /// No description provided for @simulationBackToScenarios.
  ///
  /// In en, this message translates to:
  /// **'Back to scenarios'**
  String get simulationBackToScenarios;

  /// No description provided for @quizPhaseDiagnoseShort.
  ///
  /// In en, this message translates to:
  /// **'Diagnosis'**
  String get quizPhaseDiagnoseShort;

  /// No description provided for @quizPhasePrescribeShort.
  ///
  /// In en, this message translates to:
  /// **'Prescribing'**
  String get quizPhasePrescribeShort;

  /// No description provided for @quizPhaseFollowUpShort.
  ///
  /// In en, this message translates to:
  /// **'Follow-up'**
  String get quizPhaseFollowUpShort;

  /// No description provided for @simulationDecisionPoint.
  ///
  /// In en, this message translates to:
  /// **'Decision point'**
  String get simulationDecisionPoint;

  /// No description provided for @simulationCorrectLabel.
  ///
  /// In en, this message translates to:
  /// **'Correct'**
  String get simulationCorrectLabel;

  /// No description provided for @simulationIncorrectLabel.
  ///
  /// In en, this message translates to:
  /// **'Incorrect'**
  String get simulationIncorrectLabel;

  /// No description provided for @simulationYourAnswerLabel.
  ///
  /// In en, this message translates to:
  /// **'Your answer'**
  String get simulationYourAnswerLabel;

  /// No description provided for @simulationCorrectAnswerLabel.
  ///
  /// In en, this message translates to:
  /// **'Correct answer'**
  String get simulationCorrectAnswerLabel;

  /// No description provided for @simulationExplanationLabel.
  ///
  /// In en, this message translates to:
  /// **'Explanation'**
  String get simulationExplanationLabel;

  /// No description provided for @simulationTeachingPearlLabel.
  ///
  /// In en, this message translates to:
  /// **'Teaching pearl'**
  String get simulationTeachingPearlLabel;

  /// No description provided for @simulationNoAnswerRecorded.
  ///
  /// In en, this message translates to:
  /// **'No answer recorded'**
  String get simulationNoAnswerRecorded;

  /// No description provided for @simulationXpEarned.
  ///
  /// In en, this message translates to:
  /// **'XP earned'**
  String get simulationXpEarned;

  /// No description provided for @simulationXpEarnedValue.
  ///
  /// In en, this message translates to:
  /// **'+{xp} XP'**
  String simulationXpEarnedValue(int xp);

  /// No description provided for @simulationAnswerReviewTitle.
  ///
  /// In en, this message translates to:
  /// **'Answer review'**
  String get simulationAnswerReviewTitle;

  /// No description provided for @simulationAnswerReviewSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Review your choices, correct answers, and clinical explanations for each phase.'**
  String get simulationAnswerReviewSubtitle;

  /// No description provided for @simulationScoreBreakdown.
  ///
  /// In en, this message translates to:
  /// **'Score breakdown'**
  String get simulationScoreBreakdown;

  /// No description provided for @simulationBadgesUnlocked.
  ///
  /// In en, this message translates to:
  /// **'Badges unlocked'**
  String get simulationBadgesUnlocked;

  /// No description provided for @simulationUnableToLoadResult.
  ///
  /// In en, this message translates to:
  /// **'Unable to load result summary.'**
  String get simulationUnableToLoadResult;

  /// No description provided for @simulationScoreAccuracy.
  ///
  /// In en, this message translates to:
  /// **'Score {score}% | Accuracy {accuracy}%'**
  String simulationScoreAccuracy(int score, int accuracy);

  /// No description provided for @simulationMarks.
  ///
  /// In en, this message translates to:
  /// **'Marks: {marks}'**
  String simulationMarks(String marks);

  /// No description provided for @simulationContinueNextDomain.
  ///
  /// In en, this message translates to:
  /// **'Continue in next domain'**
  String get simulationContinueNextDomain;

  /// No description provided for @simulationContinueNextScenario.
  ///
  /// In en, this message translates to:
  /// **'Continue to next scenario'**
  String get simulationContinueNextScenario;

  /// No description provided for @simulationExamPassedBanner.
  ///
  /// In en, this message translates to:
  /// **'Exam passed! {score}%'**
  String simulationExamPassedBanner(int score);

  /// No description provided for @simulationExamFailedBanner.
  ///
  /// In en, this message translates to:
  /// **'Try again! You scored {score}%'**
  String simulationExamFailedBanner(int score);

  /// No description provided for @simulationSuggestedScenario.
  ///
  /// In en, this message translates to:
  /// **'Suggested scenario: {title}'**
  String simulationSuggestedScenario(String title);

  /// No description provided for @simulationExamTitle.
  ///
  /// In en, this message translates to:
  /// **'Domain exam'**
  String get simulationExamTitle;

  /// No description provided for @simulationExamLoading.
  ///
  /// In en, this message translates to:
  /// **'Preparing your questions…'**
  String get simulationExamLoading;

  /// No description provided for @simulationQuestionProgress.
  ///
  /// In en, this message translates to:
  /// **'Question {current} of {total}'**
  String simulationQuestionProgress(int current, int total);

  /// No description provided for @simulationPreviousQuestion.
  ///
  /// In en, this message translates to:
  /// **'Previous'**
  String get simulationPreviousQuestion;

  /// No description provided for @simulationNextQuestion.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get simulationNextQuestion;

  /// No description provided for @simulationSubmitExam.
  ///
  /// In en, this message translates to:
  /// **'Submit exam'**
  String get simulationSubmitExam;

  /// No description provided for @simulationExamAnsweredCount.
  ///
  /// In en, this message translates to:
  /// **'{answered} of {total} answered'**
  String simulationExamAnsweredCount(int answered, int total);

  /// No description provided for @simulationExamUnansweredWarning.
  ///
  /// In en, this message translates to:
  /// **'Answer all questions before submitting. Use Previous to review skipped items.'**
  String get simulationExamUnansweredWarning;

  /// No description provided for @companionTitle.
  ///
  /// In en, this message translates to:
  /// **'Prescription companion'**
  String get companionTitle;

  /// No description provided for @companionPageTitle.
  ///
  /// In en, this message translates to:
  /// **'Prescription Companion'**
  String get companionPageTitle;

  /// No description provided for @companionPageSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Clinical reference for DiGA prescribing'**
  String get companionPageSubtitle;

  /// No description provided for @companionSelectorLabel.
  ///
  /// In en, this message translates to:
  /// **'Module'**
  String get companionSelectorLabel;

  /// No description provided for @companionChipKalmeda.
  ///
  /// In en, this message translates to:
  /// **'Kalmeda'**
  String get companionChipKalmeda;

  /// No description provided for @companionChipVivira.
  ///
  /// In en, this message translates to:
  /// **'Vivira'**
  String get companionChipVivira;

  /// No description provided for @companionEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'Select a module'**
  String get companionEmptyTitle;

  /// No description provided for @companionEmptyBody.
  ///
  /// In en, this message translates to:
  /// **'Select a module to view prescription details — ICD context, eligibility, documentation, and patient guidance.'**
  String get companionEmptyBody;

  /// No description provided for @companionSectionIcd.
  ///
  /// In en, this message translates to:
  /// **'ICD codes (orientation)'**
  String get companionSectionIcd;

  /// No description provided for @companionSectionEligibility.
  ///
  /// In en, this message translates to:
  /// **'Eligibility criteria'**
  String get companionSectionEligibility;

  /// No description provided for @companionSectionContra.
  ///
  /// In en, this message translates to:
  /// **'Contraindications & cautions'**
  String get companionSectionContra;

  /// No description provided for @companionSectionDoc.
  ///
  /// In en, this message translates to:
  /// **'Documentation requirements'**
  String get companionSectionDoc;

  /// No description provided for @companionSectionPatient.
  ///
  /// In en, this message translates to:
  /// **'Patient guidance'**
  String get companionSectionPatient;

  /// No description provided for @companionSectionInsurance.
  ///
  /// In en, this message translates to:
  /// **'Insurance & billing notes'**
  String get companionSectionInsurance;

  /// No description provided for @companionKalmedaIcdBlock.
  ///
  /// In en, this message translates to:
  /// **'H93.1 — Chronic subjective tinnitus\nH93.A — Somatosensory tinnitus\nF45.3 — Somatoform disorders (if clinically relevant)'**
  String get companionKalmedaIcdBlock;

  /// No description provided for @companionKalmedaEligibilityBlock.
  ///
  /// In en, this message translates to:
  /// **'Educational simulation only — verify current DiGA directory and payer rules before prescribing.\nTinnitus with relevant functional impairment documented in the chart.\nStructured therapy pathway suitable for digital intervention.\nPatient able to use smartphone app and follow instructions.'**
  String get companionKalmedaEligibilityBlock;

  /// No description provided for @companionKalmedaContraBlock.
  ///
  /// In en, this message translates to:
  /// **'Acute treatable causes of tinnitus not yet excluded where required by pathway.\nSevere psychiatric instability without adequate supervision.\nCognitive or language barriers preventing safe app use.'**
  String get companionKalmedaContraBlock;

  /// No description provided for @companionKalmedaDocBlock.
  ///
  /// In en, this message translates to:
  /// **'Indication and baseline symptoms recorded\nPrescription issued with therapy goals\nPatient informed about data protection and follow-up plan\nGKV prescription channel documented where applicable'**
  String get companionKalmedaDocBlock;

  /// No description provided for @companionKalmedaPatientBlock.
  ///
  /// In en, this message translates to:
  /// **'Explain that the DiGA supports structured exercises and education — not emergency care for sudden hearing loss or neurological red flags.\nEncourage consistent app use and define a clear follow-up appointment in primary care.'**
  String get companionKalmedaPatientBlock;

  /// No description provided for @companionKalmedaInsuranceBlock.
  ///
  /// In en, this message translates to:
  /// **'Educational content — confirm eligibility and prescription rules with the patient’s insurer (e.g. GKV digital prescription workflow).'**
  String get companionKalmedaInsuranceBlock;

  /// No description provided for @companionViviraIcdBlock.
  ///
  /// In en, this message translates to:
  /// **'M54.5 — Low back pain\nM54.4 — Lumbago with sciatica\nM51.2 — Disc displacement (when consistent with pathway)'**
  String get companionViviraIcdBlock;

  /// No description provided for @companionViviraEligibilityBlock.
  ///
  /// In en, this message translates to:
  /// **'Chronic non-specific low back pain with guideline-consistent diagnostics.\nPatient suitable for progressive exercise therapy via app.\nAbility to perform home exercises and read instructions.'**
  String get companionViviraEligibilityBlock;

  /// No description provided for @companionViviraContraBlock.
  ///
  /// In en, this message translates to:
  /// **'Red flags requiring urgent in-person evaluation not yet excluded.\nSevere neurological deficit or cauda equina suspicion.\nRecent vertebral fracture or instability without clearance.'**
  String get companionViviraContraBlock;

  /// No description provided for @companionViviraDocBlock.
  ///
  /// In en, this message translates to:
  /// **'Pain history, red-flag assessment, and prior therapies documented\nTherapy goals and exercise tolerance noted\nSide effects and adherence plan discussed\nReturn visit scheduled'**
  String get companionViviraDocBlock;

  /// No description provided for @companionViviraPatientBlock.
  ///
  /// In en, this message translates to:
  /// **'Set expectations: gradual loading, possible temporary soreness, and when to stop and seek care.\nCombine digital therapy with activity goals that fit the patient’s daily routine.'**
  String get companionViviraPatientBlock;

  /// No description provided for @companionViviraInsuranceBlock.
  ///
  /// In en, this message translates to:
  /// **'Educational content — verify coverage and documentation requirements for back-pain DiGAs with the patient’s insurer.'**
  String get companionViviraInsuranceBlock;

  /// No description provided for @companionBodyDefault.
  ///
  /// In en, this message translates to:
  /// **'Reference content (placeholder)'**
  String get companionBodyDefault;

  /// No description provided for @companionBodyFocused.
  ///
  /// In en, this message translates to:
  /// **'Focused: {moduleId}'**
  String companionBodyFocused(String moduleId);

  /// No description provided for @progressTitle.
  ///
  /// In en, this message translates to:
  /// **'Progress'**
  String get progressTitle;

  /// No description provided for @progressPageSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Track your DiGA learning performance'**
  String get progressPageSubtitle;

  /// No description provided for @progressStatModulesDone.
  ///
  /// In en, this message translates to:
  /// **'Modules completed'**
  String get progressStatModulesDone;

  /// No description provided for @progressStatAvgScore.
  ///
  /// In en, this message translates to:
  /// **'Average score'**
  String get progressStatAvgScore;

  /// No description provided for @progressStatAccuracy.
  ///
  /// In en, this message translates to:
  /// **'Accuracy'**
  String get progressStatAccuracy;

  /// No description provided for @progressStatWeeklySessions.
  ///
  /// In en, this message translates to:
  /// **'Sessions this week'**
  String get progressStatWeeklySessions;

  /// No description provided for @progressOverviewTitle.
  ///
  /// In en, this message translates to:
  /// **'Learning path completion'**
  String get progressOverviewTitle;

  /// No description provided for @progressOverviewFraction.
  ///
  /// In en, this message translates to:
  /// **'{completed} of {total} modules completed'**
  String progressOverviewFraction(int completed, int total);

  /// No description provided for @progressOverviewHint.
  ///
  /// In en, this message translates to:
  /// **'Complete all pilot modules to earn a completion badge in this demo.'**
  String get progressOverviewHint;

  /// No description provided for @progressSectionRecent.
  ///
  /// In en, this message translates to:
  /// **'Recent results'**
  String get progressSectionRecent;

  /// No description provided for @progressSectionPerformance.
  ///
  /// In en, this message translates to:
  /// **'Performance by module'**
  String get progressSectionPerformance;

  /// No description provided for @progressSectionTrend.
  ///
  /// In en, this message translates to:
  /// **'Weekly activity'**
  String get progressSectionTrend;

  /// No description provided for @progressTrendCaption.
  ///
  /// In en, this message translates to:
  /// **'Relative study intensity by weekday (illustrative demo, not live analytics).'**
  String get progressTrendCaption;

  /// No description provided for @progressTrendDaysBlock.
  ///
  /// In en, this message translates to:
  /// **'Mon|Tue|Wed|Thu|Fri|Sat|Sun'**
  String get progressTrendDaysBlock;

  /// No description provided for @progressStatusCompleted.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get progressStatusCompleted;

  /// No description provided for @progressStatusInProgress.
  ///
  /// In en, this message translates to:
  /// **'In progress'**
  String get progressStatusInProgress;

  /// No description provided for @progressDateApr8.
  ///
  /// In en, this message translates to:
  /// **'Apr 8, 2025'**
  String get progressDateApr8;

  /// No description provided for @progressDateApr5.
  ///
  /// In en, this message translates to:
  /// **'Apr 5, 2025'**
  String get progressDateApr5;

  /// No description provided for @progressDateMar28.
  ///
  /// In en, this message translates to:
  /// **'Mar 28, 2025'**
  String get progressDateMar28;

  /// No description provided for @progressLastActiveApr8.
  ///
  /// In en, this message translates to:
  /// **'Last active Apr 8, 2025'**
  String get progressLastActiveApr8;

  /// No description provided for @progressLastActiveApr5.
  ///
  /// In en, this message translates to:
  /// **'Last active Apr 5, 2025'**
  String get progressLastActiveApr5;

  /// No description provided for @progressLastActiveMar20.
  ///
  /// In en, this message translates to:
  /// **'Last active Mar 20, 2025'**
  String get progressLastActiveMar20;

  /// No description provided for @progressAttemptsCount.
  ///
  /// In en, this message translates to:
  /// **'{count} attempts'**
  String progressAttemptsCount(int count);

  /// No description provided for @progressEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'No learning activity yet'**
  String get progressEmptyTitle;

  /// No description provided for @progressEmptyBody.
  ///
  /// In en, this message translates to:
  /// **'Complete your first DiGA simulation to see scores, streaks, and weekly trends here.'**
  String get progressEmptyBody;

  /// No description provided for @progressEmptyCta.
  ///
  /// In en, this message translates to:
  /// **'Start your first module'**
  String get progressEmptyCta;

  /// No description provided for @progressBodyPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'Progress (placeholder)'**
  String get progressBodyPlaceholder;

  /// No description provided for @profileTitle.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profileTitle;

  /// No description provided for @profilePageSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Manage your account and preferences'**
  String get profilePageSubtitle;

  /// No description provided for @profileBodyPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'Profile (placeholder)'**
  String get profileBodyPlaceholder;

  /// No description provided for @profileSectionPreferences.
  ///
  /// In en, this message translates to:
  /// **'Preferences'**
  String get profileSectionPreferences;

  /// No description provided for @profileSectionAccount.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get profileSectionAccount;

  /// No description provided for @profileSectionAppInfo.
  ///
  /// In en, this message translates to:
  /// **'App'**
  String get profileSectionAppInfo;

  /// No description provided for @profileRoleDoctor.
  ///
  /// In en, this message translates to:
  /// **'Doctor'**
  String get profileRoleDoctor;

  /// No description provided for @profileDemoDisplayName.
  ///
  /// In en, this message translates to:
  /// **'Demo learner'**
  String get profileDemoDisplayName;

  /// No description provided for @profileLanguageHeading.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get profileLanguageHeading;

  /// No description provided for @profileLanguageDescription.
  ///
  /// In en, this message translates to:
  /// **'Interface language for DiGA LAB (educational content only).'**
  String get profileLanguageDescription;

  /// No description provided for @profileLanguageEnglish.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get profileLanguageEnglish;

  /// No description provided for @profileLanguageGerman.
  ///
  /// In en, this message translates to:
  /// **'German'**
  String get profileLanguageGerman;

  /// No description provided for @profileBannerDemoTitle.
  ///
  /// In en, this message translates to:
  /// **'Demo mode'**
  String get profileBannerDemoTitle;

  /// No description provided for @profileBannerDemoBody.
  ///
  /// In en, this message translates to:
  /// **'You are using DiGA LAB without a full cloud session. Some data may stay on this device only.'**
  String get profileBannerDemoBody;

  /// No description provided for @profileBannerLocalTitle.
  ///
  /// In en, this message translates to:
  /// **'Local session'**
  String get profileBannerLocalTitle;

  /// No description provided for @profileBannerLocalBody.
  ///
  /// In en, this message translates to:
  /// **'Firebase is not available in this build. Continue exploring modules; sign-in will be enabled when cloud services are configured.'**
  String get profileBannerLocalBody;

  /// No description provided for @profileTilePersonalDetails.
  ///
  /// In en, this message translates to:
  /// **'Personal details'**
  String get profileTilePersonalDetails;

  /// No description provided for @profileTileNotifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get profileTileNotifications;

  /// No description provided for @profileTilePrivacy.
  ///
  /// In en, this message translates to:
  /// **'Privacy & data'**
  String get profileTilePrivacy;

  /// No description provided for @profileTileHelp.
  ///
  /// In en, this message translates to:
  /// **'Help & support'**
  String get profileTileHelp;

  /// No description provided for @profileTileAbout.
  ///
  /// In en, this message translates to:
  /// **'About DiGA LAB'**
  String get profileTileAbout;

  /// No description provided for @profileTileComingSoon.
  ///
  /// In en, this message translates to:
  /// **'Coming soon'**
  String get profileTileComingSoon;

  /// No description provided for @profileTilePersonalDetailsDesc.
  ///
  /// In en, this message translates to:
  /// **'Name, specialty, and institution'**
  String get profileTilePersonalDetailsDesc;

  /// No description provided for @profileTileNotificationsDesc.
  ///
  /// In en, this message translates to:
  /// **'Module updates, streaks, and digests'**
  String get profileTileNotificationsDesc;

  /// No description provided for @profileTilePrivacyDesc.
  ///
  /// In en, this message translates to:
  /// **'Export data and privacy controls'**
  String get profileTilePrivacyDesc;

  /// No description provided for @profileTileHelpDesc.
  ///
  /// In en, this message translates to:
  /// **'FAQ, guides, and contact support'**
  String get profileTileHelpDesc;

  /// No description provided for @profileComingSoonSnack.
  ///
  /// In en, this message translates to:
  /// **'This option will be available in a future update.'**
  String get profileComingSoonSnack;

  /// No description provided for @profilePersonalSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Keep your professional profile up to date for certificates and progress tracking.'**
  String get profilePersonalSubtitle;

  /// No description provided for @profilePersonalNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Display name'**
  String get profilePersonalNameLabel;

  /// No description provided for @profilePersonalSpecialtyLabel.
  ///
  /// In en, this message translates to:
  /// **'Specialty'**
  String get profilePersonalSpecialtyLabel;

  /// No description provided for @profilePersonalInstitutionLabel.
  ///
  /// In en, this message translates to:
  /// **'Institution / practice'**
  String get profilePersonalInstitutionLabel;

  /// No description provided for @profilePersonalLicenseLabel.
  ///
  /// In en, this message translates to:
  /// **'Medical license (optional)'**
  String get profilePersonalLicenseLabel;

  /// No description provided for @profilePersonalSpecialtyDefault.
  ///
  /// In en, this message translates to:
  /// **'General practice'**
  String get profilePersonalSpecialtyDefault;

  /// No description provided for @profilePersonalEmailDemo.
  ///
  /// In en, this message translates to:
  /// **'demo@digalab.local'**
  String get profilePersonalEmailDemo;

  /// No description provided for @profilePersonalSaveCta.
  ///
  /// In en, this message translates to:
  /// **'Save changes'**
  String get profilePersonalSaveCta;

  /// No description provided for @profilePersonalSavedSnack.
  ///
  /// In en, this message translates to:
  /// **'Profile details saved on this device.'**
  String get profilePersonalSavedSnack;

  /// No description provided for @profileNotificationsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Choose which learning updates and reminders you receive.'**
  String get profileNotificationsSubtitle;

  /// No description provided for @profileNotificationsBannerTitle.
  ///
  /// In en, this message translates to:
  /// **'Stay on track'**
  String get profileNotificationsBannerTitle;

  /// No description provided for @profileNotificationsBannerBody.
  ///
  /// In en, this message translates to:
  /// **'Turn on module and streak alerts so you do not miss new scenarios or daily practice goals.'**
  String get profileNotificationsBannerBody;

  /// No description provided for @profileNotifModuleUpdates.
  ///
  /// In en, this message translates to:
  /// **'Module updates'**
  String get profileNotifModuleUpdates;

  /// No description provided for @profileNotifModuleUpdatesDesc.
  ///
  /// In en, this message translates to:
  /// **'New scenarios, revised content, and completion milestones.'**
  String get profileNotifModuleUpdatesDesc;

  /// No description provided for @profileNotifStreak.
  ///
  /// In en, this message translates to:
  /// **'Streak reminders'**
  String get profileNotifStreak;

  /// No description provided for @profileNotifStreakDesc.
  ///
  /// In en, this message translates to:
  /// **'Gentle nudge when your daily learning streak is at risk.'**
  String get profileNotifStreakDesc;

  /// No description provided for @profileNotifWeeklyDigest.
  ///
  /// In en, this message translates to:
  /// **'Weekly progress digest'**
  String get profileNotifWeeklyDigest;

  /// No description provided for @profileNotifWeeklyDigestDesc.
  ///
  /// In en, this message translates to:
  /// **'Summary of XP, modules completed, and weak areas.'**
  String get profileNotifWeeklyDigestDesc;

  /// No description provided for @profileNotifEmail.
  ///
  /// In en, this message translates to:
  /// **'Email summaries'**
  String get profileNotifEmail;

  /// No description provided for @profileNotifEmailDesc.
  ///
  /// In en, this message translates to:
  /// **'Optional weekly email when cloud sign-in is enabled.'**
  String get profileNotifEmailDesc;

  /// No description provided for @profileNotifProduct.
  ///
  /// In en, this message translates to:
  /// **'Product updates'**
  String get profileNotifProduct;

  /// No description provided for @profileNotifProductDesc.
  ///
  /// In en, this message translates to:
  /// **'New features, research tips, and DiGA LAB announcements.'**
  String get profileNotifProductDesc;

  /// No description provided for @profilePrivacySubtitle.
  ///
  /// In en, this message translates to:
  /// **'You control your learning data. This educational app does not replace clinical record systems.'**
  String get profilePrivacySubtitle;

  /// No description provided for @profilePrivacyBannerTitle.
  ///
  /// In en, this message translates to:
  /// **'Educational data only'**
  String get profilePrivacyBannerTitle;

  /// No description provided for @profilePrivacyBannerBody.
  ///
  /// In en, this message translates to:
  /// **'Simulation answers and progress are stored for learning purposes. No patient health data is collected in DiGA LAB.'**
  String get profilePrivacyBannerBody;

  /// No description provided for @profilePrivacyDataBody.
  ///
  /// In en, this message translates to:
  /// **'DiGA LAB processes account identifiers, module progress, quiz scores, and gamification metrics. Data may be stored locally in demo mode or synced when Firebase is configured. You can request export or deletion when backend services are connected.'**
  String get profilePrivacyDataBody;

  /// No description provided for @profilePrivacyExportTitle.
  ///
  /// In en, this message translates to:
  /// **'Export my data'**
  String get profilePrivacyExportTitle;

  /// No description provided for @profilePrivacyExportDesc.
  ///
  /// In en, this message translates to:
  /// **'Download a copy of your learning history (JSON).'**
  String get profilePrivacyExportDesc;

  /// No description provided for @profilePrivacyExportSnack.
  ///
  /// In en, this message translates to:
  /// **'Export will be available when cloud sync is enabled.'**
  String get profilePrivacyExportSnack;

  /// No description provided for @profilePrivacyActivityTitle.
  ///
  /// In en, this message translates to:
  /// **'Activity log'**
  String get profilePrivacyActivityTitle;

  /// No description provided for @profilePrivacyActivityDesc.
  ///
  /// In en, this message translates to:
  /// **'Recent sign-ins and module sessions on this device.'**
  String get profilePrivacyActivityDesc;

  /// No description provided for @profilePrivacyActivitySnack.
  ///
  /// In en, this message translates to:
  /// **'Activity log is available in connected mode only.'**
  String get profilePrivacyActivitySnack;

  /// No description provided for @profilePrivacyDeleteTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete account data'**
  String get profilePrivacyDeleteTitle;

  /// No description provided for @profilePrivacyDeleteDesc.
  ///
  /// In en, this message translates to:
  /// **'Remove progress and profile from this device or cloud.'**
  String get profilePrivacyDeleteDesc;

  /// No description provided for @profilePrivacyDeleteDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete learning data?'**
  String get profilePrivacyDeleteDialogTitle;

  /// No description provided for @profilePrivacyDeleteDialogBody.
  ///
  /// In en, this message translates to:
  /// **'This removes your progress, XP, and saved preferences. This action cannot be undone in demo mode.'**
  String get profilePrivacyDeleteDialogBody;

  /// No description provided for @profilePrivacyCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get profilePrivacyCancel;

  /// No description provided for @profilePrivacyDeleteConfirm.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get profilePrivacyDeleteConfirm;

  /// No description provided for @profilePrivacyDeleteDemoSnack.
  ///
  /// In en, this message translates to:
  /// **'Demo data cleared on this device.'**
  String get profilePrivacyDeleteDemoSnack;

  /// No description provided for @profileHelpSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Quick answers and ways to reach the DiGA LAB team.'**
  String get profileHelpSubtitle;

  /// No description provided for @profileHelpGuideTitle.
  ///
  /// In en, this message translates to:
  /// **'Getting started guide'**
  String get profileHelpGuideTitle;

  /// No description provided for @profileHelpGuideDesc.
  ///
  /// In en, this message translates to:
  /// **'How modules, simulations, and XP work.'**
  String get profileHelpGuideDesc;

  /// No description provided for @profileHelpGuideSnack.
  ///
  /// In en, this message translates to:
  /// **'Opening the guide — available in the next content release.'**
  String get profileHelpGuideSnack;

  /// No description provided for @profileHelpEmailTitle.
  ///
  /// In en, this message translates to:
  /// **'Email support'**
  String get profileHelpEmailTitle;

  /// No description provided for @profileHelpEmailValue.
  ///
  /// In en, this message translates to:
  /// **'support@digalab.example'**
  String get profileHelpEmailValue;

  /// No description provided for @profileHelpEmailSnack.
  ///
  /// In en, this message translates to:
  /// **'Support email copied to clipboard (demo).'**
  String get profileHelpEmailSnack;

  /// No description provided for @profileHelpBugTitle.
  ///
  /// In en, this message translates to:
  /// **'Report an issue'**
  String get profileHelpBugTitle;

  /// No description provided for @profileHelpBugDesc.
  ///
  /// In en, this message translates to:
  /// **'Describe a bug or content correction.'**
  String get profileHelpBugDesc;

  /// No description provided for @profileHelpBugSnack.
  ///
  /// In en, this message translates to:
  /// **'Issue report form — coming with cloud backend.'**
  String get profileHelpBugSnack;

  /// No description provided for @profileHelpFaqTitle.
  ///
  /// In en, this message translates to:
  /// **'Frequently asked questions'**
  String get profileHelpFaqTitle;

  /// No description provided for @profileHelpFaq1Q.
  ///
  /// In en, this message translates to:
  /// **'Is DiGA LAB a certified medical device?'**
  String get profileHelpFaq1Q;

  /// No description provided for @profileHelpFaq1A.
  ///
  /// In en, this message translates to:
  /// **'No. DiGA LAB is an educational simulation for prescribers. Always verify DiGA product information, indications, and payer rules before clinical use.'**
  String get profileHelpFaq1A;

  /// No description provided for @profileHelpFaq2Q.
  ///
  /// In en, this message translates to:
  /// **'Does my progress sync across devices?'**
  String get profileHelpFaq2Q;

  /// No description provided for @profileHelpFaq2A.
  ///
  /// In en, this message translates to:
  /// **'In demo or local mode, progress stays on this device. When you sign in with a connected account, progress can sync via Firebase.'**
  String get profileHelpFaq2A;

  /// No description provided for @profileHelpFaq3Q.
  ///
  /// In en, this message translates to:
  /// **'How is XP calculated?'**
  String get profileHelpFaq3Q;

  /// No description provided for @profileHelpFaq3A.
  ///
  /// In en, this message translates to:
  /// **'You earn XP for completing modules, high quiz scores, first-attempt success, and maintaining learning streaks. Levels unlock badges and recommendations on your dashboard.'**
  String get profileHelpFaq3A;

  /// No description provided for @profileVersionLine.
  ///
  /// In en, this message translates to:
  /// **'Version {version} · Build {buildNumber}'**
  String profileVersionLine(String version, String buildNumber);

  /// No description provided for @profileAppStatusLabel.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get profileAppStatusLabel;

  /// No description provided for @profileEnvironmentDemo.
  ///
  /// In en, this message translates to:
  /// **'Demo'**
  String get profileEnvironmentDemo;

  /// No description provided for @profileEnvironmentConnected.
  ///
  /// In en, this message translates to:
  /// **'Connected'**
  String get profileEnvironmentConnected;

  /// No description provided for @profileEnvironmentLocal.
  ///
  /// In en, this message translates to:
  /// **'Local'**
  String get profileEnvironmentLocal;

  /// No description provided for @profileSignOutHint.
  ///
  /// In en, this message translates to:
  /// **'You will return to the sign-in screen. Your learning progress in this demo is kept on this device.'**
  String get profileSignOutHint;

  /// No description provided for @profileAboutLegalese.
  ///
  /// In en, this message translates to:
  /// **'Educational simulation only — not a clinical decision support system.'**
  String get profileAboutLegalese;

  /// No description provided for @profileAboutBody.
  ///
  /// In en, this message translates to:
  /// **'DiGA LAB helps clinicians practise prescribing workflows for digital health applications (DiGAs). Always verify current product information, payer rules, and local regulations before clinical use.'**
  String get profileAboutBody;

  /// No description provided for @errorRouteTitle.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get errorRouteTitle;

  /// No description provided for @errorUnknownRoute.
  ///
  /// In en, this message translates to:
  /// **'Route not found:\n{uri}'**
  String errorUnknownRoute(String uri);
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['de', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
