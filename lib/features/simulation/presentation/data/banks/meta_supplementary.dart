import 'package:diga/core/locale/app_locale_provider.dart';
import 'package:diga/features/simulation/domain/models/simulation_question.dart';
import 'package:diga/features/simulation/domain/models/simulation_quiz_phase.dart';
import 'package:diga/features/simulation/presentation/data/simulation_question_factory.dart';

abstract final class MetaSupplementary {
  static List<SimulationQuestion Function(AppLanguage)> get builders => [
        _meta01, _meta02, _meta03, _meta04, _meta05, _meta06, _meta07, _meta08,
        _meta09, _meta10, _meta11, _meta12, _meta13, _meta14, _meta15, _meta16,
        _meta17, _meta18, _meta19, _meta20,
      ];

  static List<SimulationQuestion> questions(AppLanguage language) =>
      SimulationQuestionFactory.buildAll(language, builders);

  static SimulationQuestion _meta01(AppLanguage language) => SimulationQuestionFactory.fromPairs(
        id: 'meta-01', phase: SimulationQuizPhase.diagnose, correctIndex: 0, language: language,
        title: ('T2D inadequate control — DiGA adjunct', 'T2D unzureichende Einstellung — DiGA-Add-on'),
        vignette: ('Herr Frank Dietrich, 56, T2D 4 years. HbA1c 8.2% on metformin. BMI 31. Motivated for lifestyle change. GKV (Barmer).', 'Herr Frank Dietrich, 56, T2D seit 4 Jahren. HbA1c 8,2 % unter Metformin. BMI 31. Motiviert für Lifestyle-Änderung. GKV (Barmer).'),
        decisionPoint: ('DiGA role?', 'DiGA-Rolle?'), prompt: ('Diabetes DiGA triage', 'Diabetes-DiGA-Triage'),
        options: [('Diabetes lifestyle DiGAs may adjunct guideline care when indication met — not substitute for medication optimisation.', 'Diabetes-Lifestyle-DiGAs können Leitlinienversorgung ergänzen bei erfüllter Indikation — kein Ersatz für Medikationsoptimierung.'), ('HbA1c >8 excludes all digital care.', 'HbA1c >8 schließt digitale Versorgung aus.'), ('DiGA replaces metformin.', 'DiGA ersetzt Metformin.'), ('Only endocrinologists may discuss lifestyle.', 'Nur Endokrinologen dürfen Lifestyle besprechen.')],
        rationale: ('Digital diabetes programmes support self-management alongside pharmacotherapy titration.', 'Digitale Diabetesprogramme unterstützen Self-Management neben Pharmakotherapie-Titration.'),
      );

  static SimulationQuestion _meta02(AppLanguage language) => SimulationQuestionFactory.fromPairs(
        id: 'meta-02', phase: SimulationQuizPhase.prescribe, correctIndex: 1, language: language,
        title: ('MyDiabetes prescribing documentation', 'MyDiabetes-Verordnungsdokumentation'),
        vignette: ('Prescribing diabetes self-management DiGA after shared decision. Patient tracks glucose and activity.', 'Diabetes-Self-Management-DiGA nach Shared Decision. Patient trackt Glucose und Aktivität.'),
        decisionPoint: ('Document?', 'Dokumentieren?'), prompt: ('T2D DiGA chart', 'T2D-DiGA-Akte'),
        options: [('App activation code only.', 'Nur Aktivierungscode.'), ('T2D diagnosis, baseline HbA1c, current meds, hypoglycaemia education, goals, follow-up labs planned.', 'T2D-Diagnose, Baseline-HbA1c, aktuelle Medikamente, Hypoglykämie-Aufklärung, Ziele, geplante Labor-Follow-ups.'), ('No labs needed on follow-up.', 'Keine Laborwerte im Follow-up.'), ('DiGA removes need for diabetes review.', 'DiGA entfernt Bedarf an Diabetes-Review.')],
        rationale: ('Diabetes DiGA prescribing requires metabolic baselines and safety education.', 'Diabetes-DiGA-Verordnung braucht metabolische Baselines und Sicherheitsaufklärung.'),
      );

