import 'package:diga/core/locale/app_locale_provider.dart';
import 'package:diga/features/simulation/domain/models/simulation_question.dart';
import 'package:diga/features/simulation/domain/models/simulation_quiz_phase.dart';
import 'package:diga/features/simulation/presentation/data/simulation_question_factory.dart';

abstract final class NeuroSupplementary {
  static List<SimulationQuestion Function(AppLanguage)> get builders => [
        _neuro01, _neuro02, _neuro03, _neuro04, _neuro05, _neuro06, _neuro07,
        _neuro08, _neuro09, _neuro10, _neuro11, _neuro12, _neuro13, _neuro14,
        _neuro15, _neuro16, _neuro17,
      ];

  static List<SimulationQuestion> questions(AppLanguage language) =>
      SimulationQuestionFactory.buildAll(language, builders);

  static SimulationQuestion _neuro01(AppLanguage language) => SimulationQuestionFactory.fromPairs(
        id: 'neuro-01', phase: SimulationQuizPhase.diagnose, correctIndex: 0, language: language,
        title: ('Chronic migraine — M-sense eligibility', 'Chronische Migräne — M-sense-Eignung'),
        vignette: ('Frau Claudia Berg, 38, headache ≥15 days/month for 4 months, migraine features on ≥8 days. No red flags on exam. Failed propranolol. GKV (Barmer).', 'Frau Claudia Berg, 38, Kopfschmerz ≥15 Tage/Monat seit 4 Monaten, Migräne-Merkmale an ≥8 Tagen. Keine Red Flags. Propranolol versagt. GKV (Barmer).'),
        decisionPoint: ('DiGA consideration?', 'DiGA-Überlegung?'), prompt: ('Migraine DiGA triage', 'Migräne-DiGA-Triage'),
        options: [('Chronic migraine after appropriate diagnosis and safety screen may suit migraine digital programmes (e.g. M-sense) as adjunct to guideline care.', 'Chronische Migräne nach Diagnose und Safety-Screen kann Migräne-Digitalprogramme (z. B. M-sense) als Add-on zur Leitlinienversorgung passen.'), ('Any headache qualifies for tinnitus DiGA.', 'Jeder Kopfschmerz qualifiziert für Tinnitus-DiGA.'), ('Migraine DiGAs replace neurology referral always.', 'Migräne-DiGAs ersetzen immer Neurologie-Überweisung.'), ('Only acute migraine attacks need treatment.', 'Nur akute Migräneattacken brauchen Behandlung.')],
        rationale: ('Chronic migraine has specific digital options distinct from tinnitus pathways.', 'Chronische Migräne hat spezifische digitale Optionen, getrennt von Tinnitus-Pfaden.'),
      );

  static SimulationQuestion _neuro02(AppLanguage language) => SimulationQuestionFactory.fromPairs(
        id: 'neuro-02', phase: SimulationQuizPhase.prescribe, correctIndex: 1, language: language,
        title: ('M-sense prescribing documentation', 'M-sense-Verordnungsdokumentation'),
        vignette: ('You prescribe M-sense for chronic migraine patient after shared decision. Patient motivated to track triggers.', 'M-sense-Verordnung bei chronischer Migräne nach Shared Decision. Patient motiviert für Trigger-Tracking.'),
        decisionPoint: ('Document what?', 'Was dokumentieren?'), prompt: ('Migraine DiGA chart', 'Migräne-DiGA-Akte'),
        options: [('App name in billing only.', 'Nur App-Name in Abrechnung.'), ('Chronic migraine diagnosis, headache diary baseline, prior treatments, goals, medication plan unchanged, follow-up interval.', 'Chronische Migräne-Diagnose, Kopfschmerz-Tagebuch-Baseline, Vortherapien, Ziele, unveränderter Medikationsplan, Follow-up-Intervall.'), ('No diagnosis needed for DiGAs.', 'Keine Diagnose für DiGAs nötig.'), ('Defer documentation to neurologist.', 'Dokumentation an Neurologen verschieben.')],
        rationale: ('Migraine DiGA prescribing requires full clinical context and ongoing medication coordination.', 'Migräne-DiGA-Verordnung braucht vollen klinischen Kontext und laufende Medikationskoordination.'),
      );

