import 'package:diga/core/locale/app_locale_provider.dart';
import 'package:diga/features/simulation/domain/models/simulation_question.dart';
import 'package:diga/features/simulation/domain/models/simulation_quiz_phase.dart';
import 'package:diga/features/simulation/presentation/data/simulation_question_factory.dart';

abstract final class MentalSupplementary {
  static List<SimulationQuestion Function(AppLanguage)> get builders => [
        _mh01, _mh02, _mh03, _mh04, _mh05, _mh06, _mh07,
        _mh08, _mh09, _mh10, _mh11, _mh12, _mh13, _mh14,
      ];

  static List<SimulationQuestion> questions(AppLanguage language) =>
      SimulationQuestionFactory.buildAll(language, builders);

  static SimulationQuestion _mh01(AppLanguage language) =>
      SimulationQuestionFactory.fromPairs(
        id: 'mh-01',
        phase: SimulationQuizPhase.diagnose,
        correctIndex: 0,
        language: language,
        title: ('Generalised anxiety — DiGA selection', 'Generalisierte Angst — DiGA-Auswahl'),
        vignette: (
          'Frau Nina Krause, 41, teacher: 8 months excessive worry, restlessness, muscle tension, poor sleep. GAD-7: 14. No panic attacks. PHQ-9: 6. No suicidality. Prior sleep hygiene only. GKV (TK). Wants a digital option while waiting for psychotherapy.',
          'Frau Nina Krause, 41, Lehrerin: seit 8 Monaten übermäßige Sorgen, Unruhe, Muskelverspannungen, Schlafstörungen. GAD-7: 14. Keine Panikattacken. PHQ-9: 6. Keine Suizidalität. Bisher nur Schlafhygiene. GKV (TK). Wünscht digitale Option während VT-Wartezeit.',
        ),
        decisionPoint: (
          'Which approach best guides DiGA selection for generalised anxiety?',
          'Welcher Ansatz leitet die DiGA-Auswahl bei generalisierter Angst am besten?',
        ),
        prompt: ('Anxiety DiGA triage', 'Angst-DiGA-Triage'),
        options: [
          ('Match approved indication (anxiety disorder), rule out panic-specific needs, assess depression comorbidity, and discuss evidence-based CBT-focused apps (e.g. HelloBetter Angst, Selfapy).', 'Zugelassene Indikation (Angststörung) prüfen, panikspezifischen Bedarf ausschließen, Depressionskomorbidität beurteilen und evidenzbasierte VT-fokussierte Apps besprechen (z. B. HelloBetter Angst, Selfapy).'),
          ('Any mental health DiGA is interchangeable — prescribe by app store rating.', 'Jede Mental-Health-DiGA ist austauschbar — nach App-Store-Bewertung verordnen.'),
          ('Anxiety DiGAs require psychiatrist prescription in all cases.', 'Angst-DiGAs erfordern in allen Fällen psychiatrische Verordnung.'),
          ('GAD-7 above 10 always excludes DiGA use.', 'GAD-7 über 10 schließt DiGA-Nutzung immer aus.'),
        ],
        rationale: (
          'Anxiety DiGAs require correct indication, safety screening, and programme fit. GAD without panic may suit several CBT apps; ratings and blanket exclusions are incorrect.',
          'Angst-DiGAs erfordern korrekte Indikation, Sicherheits-Screening und Programm-Fit. GAD ohne Panik kann mehrere VT-Apps passen; Bewertungen und Pauschalausschlüsse sind falsch.',
        ),
        teachingPearl: (
          'Document GAD-7 alongside PHQ-9 — comorbid depression changes programme choice and follow-up intensity.',
          'GAD-7 neben PHQ-9 dokumentieren — komorbide Depression verändert Programmwahl und Follow-up-Intensität.',
        ),
      );

