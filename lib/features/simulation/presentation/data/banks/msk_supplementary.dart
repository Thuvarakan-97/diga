import 'package:diga/core/locale/app_locale_provider.dart';
import 'package:diga/features/simulation/domain/models/simulation_question.dart';
import 'package:diga/features/simulation/domain/models/simulation_quiz_phase.dart';
import 'package:diga/features/simulation/presentation/data/simulation_question_factory.dart';

abstract final class MskSupplementary {
  static List<SimulationQuestion Function(AppLanguage)> get builders => [
        _msk01, _msk02, _msk03, _msk04, _msk05, _msk06, _msk07,
        _msk08, _msk09, _msk10, _msk11, _msk12, _msk13, _msk14,
        _msk15, _msk16, _msk17,
      ];

  static List<SimulationQuestion> questions(AppLanguage language) =>
      SimulationQuestionFactory.buildAll(language, builders);

  static SimulationQuestion _msk01(AppLanguage language) => SimulationQuestionFactory.fromPairs(
        id: 'msk-01', phase: SimulationQuizPhase.diagnose, correctIndex: 0, language: language,
        title: ('Kaia vs Vivira — programme fit', 'Kaia vs Vivira — Programm-Fit'),
        vignette: ('Herr Klaus Neumann, 48, chronic non-specific LBP 7 months. No red flags. Prior PT partial benefit. Wants home exercise DiGA. GKV (TK).', 'Herr Klaus Neumann, 48, chronische unspezifische Kreuzschmerzen 7 Monate. Keine Red Flags. PT teilweise geholfen. Wünscht Heimübungs-DiGA. GKV (TK).'),
        decisionPoint: ('What guides choice between MSK DiGAs?', 'Was leitet die Wahl zwischen MSK-DiGAs?'), prompt: ('Back pain DiGA selection', 'Rückenschmerz-DiGA-Auswahl'),
        options: [('Compare indication, exercise progression model, prior PT response, and patient tech comfort — several apps cover chronic LBP after red-flag exclusion.', 'Indikation, Übungsprogression, PT-Antwort und Tech-Komfort vergleichen — mehrere Apps decken chronische Kreuzschmerzen nach Red-Flag-Ausschluss ab.'), ('Only Vivira exists for back pain.', 'Nur Vivira existiert für Rückenschmerzen.'), ('Imaging abnormalities mandate surgery before any DiGA.', 'Bildgebungsbefunde erzwingen OP vor jeder DiGA.'), ('Age over 45 excludes exercise DiGAs.', 'Alter über 45 schließt Übungs-DiGAs aus.')],
        rationale: ('Multiple permanently listed MSK DiGAs exist; shared decision-making after safety screen is appropriate.', 'Mehrere dauerhaft gelistete MSK-DiGAs; Shared Decision-making nach Safety-Screen ist angemessen.'),
      );

  static SimulationQuestion _msk02(AppLanguage language) => SimulationQuestionFactory.fromPairs(
        id: 'msk-02', phase: SimulationQuizPhase.prescribe, correctIndex: 1, language: language,
        title: ('Fibromyalgia — MSK DiGA request', 'Fibromyalgie — MSK-DiGA-Anfrage'),
        vignette: ('Frau Ingrid Lorenz, 52, widespread pain, fatigue, poor sleep 2 years. Tender points present. Asks for Vivira for "back pain."', 'Frau Ingrid Lorenz, 52, generalisierte Schmerzen, Müdigkeit, Schlafstörungen seit 2 Jahren. Druckpunkte positiv. Wünscht Vivira für „Rückenschmerzen“.'),
        decisionPoint: ('Correct response?', 'Korrekte Antwort?'), prompt: ('Fibromyalgia triage', 'Fibromyalgie-Triage'),
        options: [('Prescribe Vivira — all pain is back pain.', 'Vivira — jeder Schmerz ist Rückenschmerz.'), ('Recognise fibromyalgia pattern; standard LBP DiGAs may not be indicated — consider appropriate multidisciplinary/fibromyalgia pathways.', 'Fibromyalgie-Muster erkennen; Standard-Kreuzschmerz-DiGAs ggf. nicht indiziert — multidisziplinäre/fibromyalgiespezifische Pfade erwägen.'), ('Exercise DiGAs cure fibromyalgia in 4 weeks.', 'Übungs-DiGAs heilen Fibromyalgie in 4 Wochen.'), ('Ignore sleep and fatigue components.', 'Schlaf- und Müdigkeitskomponenten ignorieren.')],
        rationale: ('Diagnostic accuracy prevents mis-prescribing narrow MSK apps for systemic pain syndromes.', 'Diagnosegenauigkeit verhindert Fehlverordnung enger MSK-Apps bei systemischen Schmerzsyndromen.'),
      );