  static SimulationQuestion _neuro03(AppLanguage language) => SimulationQuestionFactory.fromPairs(
        id: 'neuro-03', phase: SimulationQuizPhase.followUp, correctIndex: 2, language: language,
        title: ('New aura symptoms on M-sense', 'Neue Aura-Symptome unter M-sense'),
        vignette: ('Week 5: new prolonged aura >60 minutes, one-sided weakness during headache. Otherwise adherent to app.', 'Woche 5: neue prolongierte Aura >60 Minuten, einseitige Schwäche bei Kopfschmerz. Sonst adherent.'),
        decisionPoint: ('Action?', 'Maßnahme?'), prompt: ('Migraine red flags', 'Migräne-Red-Flags'),
        options: [('Continue app — aura is expected.', 'App fortsetzen — Aura ist erwartet.'), ('Increase triptan dose without assessment.', 'Triptan-Dosis ohne Beurteilung erhöhen.'), ('Urgent neurological reassessment — atypical aura/weakness may need imaging and is not routine DiGA follow-up alone.', 'Dringliche neurologische Re-Evaluation — atypische Aura/Schwäche kann Bildgebung brauchen, nicht nur DiGA-Follow-up.'), ('Switch to Kalmeda.', 'Auf Kalmeda wechseln.')],
        rationale: ('Neurological red flags override routine digital follow-up.', 'Neurologische Red Flags überwiegen routinemäßiges digitales Follow-up.'),
      );

  static SimulationQuestion _neuro04(AppLanguage language) => SimulationQuestionFactory.fromPairs(
        id: 'neuro-04', phase: SimulationQuizPhase.diagnose, correctIndex: 3, language: language,
        title: ('Medication overuse headache', 'Medikamentenübergebrauchskopfschmerz'),
        vignette: ('Herr Stefan Wolf, 45, daily headaches. Uses ibuprofen 600mg most days for 10 months. Wants migraine DiGA.', 'Herr Stefan Wolf, 45, tägliche Kopfschmerzen. Ibuprofen 600 mg an den meisten Tagen seit 10 Monaten. Wünscht Migräne-DiGA.'),
        decisionPoint: ('Before M-sense?', 'Vor M-sense?'), prompt: ('MOH screen', 'MOH-Screening'),
        options: [('Prescribe immediately.', 'Sofort verordnen.'), ('MOH does not affect migraine apps.', 'MOH beeinflusst Migräne-Apps nicht.'), ('Add more analgesics with DiGA.', 'Mehr Analgetika mit DiGA.'), ('Identify medication overuse headache; may need detoxification/withdrawal plan before digital prophylaxis is effective.', 'Medikamentenübergebrauchskopfschmerz erkennen; ggf. Entzugs-/Ausleitungsplan vor wirksamer digitaler Prophylaxe.')],
        rationale: ('MOH must be addressed or digital migraine programmes underperform.', 'MOH muss adressiert werden, sonst unterperformen digitale Migräneprogramme.'),
      );

  static SimulationQuestion _neuro05(AppLanguage language) => SimulationQuestionFactory.fromPairs(
        id: 'neuro-05', phase: SimulationQuizPhase.prescribe, correctIndex: 0, language: language,
        title: ('Kalmeda — bilateral tinnitus', 'Kalmeda — bilateraler Tinnitus'),
        vignette: ('Frau Weiss scenario: 14 months bilateral tinnitus, ENT cleared, functional impairment documented. Requests Kalmeda.', 'Frau Weiss: 14 Monate bilateraler Tinnitus, HNO geklärt, Funktionsbeeinträchtigung dokumentiert. Wünscht Kalmeda.'),
        decisionPoint: ('Bilateral tinnitus and Kalmeda?', 'Bilateraler Tinnitus und Kalmeda?'), prompt: ('Kalmeda indication', 'Kalmeda-Indikation'),
        options: [('Bilateral subjective tinnitus does not automatically exclude Kalmeda when chronic, assessed, and functionally impairing.', 'Bilateraler subjektiver Tinnitus schließt Kalmeda nicht automatisch aus bei chronisch, abgeklärt und funktionell beeinträchtigend.'), ('Bilateral tinnitus is always absolute exclusion.', 'Bilateral ist immer absoluter Ausschluss.'), ('Only unilateral tinnitus may use any DiGA.', 'Nur einseitiger Tinnitus darf DiGA nutzen.'), ('Kalmeda requires hearing aid prescription first.', 'Kalmeda erfordert zuerst Hörgeräteverordnung.')],
        rationale: ('Companion criteria focus on chronicity and assessment, not laterality alone.', 'Begleitkriterien fokussieren Chronizität und Abklärung, nicht allein Lateralität.'),
      );