  static SimulationQuestion _meta03(AppLanguage language) => SimulationQuestionFactory.fromPairs(
        id: 'meta-03', phase: SimulationQuizPhase.followUp, correctIndex: 2, language: language,
        title: ('Hypoglycaemia on intensified therapy', 'Hypoglykämie unter intensivierter Therapie'),
        vignette: ('DiGA user on new sulfonylurea reports two mild hypoglycaemia episodes. HbA1c improving. Good app use.', 'DiGA-Nutzer unter neuem Sulfonylharnstoff: zwei milde Hypoglykämien. HbA1c verbessert. Gute App-Nutzung.'),
        decisionPoint: ('Action?', 'Maßnahme?'), prompt: ('Hypo safety follow-up', 'Hypo-Sicherheit im Verlauf'),
        options: [('Continue unchanged — improvement matters only.', 'Unverändert — nur Verbesserung zählt.'), ('Stop DiGA because of hypos.', 'DiGA wegen Hypos stoppen.'), ('Review medication, reinforce hypo recognition/management, adjust targets — DiGA continues with safety plan.', 'Medikation prüfen, Hypo-Erkennung/-Management festigen, Ziele anpassen — DiGA mit Sicherheitsplan fortsetzen.'), ('Hypos expected and ignored.', 'Hypos erwartet und ignoriert.')],
        rationale: ('Hypoglycaemia requires medication review regardless of digital engagement.', 'Hypoglykämie braucht Medikationsreview unabhängig von digitalem Engagement.'),
      );

  static SimulationQuestion _meta04(AppLanguage language) => SimulationQuestionFactory.fromPairs(
        id: 'meta-04', phase: SimulationQuizPhase.diagnose, correctIndex: 3, language: language,
        title: ('Insulin-treated T2D — DiGA limits', 'Insulin-behandelter T2D — DiGA-Grenzen'),
        vignette: ('T2D on basal-bolus insulin, HbA1c 7.8%. Wants diabetes app for carb counting support.', 'T2D unter Basis-Bolus-Insulin, HbA1c 7,8 %. Wünscht Diabetes-App für Kohlenhydrat-Zählung.'),
        decisionPoint: ('Consideration?', 'Überlegung?'), prompt: ('Insulin and DiGA', 'Insulin und DiGA'),
        options: [('Insulin always excludes DiGAs.', 'Insulin schließt DiGAs immer aus.'), ('Apps dose insulin automatically safely.', 'Apps dosieren Insulin automatisch sicher.'), ('No follow-up needed with insulin.', 'Kein Follow-up bei Insulin nötig.'), ('Verify programme scope for insulin users, ensure clinician oversight of insulin adjustments — apps supplement, not replace titration.', 'Programmumfang für Insulinanwender prüfen, ärztliche Begleitung der Insulinanpassung — Apps ergänzen, ersetzen keine Titration.')],
        rationale: ('Insulin therapy needs explicit safety boundaries for digital self-management tools.', 'Insulintherapie braucht explizite Sicherheitsgrenzen für digitale Self-Management-Tools.'),
      );

  static SimulationQuestion _meta05(AppLanguage language) => SimulationQuestionFactory.fromPairs(
        id: 'meta-05', phase: SimulationQuizPhase.prescribe, correctIndex: 0, language: language,
        title: ('Obesity — zanadio eligibility', 'Adipositas — zanadio-Eignung'),
        vignette: ('Frau Sabine Roth, 42, BMI 34, weight-related comorbidities. Failed multiple diets. Motivated for structured programme. GKV (TK).', 'Frau Sabine Roth, 42, BMI 34, gewichtsbedingte Komorbiditäten. Mehrere Diäten gescheitert. Motiviert für strukturiertes Programm. GKV (TK).'),
        decisionPoint: ('Before obesity DiGA?', 'Vor Adipositas-DiGA?'), prompt: ('Obesity DiGA triage', 'Adipositas-DiGA-Triage'),
        options: [('Screen eating disorder symptoms, comorbidities, pregnancy; obesity DiGAs need BMI/indication match and multidisciplinary context.', 'Essstörungssymptome, Komorbiditäten, Schwangerschaft screenen; Adipositas-DiGAs brauchen BMI/Indikations-Match und multidisziplinären Kontext.'), ('BMI alone sufficient without assessment.', 'BMI allein ohne Abklärung ausreichend.'), ('Obesity DiGAs guarantee surgery avoidance.', 'Adipositas-DiGAs garantieren OP-Vermeidung.'), ('Prescribe to all overweight patients.', 'Allen Übergewichtigen verordnen.')],
        rationale: ('Obesity DiGAs require eating disorder screen and indication fidelity.', 'Adipositas-DiGAs brauchen Essstörungs-Screen und Indikationstreue.'),
      );

