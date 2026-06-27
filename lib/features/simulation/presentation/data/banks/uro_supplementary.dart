import 'package:diga/core/locale/app_locale_provider.dart';
import 'package:diga/features/simulation/domain/models/simulation_question.dart';
import 'package:diga/features/simulation/domain/models/simulation_quiz_phase.dart';
import 'package:diga/features/simulation/presentation/data/simulation_question_factory.dart';

abstract final class UroSupplementary {
  static List<SimulationQuestion Function(AppLanguage)> get builders => [
        _uro01, _uro02, _uro03, _uro04, _uro05, _uro06, _uro07, _uro08,
        _uro09, _uro10, _uro11, _uro12, _uro13, _uro14, _uro15, _uro16,
        _uro17, _uro18, _uro19, _uro20,
      ];

  static List<SimulationQuestion> questions(AppLanguage language) =>
      SimulationQuestionFactory.buildAll(language, builders);

  static SimulationQuestion _uro01(AppLanguage language) => SimulationQuestionFactory.fromPairs(
        id: 'uro-01', phase: SimulationQuizPhase.diagnose, correctIndex: 0, language: language,
        title: ('Stress vs urge incontinence', 'Belastungs- vs Dranginkontinenz'),
        vignette: ('Frau Anna Weber, 52, leaks urine when coughing and jogging. No urgency. 3 vaginal births. GKV (TK).', 'Frau Anna Weber, 52, Urinverlust beim Husten und Joggen. Keine Drangsymptomatik. 3 vaginale Geburten. GKV (TK).'),
        decisionPoint: ('DiGA implication?', 'DiGA-Implikation?'), prompt: ('Incontinence type triage', 'Inkontinenz-Typ-Triage'),
        options: [('Stress incontinence pattern may suit pelvic-floor exercise DiGAs after basic assessment; urge symptoms would shift approach.', 'Belastungsinkontinenz-Muster kann Beckenboden-Übungs-DiGAs nach Basisabklärung passen; Drangsymptomatik würde Ansatz ändern.'), ('All incontinence types use identical apps without assessment.', 'Alle Inkontinenztypen identische Apps ohne Abklärung.'), ('Incontinence never qualifies for DiGA.', 'Inkontinenz qualifiziert nie für DiGA.'), ('Urodynamics mandatory before any discussion.', 'Urodynamik zwingend vor jedem Gespräch.')],
        rationale: ('Incontinence subtype guides pelvic-floor DiGA selection.', 'Inkontinenz-Subtyp leitet Beckenboden-DiGA-Wahl.'),
      );

  static SimulationQuestion _uro02(AppLanguage language) => SimulationQuestionFactory.fromPairs(
        id: 'uro-02', phase: SimulationQuizPhase.prescribe, correctIndex: 1, language: language,
        title: ('Pelvina prescribing — stress incontinence', 'Pelvina-Verordnung — Belastungsinkontinenz'),
        vignette: ('Confirmed mild-moderate stress incontinence, motivated for home pelvic-floor training. Smartphone capable.', 'Bestätigte mild-moderate Belastungsinkontinenz, motiviert für Heim-Beckenbodentraining. Smartphone-fähig.'),
        decisionPoint: ('Prescribing essentials?', 'Verordnungs-Essentials?'), prompt: ('Pelvina documentation', 'Pelvina-Dokumentation'),
        options: [('App code only.', 'Nur App-Code.'), ('Document incontinence type, prior conservative measures, treatment goals, correct exercise technique counselling, follow-up to assess symptom change.', 'Inkontinenztyp, konservative Vormaßnahmen, Therapieziele, Übungstechnik-Aufklärung, Follow-up zur Symptomänderung dokumentieren.'), ('No follow-up for pelvic apps.', 'Kein Follow-up für Becken-Apps.'), ('Prescribe without bladder diary.', 'Ohne Blasentagebuch verordnen.')],
        rationale: ('Pelvic-floor DiGA prescribing requires subtype documentation and technique guidance.', 'Beckenboden-DiGA-Verordnung braucht Subtyp-Doku und Technik-Anleitung.'),
      );