  static SimulationQuestion _mh02(AppLanguage language) =>
      SimulationQuestionFactory.fromPairs(
        id: 'mh-02',
        phase: SimulationQuizPhase.prescribe,
        correctIndex: 1,
        language: language,
        title: ('Panic disorder — HelloBetter Panik fit', 'Panikstörung — HelloBetter Panik'),
        vignette: (
          'Herr Jonas Meier, 35, reports recurrent unexpected panic attacks for 4 months with palpitations, derealisation, and avoidance of public transport. No chest pain at rest. ECG normal. GAD-7: 8. No suicidal ideation. Motivated for structured CBT. GKV (AOK).',
          'Herr Jonas Meier, 35, berichtet seit 4 Monaten rezidivierende unerwartete Panikattacken mit Palpitationen, Derealisation und Vermeidung öffentlicher Verkehrsmittel. Keine Ruhe-Thoraxschmerzen. EKG normal. GAD-7: 8. Keine Suizidgedanken. Motiviert für strukturierte VT. GKV (AOK).',
        ),
        decisionPoint: (
          'What is the most appropriate prescribing consideration?',
          'Was ist die wichtigste verordnungsrelevante Überlegung?',
        ),
        prompt: ('Panic-specific DiGA', 'Panikspezifische DiGA'),
        options: [
          ('Prescribe a depression-only DiGA — panic is a form of low mood.', 'Depressions-only-DiGA verordnen — Panik ist eine Form gedrückter Stimmung.'),
          ('Panic disorder with functional avoidance fits panic-focused CBT DiGAs after cardiac red flags excluded; document diagnosis, safety plan, and follow-up.', 'Panikstörung mit funktioneller Vermeidung passt zu panikfokussierten VT-DiGAs nach Ausschluss kardialer Red Flags; Diagnose, Sicherheitsplan und Follow-up dokumentieren.'),
          ('Panic always requires inpatient care before any DiGA.', 'Panik erfordert immer stationäre Therapie vor jeder DiGA.'),
          ('Prescribe insomnia DiGA because sleep is affected.', 'Insomnie-DiGA verordnen, weil Schlaf betroffen ist.'),
        ],
        rationale: (
          'Panic-specific programmes exist and are appropriate when diagnosis is clear and medical causes excluded. Depression-only or insomnia apps miss the primary disorder.',
          'Panikspezifische Programme existieren und sind bei klarer Diagnose und ausgeschlossenen organischen Ursachen geeignet. Depressions- oder Insomnie-Apps verfehlen die Primärstörung.',
        ),
      );

  static SimulationQuestion _mh03(AppLanguage language) =>
      SimulationQuestionFactory.fromPairs(
        id: 'mh-03',
        phase: SimulationQuizPhase.followUp,
        correctIndex: 2,
        language: language,
        title: ('Anxiety DiGA — poor adherence at 4 weeks', 'Angst-DiGA — geringe Adhärenz nach 4 Wochen'),
        vignette: (
          'Frau Krause returns at 4 weeks. She logged into her anxiety DiGA twice, found modules overwhelming, and stopped. GAD-7 unchanged at 14. Denies worsening mood or suicidality.',
          'Frau Krause nach 4 Wochen: zweimal in Angst-DiGA eingeloggt, Module überfordernd, abgebrochen. GAD-7 unverändert 14. Keine Stimmungsverschlechterung oder Suizidalität.',
        ),
        decisionPoint: (
          'What is the best next step?',
          'Was ist der beste nächste Schritt?',
        ),
        prompt: ('Anxiety DiGA follow-up', 'Angst-DiGA-Verlauf'),
        options: [
          ('Discharge — DiGA failure means no further options.', 'Entlassen — DiGA-Misserfolg bedeutet keine weiteren Optionen.'),
          ('Repeat the same prescription without discussion.', 'Gleiche Verordnung ohne Gespräch wiederholen.'),
          ('Explore barriers, consider alternative programme or guided option, reiterate psychotherapy referral, and schedule structured review.', 'Barrieren erkunden, alternatives/guided Programm erwägen, VT-Überweisung wiederholen und strukturiertes Review planen.'),
          ('Start benzodiazepines without reassessment.', 'Benzodiazepine ohne Re-Evaluation beginnen.'),
        ],
        rationale: (
          'Low adherence warrants barrier analysis and care plan adjustment — not abandonment. Stepped care includes psychotherapy and alternative digital formats.',
          'Geringe Adhärenz erfordert Barrierenanalyse und Plananpassung — kein Abbruch. Stufenversorgung umfasst VT und alternative digitale Formate.',
        ),
      );