  static SimulationQuestion _meta06(AppLanguage language) => SimulationQuestionFactory.fromPairs(
        id: 'meta-06', phase: SimulationQuizPhase.followUp, correctIndex: 1, language: language,
        title: ('Weight plateau on obesity DiGA', 'Gewichtsplateau unter Adipositas-DiGA'),
        vignette: ('12 weeks zanadio: lost 4 kg then plateau 3 weeks. Adherence 80%. No eating disorder signs.', '12 Wochen zanadio: 4 kg abgenommen, dann 3 Wochen Plateau. Adhärenz 80 %. Keine Essstörungszeichen.'),
        decisionPoint: ('Response?', 'Reaktion?'), prompt: ('Weight plateau', 'Gewichtsplateau'),
        options: [('Stop — plateau means failure.', 'Stoppen — Plateau bedeutet Misserfolg.'), ('Normalise plateau, review intake/activity data, adjust goals, consider dietitian/medical review if persistent.', 'Plateau normalisieren, Intake/Aktivitätsdaten prüfen, Ziele anpassen, ggf. Ernährungsmedizin bei Persistenz.'), ('Double calorie restriction via app only.', 'Kalorienrestriktion nur per App verdoppeln.'), ('Ignore adherence data.', 'Adhärenzdaten ignorieren.')],
        rationale: ('Plateaus are common; structured review beats abandonment.', 'Plateaus sind häufig; strukturiertes Review schlägt Abbruch.'),
      );

  static SimulationQuestion _meta07(AppLanguage language) => SimulationQuestionFactory.fromPairs(
        id: 'meta-07', phase: SimulationQuizPhase.diagnose, correctIndex: 2, language: language,
        title: ('Eating disorder in obesity pathway', 'Essstörung im Adipositas-Pfad'),
        vignette: ('BMI 33 patient reports binge eating weekly, secret eating, guilt. Wants weight-loss DiGA.', 'BMI 33, wöchentliche Binge-Eating-Episoden, heimliches Essen, Schuld. Wünscht Abnehm-DiGA.'),
        decisionPoint: ('Action?', 'Maßnahme?'), prompt: ('Binge eating screen', 'Binge-Eating-Screening'),
        options: [('Prescribe obesity DiGA immediately.', 'Sofort Adipositas-DiGA.'), ('Weight loss DiGA treats binge eating automatically.', 'Abnehm-DiGA behandelt Binge Eating automatisch.'), ('Screen for eating disorder; may need specialised eating-disorder care before or instead of standard obesity DiGA.', 'Auf Essstörung screenen; ggf. spezialisierte Essstörungsversorgung vor oder statt Standard-Adipositas-DiGA.'), ('Ignore binge episodes if BMI high.', 'Binge-Episoden bei hohem BMI ignorieren.')],
        rationale: ('Active eating disorder is often an exclusion for obesity DiGAs.', 'Aktive Essstörung ist oft Ausschluss für Adipositas-DiGAs.'),
      );