  static SimulationQuestion _uro03(AppLanguage language) => SimulationQuestionFactory.fromPairs(
        id: 'uro-03', phase: SimulationQuizPhase.followUp, correctIndex: 2, language: language,
        title: ('Insufficient improvement at 8 weeks', 'Unzureichende Besserung nach 8 Wochen'),
        vignette: ('Pelvic-floor DiGA 8 weeks, 60% adherence. Leakage episodes down 20% only. No new red flags.', 'Beckenboden-DiGA 8 Wochen, 60 % Adhärenz. Leck-Episoden nur 20 % weniger. Keine neuen Red Flags.'),
        decisionPoint: ('Next step?', 'Nächster Schritt?'), prompt: ('Uro DiGA escalation', 'Uro-DiGA-Eskalation'),
        options: [('Declare failure and discharge.', 'Misserfolg feststellen und entlassen.'), ('Ignore adherence data.', 'Adhärenzdaten ignorieren.'), ('Review technique, adherence barriers, consider physiotherapy/urology referral, adjust expectations or programme.', 'Technik, Adhärenz-Barrieren prüfen, PT/Urologie erwägen, Erwartungen/Programm anpassen.'), ('Immediate surgery referral for all partial responders.', 'Sofort OP-Überweisung für alle Teilresponder.')],
        rationale: ('Partial response warrants technique review and stepped care, not abandonment.', 'Teilresponse rechtfertigt Technik-Review und Stufenversorgung, keinen Abbruch.'),
      );

  static SimulationQuestion _uro04(AppLanguage language) => SimulationQuestionFactory.fromPairs(
        id: 'uro-04', phase: SimulationQuizPhase.diagnose, correctIndex: 3, language: language,
        title: ('Male pelvic-floor DiGA request', 'Männliche Beckenboden-DiGA-Anfrage'),
        vignette: ('Herr Peter Lang, 58, post-prostatectomy mild leakage. 4 months post-op. Surgeon supported conservative measures.', 'Herr Peter Lang, 58, milde Leckage post Prostatektomie. 4 Monate post-OP. Chirurg unterstützte konservative Maßnahmen.'),
        decisionPoint: ('Key check?', 'Zentraler Check?'), prompt: ('Male incontinence DiGA', 'Männliche Inkontinenz-DiGA'),
        options: [('Male patients never eligible for pelvic DiGAs.', 'Männer nie für Becken-DiGAs geeignet.'), ('Prescribe female-only app without checking.', 'Female-only-App ohne Prüfung.'), ('Prostatectomy excludes all digital care.', 'Prostatektomie schließt digitale Versorgung aus.'), ('Verify programme indication includes male/post-prostatectomy pathway where approved; document surgical context and goals.', 'Prüfen ob Programm-Indikation Männer/post-Prostatektomie umfasst; OP-Kontext und Ziele dokumentieren.')],
        rationale: ('Male pelvic-floor DiGAs exist but require indication-specific verification.', 'Männliche Beckenboden-DiGAs existieren, brauchen aber indikationsspezifische Prüfung.'),
      );