  static SimulationQuestion _mh04(AppLanguage language) =>
      SimulationQuestionFactory.fromPairs(
        id: 'mh-04',
        phase: SimulationQuizPhase.diagnose,
        correctIndex: 3,
        language: language,
        title: ('PTSD — DiGA contraindication screen', 'PTSD — DiGA-Kontraindikations-Screening'),
        vignette: (
          'Herr Ali Demir, 32, veteran: nightmares, hypervigilance, flashbacks after assault 2 years ago. PHQ-9: 11. Asks for a general anxiety DiGA. No current substance use. GKV (Barmer).',
          'Herr Ali Demir, 32, Veteran: Alpträume, Hypervigilanz, Flashbacks nach Übergriff vor 2 Jahren. PHQ-9: 11. Wünscht allgemeine Angst-DiGA. Kein aktueller Substanzkonsum. GKV (Barmer).',
        ),
        decisionPoint: (
          'What is the correct response?',
          'Was ist die korrekte Antwort?',
        ),
        prompt: ('Trauma and DiGA eligibility', 'Trauma und DiGA-Eignung'),
        options: [
          ('Prescribe any CBT anxiety DiGA — all use exposure techniques equally.', 'Beliebige VT-Angst-DiGA — alle nutzen Exposition gleich.'),
          ('PTSD never benefits from digital interventions.', 'PTSD profitiert nie von digitalen Interventionen.'),
          ('Prescribe insomnia DiGA for nightmares only.', 'Insomnie-DiGA nur für Alpträume.'),
          ('Screen for PTSD; trauma-focused care may need specialist pathways — generic anxiety DiGAs may be insufficient or inappropriate without trauma assessment.', 'Auf PTSD screenen; traumafokussierte Versorgung kann Spezialpfade brauchen — generische Angst-DiGAs können ohne Trauma-Abklärung unzureichend/unangemessen sein.'),
        ],
        rationale: (
          'Trauma symptoms require specific assessment. Not all anxiety DiGAs are trauma-informed; mis-prescribing risks harm or dropout.',
          'Traumasymptome erfordern spezifische Abklärung. Nicht alle Angst-DiGAs sind traumasensibel; Fehlverordnung riskiert Schaden oder Abbruch.',
        ),
      );

  static SimulationQuestion _mh05(AppLanguage language) =>
      SimulationQuestionFactory.fromPairs(
        id: 'mh-05',
        phase: SimulationQuizPhase.prescribe,
        correctIndex: 0,
        language: language,
        title: ('Eating disorder — depression DiGA request', 'Essstörung — Wunsch nach Depressions-DiGA'),
        vignette: (
          'Frau Lisa Vogel, 22, student: PHQ-9 9, low mood, social withdrawal. BMI 17.2. Reports restrictive eating and fear of weight gain. Denies suicidality. Requests Deprexis.',
          'Frau Lisa Vogel, 22, Studentin: PHQ-9 9, gedrückte Stimmung, sozialer Rückzug. BMI 17,2. Restriktives Essverhalten und Gewichtsangst. Keine Suizidalität. Wünscht Deprexis.',
        ),
        decisionPoint: (
          'What should you do?',
          'Was tun Sie?',
        ),
        prompt: ('Eating disorder exclusion', 'Essstörungs-Ausschluss'),
        options: [
          ('Do not prescribe depression DiGA; active eating disorder is typically an exclusion — refer for eating-disorder assessment first.', 'Keine Depressions-DiGA; aktive Essstörung ist typischer Ausschluss — zuerst essstörungsspezifische Abklärung.'),
          ('Prescribe Deprexis — low PHQ-9 confirms mild depression only.', 'Deprexis verordnen — niedriger PHQ-9 bestätigt nur milde Depression.'),
          ('Prescribe any DiGA to improve appetite.', 'Beliebige DiGA zur Appetitanregung.'),
          ('Wait 6 months without assessment.', '6 Monate ohne Abklärung warten.'),
        ],
        rationale: (
          'Eating disorders are exclusions for most mental health DiGAs. Low mood may be secondary; specialist assessment takes priority.',
          'Essstörungen sind Ausschlusskriterien für die meisten Mental-Health-DiGAs. Niedrige Stimmung kann sekundär sein; Spezialabklärung hat Vorrang.',
        ),
      );