  static SimulationQuestion _msk03(AppLanguage language) => SimulationQuestionFactory.fromPairs(
        id: 'msk-03', phase: SimulationQuizPhase.followUp, correctIndex: 2, language: language,
        title: ('Vivira — adherence dropout', 'Vivira — Adhärenz-Abbruch'),
        vignette: ('Herr Berger at 6 weeks: 30% session completion. Pain unchanged. No red flags. Motivation low after work stress.', 'Herr Berger nach 6 Wochen: 30 % Sitzungen. Schmerz unverändert. Keine Red Flags. Motivation niedrig nach Arbeitsstress.'),
        decisionPoint: ('Best intervention?', 'Beste Intervention?'), prompt: ('MSK DiGA adherence', 'MSK-DiGA-Adhärenz'),
        options: [('Discharge — low adherence means DiGA failed permanently.', 'Entlassen — geringe Adhärenz bedeutet dauerhaften DiGA-Misserfolg.'), ('Double exercise dose without review.', 'Übungsdosis ohne Review verdoppeln.'), ('Explore barriers, adjust intensity, consider PT re-engagement or alternative programme, set realistic goals.', 'Barrieren erkunden, Intensität anpassen, PT/Alternativprogramm erwägen, realistische Ziele setzen.'), ('Immediate MRI for all non-responders.', 'Sofort MRT für alle Non-Responder.')],
        rationale: ('Early dropout warrants barrier analysis and care adjustment before imaging escalation.', 'Früher Abbruch erfordert Barrierenanalyse und Versorgungsanpassung vor Bildgebungseskalation.'),
      );

  static SimulationQuestion _msk04(AppLanguage language) => SimulationQuestionFactory.fromPairs(
        id: 'msk-04', phase: SimulationQuizPhase.diagnose, correctIndex: 3, language: language,
        title: ('Inflammatory back pain screen', 'Screening entzündliche Rückenschmerzen'),
        vignette: ('Herr Omar Hassan, 29, chronic back pain 8 months, morning stiffness >1 hour, improves with exercise, night pain. HLA-B27 pending.', 'Herr Omar Hassan, 29, chronische Rückenschmerzen 8 Monate, Morgensteifigkeit >1 h, besser bei Bewegung, Nachtschmerz. HLA-B27 ausstehend.'),
        decisionPoint: ('Before MSK DiGA?', 'Vor MSK-DiGA?'), prompt: ('Inflammatory vs mechanical LBP', 'Entzündlich vs mechanisch'),
        options: [('Prescribe Vivira immediately.', 'Sofort Vivira.'), ('Night pain is normal in mechanical LBP.', 'Nachtschmerz normal bei mechanischen Kreuzschmerzen.'), ('Age under 40 excludes inflammatory disease.', 'Alter unter 40 schließt Entzündung aus.'), ('Screen for inflammatory spondyloarthritis; exercise DiGA inappropriate until inflammatory disease excluded or co-managed.', 'Auf entzündliche Spondyloarthritis screenen; Übungs-DiGA unangemessen bis Entzündung ausgeschlossen oder mitbehandelt.')],
        rationale: ('Inflammatory back pain needs rheumatology workup — generic exercise DiGAs may delay diagnosis.', 'Entzündliche Rückenschmerzen brauchen rheumatologische Abklärung — generische Übungs-DiGAs können Diagnose verzögern.'),
      );

