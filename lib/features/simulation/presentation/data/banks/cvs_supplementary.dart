import 'package:diga/core/locale/app_locale_provider.dart';
import 'package:diga/features/simulation/domain/models/simulation_question.dart';
import 'package:diga/features/simulation/domain/models/simulation_quiz_phase.dart';
import 'package:diga/features/simulation/presentation/data/simulation_question_factory.dart';

abstract final class CvsSupplementary {
  static List<SimulationQuestion Function(AppLanguage)> get builders => [
        _cvs01, _cvs02, _cvs03, _cvs04, _cvs05, _cvs06, _cvs07,
        _cvs08, _cvs09, _cvs10, _cvs11, _cvs12, _cvs13, _cvs14,
        _cvs15, _cvs16, _cvs17,
      ];

  static List<SimulationQuestion> questions(AppLanguage language) =>
      SimulationQuestionFactory.buildAll(language, builders);

  static SimulationQuestion _cvs01(AppLanguage language) => SimulationQuestionFactory.fromPairs(
        id: 'cvs-01', phase: SimulationQuizPhase.diagnose, correctIndex: 0, language: language,
        title: ('Heart failure vs hypertension DiGA', 'Herzinsuffizienz vs Hypertonie-DiGA'),
        vignette: ('Herr Georg Maier, 67, dyspnoea on exertion, ankle oedema, BP 128/78. BNP elevated. Asks for "blood pressure app."', 'Herr Georg Maier, 67, Belastungsdyspnoe, Knöchelödeme, BD 128/78. BNP erhöht. Wünscht „Blutdruck-App“.'),
        decisionPoint: ('Response?', 'Antwort?'), prompt: ('HF vs HTN triage', 'HI vs Hypertonie-Triage'),
        options: [('Heart failure needs HF-specific management first; hypertension lifestyle DiGA is not substitute for HF workup/treatment.', 'Herzinsuffizienz braucht HI-spezifisches Management zuerst; Hypertonie-Lifestyle-DiGA ersetzt keine HI-Abklärung/Therapie.'), ('Any cardio app treats oedema.', 'Jede Cardio-App behandelt Ödeme.'), ('Normal BP excludes cardiac disease.', 'Normaler BD schließt Herzerkrankung aus.'), ('Prescribe CardioCoach for diuretic adherence only.', 'CardioCoach nur für Diuretika-Adhärenz.')],
        rationale: ('DiGA selection must match primary cardiovascular diagnosis.', 'DiGA-Wahl muss zur primären kardiovaskulären Diagnose passen.'),
      );

  static SimulationQuestion _cvs02(AppLanguage language) => SimulationQuestionFactory.fromPairs(
        id: 'cvs-02', phase: SimulationQuizPhase.prescribe, correctIndex: 1, language: language,
        title: ('Resistant hypertension workup', 'Therapierestistente Hypertonie'),
        vignette: ('Frau Schmidt, 54, on 3 antihypertensives. Home BP 158/96. No secondary symptoms screened yet. Wants CardioCoach.', 'Frau Schmidt, 54, auf 3 Antihypertensiva. Heim-BD 158/96. Sekundärursachen noch nicht gescreent. Wünscht CardioCoach.'),
        decisionPoint: ('Before DiGA?', 'Vor DiGA?'), prompt: ('Resistant HTN', 'Resistente Hypertonie'),
        options: [('DiGA replaces fourth drug always.', 'DiGA ersetzt immer viertes Medikament.'), ('Evaluate resistant hypertension causes and medication optimisation; DiGA adjunct only after structured assessment.', 'Ursachen resistenter Hypertonie und Medikationsoptimierung prüfen; DiGA nur als Add-on nach strukturierter Beurteilung.'), ('Resistant HTN excludes all lifestyle interventions.', 'Resistente Hypertonie schließt Lifestyle aus.'), ('Stop all drugs when starting app.', 'Alle Medikamente bei App-Start absetzen.')],
        rationale: ('Uncontrolled BP on polypharmacy needs workup before lifestyle app as sole plan.', 'Unkontrollierter BD unter Polypharmazie braucht Abklärung vor Lifestyle-App als alleinigem Plan.'),
      );