  static SimulationQuestion _meta08(AppLanguage language) => SimulationQuestionFactory.fromPairs(
        id: 'meta-08', phase: SimulationQuizPhase.prescribe, correctIndex: 3, language: language,
        title: ('IBS — Cara Care consideration', 'Reizdarm — Cara Care'),
        vignette: ('Frau Monika Lehmann, 36, recurrent abdominal pain, bloating, altered bowel habit 8 months. No alarm features. IBS diagnosis documented.', 'Frau Monika Lehmann, 36, rezidivierende Bauchschmerzen, Blähungen, Stuhlveränderung 8 Monate. Keine Alarmzeichen. Reizdarm-Diagnose dokumentiert.'),
        decisionPoint: ('DiGA fit?', 'DiGA-Fit?'), prompt: ('IBS DiGA', 'Reizdarm-DiGA'),
        options: [('IBS never has digital options.', 'Reizdarm hat nie digitale Optionen.'), ('Any digestive app treats IBD.', 'Jede Verdauungs-App behandelt CED.'), ('Alarm features absent — prescribe without documentation.', 'Keine Alarmzeichen — ohne Dokumentation verordnen.'), ('IBS DiGAs (e.g. dietary/behavioural programmes) may fit after alarm exclusion and diagnosis confirmation — document subtype and goals.', 'Reizdarm-DiGAs (z. B. Ernährungs-/Verhaltensprogramme) können nach Alarm-Ausschluss und Diagnosebestätigung passen — Subtyp und Ziele dokumentieren.')],
        rationale: ('IBS has specific digital programmes distinct from IBD pathways.', 'Reizdarm hat spezifische digitale Programme, getrennt von CED-Pfaden.'),
      );

  static SimulationQuestion _meta09(AppLanguage language) => SimulationQuestionFactory.fromPairs(
        id: 'meta-09', phase: SimulationQuizPhase.followUp, correctIndex: 0, language: language,
        title: ('IBS symptom flare on DiGA', 'Reizdarm-Schub unter DiGA'),
        vignette: ('6 weeks Cara Care: improved bloating, new rectal bleeding reported yesterday. Pain increased.', '6 Wochen Cara Care: Blähungen besser, gestern rektale Blutung neu. Schmerz gestiegen.'),
        decisionPoint: ('Priority?', 'Priorität?'), prompt: ('IBS alarm features', 'Reizdarm-Alarmzeichen'),
        options: [('Assess alarm features urgently — rectal bleeding requires workup before continuing IBS DiGA alone.', 'Alarmzeichen dringlich prüfen — rektale Blutung braucht Abklärung vor alleiniger Reizdarm-DiGA-Fortsetzung.'), ('Continue DiGA — bleeding is IBS normal.', 'DiGA fortsetzen — Blutung ist Reizdarm-normal.'), ('Switch to different IBS app only.', 'Nur andere Reizdarm-App wechseln.'), ('Bleeding expected with dietary change.', 'Blutung erwartet bei Ernährungsumstellung.')],
        rationale: ('New alarm features override routine IBS digital management.', 'Neue Alarmzeichen überwiegen routinemäßiges Reizdarm-Digital-Management.'),
      );

  static SimulationQuestion _meta10(AppLanguage language) => SimulationQuestionFactory.fromPairs(
        id: 'meta-10', phase: SimulationQuizPhase.diagnose, correctIndex: 1, language: language,
        title: ('IBD vs IBS — app contraindication', 'CED vs Reizdarm — App-Kontraindikation'),
        vignette: ('Man 28, chronic diarrhoea, weight loss 5 kg, iron deficiency. Assumed IBS. Wants IBS DiGA.', 'Mann 28, chronische Diarrhoe, 5 kg Gewichtsverlust, Eisenmangel. Reizdarm angenommen. Wünscht Reizdarm-DiGA.'),
        decisionPoint: ('Before IBS DiGA?', 'Vor Reizdarm-DiGA?'), prompt: ('IBD red flags', 'CED-Red-Flags'),
        options: [('IBS and IBD DiGAs identical.', 'Reizdarm- und CED-DiGAs identisch.'), ('Weight loss and iron deficiency need IBD exclusion — IBS DiGA inappropriate until inflammatory bowel disease ruled out.', 'Gewichtsverlust und Eisenmangel brauchen CED-Ausschluss — Reizdarm-DiGA unangemessen bis entzündliche Darmerkrankung ausgeschlossen.'), ('Young age confirms IBS.', 'Junges Alter bestätigt Reizdarm.'), ('DiGA diagnoses IBD.', 'DiGA diagnostiziert CED.')],
        rationale: ('IBD alarm features must be excluded before IBS digital pathways.', 'CED-Alarmzeichen müssen vor Reizdarm-Digital-Pfaden ausgeschlossen werden.'),
      );