  static SimulationQuestion _msk05(AppLanguage language) => SimulationQuestionFactory.fromPairs(
        id: 'msk-05', phase: SimulationQuizPhase.prescribe, correctIndex: 0, language: language,
        title: ('Post-PT Vivira prescribing', 'Vivira-Verordnung nach Physiotherapie'),
        vignette: ('Frau Richter cleared of red flags. Completed 8 PT sessions with moderate benefit. Wants structured home progression. Smartphone capable.', 'Frau Richter ohne Red Flags. 8 PT-Sitzungen mit moderatem Nutzen. Wünscht strukturierte Heimprogression. Smartphone-fähig.'),
        decisionPoint: ('Supports Vivira prescribing?', 'Stützt Vivira-Verordnung?'), prompt: ('PT to DiGA transition', 'PT-zu-DiGA-Übergang'),
        options: [('Chronic non-specific LBP after conservative care and red-flag exclusion fits exercise DiGA with documented goals and follow-up.', 'Chronische unspezifische Kreuzschmerzen nach konservativer Therapie und Red-Flag-Ausschluss passen zu Übungs-DiGA mit dokumentierten Zielen und Follow-up.'), ('Must fail surgery first.', 'Muss zuerst OP scheitern.'), ('PT completion prohibits any DiGA.', 'Abgeschlossene PT verbietet jede DiGA.'), ('Only under-30 patients qualify.', 'Nur unter 30 qualifiziert.')],
        rationale: ('DiGAs often extend PT gains at home when indication and safety criteria are met.', 'DiGAs verlängern oft PT-Erfolg zu Hause bei erfüllter Indikation und Sicherheitskriterien.'),
      );

  static SimulationQuestion _msk06(AppLanguage language) => SimulationQuestionFactory.fromPairs(
        id: 'msk-06', phase: SimulationQuizPhase.followUp, correctIndex: 1, language: language,
        title: ('New leg pain on Vivira', 'Neue Beinschmerzen unter Vivira'),
        vignette: ('Week 3: new shooting leg pain, numbness in foot, pain worse when coughing. Previously back-only symptoms.', 'Woche 3: neue stechende Beinschmerzen, Fußtaubheit, schlimmer beim Husten. Zuvor nur Rücken.'),
        decisionPoint: ('Action?', 'Maßnahme?'), prompt: ('Neurological escalation', 'Neurologische Eskalation'),
        options: [('Continue Vivira — leg pain is muscle soreness.', 'Vivira fortsetzen — Beinschmerz ist Muskelkater.'), ('Stop DiGA, urgent reassessment for radiculopathy/cauda equina red flags.', 'DiGA stoppen, dringliche Re-Evaluation auf Radikulopathie/Cauda-equina-Red-Flags.'), ('Add NSAIDs and ignore neurological signs.', 'NSAR und neurologische Zeichen ignorieren.'), ('Switch to different back DiGA only.', 'Nur andere Rücken-DiGA wechseln.')],
        rationale: ('New neurological symptoms require immediate reassessment — not programme continuation.', 'Neue neurologische Symptome erfordern sofortige Re-Evaluation — keine Programmfortsetzung.'),
      );

  static SimulationQuestion _msk07(AppLanguage language) => SimulationQuestionFactory.fromPairs(
        id: 'msk-07', phase: SimulationQuizPhase.diagnose, correctIndex: 2, language: language,
        title: ('Osteoporosis and exercise DiGA', 'Osteoporose und Übungs-DiGA'),
        vignette: ('Frau Helene Weiss, 68, chronic LBP. Known osteoporosis T-score −2.8. No fractures. Stable on alendronate. Wants Kaia.', 'Frau Helene Weiss, 68, chronische Kreuzschmerzen. Bekannte Osteoporose T-Score −2,8. Keine Frakturen. Stabil mit Alendronat. Wünscht Kaia.'),
        decisionPoint: ('Key consideration?', 'Zentrale Überlegung?'), prompt: ('Osteoporosis safety', 'Osteoporose-Sicherheit'),
        options: [('Osteoporosis absolutely excludes all exercise.', 'Osteoporose schließt jede Übung aus.'), ('Any high-impact programme is ideal.', 'Jedes High-Impact-Programm ideal.'), ('Review programme loading and contraindications; favour progressive, low-fracture-risk exercises with documented bone health context.', 'Belastung und Kontraindikationen prüfen; progressive, niedrig-frakturgefährdende Übungen mit Knochengesundheits-Kontext bevorzugen.'), ('Stop alendronate when starting DiGA.', 'Alendronat bei DiGA-Start absetzen.')],
        rationale: ('Osteoporosis requires tailored loading — not blanket exclusion or high-impact defaults.', 'Osteoporose braucht angepasste Belastung — kein Pauschalausschluss oder High-Impact-Default.'),
      );