  static SimulationQuestion _neuro06(AppLanguage language) => SimulationQuestionFactory.fromPairs(
        id: 'neuro-06', phase: SimulationQuizPhase.followUp, correctIndex: 1, language: language,
        title: ('Kalmeda — hyperacusis escalation', 'Kalmeda — Hyperakusis-Eskalation'),
        vignette: ('Patient on Kalmeda 8 weeks: worsening sound sensitivity, avoiding leaving home. Tinnitus unchanged. PHQ-9: 8.', 'Patient mit Kalmeda 8 Wochen: zunehmende Geräuschempfindlichkeit, Vermeidung des Hausverlasses. Tinnitus unverändert. PHQ-9: 8.'),
        decisionPoint: ('Next step?', 'Nächster Schritt?'), prompt: ('Hyperacusis management', 'Hyperakusis-Management'),
        options: [('Double app usage time.', 'App-Nutzungszeit verdoppeln.'), ('Reassess ENT/audiology, consider hyperacusis-focused management, review whether Kalmeda still appropriate.', 'HNO/Audiologie neu beurteilen, hyperakusis-fokussiertes Management erwägen, Kalmeda-Eignung prüfen.'), ('Ignore — side effect of success.', 'Ignorieren — Nebenwirkung des Erfolgs.'), ('Stop all sound exposure permanently.', 'Dauerhaft jede Schallbelastung stoppen.')],
        rationale: ('Worsening hyperacusis needs specialist reassessment beyond app continuation.', 'Zunehmende Hyperakusis braucht Spezialisten-Re-Evaluation jenseits App-Fortsetzung.'),
      );

  static SimulationQuestion _neuro07(AppLanguage language) => SimulationQuestionFactory.fromPairs(
        id: 'neuro-07', phase: SimulationQuizPhase.diagnose, correctIndex: 2, language: language,
        title: ('Meniere disease vs tinnitus DiGA', 'Menière vs Tinnitus-DiGA'),
        vignette: ('Herr Ralf Jung, 50, episodic vertigo, fluctuating hearing, fullness right ear, tinnitus. Episodes last hours.', 'Herr Ralf Jung, 50, episodischer Schwindel, fluktuierendes Hören, Völlegefühl rechts, Tinnitus. Episoden stundenlang.'),
        decisionPoint: ('DiGA first?', 'DiGA zuerst?'), prompt: ('Vestibular differential', 'Vestibuläre Differentialdiagnose'),
        options: [('Prescribe Kalmeda for tinnitus component only.', 'Kalmeda nur für Tinnitus-Komponente.'), ('Vertigo confirms Kalmeda eligibility.', 'Schwindel bestätigt Kalmeda-Eignung.'), ('Suspect Meniere/vestibular pathology — ENT assessment required before chronic tinnitus DiGA pathway.', 'Verdacht Menière/vestibuläre Pathologie — HNO-Abklärung vor chronischem Tinnitus-DiGA-Pfad.'), ('DiGAs treat all ear symptoms equally.', 'DiGAs behandeln alle Ohrsymptome gleich.')],
        rationale: ('Episodic vertigo with hearing fluctuation is not straightforward chronic tinnitus care.', 'Episodischer Schwindel mit Hörschwankung ist kein einfacher chronischer Tinnitus-Pfad.'),
      );