  static SimulationQuestion _uro05(AppLanguage language) => SimulationQuestionFactory.fromPairs(
        id: 'uro-05', phase: SimulationQuizPhase.prescribe, correctIndex: 0, language: language,
        title: ('Hematuria exclusion', 'Hämaturie-Ausschluss'),
        vignette: ('Woman 61, urge symptoms and leaks. Reports one episode visible blood in urine last week. Wants incontinence DiGA.', 'Frau 61, Drangsymptome und Leckage. Einmal sichtbares Blut im Urin letzte Woche. Wünscht Inkontinenz-DiGA.'),
        decisionPoint: ('Before DiGA?', 'Vor DiGA?'), prompt: ('Hematuria red flag', 'Hämaturie-Red-Flag'),
        options: [('Investigate haematuria before prescribing incontinence DiGA — may indicate malignancy or infection.', 'Hämaturie abklären vor Inkontinenz-DiGA — kann Malignom oder Infekt bedeuten.'), ('Blood in urine is normal with incontinence.', 'Blut im Urin normal bei Inkontinenz.'), ('DiGA treats haematuria.', 'DiGA behandelt Hämaturie.'), ('Wait one year for investigation.', 'Ein Jahr auf Abklärung warten.')],
        rationale: ('Haematuria requires urological workup before conservative DiGA pathway.', 'Hämaturie braucht urologische Abklärung vor konservativem DiGA-Pfad.'),
      );

  static SimulationQuestion _uro06(AppLanguage language) => SimulationQuestionFactory.fromPairs(
        id: 'uro-06', phase: SimulationQuizPhase.followUp, correctIndex: 1, language: language,
        title: ('Recurrent UTI symptoms', 'Rezidivierende HWI-Symptome'),
        vignette: ('On pelvic DiGA 4 weeks. Reports burning urination, frequency, low fever yesterday.', 'Unter Becken-DiGA 4 Wochen. Brennen beim Wasserlassen, Pollakisurie, gestern leichtes Fieber.'),
        decisionPoint: ('Action?', 'Maßnahme?'), prompt: ('UTI during DiGA', 'HWI während DiGA'),
        options: [('Continue DiGA — urinary symptoms expected.', 'DiGA fortsetzen — Harnsymptome erwartet.'), ('Assess for UTI, treat infection, pause/review DiGA until infection resolved.', 'HWI abklären, Infekt behandeln, DiGA pausieren/prüfen bis Infekt geheilt.'), ('Increase pelvic exercise intensity.', 'Beckenübungsintensität erhöhen.'), ('UTI confirms DiGA working.', 'HWI bestätigt DiGA-Wirksamkeit.')],
        rationale: ('Acute infection needs treatment and may require pausing pelvic training.', 'Akute Infektion braucht Therapie und kann Pause des Beckentraining erfordern.'),
      );

  static SimulationQuestion _uro07(AppLanguage language) => SimulationQuestionFactory.fromPairs(
        id: 'uro-07', phase: SimulationQuizPhase.diagnose, correctIndex: 2, language: language,
        title: ('Overactive bladder triage', 'Überaktive Blase-Triage'),
        vignette: ('Frau Lena Hoff, 64, urgency, frequency, nocturia 3x. Small leaks reaching toilet. No pain. No haematuria.', 'Frau Lena Hoff, 64, Drang, Pollakisurie, Nykturie 3x. Kleine Leckage auf Toilettenweg. Kein Schmerz. Keine Hämaturie.'),
        decisionPoint: ('Subtype?', 'Subtyp?'), prompt: ('OAB vs stress', 'OAB vs Belastung'),
        options: [('Always stress incontinence in women over 60.', 'Immer Belastungsinkontinenz über 60.'), ('OAB and stress never coexist.', 'OAB und Belastung koexistieren nie.'), ('Urgency-dominant pattern suggests overactive bladder workup; DiGA choice differs from pure stress pathway.', 'Drang-dominantes Muster spricht für OAB-Abklärung; DiGA-Wahl unterscheidet sich von reinem Belastungspfad.'), ('Nocturia alone excludes DiGA.', 'Nykturie allein schließt DiGA aus.')],
        rationale: ('OAB vs stress incontinence requires different digital and pharmacological pathways.', 'OAB vs Belastungsinkontinenz braucht unterschiedliche digitale und pharmakologische Pfade.'),
      );