  static SimulationQuestion _msk08(AppLanguage language) => SimulationQuestionFactory.fromPairs(
        id: 'msk-08', phase: SimulationQuizPhase.prescribe, correctIndex: 3, language: language,
        title: ('MSK DiGA documentation', 'MSK-DiGA-Dokumentation'),
        vignette: ('Prescribing Vivira after shared decision for chronic LBP patient without red flags.', 'Vivira-Verordnung nach Shared Decision bei chronischen Kreuzschmerzen ohne Red Flags.'),
        decisionPoint: ('Required documentation?', 'Erforderliche Dokumentation?'), prompt: ('MSK prescribing chart', 'MSK-Verordnungsakte'),
        options: [('Download code only.', 'Nur Download-Code.'), ('Patient age and insurance number only.', 'Nur Alter und Versichertennummer.'), ('Imaging report verbatim only.', 'Nur Bildgebungsbericht wörtlich.'), ('Diagnosis, duration, red-flag assessment, prior conservative care, goals, stop rules, follow-up plan.', 'Diagnose, Dauer, Red-Flag-Assessment, konservative Vortherapie, Ziele, Stop-Regeln, Follow-up-Plan.')],
        rationale: ('MSK DiGA documentation must capture safety screening and functional goals.', 'MSK-DiGA-Doku muss Safety-Screening und Funktionsziele erfassen.'),
      );

  static SimulationQuestion _msk09(AppLanguage language) => SimulationQuestionFactory.fromPairs(
        id: 'msk-09', phase: SimulationQuizPhase.followUp, correctIndex: 0, language: language,
        title: ('Functional improvement on Kaia', 'Funktionsverbesserung mit Kaia'),
        vignette: ('8 weeks: pain 5→3/10, return-to-work 50%→80%, 85% adherence. Occasional mild soreness after new exercises.', '8 Wochen: Schmerz 5→3/10, Arbeitsrückkehr 50→80 %, 85 % Adhärenz. Gelegentlicher leichter Muskelkater.'),
        decisionPoint: ('Best response?', 'Beste Reaktion?'), prompt: ('Positive MSK follow-up', 'Positiver MSK-Verlauf'),
        options: [('Reinforce success, continue graded progression, document outcomes, plan maintenance phase.', 'Erfolg festigen, gestufte Progression fortsetzen, Outcomes dokumentieren, Erhaltungsphase planen.'), ('Stop all exercise immediately.', 'Sofort alle Übung stoppen.'), ('Refer for surgery due to residual pain.', 'OP-Überweisung wegen Restschmerz.'), ('Ignore functional gains — pain score only matters.', 'Funktionsgewinne ignorieren — nur Schmerzscore zählt.')],
        rationale: ('Functional and adherence gains support continued structured care with documentation.', 'Funktions- und Adhärenzgewinne stützen fortgesetzte strukturierte Versorgung mit Dokumentation.'),
      );