  static SimulationQuestion _neuro08(AppLanguage language) => SimulationQuestionFactory.fromPairs(
        id: 'neuro-08', phase: SimulationQuizPhase.prescribe, correctIndex: 3, language: language,
        title: ('Tinnitus safety netting', 'Tinnitus-Safety-Netting'),
        vignette: ('Prescribing Kalmeda for chronic tinnitus after ENT clearance. Patient anxious about symptoms.', 'Kalmeda-Verordnung bei chronischem Tinnitus nach HNO-Freigabe. Patient ängstlich wegen Symptome.'),
        decisionPoint: ('Mandatory patient advice?', 'Pflicht-Patientenaufklärung?'), prompt: ('Kalmeda safety advice', 'Kalmeda-Sicherheitsaufklärung'),
        options: [('App replaces all ENT follow-up.', 'App ersetzt gesamtes HNO-Follow-up.'), ('No safety advice needed after prescription.', 'Keine Sicherheitsaufklärung nach Verordnung.'), ('Only document insurance number.', 'Nur Versichertennummer dokumentieren.'), ('Explain when to stop app and seek urgent care: sudden hearing loss change, neurological symptoms, severe vertigo.', 'Erklären wann App stoppen und dringliche Hilfe: plötzliche Höränderung, neurologische Symptome, starker Schwindel.')],
        rationale: ('Safety netting is essential for tinnitus DiGA prescribing.', 'Safety-Netting ist essenziell bei Tinnitus-DiGA-Verordnung.'),
      );

  static SimulationQuestion _neuro09(AppLanguage language) => SimulationQuestionFactory.fromPairs(
        id: 'neuro-09', phase: SimulationQuizPhase.followUp, correctIndex: 0, language: language,
        title: ('Migraine DiGA — modest improvement', 'Migräne-DiGA — moderate Besserung'),
        vignette: ('M-sense 12 weeks: headache days 18→14/month. Patient wishes to continue. No new red flags.', 'M-sense 12 Wochen: Kopfschmerztage 18→14/Monat. Patient möchte fortsetzen. Keine neuen Red Flags.'),
        decisionPoint: ('Best plan?', 'Bester Plan?'), prompt: ('Partial migraine response', 'Teilresponse Migräne'),
        options: [('Acknowledge partial benefit, continue monitoring, optimise trigger management, review pharmacological options at next step.', 'Teilnutzen anerkennen, Monitoring fortsetzen, Trigger-Management optimieren, pharmakologische Optionen im nächsten Schritt prüfen.'), ('Stop — <50% reduction means failure.', 'Stoppen — <50 % Reduktion bedeutet Misserfolg.'), ('Discharge without documentation.', 'Entlassen ohne Dokumentation.'), ('Refer for neurosurgery.', 'Neurochirurgie-Überweisung.')],
        rationale: ('Partial response warrants continued structured multimodal care.', 'Teilresponse rechtfertigt fortgesetzte strukturierte multimodale Versorgung.'),
      );

  static SimulationQuestion _neuro10(AppLanguage language) => SimulationQuestionFactory.fromPairs(
        id: 'neuro-10', phase: SimulationQuizPhase.diagnose, correctIndex: 1, language: language,
        title: ('Occupational noise exposure', 'Berufliche Lärmbelastung'),
        vignette: ('Factory worker, 55, bilateral tinnitus 2 years post noise exposure. No hearing protection history. Audiogram shows high-frequency loss.', 'Fabrikarbeiter, 55, bilateraler Tinnitus 2 Jahre nach Lärmbelastung. Keine Gehörschutz-Historie. Audiogramm mit Hochtonverlust.'),
        decisionPoint: ('Before Kalmeda?', 'Vor Kalmeda?'), prompt: ('Noise-induced hearing loss', 'Lärmschwerhörigkeit'),
        options: [('Noise exposure excludes all tinnitus care.', 'Lärmbelastung schließt jede Tinnitus-Versorgung aus.'), ('Document occupational history, ensure audiological assessment and hearing conservation advice alongside DiGA consideration.', 'Berufsanamnese dokumentieren, audiologische Abklärung und Gehörschutz-Beratung neben DiGA-Erwägung sicherstellen.'), ('DiGA cures noise-induced hearing loss.', 'DiGA heilt Lärmschwerhörigkeit.'), ('Only retirees may use tinnitus DiGAs.', 'Nur Rentner dürfen Tinnitus-DiGAs nutzen.')],
        rationale: ('Occupational hearing loss needs audiological context; DiGA addresses tinnitus burden, not hearing restoration.', 'Berufliche Schwerhörigkeit braucht audiologischen Kontext; DiGA adressiert Tinnitus-Belastung, nicht Hörwiederherstellung.'),
      );