  static SimulationQuestion _meta11(AppLanguage language) => SimulationQuestionFactory.fromPairs(
        id: 'meta-11', phase: SimulationQuizPhase.prescribe, correctIndex: 2, language: language,
        title: ('Prediabetes prevention DiGA', 'Prädiabetes-Präventions-DiGA'),
        vignette: ('HbA1c 6.1%, BMI 29, family history T2D. Motivated for prevention programme.', 'HbA1c 6,1 %, BMI 29, positive T2D-Familienanamnese. Motiviert für Präventionsprogramm.'),
        decisionPoint: ('Appropriate?', 'Angemessen?'), prompt: ('Prediabetes pathway', 'Prädiabetes-Pfad'),
        options: [('Prediabetes never benefits from intervention.', 'Prädiabetes profitiert nie von Intervention.'), ('Only metformin allowed, no lifestyle.', 'Nur Metformin erlaubt, kein Lifestyle.'), ('Lifestyle digital prevention may fit when indication and programme scope match prediabetes — document goals and re-check HbA1c.', 'Digitale Lifestyle-Prävention kann passen wenn Indikation und Programmumfang zu Prädiabetes passen — Ziele dokumentieren und HbA1c kontrollieren.'), ('Wait until HbA1c 9 before any action.', 'Bis HbA1c 9 warten.')],
        rationale: ('Prediabetes is a key window for structured lifestyle intervention including digital tools.', 'Prädiabetes ist ein Schlüsselfenster für strukturierte Lifestyle-Intervention inkl. digitaler Tools.'),
      );

  static SimulationQuestion _meta12(AppLanguage language) => SimulationQuestionFactory.fromPairs(
        id: 'meta-12', phase: SimulationQuizPhase.followUp, correctIndex: 3, language: language,
        title: ('GLP-1 and digital combined care', 'GLP-1 und digitale kombinierte Versorgung'),
        vignette: ('On semaglutide and obesity DiGA. Lost 8 kg in 12 weeks. Reports nausea managed. Adherence good.', 'Unter Semaglutid und Adipositas-DiGA. 8 kg in 12 Wochen abgenommen. Übelkeit kontrolliert. Gute Adhärenz.'),
        decisionPoint: ('Ongoing plan?', 'Fortlaufender Plan?'), prompt: ('GLP-1 + DiGA', 'GLP-1 + DiGA'),
        options: [('Stop DiGA — drug does all work.', 'DiGA stoppen — Medikament leistet alles.'), ('Stop GLP-1 — app sufficient.', 'GLP-1 stoppen — App ausreichend.'), ('No monitoring needed.', 'Kein Monitoring nötig.'), ('Continue coordinated care, monitor nutrition, GI side effects, muscle mass, and long-term maintenance plan.', 'Koordinierte Versorgung fortsetzen, Ernährung, GI-Nebenwirkungen, Muskelmasse und Langzeit-Erhaltungsplan monitoren.')],
        rationale: ('Combined pharmacotherapy and digital lifestyle needs integrated follow-up.', 'Kombinierte Pharmakotherapie und digitales Lifestyle braucht integriertes Follow-up.'),
      );