  static SimulationQuestion _uro08(AppLanguage language) => SimulationQuestionFactory.fromPairs(
        id: 'uro-08', phase: SimulationQuizPhase.prescribe, correctIndex: 3, language: language,
        title: ('Postpartum stress incontinence', 'Postpartale Belastungsinkontinenz'),
        vignette: ('Frau Julia Kern, 31, 4 months postpartum, stress leaks with running. Breastfeeding. No prolapse symptoms.', 'Frau Julia Kern, 31, 4 Monate postpartum, Belastungsleckage beim Laufen. Stillend. Keine Prolaps-Symptome.'),
        decisionPoint: ('DiGA timing?', 'DiGA-Timing?'), prompt: ('Postpartum pelvic floor', 'Postpartaler Beckenboden'),
        options: [('Never treat before 12 months postpartum.', 'Nie vor 12 Monaten postpartum behandeln.'), ('Breastfeeding excludes all pelvic care.', 'Stillen schließt Beckenversorgung aus.'), ('Surgery first line postpartum.', 'OP Erstlinie postpartum.'), ('Supervised pelvic-floor rehabilitation including approved DiGA may be appropriate after assessment; document postpartum context.', 'Begleitetes Beckenboden-Training inkl. zugelassener DiGA kann nach Abklärung passen; postpartalen Kontext dokumentieren.')],
        rationale: ('Postpartum stress incontinence often benefits from conservative including digital pelvic training when assessed.', 'Postpartale Belastungsinkontinenz profitiert oft von konservativ inkl. digital wenn abgeklärt.'),
      );

  static SimulationQuestion _uro09(AppLanguage language) => SimulationQuestionFactory.fromPairs(
        id: 'uro-09', phase: SimulationQuizPhase.followUp, correctIndex: 0, language: language,
        title: ('Good adherence, marked improvement', 'Gute Adhärenz, deutliche Besserung'),
        vignette: ('12 weeks pelvic DiGA: 90% sessions, leakage episodes down 70%, returns to gym. No complications.', '12 Wochen Becken-DiGA: 90 % Sitzungen, Leck-Episoden 70 % weniger, zurück im Fitnessstudio. Keine Komplikationen.'),
        decisionPoint: ('Plan?', 'Plan?'), prompt: ('Successful uro follow-up', 'Erfolgreicher Uro-Verlauf'),
        options: [('Reinforce maintenance exercises, document outcomes, plan periodic check-in to prevent relapse.', 'Erhaltungsübungen festigen, Outcomes dokumentieren, periodisches Check-in gegen Rückfall planen.'), ('Stop all pelvic exercises forever.', 'Alle Beckenübungen für immer stoppen.'), ('Discharge without documentation.', 'Entlassen ohne Dokumentation.'), ('Refer for surgery due to residual 30%.', 'OP-Überweisung wegen restlicher 30 %.')],
        rationale: ('Successful outcomes need maintenance planning and documentation.', 'Erfolgreiche Outcomes brauchen Erhaltungsplanung und Dokumentation.'),
      );

  static SimulationQuestion _uro10(AppLanguage language) => SimulationQuestionFactory.fromPairs(
        id: 'uro-10', phase: SimulationQuizPhase.diagnose, correctIndex: 1, language: language,
        title: ('Neurogenic bladder exclusion', 'Neurogene Blase — Ausschluss'),
        vignette: ('Man 48, urgency, retention episodes, numbness perineum after disc surgery. Wants bladder training app.', 'Mann 48, Drang, Retentions-Episoden, Perineum-Taubheit nach Bandscheiben-OP. Wünscht Blasentraining-App.'),
        decisionPoint: ('Response?', 'Antwort?'), prompt: ('Neurogenic bladder', 'Neurogene Blase'),
        options: [('Prescribe incontinence DiGA for training.', 'Inkontinenz-DiGA zum Training.'), ('Suspect neurogenic bladder — urology/neurology assessment required before standard pelvic DiGA.', 'Verdacht neurogene Blase — urologische/neurologische Abklärung vor Standard-Becken-DiGA.'), ('Digital apps diagnose nerve damage.', 'Digitale Apps diagnostizieren Nervenschaden.'), ('Retention means more pelvic squeezes only.', 'Retention bedeutet nur mehr Beckenpressen.')],
        rationale: ('Neurological symptoms change bladder management pathway fundamentally.', 'Neurologische Symptome verändern Blasenmanagement-Pfad grundlegend.'),
      );