  static SimulationQuestion _cvs03(AppLanguage language) => SimulationQuestionFactory.fromPairs(
        id: 'cvs-03', phase: SimulationQuizPhase.followUp, correctIndex: 2, language: language,
        title: ('Orthostatic symptoms after titration', 'Orthostatische Symptome nach Titration'),
        vignette: ('CardioCoach patient: BP improved but dizziness on standing after amlodipine increase. No syncope.', 'CardioCoach-Patient: BD besser, Schwindel beim Aufstehen nach Amlodipin-Steigerung. Keine Synkope.'),
        decisionPoint: ('Action?', 'Maßnahme?'), prompt: ('Orthostatic hypotension', 'Orthostatische Hypotonie'),
        options: [('Ignore — DiGA success metric only.', 'Ignorieren — nur DiGA-Erfolgsmetrik.'), ('Stop DiGA and all BP drugs.', 'DiGA und alle BD-Medikamente stoppen.'), ('Assess orthostatic BP, review medication timing/dose, continue lifestyle support with safety advice.', 'Orthostatischen BD messen, Medikamenten-Timing/Dosis prüfen, Lifestyle-Support mit Sicherheitsrat fortsetzen.'), ('Advise bed rest 2 weeks.', '2 Wochen Bettruhe.')],
        rationale: ('Orthostatic symptoms need medication review alongside DiGA support.', 'Orthostatische Symptome brauchen Medikationsreview neben DiGA-Support.'),
      );

  static SimulationQuestion _cvs04(AppLanguage language) => SimulationQuestionFactory.fromPairs(
        id: 'cvs-04', phase: SimulationQuizPhase.diagnose, correctIndex: 3, language: language,
        title: ('White-coat hypertension', 'Weißkittelhypertonie'),
        vignette: ('Office BP 152/94, but validated home average 128/82 over 2 weeks. Patient requests hypertension DiGA.', 'Praxis-BD 152/94, validiertes Heimmittel 128/82 über 2 Wochen. Patient wünscht Hypertonie-DiGA.'),
        decisionPoint: ('Implication?', 'Implikation?'), prompt: ('Out-of-office BP', 'BD außerhalb der Praxis'),
        options: [('Office BP alone mandates maximum pharmacotherapy.', 'Praxis-BD allein erzwingt maximale Pharmakotherapie.'), ('Home BP is invalid for decisions.', 'Heim-BD ungültig für Entscheidungen.'), ('White-coat pattern excludes all care.', 'Weißkittel-Muster schließt Versorgung aus.'), ('Use out-of-office readings for risk stratification; DiGA may still support lifestyle if overall cardiovascular risk warrants.', 'BD außerhalb der Praxis zur Risikostratifizierung; DiGA kann Lifestyle unterstützen wenn Gesamtrisiko es rechtfertigt.')],
        rationale: ('Diagnosis and treatment targets rely on confirmed BP pattern, not single office reading.', 'Diagnose und Ziele stützen sich auf bestätigtes BD-Muster, nicht Einzelmessung.'),
      );