  static SimulationQuestion _mh06(AppLanguage language) =>
      SimulationQuestionFactory.fromPairs(
        id: 'mh-06',
        phase: SimulationQuizPhase.followUp,
        correctIndex: 1,
        language: language,
        title: ('Depression DiGA — emerging suicidality', 'Depressions-DiGA — neu aufkommende Suizidalität'),
        vignette: (
          'Herr Kraft returns at 3 weeks on Selfapy. PHQ-9 rose from 12 to 18. He reports passive suicidal thoughts "most days" but no plan. Still using the app daily.',
          'Herr Kraft nach 3 Wochen mit Selfapy. PHQ-9 von 12 auf 18 gestiegen. Passive Suizidgedanken „fast täglich“, kein Plan. Nutzt App weiterhin täglich.',
        ),
        decisionPoint: (
          'What is mandatory now?',
          'Was ist jetzt zwingend?',
        ),
        prompt: ('Safety escalation', 'Sicherheitseskalation'),
        options: [
          ('Continue DiGA — engagement is good.', 'DiGA fortsetzen — Engagement ist gut.'),
          ('Urgent safety assessment, consider psychiatry/crisis referral, review whether DiGA remains appropriate — suicidality is an exclusion.', 'Dringliche Sicherheitsbeurteilung, Psychiatrie/Krise erwägen, DiGA-Eignung prüfen — Suizidalität ist Ausschluss.'),
          ('Switch to a different depression DiGA only.', 'Nur andere Depressions-DiGA wechseln.'),
          ('Stop all care and discharge.', 'Alle Versorgung beenden und entlassen.'),
        ],
        rationale: (
          'Worsening depression with suicidal ideation requires immediate escalation. DiGAs are not crisis interventions.',
          'Verschlechterte Depression mit Suizidgedanken erfordert sofortige Eskalation. DiGAs sind keine Kriseninterventionen.',
        ),
      );

  static SimulationQuestion _mh07(AppLanguage language) =>
      SimulationQuestionFactory.fromPairs(
        id: 'mh-07',
        phase: SimulationQuizPhase.diagnose,
        correctIndex: 2,
        language: language,
        title: ('Substance use — DiGA eligibility', 'Substanzkonsum — DiGA-Eignung'),
        vignette: (
          'Herr Paul Werner, 45, wants HelloBetter Depression. PHQ-9: 15. Drinks 8–10 beers daily, morning tremor, failed reduction attempts. No suicidality. GKV (TK).',
          'Herr Paul Werner, 45, wünscht HelloBetter Depression. PHQ-9: 15. 8–10 Bier täglich, Morgenzittern, gescheiterte Reduktionsversuche. Keine Suizidalität. GKV (TK).',
        ),
        decisionPoint: (
          'What is the correct prioritisation?',
          'Was ist die korrekte Priorisierung?',
        ),
        prompt: ('Alcohol use disorder screen', 'Screening Alkoholstörung'),
        options: [
          ('Prescribe depression DiGA — alcohol is unrelated.', 'Depressions-DiGA — Alkohol ist unrelated.'),
          ('Depression DiGA will automatically reduce drinking.', 'Depressions-DiGA reduziert Trinken automatisch.'),
          ('Address alcohol use disorder first or in parallel; uncontrolled dependence is often an exclusion — depression DiGA alone is insufficient.', 'Alkoholstörung zuerst oder parallel behandeln; unkontrollierte Abhängigkeit oft Ausschluss — Depressions-DiGA allein unzureichend.'),
          ('Only psychiatrists may discuss alcohol with patients.', 'Nur Psychiater dürfen über Alkohol sprechen.'),
        ],
        rationale: (
          'Active substance dependence commonly excludes mental health DiGAs and needs targeted treatment before or alongside digital depression care.',
          'Aktive Abhängigkeit schließt häufig Mental-Health-DiGAs aus und braucht gezielte Behandlung vor oder parallel zur digitalen Depressionsversorgung.',
        ),
      );