  static SimulationQuestion _uro11(AppLanguage language) => SimulationQuestionFactory.fromPairs(
        id: 'uro-11', phase: SimulationQuizPhase.prescribe, correctIndex: 2, language: language,
        title: ('Pelvic organ prolapse', 'Descensus genitalis'),
        vignette: ('Woman 58, feels bulge, stress leaks. Prolapse grade 2 on exam. Interested in Pelvina.', 'Frau 58, Vorwölbungsgefühl, Belastungsleckage. Prolaps Grad 2. Interesse an Pelvina.'),
        decisionPoint: ('Approach?', 'Vorgehen?'), prompt: ('Prolapse and DiGA', 'Prolaps und DiGA'),
        options: [('Prolapse contraindicates all exercise.', 'Prolaps kontraindiziert jede Übung.'), ('DiGA replaces pessary fitting always.', 'DiGA ersetzt immer Pessar-Anpassung.'), ('Pelvic-floor strengthening may be appropriate adjunct; coordinate prolapse management goals and consider gynaecology input.', 'Beckenbodenstärkung kann Add-on sein; Prolaps-Ziele koordinieren und Gynäkologie einbinden.'), ('Ignore prolapse if patient prefers app.', 'Prolaps ignorieren wenn Patient App will.')],
        rationale: ('Prolapse requires coordinated conservative/surgical planning alongside digital training.', 'Prolaps braucht koordinierte konservative/operative Planung neben digitalem Training.'),
      );

  static SimulationQuestion _uro12(AppLanguage language) => SimulationQuestionFactory.fromPairs(
        id: 'uro-12', phase: SimulationQuizPhase.followUp, correctIndex: 3, language: language,
        title: ('Pelvic pain during exercises', 'Beckenschmerz bei Übungen'),
        vignette: ('Reports sharp pelvic pain during app-guided contractions. No fever. Symptoms new this week.', 'Berichtet stechenden Beckenschmerz bei App-geführten Kontraktionen. Kein Fieber. Symptome neu diese Woche.'),
        decisionPoint: ('Advice?', 'Rat?'), prompt: ('Pain with pelvic training', 'Schmerz bei Beckentraining'),
        options: [('Push through pain for faster results.', 'Durch Schmerz für schnellere Ergebnisse.'), ('Pain proves exercises working.', 'Schmerz beweist wirksame Übungen.'), ('Switch to higher intensity.', 'Höhere Intensität wechseln.'), ('Stop exercises, assess for musculoskeletal/pelvic pathology, review technique before resuming.', 'Übungen stoppen, muskuloskelettale/beckenpathologische Ursachen prüfen, Technik vor Wiederaufnahme reviewen.')],
        rationale: ('New pain during pelvic training needs assessment, not intensity increase.', 'Neuer Schmerz bei Beckentraining braucht Abklärung, keine Intensitätssteigerung.'),
      );