  static SimulationQuestion _neuro11(AppLanguage language) => SimulationQuestionFactory.fromPairs(
        id: 'neuro-11', phase: SimulationQuizPhase.prescribe, correctIndex: 2, language: language,
        title: ('Pediatric tinnitus DiGA', 'Pädiatrischer Tinnitus-DiGA'),
        vignette: ('Parents request Kalmeda for 14-year-old with tinnitus 6 months after concert exposure. Otherwise well.', 'Eltern wünschen Kalmeda für 14-Jährigen mit Tinnitus 6 Monate nach Konzert. Sonst gesund.'),
        decisionPoint: ('Approach?', 'Vorgehen?'), prompt: ('Age limits tinnitus', 'Altersgrenzen Tinnitus'),
        options: [('Prescribe adult Kalmeda with parental consent.', 'Erwachsenen-Kalmeda mit Elterneinwilligung.'), ('Tinnitus in teens never needs assessment.', 'Tinnitus bei Jugendlichen braucht nie Abklärung.'), ('Verify age approval, paediatric ENT assessment, consider family-mediated support — adult DiGA may not be indicated.', 'Altersfreigabe prüfen, pädiatrische HNO-Abklärung, familienvermittelte Unterstützung — Erwachsenen-DiGA ggf. nicht indiziert.'), ('Wait until age 18 regardless.', 'Unabhängig bis 18 warten.')],
        rationale: ('Paediatric tinnitus requires developmental and regulatory consideration.', 'Pädiatrischer Tinnitus braucht entwicklungs- und regulatorische Beurteilung.'),
      );

  static SimulationQuestion _neuro12(AppLanguage language) => SimulationQuestionFactory.fromPairs(
        id: 'neuro-12', phase: SimulationQuizPhase.followUp, correctIndex: 3, language: language,
        title: ('Kalmeda — PHQ-9 rise', 'Kalmeda — PHQ-9-Anstieg'),
        vignette: ('6-week review: PHQ-9 4→13, sleep worse, hopelessness. Tinnitus loudness same. Good app adherence.', '6-Wochen-Review: PHQ-9 4→13, Schlaf schlechter, Hoffnungslosigkeit. Tinnitus-Lautstärke gleich. Gute Adhärenz.'),
        decisionPoint: ('Priority?', 'Priorität?'), prompt: ('Comorbid depression tinnitus', 'Komorbide Depression Tinnitus'),
        options: [('Continue Kalmeda only — tinnitus unchanged.', 'Nur Kalmeda — Tinnitus unverändert.'), ('Depression irrelevant to tinnitus care.', 'Depression irrelevant für Tinnitus-Versorgung.'), ('Switch tinnitus DiGA brand.', 'Tinnitus-DiGA-Marke wechseln.'), ('Assess emerging depression, broaden care beyond DiGA, evaluate mental health referral.', 'Aufkommende Depression beurteilen, Versorgung über DiGA erweitern, psychische Überweisung erwägen.')],
        rationale: ('Rising depression with unchanged tinnitus signals need for stepped mental health care.', 'Steigende Depression bei unverändertem Tinnitus signalisiert Bedarf an psychischer Stufenversorgung.'),
      );