  static SimulationQuestion _mh08(AppLanguage language) =>
      SimulationQuestionFactory.fromPairs(
        id: 'mh-08',
        phase: SimulationQuizPhase.prescribe,
        correctIndex: 3,
        language: language,
        title: ('Velibra - OCD vs anxiety distinction', 'Velibra - Zwang vs Angst'),
        vignette: (
          'Frau Emma Stein, 28, intrusive thoughts and compulsive checking 2+ hours daily for 6 months. GAD-7: 12. PHQ-9: 7. Requests Velibra (anxiety DiGA). No suicidality. GKV (DAK).',
          'Frau Emma Stein, 28, intrusive Gedanken und zwanghaftes Kontrollieren 2+ Stunden/Tag seit 6 Monaten. GAD-7: 12. PHQ-9: 7. Wünscht Velibra (Angst-DiGA). Keine Suizidalität. GKV (DAK).',
        ),
        decisionPoint: (
          'What is the best prescribing approach?',
          'Was ist der beste Verordnungsansatz?',
        ),
        prompt: ('OCD diagnostic accuracy', 'OCD-Diagnosegenauigkeit'),
        options: [
          ('Prescribe Velibra - checking is anxiety.', 'Velibra - Kontrollieren ist Angst.'),
          ('Any CBT app treats OCD equally.', 'Jede VT-App behandelt Zwang gleich.'),
          ('OCD requires benzodiazepines before any therapy.', 'Zwang erfordert Benzodiazepine vor jeder Therapie.'),
          (
            'Differentiate OCD from GAD; OCD may need disorder-specific pathways - generic anxiety DiGA may not deliver appropriate ERP-focused care.',
            'Zwang von GAD unterscheiden; Zwang braucht ggf. spezifische Pfade - generische Angst-DiGA liefert ggf. keine adaequate ERP.',
          ),
        ],
        rationale: (
          'OCD and GAD overlap in scores but need different therapeutic approaches. Diagnostic accuracy precedes DiGA choice.',
          'Zwang und GAD überlappen in Scores, brauchen aber unterschiedliche Therapie. Diagnosegenauigkeit vor DiGA-Wahl.',
        ),
      );

  static SimulationQuestion _mh09(AppLanguage language) =>
      SimulationQuestionFactory.fromPairs(
        id: 'mh-09',
        phase: SimulationQuizPhase.followUp,
        correctIndex: 0,
        language: language,
        title: ('Insomnia DiGA — shift worker adherence', 'Insomnie-DiGA — Schichtarbeiter-Adhärenz'),
        vignette: (
          'Nurse on rotating shifts completed 8 weeks of CBT-I DiGA. ISI improved 18→10 but sleep still fragmented on night shifts. No new depression symptoms.',
          'Pflegekraft im Schichtdienst: 8 Wochen CBT-I-DiGA. ISI 18→10, Schlaf auf Nachtschichten weiter fragmentiert. Keine neuen Depressionszeichen.',
        ),
        decisionPoint: (
          'Best follow-up advice?',
          'Bester Verlaufsrat?',
        ),
        prompt: ('Shift work and CBT-I', 'Schichtarbeit und CBT-I'),
        options: [
          ('Acknowledge partial success, tailor sleep scheduling advice for shift work, continue skills, plan long-term monitoring.', 'Teilerfolg anerkennen, Schicht-Schlafplan anpassen, Fertigkeiten fortsetzen, Langzeit-Monitoring planen.'),
          ('Declare cure and stop all sleep care.', 'Heilung feststellen und Schlafversorgung beenden.'),
          ('Switch to hypnotics as first choice.', 'Hypnotika als Erstwahl wechseln.'),
          ('Insomnia DiGAs never work for shift workers.', 'Insomnie-DiGAs wirken nie bei Schichtarbeitern.'),
        ],
        rationale: (
          'Partial response in shift workers is common; continued structured support beats binary success/failure thinking.',
          'Teilresponse bei Schichtarbeit ist häufig; strukturierte Fortführung schlägt binäres Erfolg/Misserfolg-Denken.',
        ),
      );

  static SimulationQuestion _mh10(AppLanguage language) =>
      SimulationQuestionFactory.fromPairs(
        id: 'mh-10',
        phase: SimulationQuizPhase.diagnose,
        correctIndex: 1,
        language: language,
        title: ('Burnout vs clinical depression', 'Burnout vs klinische Depression'),
        vignette: (
          'Herr Felix Brand, 39, IT manager: exhaustion, cynicism, reduced performance after reorganisation. PHQ-9: 8. No anhedonia or guilt. Sleep intact. Asks for depression DiGA.',
          'Herr Felix Brand, 39, IT-Manager: Erschöpfung, Zynismus, Leistungsabfall nach Reorganisation. PHQ-9: 8. Keine Anhedonie oder Schuld. Schlaf intakt. Wünscht Depressions-DiGA.',
        ),
        decisionPoint: (
          'What is the key diagnostic step?',
          'Was ist der zentrale diagnostische Schritt?',
        ),
        prompt: ('Burnout differential', 'Burnout-Differentialdiagnose'),
        options: [
          ('PHQ-9 above 5 always confirms depression DiGA indication.', 'PHQ-9 über 5 bestätigt immer Depressions-DiGA-Indikation.'),
          ('Differentiate adjustment/burnout from major depression; DiGA prescribing requires appropriate ICD-level diagnosis, not stress label alone.', 'Anpassungsstörung/Burnout von Major Depression unterscheiden; DiGA-Verordnung braucht passende ICD-Diagnose, nicht nur Stress-Label.'),
          ('Burnout always excludes any mental health treatment.', 'Burnout schließt jede psychische Behandlung aus.'),
          ('Prescribe based on employer recommendation.', 'Nach Arbeitgeberempfehlung verordnen.'),
        ],
        rationale: (
          'Occupational stress and clinical depression differ. DiGA prescriptions need valid indication and documentation.',
          'Berufsstress und klinische Depression unterscheiden sich. DiGA-Verordnungen brauchen gültige Indikation und Dokumentation.',
        ),
      );