  static SimulationQuestion _uro13(AppLanguage language) => SimulationQuestionFactory.fromPairs(
        id: 'uro-13', phase: SimulationQuizPhase.diagnose, correctIndex: 0, language: language,
        title: ('Mixed incontinence prioritisation', 'Mixed inkontinenz — Priorisierung'),
        vignette: ('Woman 55, both stress leaks and severe urgency with occasional urge incontinence. Bladder diary shows both patterns.', 'Frau 55, Belastungsleckage und starker Drang mit gelegentlicher Dranginkontinenz. Blasentagebuch zeigt beide Muster.'),
        decisionPoint: ('DiGA strategy?', 'DiGA-Strategie?'), prompt: ('Mixed incontinence', 'Mixed Inkontinenz'),
        options: [('Prioritise dominant symptom, may need staged approach — pelvic DiGA alone may not address urge component adequately.', 'Dominantes Symptom priorisieren, ggf. stufenweise — Becken-DiGA allein adressiert Drangkomponente ggf. unzureichend.'), ('Mixed incontinence uses any random app.', 'Mixed Inkontinenz beliebige App.'), ('Only surgery helps mixed incontinence.', 'Nur OP hilft bei Mixed Inkontinenz.'), ('Ignore stress component.', 'Belastungskomponente ignorieren.')],
        rationale: ('Mixed incontinence needs symptom prioritisation and possibly multimodal care.', 'Mixed Inkontinenz braucht Symptom-Priorisierung und ggf. multimodale Versorgung.'),
      );

  static SimulationQuestion _uro14(AppLanguage language) => SimulationQuestionFactory.fromPairs(
        id: 'uro-14', phase: SimulationQuizPhase.prescribe, correctIndex: 1, language: language,
        title: ('Diabetes and nocturia', 'Diabetes und Nykturie'),
        vignette: ('T2D patient with nocturia 4x, polyuria. Incontinence DiGA requested for "leaks at night."', 'T2D-Patient mit Nykturie 4x, Polyurie. Inkontinenz-DiGA wegen „Leckage nachts“ gewünscht.'),
        decisionPoint: ('First step?', 'Erster Schritt?'), prompt: ('Glycaemic nocturia', 'Glykämische Nykturie'),
        options: [('Prescribe pelvic DiGA immediately.', 'Sofort Becken-DiGA.'), ('Assess glycaemic control and fluid management — polyuria may be metabolic, not pelvic floor primary.', 'Glykämische Kontrolle und Flüssigkeitsmanagement prüfen — Polyurie kann metabolisch sein, nicht primär Beckenboden.'), ('Nocturia always stress incontinence.', 'Nykturie immer Belastungsinkontinenz.'), ('DiGA controls blood glucose.', 'DiGA steuert Blutzucker.')],
        rationale: ('Nocturia in diabetes needs metabolic assessment before attributing to incontinence.', 'Nykturie bei Diabetes braucht metabolische Abklärung vor Zuschreibung an Inkontinenz.'),
      );

  static SimulationQuestion _uro15(AppLanguage language) => SimulationQuestionFactory.fromPairs(
        id: 'uro-15', phase: SimulationQuizPhase.followUp, correctIndex: 2, language: language,
        title: ('Elderly functional impairment', 'Geriatrische Funktionsbeeinträchtigung'),
        vignette: ('82-year-old completed 50% sessions, cognitive mild impairment, daughter helps with phone. Modest symptom gain.', '82-Jährige, 50 % Sitzungen, leichte kognitive Beeinträchtigung, Tochter hilft mit Handy. Moderater Symptomgewinn.'),
        decisionPoint: ('Continue?', 'Fortsetzen?'), prompt: ('Geriatric uro DiGA', 'Geriatrische Uro-DiGA'),
        options: [('Stop — age excludes benefit.', 'Stoppen — Alter schließt Nutzen aus.'), ('Ignore caregiver role.', 'Betreuerrolle ignorieren.'), ('Assess feasibility with caregiver support, simplify goals, consider in-person PT if digital insufficient.', 'Machbarkeit mit Betreuer prüfen, Ziele vereinfachen, ggf. ambulante PT wenn digital unzureichend.'), ('Double session length despite confusion.', 'Sitzungsdauer trotz Verwirrung verdoppeln.')],
        rationale: ('Geriatric success may need caregiver involvement and simplified goals.', 'Geriatrischer Erfolg kann Betreuer und vereinfachte Ziele brauchen.'),
      );