  static SimulationQuestion _neuro13(AppLanguage language) => SimulationQuestionFactory.fromPairs(
        id: 'neuro-13', phase: SimulationQuizPhase.diagnose, correctIndex: 0, language: language,
        title: ('Thunderclap headache — exclusion', 'Donnerschlagkopfschmerz — Ausschluss'),
        vignette: ('Frau Eva Roth, 42, sudden worst headache of life 2 days ago, now mild residual pain. Wants migraine DiGA.', 'Frau Eva Roth, 42, vor 2 Tagen plötzlich schwerster Kopfschmerz des Lebens, jetzt milde Restbeschwerden. Wünscht Migräne-DiGA.'),
        decisionPoint: ('Response?', 'Antwort?'), prompt: ('Thunderclap red flag', 'Donnerschlag-Red-Flag'),
        options: [('Thunderclap onset requires urgent exclusion of subarachnoid haemorrhage/other serious pathology before any headache DiGA.', 'Donnerschlag-Beginn erfordert dringlichen Ausschluss SAB/anderer ernster Pathologie vor jeder Kopfschmerz-DiGA.'), ('Residual pain means migraine DiGA safe.', 'Restbeschwerden bedeuten Migräne-DiGA sicher.'), ('DiGA can rule out bleeding.', 'DiGA kann Blutung ausschließen.'), ('Wait 6 months then prescribe.', '6 Monate warten dann verordnen.')],
        rationale: ('Thunderclap headache is a neurological emergency screen, not DiGA territory.', 'Donnerschlagkopfschmerz ist neurologischer Notfall-Screen, nicht DiGA-Territorium.'),
      );

  static SimulationQuestion _neuro14(AppLanguage language) => SimulationQuestionFactory.fromPairs(
        id: 'neuro-14', phase: SimulationQuizPhase.prescribe, correctIndex: 1, language: language,
        title: ('Migraine + oral contraception', 'Migräne + orale Kontrazeption'),
        vignette: ('Migraine with aura patient requests M-sense. Uses combined oral contraceptive. No vascular disease.', 'Migräne mit Aura, wünscht M-sense. Kombinierte Pille. Keine Gefäßerkrankung.'),
        decisionPoint: ('Prescribing note?', 'Verordnungshinweis?'), prompt: ('Aura and vascular risk', 'Aura und vaskuläres Risiko'),
        options: [('DiGA replaces contraception counselling.', 'DiGA ersetzt Kontrazeptionsberatung.'), ('Document aura history, ensure contraception/vascular risk addressed per guidelines alongside migraine DiGA.', 'Aura-Anamnese dokumentieren, Kontrazeption/vaskuläres Risiko leitliniengerecht neben Migräne-DiGA adressieren.'), ('Aura contraindicates all digital care.', 'Aura kontraindiziert jede digitale Versorgung.'), ('Ignore aura if patient prefers app.', 'Aura ignorieren wenn Patient App will.')],
        rationale: ('Migraine with aura has vascular implications independent of DiGA prescribing.', 'Migräne mit Aura hat vaskuläre Implikationen unabhängig von DiGA-Verordnung.'),
      );

  static SimulationQuestion _neuro15(AppLanguage language) => SimulationQuestionFactory.fromPairs(
        id: 'neuro-15', phase: SimulationQuizPhase.followUp, correctIndex: 2, language: language,
        title: ('Sudden hearing change on Kalmeda', 'Plötzliche Höränderung unter Kalmeda'),
        vignette: ('Patient calls: new sudden hearing drop right ear today while using Kalmeda. No vertigo.', 'Patient meldet: heute plötzlicher Hörabfall rechts unter Kalmeda. Kein Schwindel.'),
        decisionPoint: ('Advice?', 'Rat?'), prompt: ('SSHL during DiGA', 'SSHL während DiGA'),
        options: [('Continue Kalmeda and review in 4 weeks.', 'Kalmeda fortsetzen, Review in 4 Wochen.'), ('Increase app volume exercises.', 'App-Lautstärke-Übungen erhöhen.'), ('Stop DiGA, same-day ENT/urgent assessment for sudden sensorineural hearing loss.', 'DiGA stoppen, HNO-/dringliche Abklärung bei plötzlichem sensorineuralem Hörverlust am selben Tag.'), ('Prescribe antibiotics by phone.', 'Antibiotika telefonisch.')],
        rationale: ('Sudden hearing change is time-sensitive — DiGA must not delay care.', 'Plötzliche Höränderung ist zeitkritisch — DiGA darf Versorgung nicht verzögern.'),
      );