  static SimulationQuestion _mh11(AppLanguage language) =>
      SimulationQuestionFactory.fromPairs(
        id: 'mh-11',
        phase: SimulationQuizPhase.prescribe,
        correctIndex: 2,
        language: language,
        title: ('Pediatric depression DiGA request', 'Depressions-DiGA-Anfrage bei Jugendlichem'),
        vignette: (
          'Mother brings Tim, 15, with 3 months low mood and school refusal. PHQ-9-A: 14. No self-harm disclosed. Family asks for Deprexis.',
          'Mutter bringt Tim, 15, mit 3 Monaten gedrückter Stimmung und Schulverweigerung. PHQ-9-A: 14. Keine Selbstverletzung angegeben. Familie wünscht Deprexis.',
        ),
        decisionPoint: (
          'What is the prescribing rule?',
          'Was gilt bei der Verordnung?',
        ),
        prompt: ('Age eligibility', 'Alterseignung'),
        options: [
          ('Prescribe adult depression DiGA with parental consent.', 'Erwachsenen-Depressions-DiGA mit Elterneinwilligung.'),
          ('Age does not matter for DiGAs.', 'Alter spielt für DiGAs keine Rolle.'),
          ('Verify age-specific approval and paediatric pathways; many DiGAs are adult-only — child psychiatry referral may be required.', 'Altersspezifische Zulassung und pädiatrische Pfade prüfen; viele DiGAs nur für Erwachsene — Kinderpsychiatrie ggf. nötig.'),
          ('School refusal alone justifies any app.', 'Schulverweigerung allein rechtfertigt jede App.'),
        ],
        rationale: (
          'DiGA indications include age limits. Adolescent depression needs developmental assessment and appropriate services.',
          'DiGA-Indikationen haben Altersgrenzen. Jugenddepression braucht entwicklungsbezogene Abklärung und passende Angebote.',
        ),
      );

  static SimulationQuestion _mh12(AppLanguage language) =>
      SimulationQuestionFactory.fromPairs(
        id: 'mh-12',
        phase: SimulationQuizPhase.followUp,
        correctIndex: 3,
        language: language,
        title: ('Comorbid anxiety and depression', 'Komorbide Angst und Depression'),
        vignette: (
          'Patient on Selfapy 6 weeks: PHQ-9 10→7, GAD-7 still 15. Reports ongoing worry despite mood improvement. Good app adherence.',
          'Patient mit Selfapy nach 6 Wochen: PHQ-9 10→7, GAD-7 weiter 15. Anhaltende Sorgen trotz Stimmungsbesserung. Gute App-Adhärenz.',
        ),
        decisionPoint: (
          'Best next step?',
          'Bester nächster Schritt?',
        ),
        prompt: ('Residual anxiety follow-up', 'Residualangst im Verlauf'),
        options: [
          ('Stop all treatment — depression improved.', 'Behandlung beenden — Depression gebessert.'),
          ('Ignore GAD-7 because depression score improved.', 'GAD-7 ignorieren weil Depressions-Score besser.'),
          ('Add benzodiazepines immediately.', 'Sofort Benzodiazepine hinzufügen.'),
          ('Reassess comorbid anxiety, consider adjunct anxiety programme or psychotherapy, continue monitoring both scales.', 'Komorbide Angst neu beurteilen, ggf. Angstprogramm/VT ergänzen, beide Skalen weiter monitoren.'),
        ],
        rationale: (
          'Partial response with persistent anxiety needs stepped-care adjustment, not premature discharge.',
          'Teilresponse mit persistierender Angst braucht Stufenversorgungs-Anpassung, keinen vorzeitigen Abbruch.',
        ),
      );