  static SimulationQuestion _uro16(AppLanguage language) => SimulationQuestionFactory.fromPairs(
        id: 'uro-16', phase: SimulationQuizPhase.diagnose, correctIndex: 3, language: language,
        title: ('Pelvic pain differential', 'Differentialdiagnose Beckenschmerz'),
        vignette: ('Woman 34, chronic pelvic pain, painful urination, dyspareunia. Requests incontinence DiGA for "weak bladder."', 'Frau 34, chronischer Beckenschmerz, schmerzhaftes Wasserlassen, Dyspareunie. Wünscht Inkontinenz-DiGA wegen „schwacher Blase“.'),
        decisionPoint: ('Priority?', 'Priorität?'), prompt: ('Pelvic pain not incontinence', 'Beckenschmerz nicht Inkontinenz'),
        options: [('Prescribe Pelvina for any pelvic complaint.', 'Pelvina für jede Beckenbeschwerde.'), ('Pain confirms stress incontinence.', 'Schmerz bestätigt Belastungsinkontinenz.'), ('DiGA treats interstitial cystitis.', 'DiGA behandelt interstitielle Zystitis.'), ('Evaluate pelvic pain syndrome, infection, endometriosis differentials before incontinence DiGA — diagnosis may not be incontinence.', 'Beckenschmerzsyndrom, Infektion, Endometriose abklären vor Inkontinenz-DiGA — Diagnose ist ggf. nicht Inkontinenz.')],
        rationale: ('Pelvic pain requires broader differential than incontinence DiGA alone.', 'Beckenschmerz braucht breitere Differentialdiagnose als Inkontinenz-DiGA allein.'),
      );

  static SimulationQuestion _uro17(AppLanguage language) => SimulationQuestionFactory.fromPairs(
        id: 'uro-17', phase: SimulationQuizPhase.prescribe, correctIndex: 0, language: language,
        title: ('Pessary vs digital first', 'Pessar vs digital zuerst'),
        vignette: ('Prolapse grade 1, mild stress leaks. Patient prefers trying digital training before pessary.', 'Prolaps Grad 1, milde Belastungsleckage. Patient bevorzugt digitales Training vor Pessar.'),
        decisionPoint: ('Shared decision?', 'Shared Decision?'), prompt: ('Conservative ladder', 'Konservative Stufenleiter'),
        options: [('Document shared decision for conservative pelvic-floor DiGA trial with clear review point and escalation plan if inadequate.', 'Shared Decision für konservativen Beckenboden-DiGA-Versuch mit klarem Review und Eskalationsplan bei Unzureichend dokumentieren.'), ('Pessary mandatory before any app.', 'Pessar zwingend vor jeder App.'), ('Digital replaces all gynaecology.', 'Digital ersetzt gesamte Gynäkologie.'), ('No review needed if patient prefers digital.', 'Kein Review nötig wenn Patient digital will.')],
        rationale: ('Conservative trials need defined review and escalation criteria.', 'Konservative Versuche brauchen definierte Review- und Eskalationskriterien.'),
      );

  static SimulationQuestion _uro18(AppLanguage language) => SimulationQuestionFactory.fromPairs(
        id: 'uro-18', phase: SimulationQuizPhase.followUp, correctIndex: 1, language: language,
        title: ('Sexual dysfunction comorbidity', 'Komorbide sexuelle Dysfunktion'),
        vignette: ('Improved leaks but reports worsened dyspareunia since intensive pelvic exercises. Distressed.', 'Verbesserte Leckage, aber verschlechterte Dyspareunie seit intensiven Beckenübungen. Belastet.'),
        decisionPoint: ('Response?', 'Reaktion?'), prompt: ('Dyspareunia follow-up', 'Dyspareunie im Verlauf'),
        options: [('Ignore — incontinence was primary goal.', 'Ignorieren — Inkontinenz war Primärziel.'), ('Assess technique, tone/hypertonicity, consider pelvic PT specialised in pain, adjust programme.', 'Technik, Tonus/Hypertonie prüfen, spezialisierte Becken-PT erwägen, Programm anpassen.'), ('Increase exercise frequency.', 'Übungshäufigkeit erhöhen.'), ('Dyspareunia unrelated to pelvic floor.', 'Dyspareunie unrelated zum Beckenboden.')],
        rationale: ('Pelvic hypertonicity can worsen pain — technique and specialist input matter.', 'Becken-Hypertonie kann Schmerz verschlechtern — Technik und Spezialisten-Input zählen.'),
      );