  static SimulationQuestion _neuro16(AppLanguage language) => SimulationQuestionFactory.fromPairs(
        id: 'neuro-16', phase: SimulationQuizPhase.diagnose, correctIndex: 3, language: language,
        title: ('Acoustic neuroma workup', 'Akustikusneurinom-Abklärung'),
        vignette: ('Unilateral tinnitus 8 months, subtle ipsilateral hearing loss. MRI scheduled in 3 weeks. Patient wants Kalmeda now.', 'Einseitiger Tinnitus 8 Monate, subtiler ipsilateraler Hörverlust. MRT in 3 Wochen. Patient wünscht jetzt Kalmeda.'),
        decisionPoint: ('Best approach?', 'Bestes Vorgehen?'), prompt: ('Structural lesion screen', 'Strukturelle Läsion'),
        options: [('Prescribe immediately — MRI is optional.', 'Sofort verordnen — MRT optional.'), ('Unilateral tinnitus never needs imaging.', 'Einseitiger Tinnitus braucht nie Bildgebung.'), ('Kalmeda diagnoses acoustic neuroma.', 'Kalmeda diagnostiziert Akustikusneurinom.'), ('Complete appropriate structural workup before chronic tinnitus DiGA when unilateral hearing loss present — coordinate timing with ENT.', 'Angemessene strukturelle Abklärung vor chronischer Tinnitus-DiGA bei einseitigem Hörverlust — Timing mit HNO abstimmen.')],
        rationale: ('Unilateral tinnitus with hearing loss needs exclusion of structural pathology.', 'Einseitiger Tinnitus mit Hörverlust braucht Ausschluss struktureller Pathologie.'),
      );

  static SimulationQuestion _neuro17(AppLanguage language) => SimulationQuestionFactory.fromPairs(
        id: 'neuro-17', phase: SimulationQuizPhase.prescribe, correctIndex: 0, language: language,
        title: ('Choosing between neuro DiGAs', 'Wahl zwischen Neuro-DiGAs'),
        vignette: ('Patient has chronic migraine AND chronic tinnitus after separate workups. Asks which single DiGA covers both.', 'Patient hat chronische Migräne UND chronischen Tinnitus nach getrennter Abklärung. Fragt welche eine DiGA beides abdeckt.'),
        decisionPoint: ('Correct counselling?', 'Korrekte Beratung?'), prompt: ('Multi-condition DiGA', 'Multi-Indikation-DiGA'),
        options: [('DiGAs are indication-specific; migraine and tinnitus programmes differ — may need prioritisation or sequential prescribing per guidelines, not one app for all.', 'DiGAs sind indikationsspezifisch; Migräne- und Tinnitus-Programme unterscheiden sich — ggf. Priorisierung oder sequenzielle Verordnung, nicht eine App für alles.'), ('Any neuro DiGA treats all symptoms.', 'Jede Neuro-DiGA behandelt alle Symptome.'), ('Prescribe two DiGAs simultaneously always.', 'Immer zwei DiGAs gleichzeitig.'), ('Neither condition qualifies for DiGA.', 'Keine Indikation qualifiziert für DiGA.')],
        rationale: ('Indication fidelity matters; combined symptoms need prioritised shared decision-making.', 'Indikationstreue zählt; kombinierte Symptome brauchen priorisiertes Shared Decision-making.'),
        teachingPearl: ('Document which condition is primary treatment target when multiple neuro DiGAs could apply over time.', 'Primäres Behandlungsziel dokumentieren wenn mehrere Neuro-DiGAs über Zeit infrage kommen.'),
      );
}