  static SimulationQuestion _cvs05(AppLanguage language) => SimulationQuestionFactory.fromPairs(
        id: 'cvs-05', phase: SimulationQuizPhase.prescribe, correctIndex: 0, language: language,
        title: ('Diabetes + hypertension DiGA', 'Diabetes + Hypertonie-DiGA'),
        vignette: ('T2D patient HbA1c 7.4%, BP 145/90 on one drug. Motivated for lifestyle tracking. GKV (TK).', 'T2D-Patient HbA1c 7,4 %, BD 145/90 auf einem Medikament. Motiviert für Lifestyle-Tracking. GKV (TK).'),
        decisionPoint: ('Integrated approach?', 'Integrierter Ansatz?'), prompt: ('Cardiometabolic DiGA', 'Kardiometabolische DiGA'),
        options: [('Coordinate hypertension DiGA with diabetes care goals; document both conditions and avoid siloed prescribing.', 'Hypertonie-DiGA mit Diabetes-Zielen koordinieren; beide Erkrankungen dokumentieren, keine Silo-Verordnung.'), ('Only one DiGA allowed per patient ever.', 'Nur eine DiGA pro Patient je lebenslang.'), ('Diabetes excludes hypertension DiGA.', 'Diabetes schließt Hypertonie-DiGA aus.'), ('Hypertension DiGA controls glucose automatically.', 'Hypertonie-DiGA steuert Glucose automatisch.')],
        rationale: ('Cardiometabolic comorbidity needs coordinated goals across conditions.', 'Kardiometabolische Komorbidität braucht koordinierte Ziele über Erkrankungen hinweg.'),
      );

  static SimulationQuestion _cvs06(AppLanguage language) => SimulationQuestionFactory.fromPairs(
        id: 'cvs-06', phase: SimulationQuizPhase.followUp, correctIndex: 1, language: language,
        title: ('Atrial fibrillation on BP app', 'Vorhofflimmern bei BD-App'),
        vignette: ('Known AF on apixaban. Uses CardioCoach. Reports palpitations increased, irregular pulse at home.', 'Bekanntes VHF unter Apixaban. Nutzt CardioCoach. Mehr Palpitationen, unregelmäßiger Puls zu Hause.'),
        decisionPoint: ('Priority?', 'Priorität?'), prompt: ('AF symptom change', 'VHF-Symptomänderung'),
        options: [('Continue app — palpitations are normal in AF.', 'App fortsetzen — Palpitationen normal bei VHF.'), ('Assess rate control/anticoagulation context, arrange ECG/clinical review — not DiGA-only follow-up.', 'Frequenzkontrolle/Antikoagulation prüfen, EKG/klinisches Review — nicht nur DiGA-Follow-up.'), ('Stop anticoagulation because app helps.', 'Antikoagulation stoppen weil App hilft.'), ('AF contraindicates all digital tools.', 'VHF kontraindiziert alle digitalen Tools.')],
        rationale: ('Symptom change in AF needs clinical assessment beyond lifestyle app data.', 'Symptomänderung bei VHF braucht klinische Beurteilung jenseits Lifestyle-App-Daten.'),
      );

  static SimulationQuestion _cvs07(AppLanguage language) => SimulationQuestionFactory.fromPairs(
        id: 'cvs-07', phase: SimulationQuizPhase.diagnose, correctIndex: 2, language: language,
        title: ('Post-MI rehabilitation digital', 'Digitale Reha nach Myokardinfarkt'),
        vignette: ('6 weeks post MI, completed cardiac rehab, stable on secondary prevention. Asks about digital lifestyle support.', '6 Wochen post MI, Herzreha abgeschlossen, stabil unter Sekundärprävention. Fragt nach digitalem Lifestyle-Support.'),
        decisionPoint: ('Appropriate?', 'Angemessen?'), prompt: ('Post-MI DiGA', 'Post-MI-DiGA'),
        options: [('Immediate high-intensity exercise app without cardiology input.', 'Sofort High-Intensity-Übungs-App ohne Kardiologie.'), ('All post-MI patients excluded from DiGAs forever.', 'Alle Post-MI-Patienten dauerhaft DiGA-ausgeschlossen.'), ('May suit adjunct lifestyle/adherence support when cardiology clearance and programme scope align with post-MI guidelines.', 'Kann Lifestyle-/Adhärenz-Support ergänzen wenn kardiologische Freigabe und Programmumfang zu Post-MI-Leitlinien passen.'), ('DiGA replaces beta-blockers.', 'DiGA ersetzt Betablocker.')],
        rationale: ('Post-MI digital support requires explicit cardiac rehabilitation alignment.', 'Digitaler Post-MI-Support braucht explizite Abstimmung mit Herzreha.'),
      );