  static SimulationQuestion _uro19(AppLanguage language) => SimulationQuestionFactory.fromPairs(
        id: 'uro-19', phase: SimulationQuizPhase.diagnose, correctIndex: 2, language: language,
        title: ('Catheterisation history', 'Katheterisierungs-Anamnese'),
        vignette: ('Man 70, spinal cord injury, intermittent catheterisation. Leakage between caths. Wants standard incontinence app.', 'Mann 70, Rückenmarksverletzung, intermittierende Katheterisierung. Leckage zwischen Katheterungen. Wünscht Standard-Inkontinenz-App.'),
        decisionPoint: ('Appropriate?', 'Angemessen?'), prompt: ('Neurogenic pathway', 'Neurogener Pfad'),
        options: [('Standard stress incontinence DiGA fits all.', 'Standard-Belastungsinkontinenz-DiGA passt für alle.'), ('SCI never needs specialist care.', 'QUERSchnitt braucht nie Spezialversorgung.'), ('Neurogenic bladder pathway — standard pelvic DiGA likely inappropriate; specialist bladder management first.', 'Neurogener Blasen-Pfad — Standard-Becken-DiGA wahrscheinlich unangemessen; spezialisiertes Blasenmanagement zuerst.'), ('Catheterisation excludes all treatment.', 'Katheterisierung schließt jede Behandlung aus.')],
        rationale: ('Neurogenic bladder needs specialised pathways outside standard incontinence DiGAs.', 'Neurogene Blase braucht spezialisierte Pfade außerhalb Standard-Inkontinenz-DiGAs.'),
      );

  static SimulationQuestion _uro20(AppLanguage language) => SimulationQuestionFactory.fromPairs(
        id: 'uro-20', phase: SimulationQuizPhase.prescribe, correctIndex: 3, language: language,
        title: ('GKV uro DiGA workflow', 'GKV-Uro-DiGA-Workflow'),
        vignette: ('Eligible stress incontinence patient starting Pelvina via GKV prescription.', 'Geeignete Belastungsinkontinenz startet Pelvina über GKV-Verordnung.'),
        decisionPoint: ('Physician ongoing role?', 'Fortlaufende ärztliche Rolle?'), prompt: ('Uro DiGA continuity', 'Uro-DiGA-Kontinuität'),
        options: [('One-time code ends responsibility.', 'Einmaliger Code beendet Verantwortung.'), ('Insurer manages clinical follow-up.', 'Kostenträger übernimmt klinisches Follow-up.'), ('Patient self-discharge after activation.', 'Patient entlässt sich nach Aktivierung selbst.'), ('Schedule follow-up to review symptoms, adherence, technique, and escalation if targets not met.', 'Follow-up planen für Symptome, Adhärenz, Technik und Eskalation bei Zielverfehlung.')],
        rationale: ('Urogenital DiGAs need longitudinal oversight like other prescriptions.', 'Urogenitale DiGAs brauchen Langzeit-Begleitung wie andere Verordnungen.'),
        teachingPearl: ('Use bladder diaries as objective follow-up anchors — insurers and patients value measurable outcomes.', 'Blasentagebücher als objektive Follow-up-Anker — Kostenträger und Patienten schätzen messbare Outcomes.'),
      );
}