  static SimulationQuestion _meta13(AppLanguage language) => SimulationQuestionFactory.fromPairs(
        id: 'meta-13', phase: SimulationQuizPhase.diagnose, correctIndex: 0, language: language,
        title: ('Celiac vs IBS misdiagnosis', 'Zöliakie vs Reizdarm Fehldiagnose'),
        vignette: ('Woman 40, bloating, diarrhoea. Self-diagnosed IBS. On gluten-free diet inconsistently. Wants IBS app.', 'Frau 40, Blähungen, Diarrhoe. Selbst-Reizdarm-Diagnose. Glutenfreie Diät inkonsistent. Wünscht Reizdarm-App.'),
        decisionPoint: ('Before IBS DiGA?', 'Vor Reizdarm-DiGA?'), prompt: ('Celiac screen', 'Zöliakie-Screening'),
        options: [('Confirm diagnosis — celiac disease should be excluded before IBS pathway; serology/testing as indicated before dietary/app programmes.', 'Diagnose bestätigen — Zöliakie vor Reizdarm-Pfad ausschließen; Serologie/Testung wie indiziert vor Ernährungs-/App-Programmen.'), ('Self-diagnosis sufficient for DiGA.', 'Selbstdiagnose ausreichend für DiGA.'), ('Gluten-free diet proves celiac ruled out.', 'Glutenfreie Diät beweist Zöliakie ausgeschlossen.'), ('IBS apps treat celiac.', 'Reizdarm-Apps behandeln Zöliakie.')],
        rationale: ('Celiac mislabelled as IBS is a common error — test before digital IBS care.', 'Zöliakie als Reizdarm fehl etiquettiert ist häufig — testen vor digitaler Reizdarm-Versorgung.'),
      );

  static SimulationQuestion _meta14(AppLanguage language) => SimulationQuestionFactory.fromPairs(
        id: 'meta-14', phase: SimulationQuizPhase.prescribe, correctIndex: 1, language: language,
        title: ('NAFLD metabolic support', 'NAFLD metabolische Unterstützung'),
        vignette: ('NAFLD on ultrasound, BMI 32, ALT mildly elevated. No cirrhosis. Wants weight programme.', 'NAFLD im Ultraschall, BMI 32, ALT leicht erhöht. Keine Zirrhose. Wünscht Gewichtsprogramm.'),
        decisionPoint: ('DiGA role?', 'DiGA-Rolle?'), prompt: ('NAFLD lifestyle', 'NAFLD-Lifestyle'),
        options: [('NAFLD excludes weight management.', 'NAFLD schließt Gewichtsmanagement aus.'), ('Obesity/metabolic DiGA may support weight and lifestyle targets affecting NAFLD — coordinate hepatology monitoring.', 'Adipositas-/metabolische DiGA kann Gewichts- und Lifestyle-Ziele für NAFLD unterstützen — Hepatologie-Monitoring koordinieren.'), ('DiGA treats cirrhosis.', 'DiGA behandelt Zirrhose.'), ('ALT normalisation automatic with app.', 'ALT-Normalisierung automatisch mit App.')],
        rationale: ('NAFLD benefits from weight/lifestyle intervention; digital tools may adjunct specialist monitoring.', 'NAFLD profitiert von Gewichts-/Lifestyle-Intervention; digitale Tools können Spezialmonitoring ergänzen.'),
      );

  static SimulationQuestion _meta15(AppLanguage language) => SimulationQuestionFactory.fromPairs(
        id: 'meta-15', phase: SimulationQuizPhase.followUp, correctIndex: 2, language: language,
        title: ('Malnutrition risk in elderly', 'Mangelernährungsrisiko im Alter'),
        vignette: ('79-year-old on diabetes DiGA lost 3 kg unintentionally in 6 weeks. App encourages calorie deficit.', '79-Jähriger unter Diabetes-DiGA: 3 kg ungewollt in 6 Wochen. App fördert Kaloriendefizit.'),
        decisionPoint: ('Action?', 'Maßnahme?'), prompt: ('Malnutrition screen', 'Mangelernährungs-Screening'),
        options: [('Celebrate weight loss always.', 'Gewichtsverlust immer feiern.'), ('Continue deficit — diabetes needs weight loss.', 'Defizit fortsetzen — Diabetes braucht Abnahme.'), ('Assess malnutrition risk, adjust goals, may pause weight-loss focus, involve dietitian — frailty changes targets.', 'Mangelernährungsrisiko prüfen, Ziele anpassen, ggf. Abnahme-Fokus pausieren, Ernährungsberatung — Frailty verändert Ziele.'), ('Elderly cannot use DiGAs.', 'Ältere können keine DiGAs nutzen.')],
        rationale: ('Unintentional weight loss in elderly needs malnutrition assessment — apps may need goal adjustment.', 'Ungewollter Gewichtsverlust im Alter braucht Mangelernährungs-Assessment — Apps brauchen ggf. Zielanpassung.'),
      );

