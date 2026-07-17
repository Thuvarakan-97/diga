// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get appTitle => 'DiGA LAB';

  @override
  String get splashLoading => 'Lade …';

  @override
  String get loginTitle => 'Anmeldung';

  @override
  String get loginHeadline => 'DiGA LAB';

  @override
  String get loginSubtitle =>
      'Bildungssimulation zur Verordnung von Digitalen Gesundheitsanwendungen (DiGA) – kein klinisches Werkzeug.';

  @override
  String get loginContinueDemo => 'Weiter (Demo)';

  @override
  String get loginContinueWithoutAuth => 'Ohne Anmeldung (MVP)';

  @override
  String get authEmailLabel => 'E-Mail';

  @override
  String get authPasswordLabel => 'Passwort';

  @override
  String get authPasswordConfirmLabel => 'Passwort bestätigen';

  @override
  String get authDisplayNameLabel => 'Anzeigename (optional)';

  @override
  String get authSignInCta => 'Anmelden';

  @override
  String get authCreateAccountCta => 'Konto erstellen';

  @override
  String get authRegisterTitle => 'Konto erstellen';

  @override
  String get authForgotPassword => 'Passwort vergessen?';

  @override
  String get authNoAccountLink => 'Noch kein Konto? Registrieren';

  @override
  String get authHaveAccountLink => 'Bereits ein Konto? Anmelden';

  @override
  String get authSendReset => 'Link zum Zurücksetzen senden';

  @override
  String get authResetSent =>
      'Wenn ein Konto mit dieser E-Mail existiert, wurde ein Link zum Zurücksetzen gesendet.';

  @override
  String get validationEmailRequired => 'Bitte E-Mail eingeben.';

  @override
  String get validationEmailInvalid =>
      'Bitte eine gültige E-Mail-Adresse eingeben.';

  @override
  String get validationPasswordRequired => 'Bitte Passwort eingeben.';

  @override
  String get validationPasswordMin =>
      'Passwort muss mindestens 8 Zeichen haben.';

  @override
  String get validationPasswordMismatch => 'Passwörter stimmen nicht überein.';

  @override
  String get demoContinueButton =>
      'Ohne Firebase fortfahren (Entwicklung / Desktop)';

  @override
  String get authSignOut => 'Abmelden';

  @override
  String authSignedInAs(String email) {
    return 'Angemeldet als $email';
  }

  @override
  String get authDemoBanner => 'Demo-Modus (kein Firebase auf diesem Gerät).';

  @override
  String get authErrorGeneric =>
      'Etwas ist schiefgelaufen. Bitte erneut versuchen.';

  @override
  String get authSignInGoogle => 'Mit Google fortfahren';

  @override
  String get authOrContinueWith => 'oder';

  @override
  String get authErrorEmailInUse =>
      'Diese E-Mail ist bereits registriert. Bitte anmelden.';

  @override
  String get authErrorWrongPassword => 'E-Mail oder Passwort ist falsch.';

  @override
  String get authErrorUserNotFound => 'Kein Konto mit dieser E-Mail gefunden.';

  @override
  String get authErrorInvalidEmail =>
      'Bitte eine gültige E-Mail-Adresse eingeben.';

  @override
  String get authErrorWeakPassword =>
      'Passwort zu schwach. Mindestens 8 Zeichen verwenden.';

  @override
  String get authErrorTooManyRequests =>
      'Zu viele Versuche. Bitte warten und erneut versuchen.';

  @override
  String get authErrorNetwork =>
      'Netzwerkfehler. Verbindung prüfen und erneut versuchen.';

  @override
  String get authErrorGoogleCancelled => 'Google-Anmeldung abgebrochen.';

  @override
  String get authFirebaseWebSetup =>
      'Web-App-ID in der Firebase Console hinzufügen (Projekteinstellungen → Ihre Apps → Web) und appId in lib/firebase_options.dart eintragen.';

  @override
  String get aiReportTitle => 'KI-Lernbericht';

  @override
  String get aiReportSubtitle =>
      'Persönliches Coaching basierend auf Ihren Prüfungsantworten';

  @override
  String get aiReportWeakAreas => 'Schwerpunkte';

  @override
  String get aiReportFocusTitle => 'Fehlerhafte Items zum Wiederholen';

  @override
  String get aiReportTipsTitle => 'Lerntipps';

  @override
  String get aiReportNextStepsTitle => 'Empfohlene nächste Schritte';

  @override
  String get aiReportSubmitCta => 'Lernbericht einreichen';

  @override
  String get aiReportSubmitted => 'Lernbericht eingereicht';

  @override
  String get aiReportWeakPhaseGeneral =>
      'Begründungen der Fehlantworten sorgfältig prüfen';

  @override
  String get aiReportTipPerfect1 =>
      'Starke Indikations- und Sicherheitslogik — Baselines weiter explizit dokumentieren.';

  @override
  String get aiReportTipPerfect2 =>
      'Nächstes Szenario nutzen, um Follow-up und Adhärenz-Coaching zu vertiefen.';

  @override
  String get aiReportTipReviewWrong =>
      'Begründungen der Fehlantworten vor dem Weitergehen erneut lesen.';

  @override
  String get aiReportTipDiagnose =>
      'Indikationspassung und Red-Flag-Ausschluss vor der Verordnung schärfen.';

  @override
  String get aiReportTipPrescribe =>
      'DiGA-Wahl an Ziele, Ausschlüsse und Patient:innen-Kapazität koppeln.';

  @override
  String get aiReportTipFollowUp =>
      'Follow-up-Zeitpunkt und Abbruchkriterien klar im Plan festlegen.';

  @override
  String get aiReportTipDocumentation =>
      'Diagnose, Rationale, Ziele und Review-Datum als Kurznotiz dokumentieren.';

  @override
  String get aiReportNextRetry =>
      'Szenario nach Prüfung der Schwerpunkte erneut absolvieren.';

  @override
  String get aiReportNextReviewCompanion =>
      'Prescription Companion öffnen und Dokumentations-Checkliste prüfen.';

  @override
  String get aiReportNextContinueScenarios =>
      'Bei Bereitschaft mit dem nächsten freigeschalteten Szenario fortfahren.';

  @override
  String aiReportSummaryExcellent(int score) {
    return 'Ausgezeichnete Prüfung ($score %). Ihr Weg entspricht zentralen DiGA-Verordnungsstandards.';
  }

  @override
  String aiReportSummaryPassed(int score, int wrongCount) {
    return 'Bestanden mit $score % und $wrongCount Fehlern. Stärken Sie die Schwerpunkte unten und fahren Sie fort.';
  }

  @override
  String aiReportSummaryFailed(int score, int wrongCount) {
    return 'Ergebnis $score % — unter der Bestehensgrenze. Prüfen Sie die $wrongCount Fehler und versuchen Sie es erneut.';
  }

  @override
  String get aiReportStrengths => 'Stärken';

  @override
  String get aiCoachHubTitle => 'KI-Coach';

  @override
  String get aiCoachHubSubtitle =>
      'Interaktives Coaching basierend auf Ihrem Prüfungsergebnis';

  @override
  String get aiCoachHubTutor => 'KI-Tutor fragen';

  @override
  String get aiCoachHubTutorDesc =>
      'Erklärungen zu Fehlern und Verordnungstipps erhalten';

  @override
  String get aiCoachHubPatient => 'Patientengespräch üben';

  @override
  String aiCoachHubPatientDesc(String name) {
    return 'Gemeinsame Entscheidungsfindung mit $name simulieren';
  }

  @override
  String get aiCoachHubDoc => 'Dokumentations-Coach';

  @override
  String get aiCoachHubDocDesc =>
      'Kurznotiz schreiben und sofort Checklisten-Feedback erhalten';

  @override
  String get aiTutorChatTitle => 'KI-Tutor';

  @override
  String aiTutorChatSubtitle(String domain) {
    return 'Coaching für $domain';
  }

  @override
  String get aiPatientChatTitle => 'Patientengespräch';

  @override
  String aiPatientChatSubtitle(String name) {
    return 'DiGA-Erklärung für $name üben';
  }

  @override
  String get aiTutorInputHint =>
      'Fragen zu Prüfung, Dokumentation oder Patientenaufklärung…';

  @override
  String aiTutorOpeningPerfect(int score, String domain) {
    return 'Sehr gut — $score % in $domain. Fragen Sie mich zur Dokumentation oder zur Patientenaufklärung.';
  }

  @override
  String aiTutorOpeningWithMistakes(int score, int count, String domain) {
    return 'Ich habe Ihr Ergebnis ($score % in $domain) ausgewertet. Sie haben $count Frage(n) verfehlt. Nutzen Sie die Schnellfragen oder stellen Sie eine eigene Frage.';
  }

  @override
  String get aiTutorQuickWrongAnswer => 'Warum war meine Antwort falsch?';

  @override
  String get aiTutorQuickDocumentation => 'Wie dokumentiere ich das?';

  @override
  String get aiTutorQuickPatientTalk => 'Wie erkläre ich DiGA dem Patienten?';

  @override
  String aiTutorQuickWeakPhase(String phase) {
    return 'Hilfe bei $phase';
  }

  @override
  String get aiTutorNoMistakes =>
      'Alle Fragen richtig beantwortet. Konzentrieren Sie sich auf klare Dokumentation und Patientenerwartungen.';

  @override
  String get aiTutorWrongIntro =>
      'Die klinischen Begründungen zu Ihren Fehlern:';

  @override
  String get aiTutorDocumentationAdvice =>
      'Eine solide DiGA-Dokumentation enthält: Diagnose (mit ICD wenn möglich), bisherige nicht-digitale Maßnahmen, Passung des Programms, Ausschlusskriterien, messbare Ziele und ein Nachsorgetermin.';

  @override
  String aiTutorPatientAdvice(String name, String domain) {
    return 'Für $name in einfacher Sprache: tägliche Nutzung, realistischer Zeitaufwand, Ergänzung (nicht Ersatz) der medizinischen Betreuung, und gemeinsamer Verlaufskontrolltermin.';
  }

  @override
  String get aiTutorFollowUpAdvice =>
      'Konkreten Kontrolltermin festlegen (z. B. 4–6 Wochen). Adhärenzbarrieren, verwendete Scores und Abbruchkriterien bei Warnzeichen dokumentieren.';

  @override
  String get aiTutorSafetyAdvice =>
      'Ausschlusskriterien und Warnzeichen vor Codeausstellung dokumentieren. Bei neuen Alarmsymptomen hat die persönliche Wiedervorstellung Vorrang vor App-Fortführung.';

  @override
  String aiTutorPrescribeAdvice(String domain) {
    return 'In $domain: DiGA an Indikation, Patientenkapazität und Evidenz anpassen — nicht nur nach Oberfläche wählen.';
  }

  @override
  String get aiTutorDiagnoseAdvice =>
      'Indikation muss zum zugelassenen DiGA-Label passen, Chronizitätskriterien erfüllt sein und akute Warnzeichen ausgeschlossen werden.';

  @override
  String aiTutorWeakPhaseAdvice(String phases) {
    return 'Schwächerer Bereich: $phases. Companion-Checkliste und eine Szenario-Begründung in dieser Phase nachlesen.';
  }

  @override
  String get aiTutorFallback =>
      'Ich helfe bei Fehlern, Dokumentation, Patientenaufklärung, Sicherheitsscreening und Nachsorgeplanung. Nutzen Sie die Vorschläge oben.';

  @override
  String get aiTutorFallbackWithHint =>
      'Basierend auf Ihrer Prüfung — wichtiger Lernpunkt:';

  @override
  String get aiPatientChipExpectations => 'Was kann ich von der App erwarten?';

  @override
  String get aiPatientChipTime => 'Wie viel Zeit pro Tag?';

  @override
  String get aiPatientChipPrivacy => 'Sind meine Daten privat?';

  @override
  String get aiPatientReplySchedule =>
      'Das klingt machbar. Ich kann abends 15–20 Minuten versuchen, wenn Sie glauben, dass es wirklich hilft.';

  @override
  String get aiPatientReplySafety =>
      'Gut zu wissen, dass es meinen Arzt nicht ersetzt. Bei welchen Symptomen soll ich Sie früher kontaktieren?';

  @override
  String get aiPatientReplyEvidence =>
      'Ich würde mich sicherer fühlen, wenn es Studien gibt. Welche Verbesserungen sehen Patienten normalerweise?';

  @override
  String get aiPatientReplyGeneral =>
      'Danke für die Erklärung. Ich möchte noch verstehen, wie das zu meiner anderen Behandlung passt.';

  @override
  String get aiDocCoachTitle => 'Dokumentations-Coach';

  @override
  String get aiDocCoachSubtitle =>
      'Kurznotiz verfassen — KI prüft Vollständigkeit sofort';

  @override
  String get aiDocCoachHint =>
      'Beispiel: F32.1 mittelschwere Depression. Medikation abgelehnt. Schlafhygiene versucht. Selfapy mit Ziel PHQ-9-Reduktion. Keine bipolare Vorgeschichte. Kontrolle in 6 Wochen.';

  @override
  String get aiDocCoachAnalyse => 'Dokumentation analysieren';

  @override
  String aiDocCoachScore(int score) {
    return 'Dokumentations-Score: $score %';
  }

  @override
  String get aiDocTooShort =>
      'Bitte mindestens eine kurze Notiz schreiben (2–3 Sätze).';

  @override
  String get aiDocCheckDiagnosis => 'Diagnose dokumentiert';

  @override
  String get aiDocCheckIndication => 'Indikation / Eignung notiert';

  @override
  String get aiDocCheckRationale => 'Verordnungsbegründung';

  @override
  String get aiDocCheckGoals => 'Patientenziele genannt';

  @override
  String get aiDocCheckFollowUp => 'Nachsorgeplan';

  @override
  String get aiDocCheckSafety => 'Sicherheit / Kontraindikationen';

  @override
  String get aiDocFeedbackExcellent =>
      'Ausgezeichnete Dokumentation — diese Notiz stützt eine vertretbare DiGA-Verordnung.';

  @override
  String get aiDocFeedbackGood =>
      'Gute Notiz. Ergänzen Sie fehlende Checklistenpunkte vor der endgültigen Verordnung.';

  @override
  String get aiDocFeedbackPartial =>
      'Teilweise dokumentiert. Für sichere DiGA-Verordnung fehlen noch wichtige Elemente.';

  @override
  String get aiDocFeedbackNeedsWork =>
      'Diese Notiz braucht mehr Struktur: Diagnose, Begründung, Ziele, Sicherheitsscreening und Nachsorge.';

  @override
  String get aiRecommendationPersonalised => 'Personalisiert für Ihre Prüfung';

  @override
  String get homeAiCoachTitle => 'KI-Coach';

  @override
  String get homeAiCoachSubtitle =>
      'DiGA-Aufklärung, Dokumentation & Verordnung jederzeit üben';

  @override
  String get homeAiCoachQuickSafety => 'Wie screene ich Kontraindikationen?';

  @override
  String get aiTutorOpeningHome =>
      'Willkommen! Ich bin Ihr DiGA-Verordnungs-Coach. Fragen Sie zu Indikation, Dokumentation, Patientenaufklärung oder Sicherheitsscreening — ohne Prüfung.';

  @override
  String get navHome => 'Start';

  @override
  String get navModules => 'Module';

  @override
  String get navCompanion => 'Begleitung';

  @override
  String get navProgress => 'Lernstand';

  @override
  String get navProfile => 'Profil';

  @override
  String get homeTitle => 'Start';

  @override
  String get homeBodyPlaceholder => 'Dashboard (MVP-Platzhalter)';

  @override
  String get homeGreetingMorning => 'Guten Morgen';

  @override
  String get homeGreetingAfternoon => 'Guten Tag';

  @override
  String get homeGreetingEvening => 'Guten Abend';

  @override
  String get homeDoctorFallback => 'Kolleg:in';

  @override
  String get homeDashboardSubtitle =>
      'Bleiben Sie mit kurzen Simulationen und verlässlichen Referenzinhalten fit in der DiGA‑Verordnung.';

  @override
  String get homeContinueTitle => 'Weiterlernen';

  @override
  String get homeContinueModule => 'Vivira';

  @override
  String get homeContinuePhase => 'Phase 2 · Verordnung';

  @override
  String get homeContinueHint =>
      'Dort weitermachen, wo Sie aufgehört haben — Ihr Fortschritt wird gespeichert.';

  @override
  String get homeContinueCta => 'Fortsetzen';

  @override
  String get homeStatsTitle => 'Ihre Übersicht';

  @override
  String get homeMetricModules => 'Module fertig';

  @override
  String get homeMetricAccuracy => 'Ø Trefferquote';

  @override
  String get homeMetricStreak => 'Wochen‑Serie';

  @override
  String get homeSectionRecommended => 'Empfohlen für Sie';

  @override
  String get homeSectionRecent => 'Letzte Aktivität';

  @override
  String get homeSeeModules => 'Alle';

  @override
  String get homeRecentItem1Title => 'Simulation abgeschlossen';

  @override
  String get homeRecentItem1Subtitle => 'Kalmeda · Score 88 %';

  @override
  String get homeRecentItem2Title => 'Begleitung gelesen';

  @override
  String get homeRecentItem2Subtitle => 'Vivira · Dokumentation';

  @override
  String get homeEmptyActivityTitle => 'Noch keine Aktivität';

  @override
  String get homeEmptyActivityBody =>
      'Starten Sie ein Modul — hier erscheinen Simulationen und Recherchen.';

  @override
  String get homeEmptyCta => 'Module ansehen';

  @override
  String get homeDuration12 => '12 Min.';

  @override
  String get homeDuration20 => '20 Min.';

  @override
  String get homeVerifiedApr2025 => 'Geprüft Apr. 2025';

  @override
  String get homeTagEnt => 'HNO';

  @override
  String get homeTagGp => 'HA';

  @override
  String get homeTagPain => 'Schmerz';

  @override
  String get homeModuleDescKalmeda =>
      'Klinische Szenarien: Hörsturz‑Warnsignale, Kalmeda‑Indikation, Verlaufs‑Eskalation.';

  @override
  String get homeModuleDescVivira =>
      'Klinische Szenarien: Cauda‑equina‑Screening, Vivira‑Indikation, Übungs‑Follow‑up.';

  @override
  String get homeCtaStart => 'Start';

  @override
  String get homeCtaContinue => 'Weiter';

  @override
  String get modulesTitle => 'DiGA-Module';

  @override
  String get modulesPageTitle => 'DiGA-Module';

  @override
  String get modulesPageSubtitle =>
      'Digitale Gesundheitsanwendungen entdecken und sicher verordnen lernen.';

  @override
  String get modulesSearchHint => 'Module, Indikationen …';

  @override
  String get modulesFilterAll => 'Alle';

  @override
  String get modulesFilterEnt => 'HNO';

  @override
  String get modulesFilterGp => 'Hausarzt';

  @override
  String get modulesFilterPain => 'Schmerz';

  @override
  String get modulesFilterMental => 'Psychiatrie';

  @override
  String get modulesEmptyTitle => 'Keine Module verfügbar';

  @override
  String get modulesEmptySubtitle =>
      'Passe Suche oder Filter an — neue Lernpfade werden regelmäßig ergänzt.';

  @override
  String get modulesProgressLabel => 'Ihr Fortschritt';

  @override
  String modulesProgressPercent(int percent) {
    return '$percent %';
  }

  @override
  String get moduleDifficultyIntro => 'Einstieg';

  @override
  String get moduleDifficultyStandard => 'Standard';

  @override
  String get moduleVelibraDemo => 'Velibra (Demo)';

  @override
  String get moduleVelibraSubtitle => 'Leichte Depression';

  @override
  String get moduleVelibraDesc =>
      'Depressions-DiGA-Szenarien: App-Auswahl, Bipolar-Sicherheit, schwere Depression (Plot Twist).';

  @override
  String get moduleInsomniaDemo => 'Schlaf-DiGA Auswahl';

  @override
  String get moduleInsomniaSubtitle => 'Nichtorganische Insomnie (CBT-I)';

  @override
  String get moduleInsomniaDesc =>
      'Klinische Szenarien: Somnio vs. HelloBetter Schlafen — gemeinsame Entscheidung und Dokumentation.';

  @override
  String get moduleCardioDemo => 'CardioCoach (Demo)';

  @override
  String get moduleCardioSubtitle => 'Hypertonie‑Nachsorge';

  @override
  String get moduleCardioDesc =>
      'Klinische Szenarien: RR‑Ziele, CardioCoach‑Dokumentation, Medikation + Lifestyle.';

  @override
  String get moduleDuration15 => '15 Min.';

  @override
  String get moduleKalmedaDemo => 'Kalmeda (Demo)';

  @override
  String get moduleKalmedaSubtitle => 'Tinnitus';

  @override
  String get moduleViviraDemo => 'Vivira (Demo)';

  @override
  String get moduleViviraSubtitle => 'Chronische Rückenschmerzen';

  @override
  String moduleDetailTitle(String moduleId) {
    return 'Modul: $moduleId';
  }

  @override
  String get moduleDetailPlaceholder => 'Moduldetails (Platzhalter)';

  @override
  String get moduleDetailStartSimulation => 'Simulation starten';

  @override
  String get simulationPhase1Title => 'Phase 1: Diagnose';

  @override
  String get simulationPhase2Title => 'Phase 2: Verordnung';

  @override
  String get simulationPhase3Title => 'Phase 3: Verlauf';

  @override
  String get simulationResultTitle => 'Ergebnis';

  @override
  String moduleLabel(String moduleId) {
    return 'Modul: $moduleId';
  }

  @override
  String get simulationNextToPhase2 => 'Weiter zu Phase 2';

  @override
  String get simulationNextToPhase3 => 'Weiter zu Phase 3';

  @override
  String get simulationToResult => 'Zum Ergebnis';

  @override
  String get simulationScorePlaceholder => 'Score / Feedback (Platzhalter)';

  @override
  String get simulationBackToModuleList => 'Zur Modulliste';

  @override
  String get simulationBackToScenarios => 'Zur Szenarioübersicht';

  @override
  String get quizPhaseDiagnoseShort => 'Diagnose';

  @override
  String get quizPhasePrescribeShort => 'Verordnung';

  @override
  String get quizPhaseFollowUpShort => 'Verlauf';

  @override
  String get simulationDecisionPoint => 'Entscheidungspunkt';

  @override
  String get simulationCorrectLabel => 'Richtig';

  @override
  String get simulationIncorrectLabel => 'Falsch';

  @override
  String get simulationYourAnswerLabel => 'Ihre Antwort';

  @override
  String get simulationCorrectAnswerLabel => 'Richtige Antwort';

  @override
  String get simulationExplanationLabel => 'Erklärung';

  @override
  String get simulationTeachingPearlLabel => 'Klinischer Merksatz';

  @override
  String get simulationNoAnswerRecorded => 'Keine Antwort erfasst';

  @override
  String get simulationXpEarned => 'XP verdient';

  @override
  String simulationXpEarnedValue(int xp) {
    return '+$xp XP';
  }

  @override
  String get simulationAnswerReviewTitle => 'Antwortenüberprüfung';

  @override
  String get simulationAnswerReviewSubtitle =>
      'Überprüfen Sie Ihre Entscheidungen, richtige Antworten und klinische Erklärungen für jede Phase.';

  @override
  String get simulationScoreBreakdown => 'Punkteaufschlüsselung';

  @override
  String get simulationBadgesUnlocked => 'Freigeschaltete Abzeichen';

  @override
  String get simulationUnableToLoadResult =>
      'Ergebniszusammenfassung konnte nicht geladen werden.';

  @override
  String simulationScoreAccuracy(int score, int accuracy) {
    return 'Punkte $score% | Genauigkeit $accuracy%';
  }

  @override
  String simulationMarks(String marks) {
    return 'Punkte: $marks';
  }

  @override
  String get simulationContinueNextDomain => 'Weiter im nächsten Bereich';

  @override
  String get simulationContinueNextScenario => 'Weiter zum nächsten Szenario';

  @override
  String simulationExamPassedBanner(int score) {
    return 'Prüfung bestanden! $score %';
  }

  @override
  String simulationExamFailedBanner(int score) {
    return 'Versuche es erneut! $score % erreicht';
  }

  @override
  String simulationSuggestedScenario(String title) {
    return 'Vorgeschlagenes Szenario: $title';
  }

  @override
  String get simulationExamTitle => 'Bereichsprüfung';

  @override
  String get simulationExamLoading => 'Fragen werden vorbereitet…';

  @override
  String simulationQuestionProgress(int current, int total) {
    return 'Frage $current von $total';
  }

  @override
  String get simulationPreviousQuestion => 'Zurück';

  @override
  String get simulationNextQuestion => 'Weiter';

  @override
  String get simulationSubmitExam => 'Prüfung abgeben';

  @override
  String simulationExamAnsweredCount(int answered, int total) {
    return '$answered von $total beantwortet';
  }

  @override
  String get simulationExamUnansweredWarning =>
      'Bitte alle Fragen beantworten, bevor Sie abgeben. Nutzen Sie Zurück für übersprungene Fragen.';

  @override
  String get companionTitle => 'Rezeptbegleitung';

  @override
  String get companionPageTitle => 'Rezeptbegleitung';

  @override
  String get companionPageSubtitle => 'Klinische Referenz zur DiGA‑Verordnung';

  @override
  String get companionSelectorLabel => 'Modul';

  @override
  String get companionChipKalmeda => 'Kalmeda';

  @override
  String get companionChipVivira => 'Vivira';

  @override
  String get companionEmptyTitle => 'Modul wählen';

  @override
  String get companionEmptyBody =>
      'Wählen Sie ein Modul, um Verordnungsdetails zu sehen — ICD‑Kontext, Indikation, Dokumentation und Patienteninformation.';

  @override
  String get companionSectionIcd => 'ICD‑Codes (Orientierung)';

  @override
  String get companionSectionEligibility => 'Indikation / Eignung';

  @override
  String get companionSectionContra => 'Kontraindikationen & Vorsicht';

  @override
  String get companionSectionDoc => 'Dokumentationsanforderungen';

  @override
  String get companionSectionPatient => 'Patienteninformation';

  @override
  String get companionSectionInsurance => 'Kasse / Abrechnungshinweise';

  @override
  String get companionKalmedaIcdBlock =>
      'H93.1 — Chronischer subjektiver Tinnitus\nH93.A — Somatosensorischer Tinnitus\nF45.3 — Somatoforme Störungen (falls klinisch relevant)';

  @override
  String get companionKalmedaEligibilityBlock =>
      'Bildungsinhalt — jeweils aktuelles DiGA‑Verzeichnis und Kostenträgerregeln prüfen.\nTinnitus mit relevanter funktioneller Beeinträchtigung in der Dokumentation.\nStrukturierter Therapieweg geeignet für digitale Intervention.\nPatient:in kann Smartphone‑App nutzen und Anweisungen befolgen.';

  @override
  String get companionKalmedaContraBlock =>
      'Akute behandelbare Tinnitusursachen noch nicht ausgeschlossen (falls im Pfad vorgesehen).\nSchwere psychiatrische Instabilität ohne adäquate Betreuung.\nKognitive oder Sprachbarrieren, die eine sichere App‑Nutzung verhindern.';

  @override
  String get companionKalmedaDocBlock =>
      'Indikation und Ausgangsbeschwerden dokumentiert\nVerordnung mit Therapiezielen\nAufklärung zu Datenschutz und Nachsorge\nGKV‑Rezeptweg dokumentiert (falls zutreffend)';

  @override
  String get companionKalmedaPatientBlock =>
      'Erklären Sie, dass die DiGA strukturierte Übungen und Aufklärung unterstützt — kein Ersatz für Notfallversorgung bei plötzlicher Hörverschlechterung oder neurologischen Red Flags.\nRegelmäßige App‑Nutzung fördern und einen klaren hausärztlichen Kontakttermin vereinbaren.';

  @override
  String get companionKalmedaInsuranceBlock =>
      'Bildungsinhalt — Leistungsfähigkeit und Rezeptmodalitäten bei der zuständigen Kasse verifizieren (z. B. digitales GKV‑Rezept).';

  @override
  String get companionViviraIcdBlock =>
      'M54.5 — Kreuzschmerzen\nM54.4 — Lumbago mit Ischialgie\nM51.2 — Bandscheibenverschiebung (wenn mit Pfad konsistent)';

  @override
  String get companionViviraEligibilityBlock =>
      'Chronische unspezifische Kreuzschmerzen mit leitliniengerechter Diagnostik.\nPatient:in für progressive Übungstherapie per App geeignet.\nFähigkeit zu häuslichen Übungen und zum Lesen der Anweisungen.';

  @override
  String get companionViviraContraBlock =>
      'Red Flags mit dringender klinischer Abklärung noch nicht ausgeschlossen.\nSchwere neurologische Ausfälle oder Kauda‑equina‑Verdacht.\nFrische Wirbelfraktur oder Instabilität ohne Freigabe.';

  @override
  String get companionViviraDocBlock =>
      'Schmerzanamnese, Red‑Flag‑Assessment und Vortherapien dokumentiert\nTherapieziele und Belastbarkeit festgehalten\nNebenwirkungen und Adhärenz besprochen\nWiedervorstellung geplant';

  @override
  String get companionViviraPatientBlock =>
      'Erwartungsmanagement: schrittweise Belastung, mögliche muskuläre Reaktionen, wann abzubrechen und ärztlich vorzustellen ist.\nDigitale Therapie mit alltagsnahen Aktivitätszielen verbinden.';

  @override
  String get companionViviraInsuranceBlock =>
      'Bildungsinhalt — Leistungsfähigkeit und Dokumentationsanforderungen für Rückenschmerz‑DiGAs bei der Kasse prüfen.';

  @override
  String get companionBodyDefault => 'Referenzinhalte (Platzhalter)';

  @override
  String companionBodyFocused(String moduleId) {
    return 'Fokus: $moduleId';
  }

  @override
  String get progressTitle => 'Lernstand';

  @override
  String get progressPageSubtitle => 'DiGA‑Lernleistung im Blick behalten';

  @override
  String get progressStatModulesDone => 'Module abgeschlossen';

  @override
  String get progressStatAvgScore => 'Ø Score';

  @override
  String get progressStatAccuracy => 'Trefferquote';

  @override
  String get progressStatWeeklySessions => 'Sessions diese Woche';

  @override
  String get progressOverviewTitle => 'Fortschritt Lernpfad';

  @override
  String progressOverviewFraction(int completed, int total) {
    return '$completed von $total Modulen abgeschlossen';
  }

  @override
  String get progressOverviewHint =>
      'Schließen Sie alle Pilot‑Module ab, um ein Abschluss‑Badge in dieser Demo zu erhalten.';

  @override
  String get progressSectionRecent => 'Letzte Ergebnisse';

  @override
  String get progressSectionPerformance => 'Leistung je Modul';

  @override
  String get progressSectionTrend => 'Aktivität pro Woche';

  @override
  String get progressTrendCaption =>
      'Relative Lernintensität nach Wochentag (illustrative Demo, keine Live‑Analytics).';

  @override
  String get progressTrendDaysBlock => 'Mo|Di|Mi|Do|Fr|Sa|So';

  @override
  String get progressStatusCompleted => 'Abgeschlossen';

  @override
  String get progressStatusInProgress => 'Läuft';

  @override
  String get progressDateApr8 => '8. Apr. 2025';

  @override
  String get progressDateApr5 => '5. Apr. 2025';

  @override
  String get progressDateMar28 => '28. Mär. 2025';

  @override
  String get progressLastActiveApr8 => 'Zuletzt 8. Apr. 2025';

  @override
  String get progressLastActiveApr5 => 'Zuletzt 5. Apr. 2025';

  @override
  String get progressLastActiveMar20 => 'Zuletzt 20. Mär. 2025';

  @override
  String progressAttemptsCount(int count) {
    return '$count Versuche';
  }

  @override
  String get progressEmptyTitle => 'Noch keine Lernaktivität';

  @override
  String get progressEmptyBody =>
      'Schließen Sie Ihre erste DiGA‑Simulation ab, um hier Scores, Serien und Wochentrends zu sehen.';

  @override
  String get progressEmptyCta => 'Erstes Modul starten';

  @override
  String get progressBodyPlaceholder => 'Fortschritt (Platzhalter)';

  @override
  String get profileTitle => 'Profil';

  @override
  String get profilePageSubtitle => 'Konto und Einstellungen verwalten';

  @override
  String get profileBodyPlaceholder => 'Profil (Platzhalter)';

  @override
  String get profileSectionPreferences => 'Einstellungen';

  @override
  String get profileSectionAccount => 'Konto';

  @override
  String get profileSectionAppInfo => 'App';

  @override
  String get profileRoleDoctor => 'Ärztin / Arzt';

  @override
  String get profileDemoDisplayName => 'Demo‑Nutzer';

  @override
  String get profileLanguageHeading => 'Sprache';

  @override
  String get profileLanguageDescription =>
      'Oberflächensprache für DiGA LAB (nur Lehrinhalt).';

  @override
  String get profileLanguageEnglish => 'Englisch';

  @override
  String get profileLanguageGerman => 'Deutsch';

  @override
  String get profileBannerDemoTitle => 'Demo‑Modus';

  @override
  String get profileBannerDemoBody =>
      'Sie nutzen DiGA LAB ohne vollständige Cloud‑Anbindung. Einige Daten verbleiben nur auf diesem Gerät.';

  @override
  String get profileBannerLocalTitle => 'Lokale Sitzung';

  @override
  String get profileBannerLocalBody =>
      'Firebase ist in diesem Build nicht verfügbar. Sie können Module weiter nutzen; die Anmeldung folgt, sobald die Cloud‑Dienste eingerichtet sind.';

  @override
  String get profileTilePersonalDetails => 'Persönliche Angaben';

  @override
  String get profileTileNotifications => 'Benachrichtigungen';

  @override
  String get profileTilePrivacy => 'Datenschutz & Daten';

  @override
  String get profileTileHelp => 'Hilfe & Support';

  @override
  String get profileTileAbout => 'Über DiGA LAB';

  @override
  String get profileTileComingSoon => 'Demnächst';

  @override
  String get profileTilePersonalDetailsDesc =>
      'Name, Fachrichtung und Institution';

  @override
  String get profileTileNotificationsDesc =>
      'Modul-Updates, Streaks und Zusammenfassungen';

  @override
  String get profileTilePrivacyDesc =>
      'Datenexport und Datenschutzeinstellungen';

  @override
  String get profileTileHelpDesc => 'FAQ, Anleitungen und Support';

  @override
  String get profileComingSoonSnack =>
      'Diese Funktion wird in einem späteren Update bereitgestellt.';

  @override
  String get profilePersonalSubtitle =>
      'Halten Sie Ihr berufliches Profil für Zertifikate und Fortschritt aktuell.';

  @override
  String get profilePersonalNameLabel => 'Anzeigename';

  @override
  String get profilePersonalSpecialtyLabel => 'Fachrichtung';

  @override
  String get profilePersonalInstitutionLabel => 'Institution / Praxis';

  @override
  String get profilePersonalLicenseLabel => 'Ärztliche Approbation (optional)';

  @override
  String get profilePersonalSpecialtyDefault => 'Allgemeinmedizin';

  @override
  String get profilePersonalEmailDemo => 'demo@digalab.local';

  @override
  String get profilePersonalSaveCta => 'Änderungen speichern';

  @override
  String get profilePersonalSavedSnack =>
      'Profildaten auf diesem Gerät gespeichert.';

  @override
  String get profileNotificationsSubtitle =>
      'Wählen Sie, welche Lern-Updates und Erinnerungen Sie erhalten.';

  @override
  String get profileNotificationsBannerTitle => 'Am Ball bleiben';

  @override
  String get profileNotificationsBannerBody =>
      'Aktivieren Sie Modul- und Streak-Hinweise, damit Sie keine neuen Szenarien oder Tagesziele verpassen.';

  @override
  String get profileNotifModuleUpdates => 'Modul-Updates';

  @override
  String get profileNotifModuleUpdatesDesc =>
      'Neue Szenarien, überarbeitete Inhalte und Abschluss-Meilensteine.';

  @override
  String get profileNotifStreak => 'Streak-Erinnerungen';

  @override
  String get profileNotifStreakDesc =>
      'Sanfte Erinnerung, wenn Ihre tägliche Lernserie gefährdet ist.';

  @override
  String get profileNotifWeeklyDigest => 'Wöchentliche Fortschrittsübersicht';

  @override
  String get profileNotifWeeklyDigestDesc =>
      'Zusammenfassung von XP, abgeschlossenen Modulen und Schwachstellen.';

  @override
  String get profileNotifEmail => 'E-Mail-Zusammenfassungen';

  @override
  String get profileNotifEmailDesc =>
      'Optionale wöchentliche E-Mail, wenn Cloud-Anmeldung aktiv ist.';

  @override
  String get profileNotifProduct => 'Produkt-Updates';

  @override
  String get profileNotifProductDesc =>
      'Neue Funktionen, Lerntipps und DiGA LAB-Ankündigungen.';

  @override
  String get profilePrivacySubtitle =>
      'Sie behalten die Kontrolle über Ihre Lerndaten. Diese App ersetzt keine klinischen Dokumentationssysteme.';

  @override
  String get profilePrivacyBannerTitle => 'Nur Bildungsdaten';

  @override
  String get profilePrivacyBannerBody =>
      'Simulationsantworten und Fortschritt werden zu Lernzwecken gespeichert. Es werden keine Patientengesundheitsdaten in DiGA LAB erfasst.';

  @override
  String get profilePrivacyDataBody =>
      'DiGA LAB verarbeitet Kontokennungen, Modulfortschritt, Quiz-Ergebnisse und Gamification-Metriken. Daten können im Demo-Modus lokal oder bei Firebase-Konfiguration synchronisiert werden. Export oder Löschung ist möglich, sobald Backend-Dienste verbunden sind.';

  @override
  String get profilePrivacyExportTitle => 'Meine Daten exportieren';

  @override
  String get profilePrivacyExportDesc =>
      'Kopie Ihrer Lernhistorie herunterladen (JSON).';

  @override
  String get profilePrivacyExportSnack =>
      'Export verfügbar, sobald Cloud-Sync aktiv ist.';

  @override
  String get profilePrivacyActivityTitle => 'Aktivitätsprotokoll';

  @override
  String get profilePrivacyActivityDesc =>
      'Letzte Anmeldungen und Modulsitzungen auf diesem Gerät.';

  @override
  String get profilePrivacyActivitySnack =>
      'Aktivitätsprotokoll nur im verbundenen Modus verfügbar.';

  @override
  String get profilePrivacyDeleteTitle => 'Kontodaten löschen';

  @override
  String get profilePrivacyDeleteDesc =>
      'Fortschritt und Profil auf diesem Gerät oder in der Cloud entfernen.';

  @override
  String get profilePrivacyDeleteDialogTitle => 'Lerndaten löschen?';

  @override
  String get profilePrivacyDeleteDialogBody =>
      'Dies entfernt Fortschritt, XP und gespeicherte Einstellungen. Im Demo-Modus nicht rückgängig zu machen.';

  @override
  String get profilePrivacyCancel => 'Abbrechen';

  @override
  String get profilePrivacyDeleteConfirm => 'Löschen';

  @override
  String get profilePrivacyDeleteDemoSnack =>
      'Demo-Daten auf diesem Gerät gelöscht.';

  @override
  String get profileHelpSubtitle =>
      'Schnelle Antworten und Kontakt zum DiGA LAB-Team.';

  @override
  String get profileHelpGuideTitle => 'Erste-Schritte-Anleitung';

  @override
  String get profileHelpGuideDesc =>
      'So funktionieren Module, Simulationen und XP.';

  @override
  String get profileHelpGuideSnack =>
      'Anleitung wird in der nächsten Inhaltsversion geöffnet.';

  @override
  String get profileHelpEmailTitle => 'E-Mail-Support';

  @override
  String get profileHelpEmailValue => 'support@digalab.example';

  @override
  String get profileHelpEmailSnack =>
      'Support-E-Mail in die Zwischenablage kopiert (Demo).';

  @override
  String get profileHelpBugTitle => 'Problem melden';

  @override
  String get profileHelpBugDesc =>
      'Fehler oder inhaltliche Korrektur beschreiben.';

  @override
  String get profileHelpBugSnack =>
      'Meldungsformular — mit Cloud-Backend verfügbar.';

  @override
  String get profileHelpFaqTitle => 'Häufig gestellte Fragen';

  @override
  String get profileHelpFaq1Q =>
      'Ist DiGA LAB ein zertifiziertes Medizinprodukt?';

  @override
  String get profileHelpFaq1A =>
      'Nein. DiGA LAB ist eine Bildungssimulation für Verordner. Prüfen Sie stets DiGA-Produktinformationen, Indikationen und Erstattungsregeln vor dem klinischen Einsatz.';

  @override
  String get profileHelpFaq2Q =>
      'Synchronisiert sich mein Fortschritt über Geräte?';

  @override
  String get profileHelpFaq2A =>
      'Im Demo- oder lokalen Modus bleibt der Fortschritt auf diesem Gerät. Mit verbundenem Konto kann der Fortschritt über Firebase synchronisiert werden.';

  @override
  String get profileHelpFaq3Q => 'Wie wird XP berechnet?';

  @override
  String get profileHelpFaq3A =>
      'XP erhalten Sie für abgeschlossene Module, hohe Quiz-Ergebnisse, Erfolg beim ersten Versuch und aufrechterhaltene Lernserien. Level schalten Abzeichen und Empfehlungen frei.';

  @override
  String profileVersionLine(String version, String buildNumber) {
    return 'Version $version · Build $buildNumber';
  }

  @override
  String get profileAppStatusLabel => 'Status';

  @override
  String get profileEnvironmentDemo => 'Demo';

  @override
  String get profileEnvironmentConnected => 'Verbunden';

  @override
  String get profileEnvironmentLocal => 'Lokal';

  @override
  String get profileSignOutHint =>
      'Sie kehren zur Anmeldung zurück. Ihr Fortschritt in dieser Demo bleibt auf diesem Gerät.';

  @override
  String get profileAboutLegalese =>
      'Nur zu Schulungszwecken — kein klinisches Entscheidungshilfe‑System.';

  @override
  String get profileAboutBody =>
      'DiGA LAB unterstützt Sie beim Üben von Verschreibungsabläufen für Digitale Gesundheitsanwendungen (DiGAs). Bitte immer aktuelle Produktinformationen, Kostenträgerregeln und lokale Vorgaben vor dem klinischen Gebrauch prüfen.';

  @override
  String get errorRouteTitle => 'Fehler';

  @override
  String errorUnknownRoute(String uri) {
    return 'Route nicht gefunden:\n$uri';
  }
}