  static SimulationQuestion _msk10(AppLanguage language) => SimulationQuestionFactory.fromPairs(
        id: 'msk-10', phase: SimulationQuizPhase.diagnose, correctIndex: 1, language: language,
        title: ('Cancer history — back pain', 'Tumoranamnese — Rückenschmerzen'),
        vignette: ('Herr Frank Otto, 61, new back pain 6 weeks. History of prostate cancer in remission 3 years. No weight loss. No fever.', 'Herr Frank Otto, 61, neue Rückenschmerzen 6 Wochen. Prostatakarzinom in Remission seit 3 Jahren. Kein Gewichtsverlust. Kein Fieber.'),
        decisionPoint: ('Before exercise DiGA?', 'Vor Übungs-DiGA?'), prompt: ('Oncology red flags', 'Onkologie-Red-Flags'),
        options: [('Cancer history is irrelevant after 3 years.', 'Tumoranamnese nach 3 Jahren irrelevant.'), ('Consider metastatic workup when cancer history plus new persistent pain — exclude serious pathology before DiGA.', 'Bei Tumoranamnese und neuen persistierenden Schmerzen Metastasen-Abklärung erwägen — ernste Pathologie vor DiGA ausschließen.'), ('All cancer survivors are DiGA-excluded forever.', 'Alle Krebsüberlebenden dauerhaft DiGA-ausgeschlossen.'), ('Prescribe DiGA to avoid alarming patient.', 'DiGA verordnen um Patienten nicht zu beunruhigen.')],
        rationale: ('Cancer history lowers threshold for imaging/workup in new back pain.', 'Tumoranamnese senkt Schwelle für Bildgebung/Abklärung bei neuen Rückenschmerzen.'),
      );

  static SimulationQuestion _msk11(AppLanguage language) => SimulationQuestionFactory.fromPairs(
        id: 'msk-11', phase: SimulationQuizPhase.prescribe, correctIndex: 2, language: language,
        title: ('PHQ-9 comorbidity in chronic pain', 'PHQ-9-Komorbidität bei chronischem Schmerz'),
        vignette: ('Chronic LBP patient PHQ-9: 14, passive suicidal ideation denied. Suitable for Vivira biomechanically. GKV (AOK).', 'Chronische Kreuzschmerzen, PHQ-9: 14, passive Suizidgedanken verneint. Biomechanisch für Vivira geeignet. GKV (AOK).'),
        decisionPoint: ('Prescribing approach?', 'Verordnungsansatz?'), prompt: ('Pain and depression', 'Schmerz und Depression'),
        options: [('Ignore PHQ-9 — MSK DiGA only treats back.', 'PHQ-9 ignorieren — MSK-DiGA behandelt nur Rücken.'), ('Depression automatically excludes all MSK DiGAs.', 'Depression schließt alle MSK-DiGAs aus.'), ('Address depression in parallel; MSK DiGA may proceed if safe with mental health follow-up/co-management.', 'Depression parallel behandeln; MSK-DiGA möglich bei Sicherheit mit psychischem Follow-up/Co-Management.'), ('Prescribe two MSK DiGAs for mood.', 'Zwei MSK-DiGAs für Stimmung.')],
        rationale: ('Depression affects pain outcomes; co-management improves safety and effectiveness.', 'Depression beeinflusst Schmerzoutcomes; Co-Management verbessert Sicherheit und Wirksamkeit.'),
      );

  static SimulationQuestion _msk12(AppLanguage language) => SimulationQuestionFactory.fromPairs(
        id: 'msk-12', phase: SimulationQuizPhase.followUp, correctIndex: 3, language: language,
        title: ('Pain catastrophizing', 'Schmerzkatastrophisieren'),
        vignette: ('Patient with good exercise adherence reports fear of "permanent damage" and avoids all daily activity despite improving ROM.', 'Gute Übungsadhärenz, aber Angst vor „dauerhaftem Schaden“, vermeidet Alltagsaktivität trotz besserer ROM.'),
        decisionPoint: ('Best addition?', 'Beste Ergänzung?'), prompt: ('Yellow flags follow-up', 'Gelbe Flaggen im Verlauf'),
        options: [('Stop DiGA — fear means failure.', 'DiGA stoppen — Angst bedeutet Misserfolg.'), ('Ignore beliefs — exercise fixes cognition.', 'Überzeugungen ignorieren — Übung heilt Kognition.'), ('Increase opioid dose.', 'Opioiddosis erhöhen.'), ('Address catastrophizing (education, pacing, psychology referral if needed) alongside continued graded exercise.', 'Katastrophisieren adressieren (Aufklärung, Pacing, ggf. Psychologie) neben gestufter Übung.')],
        rationale: ('Yellow flags need targeted intervention — exercise alone may be insufficient.', 'Gelbe Flaggen brauchen gezielte Intervention — Übung allein kann unzureichend sein.'),
      );