  static SimulationQuestion _mh13(AppLanguage language) =>
      SimulationQuestionFactory.fromPairs(
        id: 'mh-13',
        phase: SimulationQuizPhase.diagnose,
        correctIndex: 0,
        language: language,
        title: ('Pregnancy and mental health DiGA', 'Schwangerschaft und Mental-Health-DiGA'),
        vignette: (
          'Frau Sandra Müller, 30, pregnant (12 weeks): PHQ-9 11, insomnia, anxiety about childbirth. No medication wanted. Asks for digital CBT.',
          'Frau Sandra Müller, 30, schwanger (12. SSW): PHQ-9 11, Insomnie, Angst vor Geburt. Keine Medikation gewünscht. Wünscht digitale VT.',
        ),
        decisionPoint: (
          'Key consideration before prescribing?',
          'Zentrale Überlegung vor Verordnung?',
        ),
        prompt: ('Pregnancy safety', 'Sicherheit in der Schwangerschaft'),
        options: [
          ('Review pregnancy-specific cautions in DiGA documentation, coordinate with midwife/OB, prefer programmes with pregnancy evidence or guidance.', 'Schwangerschaftsspezifische Hinweise in DiGA-Doku prüfen, mit Hebamme/Gyn abstimmen, Programme mit Schwangerschaftsevidenz bevorzugen.'),
          ('All DiGAs are automatically safe in pregnancy.', 'Alle DiGAs sind in der Schwangerschaft automatisch sicher.'),
          ('Pregnancy always excludes all digital mental health care.', 'Schwangerschaft schließt jede digitale psychische Versorgung aus.'),
          ('Prescribe based on lowest PHQ-9 app only.', 'Nur nach niedrigstem PHQ-9-App-Verordnen.'),
        ],
        rationale: (
          'Pregnancy requires explicit safety review per programme. Neither blanket approval nor blanket exclusion is correct.',
          'Schwangerschaft erfordert explizite Sicherheitsprüfung pro Programm. Weder pauschale Freigabe noch pauschaler Ausschluss ist korrekt.',
        ),
      );

  static SimulationQuestion _mh14(AppLanguage language) =>
      SimulationQuestionFactory.fromPairs(
        id: 'mh-14',
        phase: SimulationQuizPhase.prescribe,
        correctIndex: 1,
        language: language,
        title: ('DiGA prescription documentation — mental health', 'DiGA-Verordnungsdokumentation — Mental Health'),
        vignette: (
          'You decide to prescribe HelloBetter Angst for Frau Krause after shared decision-making. GKV prescription workflow initiated.',
          'Sie verordnen HelloBetter Angst für Frau Krause nach Shared Decision-making. GKV-Verordnungsworkflow gestartet.',
        ),
        decisionPoint: (
          'Minimum documentation standard?',
          'Mindeststandard der Dokumentation?',
        ),
        prompt: ('Mental health DiGA charting', 'Mental-Health-DiGA-Dokumentation'),
        options: [
          ('App name only in billing field.', 'Nur App-Name im Abrechnungsfeld.'),
          ('Diagnosis (ICD), screening scores, exclusions ruled out, patient goals, programme rationale, follow-up date, crisis/safety advice given.', 'Diagnose (ICD), Screening-Scores, ausgeschlossene Ausschlüsse, Patientenziele, Programmbegründung, Follow-up-Termin, Krisen-/Sicherheitsaufklärung.'),
          ('Verbal consent sufficient — no chart entry.', 'Mündliche Einwilligung reicht — kein Akteneintrag.'),
          ('Documentation deferred to insurer after 90 days.', 'Dokumentation an Kostenträger nach 90 Tagen.'),
        ],
        rationale: (
          'DiGA prescriptions require the same clinical documentation rigour as conventional treatments for continuity and safety.',
          'DiGA-Verordnungen brauchen dieselbe klinische Dokumentationssorgfalt wie konventionelle Behandlungen für Kontinuität und Sicherheit.',
        ),
        teachingPearl: (
          'Store baseline PHQ-9/GAD-7 in the chart — essential for follow-up and quality audits.',
          'Baseline PHQ-9/GAD-7 in der Akte speichern — essenziell für Verlauf und Qualitätsaudits.',
        ),
      );
}