  static SimulationQuestion _cvs08(AppLanguage language) => SimulationQuestionFactory.fromPairs(
        id: 'cvs-08', phase: SimulationQuizPhase.prescribe, correctIndex: 3, language: language,
        title: ('Statin adherence support', 'Statin-Adhärenz-Support'),
        vignette: ('Patient with ASCVD on atorvastatin, reports forgetting doses. Interested in digital reminder programme if available.', 'Patient mit ASCVD auf Atorvastatin, vergisst Dosen. Interesse an digitalem Erinnerungsprogramm falls verfügbar.'),
        decisionPoint: ('Role of DiGA?', 'Rolle der DiGA?'), prompt: ('Medication adherence DiGA', 'Medikamenten-Adhärenz-DiGA'),
        options: [('Adherence apps replace statin therapy.', 'Adhärenz-Apps ersetzen Statintherapie.'), ('Forgetting doses means statins contraindicated.', 'Vergessene Dosen bedeuten Statin-Kontraindikation.'), ('Only pharmacists may discuss adherence.', 'Nur Apotheker dürfen Adhärenz besprechen.'), ('Digital adherence tools may supplement — document indication, ensure approved pathway, maintain lipid monitoring.', 'Digitale Adhärenz-Tools können ergänzen — Indikation dokumentieren, zugelassenen Pfad sichern, Lipid-Monitoring aufrechterhalten.')],
        rationale: ('Adherence support is adjunctive to evidence-based pharmacotherapy.', 'Adhärenz-Support ergänzt evidenzbasierte Pharmakotherapie.'),
      );

  static SimulationQuestion _cvs09(AppLanguage language) => SimulationQuestionFactory.fromPairs(
        id: 'cvs-09', phase: SimulationQuizPhase.followUp, correctIndex: 0, language: language,
        title: ('Pregnancy hypertension exclusion', 'Hypertonie in der Schwangerschaft'),
        vignette: ('Pregnant patient 28 weeks with BP 148/92 started rising. Previously on CardioCoach. No proteinuria yet.', 'Schwangere 28. SSW, BD 148/92 steigend. Zuvor CardioCoach. Noch keine Proteinurie.'),
        decisionPoint: ('Action?', 'Maßnahme?'), prompt: ('Gestational HTN', 'Schwangerschaftshypertonie'),
        options: [('Obstetric assessment takes priority; standard hypertension DiGA not appropriate — refer to maternity care pathway.', 'Geburtshilfliche Abklärung hat Vorrang; Standard-Hypertonie-DiGA unangemessen — Mutterschaftspfad.'), ('Continue CardioCoach unchanged.', 'CardioCoach unverändert fortsetzen.'), ('Pregnancy BP managed only by apps.', 'Schwangerschafts-BD nur per Apps.'), ('Stop all BP measurement.', 'Alle BD-Messung stoppen.')],
        rationale: ('Gestational hypertension needs obstetric pathways, not routine lifestyle DiGAs.', 'Schwangerschaftshypertonie braucht geburtshilfliche Pfade, keine Routine-Lifestyle-DiGAs.'),
      );