  static SimulationQuestion _msk13(AppLanguage language) => SimulationQuestionFactory.fromPairs(
        id: 'msk-13', phase: SimulationQuizPhase.diagnose, correctIndex: 0, language: language,
        title: ('Acute LBP — DiGA timing', 'Akute Kreuzschmerzen — DiGA-Timing'),
        vignette: ('Herr Leo Brand, 33, acute LBP 5 days after gardening. No leg symptoms. No red flags. Asks for immediate Vivira.', 'Herr Leo Brand, 33, akute Kreuzschmerzen 5 Tage nach Gartenarbeit. Keine Beinsymptome. Keine Red Flags. Wünscht sofort Vivira.'),
        decisionPoint: ('Correct advice?', 'Korrekter Rat?'), prompt: ('Acute vs chronic pathway', 'Akut vs chronisch'),
        options: [('Most MSK DiGAs target chronic LBP (typically ≥12 weeks); acute phase needs brief advice, activity guidance, reassess if persistent.', 'Die meisten MSK-DiGAs zielen auf chronische Kreuzschmerzen (typisch ≥12 Wochen); Akutphase braucht Kurzberatung, Aktivitätsführung, Re-Evaluation bei Persistenz.'), ('Acute pain always needs emergency MRI.', 'Akutschmerz braucht immer Notfall-MRT.'), ('Prescribe immediately — earlier app is always better.', 'Sofort verordnen — frühere App immer besser.'), ('Bed rest for 4 weeks first.', '4 Wochen Bettruhe zuerst.')],
        rationale: ('DiGA indications emphasise chronicity; acute management differs.', 'DiGA-Indikationen betonen Chronizität; Akutmanagement unterscheidet sich.'),
      );

  static SimulationQuestion _msk14(AppLanguage language) => SimulationQuestionFactory.fromPairs(
        id: 'msk-14', phase: SimulationQuizPhase.prescribe, correctIndex: 1, language: language,
        title: ('Workplace ergonomics referral', 'Arbeitsplatz-Ergonomie'),
        vignette: ('Office worker with chronic LBP identifies prolonged sitting as main trigger. Starting Kaia. Employer offers ergonomic assessment.', 'Büroangestellte mit chronischen Kreuzschmerzen, langes Sitzen als Trigger. Start Kaia. Arbeitgeber bietet Ergonomie-Assessment.'),
        decisionPoint: ('Holistic plan?', 'Ganzheitlicher Plan?'), prompt: ('Biopsychosocial MSK care', 'Biopsychosoziale MSK-Versorgung'),
        options: [('DiGA replaces all workplace interventions.', 'DiGA ersetzt alle Arbeitsplatz-Interventionen.'), ('Combine DiGA with ergonomic modifications and activity pacing for sustainable return-to-work.', 'DiGA mit ergonomischen Anpassungen und Activity-Pacing für nachhaltige Arbeitsrückkehr kombinieren.'), ('Ergonomics contraindicates exercise DiGAs.', 'Ergonomie kontraindiziert Übungs-DiGAs.'), ('Only physiotherapy may address work factors.', 'Nur Physiotherapie darf Arbeitsfaktoren adressieren.')],
        rationale: ('Best outcomes combine digital exercise with occupational factors.', 'Beste Outcomes kombinieren digitale Übung mit beruflichen Faktoren.'),
      );

  static SimulationQuestion _msk15(AppLanguage language) => SimulationQuestionFactory.fromPairs(
        id: 'msk-15', phase: SimulationQuizPhase.followUp, correctIndex: 2, language: language,
        title: ('Post-surgical rehabilitation boundary', 'Grenze postoperative Rehabilitation'),
        vignette: ('6 weeks post lumbar microdiscectomy, surgeon cleared light activity. Patient wants Vivira instead of outpatient PT.', '6 Wochen post Mikrodiskektomie, Chirurg gab leichte Aktivität frei. Patient wünscht Vivira statt ambulanter PT.'),
        decisionPoint: ('Appropriate?', 'Angemessen?'), prompt: ('Post-op DiGA timing', 'Post-OP-DiGA-Timing'),
        options: [('Any DiGA replaces surgeon instructions.', 'Jede DiGA ersetzt chirurgische Anweisungen.'), ('Post-op patients never use DiGAs.', 'Post-OP-Patienten nutzen nie DiGAs.'), ('Coordinate with surgical/PT guidance; DiGA may supplement when clearance and programme scope match post-op protocols.', 'Mit chirurgischer/PT-Anleitung abstimmen; DiGA kann ergänzen wenn Freigabe und Programmumfang zu Post-OP-Protokollen passen.'), ('Wait 2 years before any movement.', '2 Jahre warten vor jeder Bewegung.')],
        rationale: ('Post-operative use requires explicit alignment with surgical rehabilitation plans.', 'Postoperative Nutzung braucht explizite Abstimmung mit Reha-Plänen.'),
      );