  static SimulationQuestion _meta16(AppLanguage language) => SimulationQuestionFactory.fromPairs(
        id: 'meta-16', phase: SimulationQuizPhase.diagnose, correctIndex: 3, language: language,
        title: ('GERD lifestyle app boundary', 'GERD-Lifestyle-App-Grenze'),
        vignette: ('Man 55, heartburn 5 years, dysphagia new 2 months, weight stable. Wants digestive lifestyle app.', 'Mann 55, Sodbrennen 5 Jahre, Dysphagie neu seit 2 Monaten, Gewicht stabil. Wünscht Verdauungs-Lifestyle-App.'),
        decisionPoint: ('Response?', 'Antwort?'), prompt: ('Dysphagia alarm', 'Dysphagie-Alarm'),
        options: [('Prescribe GERD lifestyle DiGA.', 'GERD-Lifestyle-DiGA verordnen.'), ('Dysphagia confirms reflux only.', 'Dysphagie bestätigt nur Reflux.'), ('Apps diagnose oesophageal cancer.', 'Apps diagnostizieren Ösophaguskarzinom.'), ('New dysphagia needs endoscopic assessment before attributing to GERD lifestyle pathway alone.', 'Neue Dysphagie braucht endoskopische Abklärung bevor allein GERD-Lifestyle-Pfad.')],
        rationale: ('Alarm features in GI symptoms need investigation before lifestyle DiGA.', 'Alarmzeichen bei GI-Symptomen brauchen Abklärung vor Lifestyle-DiGA.'),
      );

  static SimulationQuestion _meta17(AppLanguage language) => SimulationQuestionFactory.fromPairs(
        id: 'meta-17', phase: SimulationQuizPhase.prescribe, correctIndex: 0, language: language,
        title: ('Pediatric obesity DiGA exclusion', 'Pädiatrische Adipositas-DiGA'),
        vignette: ('Parents request obesity DiGA for 11-year-old, BMI 98th percentile. No comorbidities yet.', 'Eltern wünschen Adipositas-DiGA für 11-Jährigen, BMI 98. Perzentil. Noch keine Komorbiditäten.'),
        decisionPoint: ('Approach?', 'Vorgehen?'), prompt: ('Child obesity DiGA', 'Kinder-Adipositas-DiGA'),
        options: [('Verify paediatric approval and pathways; many obesity DiGAs adult-only — paediatric obesity services may be required.', 'Pädiatrische Freigabe und Pfade prüfen; viele Adipositas-DiGAs nur für Erwachsene — pädiatrische Adipositas-Angebote ggf. nötig.'), ('Prescribe adult zanadio with consent.', 'Erwachsenen-zanadio mit Einwilligung.'), ('Childhood obesity never treated.', 'Kinderadipositas nie behandelt.'), ('BMI percentile irrelevant.', 'BMI-Perzentil irrelevant.')],
        rationale: ('Paediatric obesity needs age-appropriate services and regulatory compliance.', 'Kinderadipositas braucht altersgerechte Angebote und regulatorische Compliance.'),
      );