  static SimulationQuestion _cvs10(AppLanguage language) => SimulationQuestionFactory.fromPairs(
        id: 'cvs-10', phase: SimulationQuizPhase.diagnose, correctIndex: 1, language: language,
        title: ('Oncology supportive DiGA — PINK!', 'Onkologie-Support-DiGA — PINK!'),
        vignette: ('Frau Maria Keller, 48, newly diagnosed breast cancer, starting chemotherapy. High distress. Asks for supportive DiGA.', 'Frau Maria Keller, 48, neu diagnostiziertes Mammakarzinom, Chemotherapie beginnt. Hohe Belastung. Wünscht Support-DiGA.'),
        decisionPoint: ('Primary step?', 'Primärer Schritt?'), prompt: ('Cancer distress triage', 'Krebs-Belastungs-Triage'),
        options: [('DiGA replaces oncology counselling.', 'DiGA ersetzt Onkologie-Beratung.'), ('Ensure oncology team involvement, assess distress/psychosocial needs, consider approved supportive DiGA as adjunct — not substitute for cancer care.', 'Onkologie-Team einbinden, Belastung/psychosoziale Bedürfnisse prüfen, zugelassene Support-DiGA als Add-on — kein Ersatz für Krebsversorgung.'), ('All cancer patients get same DiGA.', 'Alle Krebspatienten gleiche DiGA.'), ('Distress excludes any digital support.', 'Belastung schließt digitalen Support aus.')],
        rationale: ('Oncology supportive DiGAs sit within multidisciplinary cancer care.', 'Onkologie-Support-DiGAs stehen in multidisziplinärer Krebsversorgung.'),
      );

  static SimulationQuestion _cvs11(AppLanguage language) => SimulationQuestionFactory.fromPairs(
        id: 'cvs-11', phase: SimulationQuizPhase.prescribe, correctIndex: 2, language: language,
        title: ('Chemotherapy cardiotoxicity', 'Chemotherapie-Kardiotoxizität'),
        vignette: ('Breast cancer on anthracycline. EF 52% pre-treatment. Oncology asks GP to support lifestyle between cycles.', 'Mammakarzinom mit Anthrazyklin. EF 52 % prätherapeutisch. Onkologie bittet HA um Lifestyle-Support zwischen Zyklen.'),
        decisionPoint: ('GP role?', 'HA-Rolle?'), prompt: ('Cardio-oncology', 'Kardio-Onkologie'),
        options: [('Prescribe intensive cardio exercise DiGA without oncology input.', 'Intensive Cardio-Übungs-DiGA ohne Onkologie.'), ('Cardiotoxicity means no physical activity ever.', 'Kardiotoxizität bedeutet nie körperliche Aktivität.'), ('Coordinate with oncology/cardiology on activity limits; general wellness support only within approved safe boundaries.', 'Mit Onkologie/Kardiologie Aktivitätsgrenzen abstimmen; Wellness-Support nur innerhalb sicherer Grenzen.'), ('GP manages chemotherapy dosing.', 'HA steuert Chemotherapie-Dosierung.')],
        rationale: ('Cardio-oncology coordination precedes generic lifestyle DiGA prescribing.', 'Kardio-onkologische Abstimmung vor generischer Lifestyle-DiGA-Verordnung.'),
      );

  static SimulationQuestion _cvs12(AppLanguage language) => SimulationQuestionFactory.fromPairs(
        id: 'cvs-12', phase: SimulationQuizPhase.followUp, correctIndex: 3, language: language,
        title: ('Palliative vs rehabilitative digital', 'Palliativ vs rehabilitativ digital'),
        vignette: ('Metastatic cancer, ECOG 3, wants "cancer app" for motivation. Life expectancy months.', 'Metastasierendes Karzinom, ECOG 3, wünscht „Krebs-App“ zur Motivation. Lebenserwartung Monate.'),
        decisionPoint: ('Response?', 'Antwort?'), prompt: ('Palliative appropriateness', 'Palliative Angemessenheit'),
        options: [('Prescribe rehabilitative DiGA at full intensity.', 'Rehabilitative DiGA in voller Intensität.'), ('Digital tools always appropriate regardless of stage.', 'Digitale Tools immer angemessen unabhängig vom Stadium.'), ('Ignore patient motivation.', 'Patientenmotivation ignorieren.'), ('Focus on palliative psychosocial support; rehabilitative DiGA likely inappropriate — align goals with palliative team.', 'Palliativen psychosozialen Support fokussieren; rehabilitative DiGA wahrscheinlich unangemessen — Ziele mit Palliativteam.')],
        rationale: ('Goals of care determine DiGA appropriateness in advanced cancer.', 'Versorgungsziele bestimmen DiGA-Angemessenheit bei fortgeschrittenem Krebs.'),
      );