  static SimulationQuestion _msk16(AppLanguage language) => SimulationQuestionFactory.fromPairs(
        id: 'msk-16', phase: SimulationQuizPhase.diagnose, correctIndex: 3, language: language,
        title: ('Shoulder pain — wrong DiGA domain', 'Schulterschmerz — falsche DiGA-Domäne'),
        vignette: ('Frau Petra Klein, 44, isolated right shoulder pain 4 months, overhead movement limited. No back pain. Requests Vivira.', 'Frau Petra Klein, 44, isolierte rechte Schulterschmerzen 4 Monate, Überkopfbewegung eingeschränkt. Keine Rückenschmerzen. Wünscht Vivira.'),
        decisionPoint: ('Response?', 'Antwort?'), prompt: ('Indication accuracy', 'Indikationsgenauigkeit'),
        options: [('Prescribe Vivira — shoulder is part of back.', 'Vivira — Schulter ist Teil des Rückens.'), ('All MSK DiGAs treat any joint.', 'Alle MSK-DiGAs behandeln jedes Gelenk.'), ('Shoulder pain always needs surgery first.', 'Schulterschmerz braucht immer zuerst OP.'), ('Vivira targets chronic LBP — shoulder pathology needs appropriate assessment and shoulder-specific pathways, not LBP DiGA.', 'Vivira zielt auf chronische Kreuzschmerzen — Schulterpathologie braucht passende Abklärung und schulterspezifische Pfade, keine LBP-DiGA.')],
        rationale: ('Prescribing outside approved indication is a common DiGA error.', 'Verordnung außerhalb der Zulassungsindikation ist häufiger DiGA-Fehler.'),
      );

  static SimulationQuestion _msk17(AppLanguage language) => SimulationQuestionFactory.fromPairs(
        id: 'msk-17', phase: SimulationQuizPhase.prescribe, correctIndex: 0, language: language,
        title: ('GKV prescription workflow', 'GKV-Verordnungsworkflow'),
        vignette: ('Eligible patient selected Vivira. You initiate DiGA prescription via standard GKV workflow.', 'Geeigneter Patient wählte Vivira. Sie starten DiGA-Verordnung über Standard-GKV-Workflow.'),
        decisionPoint: ('Physician responsibility?', 'Ärztliche Verantwortung?'), prompt: ('DiGA billing workflow', 'DiGA-Abrechnungsworkflow'),
        options: [('Ensure correct indication documented, patient receives activation instructions, follow-up scheduled — billing code alone is insufficient care.', 'Korrekte Indikation dokumentieren, Patient erhält Aktivierungsanleitung, Follow-up geplant — Abrechnungscode allein ist unzureichende Versorgung.'), ('Insurer handles all clinical follow-up.', 'Kostenträger übernimmt gesamtes klinisches Follow-up.'), ('No follow-up needed for exercise apps.', 'Kein Follow-up für Übungs-Apps nötig.'), ('Patient self-manages without physician contact.', 'Patient self-managed ohne Arztkontakt.')],
        rationale: ('GKV DiGA workflow requires ongoing physician oversight, not one-time code issuance.', 'GKV-DiGA-Workflow erfordert laufende ärztliche Begleitung, nicht einmalige Code-Vergabe.'),
        teachingPearl: ('Link prescription to functional goals measurable at follow-up (days off work, walking tolerance).', 'Verordnung an messbaren Funktionszielen für Follow-up koppeln (Ausfalltage, Gehtoleranz).'),
      );
}