  static SimulationQuestion _meta18(AppLanguage language) => SimulationQuestionFactory.fromPairs(
        id: 'meta-18', phase: SimulationQuizPhase.followUp, correctIndex: 1, language: language,
        title: ('Bariatric surgery post-op digital', 'Digital post bariatrische OP'),
        vignette: ('6 months post sleeve gastrectomy, using nutrition tracking app. Lost weight adequately. Reports hair loss, fatigue.', '6 Monate post Schlauchmagen, Ernährungs-Tracking-App. Ausreichende Abnahme. Haarausfall, Müdigkeit.'),
        decisionPoint: ('Follow-up focus?', 'Follow-up-Fokus?'), prompt: ('Post-bariatric monitoring', 'Post-bariatrisches Monitoring'),
        options: [('App success means no labs.', 'App-Erfolg bedeutet keine Laborwerte.'), ('Monitor micronutrients, protein intake, surgical follow-up — digital tool supplements but does not replace bariatric surveillance.', 'Mikronährstoffe, Proteinzufuhr, chirurgisches Follow-up monitoren — digitales Tool ergänzt, ersetzt keine bariatrische Surveillance.'), ('Fatigue unrelated to surgery.', 'Müdigkeit unrelated zur OP.'), ('Stop surgical follow-up.', 'Chirurgisches Follow-up stoppen.')],
        rationale: ('Post-bariatric patients need nutritional surveillance beyond app engagement.', 'Post-bariatrische Patienten brauchen Ernährungs-Surveillance jenseits App-Engagement.'),
      );

  static SimulationQuestion _meta19(AppLanguage language) => SimulationQuestionFactory.fromPairs(
        id: 'meta-19', phase: SimulationQuizPhase.diagnose, correctIndex: 2, language: language,
        title: ('Alcohol and liver disease', 'Alkohol und Lebererkrankung'),
        vignette: ('BMI 30, elevated GGT, drinks 4 pints daily. Wants obesity DiGA. AST/ALT mildly raised.', 'BMI 30, GGT erhöht, 4 Bier täglich. Wünscht Adipositas-DiGA. AST/ALT leicht erhöht.'),
        decisionPoint: ('Priority?', 'Priorität?'), prompt: ('Alcohol-related liver', 'Alkoholassoziierte Leber'),
        options: [('Obesity DiGA treats liver enzymes.', 'Adipositas-DiGA behandelt Leberenzyme.'), ('Ignore alcohol if motivated for app.', 'Alkohol ignorieren wenn motiviert für App.'), ('Address alcohol use and liver disease assessment before obesity DiGA — alcohol may be primary driver.', 'Alkoholkonsum und Lebererkrankungs-Abklärung vor Adipositas-DiGA — Alkohol kann primärer Treiber sein.'), ('GGT elevation normal in obesity.', 'GGT-Erhöhung normal bei Adipositas.')],
        rationale: ('Alcohol-related liver disease needs specific management parallel to weight programmes.', 'Alkoholassoziierte Lebererkrankung braucht spezifisches Management parallel zu Gewichtsprogrammen.'),
      );

  static SimulationQuestion _meta20(AppLanguage language) => SimulationQuestionFactory.fromPairs(
        id: 'meta-20', phase: SimulationQuizPhase.prescribe, correctIndex: 3, language: language,
        title: ('Metabolic DiGA documentation standard', 'Metabolische DiGA-Dokumentation'),
        vignette: ('Starting diabetes self-management DiGA for T2D patient with documented HbA1c and goals.', 'Start Diabetes-Self-Management-DiGA bei T2D mit dokumentiertem HbA1c und Zielen.'),
        decisionPoint: ('Minimum standard?', 'Mindeststandard?'), prompt: ('Meta DiGA charting', 'Meta-DiGA-Dokumentation'),
        options: [('Billing code sufficient.', 'Abrechnungscode ausreichend.'), ('Verbal goals only.', 'Nur mündliche Ziele.'), ('Defer labs to app.', 'Labor an App delegieren.'), ('Diagnosis, baseline metrics (HbA1c, weight, BP), meds, targets, hypo/alert education, follow-up schedule with lab review.', 'Diagnose, Baseline-Metriken (HbA1c, Gewicht, BD), Medikamente, Ziele, Hypo-/Alarm-Aufklärung, Follow-up-Plan mit Labor-Review.')],
        rationale: ('Metabolic DiGAs require measurable baselines and scheduled metabolic review.', 'Metabolische DiGAs brauchen messbare Baselines und geplantes metabolisches Review.'),
        teachingPearl: ('Link DiGA goals to next scheduled HbA1c — anchors follow-up to objective outcomes.', 'DiGA-Ziele an nächstes HbA1c koppeln — verankert Follow-up an objektiven Outcomes.'),
      );
}