  static SimulationQuestion _cvs13(AppLanguage language) => SimulationQuestionFactory.fromPairs(
        id: 'cvs-13', phase: SimulationQuizPhase.diagnose, correctIndex: 0, language: language,
        title: ('Secondary hypertension screen', 'Sekundäre Hypertonie'),
        vignette: ('Young patient 32, BP 168/104, hypokalaemia, no obesity. Family history negative. Wants lifestyle app.', 'Junger Patient 32, BD 168/104, Hypokaliämie, kein Adipositas. Familienanamnese negativ. Wünscht Lifestyle-App.'),
        decisionPoint: ('Before DiGA?', 'Vor DiGA?'), prompt: ('Secondary HTN red flags', 'Sekundäre Hypertonie Red Flags'),
        options: [('Screen for secondary causes (e.g. hyperaldosteronism) before attributing to primary hypertension lifestyle pathway.', 'Sekundärursachen screenen (z. B. Hyperaldosteronismus) bevor primäre Hypertonie-Lifestyle-Pfad.'), ('Young age excludes workup.', 'Junges Alter schließt Abklärung aus.'), ('Lifestyle app treats hypokalaemia.', 'Lifestyle-App behandelt Hypokaliämie.'), ('Start DiGA while waiting years for labs.', 'DiGA starten während Jahre auf Labor gewartet wird.')],
        rationale: ('Secondary hypertension features need investigation, not app-first management.', 'Merkmale sekundärer Hypertonie brauchen Abklärung, kein App-first-Management.'),
      );

  static SimulationQuestion _cvs14(AppLanguage language) => SimulationQuestionFactory.fromPairs(
        id: 'cvs-14', phase: SimulationQuizPhase.prescribe, correctIndex: 1, language: language,
        title: ('Smoking cessation in CAD patient', 'Rauchstopp bei KHK-Patient'),
        vignette: ('CAD patient smokes 15/day, motivated to quit. Asks if digital programme can be prescribed.', 'KHK-Patient raucht 15/Tag, motiviert aufzuhören. Fragt ob digitales Programm verordnet werden kann.'),
        decisionPoint: ('Approach?', 'Vorgehen?'), prompt: ('Smoking cessation DiGA', 'Rauchstopp-DiGA'),
        options: [('Smoking unrelated to cardiovascular DiGAs.', 'Rauchen unrelated zu kardiovaskulären DiGAs.'), ('Evaluate approved smoking cessation digital options alongside pharmacotherapy/NRT and cardiovascular risk counselling.', 'Zugelassene digitale Rauchstopp-Optionen neben Pharmakotherapie/NRT und kardiovaskulärer Risikoberatung prüfen.'), ('Only hypertension DiGA may be prescribed.', 'Nur Hypertonie-DiGA darf verordnet werden.'), ('Wait until next MI to address smoking.', 'Bis zum nächsten MI mit Rauchen warten.')],
        rationale: ('Smoking cessation is core cardiovascular prevention — digital tools may fit when approved.', 'Rauchstopp ist Kern der kardiovaskulären Prävention — digitale Tools können passen wenn zugelassen.'),
      );

  static SimulationQuestion _cvs15(AppLanguage language) => SimulationQuestionFactory.fromPairs(
        id: 'cvs-15', phase: SimulationQuizPhase.followUp, correctIndex: 2, language: language,
        title: ('Elderly polypharmacy follow-up', 'Geriatrische Polypharmazie im Verlauf'),
        vignette: ('78-year-old on CardioCoach: BP 118/58, two falls last month. On 7 medications.', '78-Jähriger mit CardioCoach: BD 118/58, zwei Stürze letzten Monat. 7 Medikamente.'),
        decisionPoint: ('Review focus?', 'Review-Fokus?'), prompt: ('Falls and hypotension', 'Stürze und Hypotonie'),
        options: [('Celebrate low BP only.', 'Nur niedrigen BD feiern.'), ('Add more antihypertensives.', 'Mehr Antihypertensiva.'), ('Medication review for hypotension/fall risk, adjust targets for frailty, continue lifestyle support cautiously.', 'Medikationsreview auf Hypotonie/Sturzrisiko, Ziele bei Frailty anpassen, Lifestyle-Support vorsichtig fortsetzen.'), ('Discharge elderly from all care.', 'Ältere aus allen Versorgung entlassen.')],
        rationale: ('Geriatric BP targets and fall risk change follow-up priorities.', 'Geriatrische BD-Ziele und Sturzrisiko verändern Follow-up-Prioritäten.'),
      );

  static SimulationQuestion _cvs16(AppLanguage language) => SimulationQuestionFactory.fromPairs(
        id: 'cvs-16', phase: SimulationQuizPhase.diagnose, correctIndex: 3, language: language,
        title: ('Chest pain — not DiGA first', 'Thoraxschmerz — nicht DiGA zuerst'),
        vignette: ('Man 49, new exertional chest pain 3 days, diaphoresis yesterday. BP 138/86. Wants CardioCoach.', 'Mann 49, neue Belastungs-Thoraxschmerzen 3 Tage, gestern Diaphorese. BD 138/86. Wünscht CardioCoach.'),
        decisionPoint: ('Response?', 'Antwort?'), prompt: ('ACS red flags', 'ACS-Red-Flags'),
        options: [('Prescribe CardioCoach for lifestyle.', 'CardioCoach für Lifestyle verordnen.'), ('Chest pain in men is anxiety — mental health DiGA.', 'Thoraxschmerz bei Männern ist Angst — Mental-Health-DiGA.'), ('Normal BP excludes ACS.', 'Normaler BD schließt ACS aus.'), ('Acute coronary syndrome must be excluded before lifestyle hypertension DiGA — urgent assessment if indicated.', 'Akutes Koronarsyndrom ausschließen vor Lifestyle-Hypertonie-DiGA — dringliche Abklärung wenn indiziert.')],
        rationale: ('Acute chest pain triage precedes any lifestyle DiGA discussion.', 'Akuter Thoraxschmerz-Triage vor jeder Lifestyle-DiGA-Diskussion.'),
      );

  static SimulationQuestion _cvs17(AppLanguage language) => SimulationQuestionFactory.fromPairs(
        id: 'cvs-17', phase: SimulationQuizPhase.prescribe, correctIndex: 0, language: language,
        title: ('CVS DiGA documentation standard', 'CVS-DiGA-Dokumentationsstandard'),
        vignette: ('Prescribing CardioCoach after shared decision for hypertensive patient with lifestyle goals.', 'CardioCoach-Verordnung nach Shared Decision bei Hypertoniker mit Lifestyle-Zielen.'),
        decisionPoint: ('Minimum chart entry?', 'Mindest-Akteneintrag?'), prompt: ('CVS DiGA charting', 'CVS-DiGA-Dokumentation'),
        options: [('Diagnosis, baseline BP, cardiovascular risk factors, concurrent meds, lifestyle goals, follow-up metrics, patient information provided.', 'Diagnose, Baseline-BD, kardiovaskuläre Risikofaktoren, Begleitmedikation, Lifestyle-Ziele, Follow-up-Metriken, Patientenaufklärung.'), ('Billing code only.', 'Nur Abrechnungscode.'), ('Verbal consent sufficient.', 'Mündliche Einwilligung reicht.'), ('Defer to cardiologist documentation.', 'Dokumentation an Kardiologen.')],
        rationale: ('Cardiovascular DiGA prescribing requires measurable baseline and follow-up plan.', 'Kardiovaskuläre DiGA-Verordnung braucht messbare Baseline und Follow-up-Plan.'),
        teachingPearl: ('Link home BP log review to scheduled follow-up — improves adherence conversations.', 'Heim-BD-Log-Review an Follow-up-Termin koppeln — verbessert Adhärenz-Gespräche.'),
      );
}
