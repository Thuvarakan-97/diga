import 'package:diga/core/locale/app_locale_provider.dart';
import 'package:diga/features/simulation/domain/models/simulation_question.dart';
import 'package:diga/features/simulation/domain/models/simulation_quiz_phase.dart';
import 'package:diga/features/simulation/presentation/data/localized_string.dart';

/// DiGA LAB clinical scenario bank — EN/DE localized legacy tracks.
abstract final class ClinicalScenariosData {
  /// Legacy depression track (3 scenarios) — merged into mental health domain exam.
  static List<SimulationQuestion> depressionTrack(AppLanguage language) => _depressionTrack(language);

  static List<SimulationQuestion> insomniaTrack(AppLanguage language) => _insomniaTrack(language);

  static List<SimulationQuestion> kalmedaTrack(AppLanguage language) => _kalmedaTrack(language);

  static List<SimulationQuestion> viviraTrack(AppLanguage language) => _viviraTrack(language);

  static List<SimulationQuestion> cardioTrack(AppLanguage language) => _cardioTrack(language);

  static List<SimulationQuestion> genericTrack(AppLanguage language) => _genericTrack(language);

  static SimulationQuestion _q({
    required String id,
    required SimulationQuizPhase phase,
    required int correctIndex,
    required L10nStr title,
    required L10nStr vignette,
    required L10nStr decisionPoint,
    required L10nStr prompt,
    required List<L10nStr> options,
    required L10nStr rationale,
    L10nStr? teachingPearl,
    required AppLanguage language,
  }) {
    return SimulationQuestion(
      id: id,
      phase: phase,
      correctIndex: correctIndex,
      scenarioTitle: title.forLanguage(language),
      vignette: vignette.forLanguage(language),
      decisionPoint: decisionPoint.forLanguage(language),
      prompt: prompt.forLanguage(language),
      options: localizedOptions(language, options),
      rationale: rationale.forLanguage(language),
      teachingPearl: teachingPearl?.forLanguage(language),
    );
  }

  static List<SimulationQuestion> _depressionTrack(AppLanguage language) => [
        _q(
          id: 'dep-1-1-diagnose',
          phase: SimulationQuizPhase.diagnose,
          correctIndex: 1,
          language: language,
          title: const L10nStr(
            'Scenario 1.1 — Which Depression DiGA and Why',
            'Szenario 1.1 — Welche Depressions-DiGA und warum',
          ),
          vignette: const L10nStr(
            'Dr. Lena Hartmann sees Frau Sandra Holz, 34, secondary school teacher: 6 weeks low mood, anhedonia, poor sleep, poor concentration. PHQ-9: 13 (moderate). No prior psychiatric history. No suicidal ideation. No medication. Confident smartphone user. Declines antidepressants; aware of 4–6 month CBT wait; asks which app is best. GKV eligible (TK). Choice between five approved depression DiGAs.',
            'Dr. Lena Hartmann sieht Frau Sandra Holz, 34, Sekundarlehrerin: seit 6 Wochen gedrückte Stimmung, Anhedonie, Schlafstörungen, Konzentrationsprobleme. PHQ-9: 13 (mittelgradig). Keine psychiatrische Vorgeschichte. Keine Suizidalität. Keine Medikation. Sicherer Smartphone-Nutzer. Lehnt Antidepressiva ab; kennt 4–6 Monate Wartezeit auf VT; fragt nach der besten App. GKV (TK). Auswahl zwischen fünf zugelassenen Depressions-DiGAs.',
          ),
          decisionPoint: const L10nStr(
            'Which of the following most accurately reflects the clinical differences between depression DiGAs that should guide your choice for Frau Holz?',
            'Welche der folgenden Aussagen beschreibt am zutreffendsten die klinischen Unterschiede zwischen Depressions-DiGAs, die Ihre Wahl für Frau Holz leiten sollten?',
          ),
          prompt: const L10nStr('Choosing between depression DiGAs', 'Auswahl zwischen Depressions-DiGAs'),
          options: const [
            L10nStr(
              'All five depression DiGAs are equally suitable — let the patient choose by interface only.',
              'Alle fünf Depressions-DiGAs sind gleich geeignet — die Patientin soll nur nach der Oberfläche wählen.',
            ),
            L10nStr(
              'Deprexis and Selfapy have the strongest RCT evidence; for this motivated, CBT-familiar patient with moderate depression, either is appropriate; choice can include patient preference after brief programme description.',
              'Deprexis und Selfapy haben die stärkste RCT-Evidenz; für diese motivierte, VT-vertraute Patientin mit mittelgradiger Depression ist beides geeignet; die Wahl kann nach kurzer Programmbeschreibung die Patientenpräferenz einbeziehen.',
            ),
            L10nStr(
              'Only Selfapy is appropriate because she has moderate (not mild) depression.',
              'Nur Selfapy ist geeignet, weil sie eine mittelgradige (nicht milde) Depression hat.',
            ),
            L10nStr(
              'Prescribing any one without psychiatrist advice is a clinical risk — psychiatry must choose the app.',
              'Die Verordnung ohne psychiatrische Beratung ist ein klinisches Risiko — die Psychiatrie muss die App wählen.',
            ),
          ],
          rationale: const L10nStr(
            'Patient preference matters, but evidence differentiates options. Deprexis has strong trial support for permanent listing; Selfapy suits CBT-familiar patients. Severity does not restrict to one app (option C is wrong). GPs may choose between DiGAs without mandatory psychiatry (option D is wrong).',
            'Patientenpräferenz ist wichtig, aber die Evidenz differenziert. Deprexis hat starke Studienunterstützung; Selfapy passt zu VT-vertrauten Patientinnen. Der Schweregrad schränkt nicht auf eine App ein (C falsch). Hausärzte dürfen zwischen DiGAs wählen ohne zwingende Psychiatrie (D falsch).',
          ),
          teachingPearl: const L10nStr(
            'Deprexis showed ~32% reduction in health insurance costs vs ~13% in passive control in routine care — useful for insurer discussions. Acknowledge evidence limitations (risk of bias) when speaking with sceptical colleagues.',
            'Deprexis zeigte in der Regelversorgung ~32 % Kostensenkung vs. ~13 % in der Kontrollgruppe — nützlich für Gespräche mit Kostenträgern. Evidenzlimitierungen (Bias-Risiko) gegenüber skeptischen Kollegen offen ansprechen.',
          ),
        ),
        _q(
          id: 'dep-1-2-prescribe',
          phase: SimulationQuizPhase.prescribe,
          correctIndex: 1,
          language: language,
          title: const L10nStr(
            'Scenario 1.2 — The Absolute Contraindication',
            'Szenario 1.2 — Das absolute Kontraindikations-Szenario',
          ),
          vignette: const L10nStr(
            'Herr Daniel Kraft, 29, requests a depression DiGA. PHQ-9: 17. Low mood, hopelessness, poor sleep, work impairment for 3 months. Reports mood "goes up and down" — week-long periods of high energy, little sleep but feeling great, excessive spending, multiple projects. Last episode 6 weeks ago, 8 days. Never psychiatrically assessed. No medication. GKV (AOK).',
            'Herr Daniel Kraft, 29, wünscht eine Depressions-DiGA. PHQ-9: 17. Gedrückte Stimmung, Hoffnungslosigkeit, Schlafstörungen, berufliche Beeinträchtigung seit 3 Monaten. Stimmung „schwankt stark“ — wochenlange Phasen mit viel Energie, wenig Schlaf, aber gutem Befinden, übermäßigen Ausgaben, vielen Projekten. Letzte Episode vor 6 Wochen, 8 Tage. Nie psychiatrisch abgeklärt. Keine Medikation. GKV (AOK).',
          ),
          decisionPoint: const L10nStr(
            'What is the correct clinical response to his request for a depression DiGA?',
            'Was ist die korrekte klinische Antwort auf seinen Wunsch nach einer Depressions-DiGA?',
          ),
          prompt: const L10nStr('Depression DiGA safety screen', 'Sicherheits-Screening Depressions-DiGA'),
          options: const [
            L10nStr(
              'Prescribe Selfapy or Deprexis — PHQ-9 confirms depression; mood variation is normal in depression.',
              'Selfapy oder Deprexis verordnen — PHQ-9 bestätigt Depression; Stimmungsschwankungen sind normal.',
            ),
            L10nStr(
              'Do not prescribe any depression DiGA now. Episodic elevated mood, reduced sleep need, increased energy, and impulsive spending suggest bipolar spectrum disorder; CBT depression DiGA without psychiatric assessment is inappropriate and potentially harmful.',
              'Jetzt keine Depressions-DiGA verordnen. Episodisch gehobene Stimmung, reduzierter Schlafbedarf, mehr Energie und impulsives Ausgeben sprechen für bipolares Spektrum; eine VT-Depressions-DiGA ohne psychiatrische Abklärung ist unangemessen und potenziell schädlich.',
            ),
            L10nStr(
              'Prescribe a DiGA but tell him to stop if mood elevates — apps monitor instability.',
              'DiGA verordnen, aber bei Stimmungsanhebung stoppen — Apps überwachen Instabilität.',
            ),
            L10nStr(
              'Prescribe Novego because it is approved for comorbid mood instability with depression.',
              'Novego verordnen, da es für Stimmungsinstabilität bei Depression zugelassen ist.',
            ),
          ],
          rationale: const L10nStr(
            'Hypomanic features (8 days elevated mood, decreased sleep need, impulsivity) raise bipolar spectrum concern. Bipolar disorders are exclusions for depression DiGAs; CBT-focused depression tools can risk manic switch without mood stabilisation. Refer for mood disorder assessment first.',
            'Hypomanische Merkmale (8 Tage gehobene Stimmung, weniger Schlafbedarf, Impulsivität) ergeben Verdacht auf bipolares Spektrum. Bipolare Störungen sind Ausschlusskriterien; VT-Depressions-DiGAs können ohne Stimmungsstabilisierung manischen Switch riskieren. Zuerst psychiatrische Abklärung.',
          ),
          teachingPearl: const L10nStr(
            'The directory lists approved diagnoses, but safety depends on diagnostic accuracy. A depression DiGA in undiagnosed bipolar disorder is a diagnostic error, not merely a prescribing error.',
            'Das Verzeichnis listet Indikationen, aber die Sicherheit hängt von der Diagnosegenauigkeit ab. Eine Depressions-DiGA bei unerkanntem bipolarer Störung ist ein Diagnosefehler, nicht nur ein Verordnungsfehler.',
          ),
        ),
        _q(
          id: 'dep-3-1-followup',
          phase: SimulationQuizPhase.followUp,
          correctIndex: 1,
          language: language,
          title: const L10nStr(
            'Scenario 3.1 — Appears Perfect, But Is Not',
            'Szenario 3.1 — Scheinbar perfekt, aber nicht geeignet',
          ),
          vignette: const L10nStr(
            'Herr Friedrich Becker, 55, retired: 7 months low mood, poor sleep, early waking, 4 kg weight loss, anhedonia, reduced concentration. PHQ-9: 21 (severe). Wife reports he barely left the house for 6 weeks. Denies active suicidal ideation but says "I wouldn\'t mind not waking up." GKV (TK). Smartphone available. Wife researched Deprexis and asks you to prescribe it.',
            'Herr Friedrich Becker, 55, pensioniert: 7 Monate gedrückte Stimmung, Schlafstörungen, frühes Erwachen, 4 kg Gewichtsverlust, Anhedonie, Konzentrationsstörung. PHQ-9: 21 (schwer). Ehefrau berichtet, er verließ 6 Wochen kaum das Haus. Verneint aktive Suizidgedanken, sagt aber: „Es wäre mir egal, nicht aufzuwachen.“ GKV (TK). Smartphone vorhanden. Ehefrau möchte Deprexis verordnet haben.',
          ),
          decisionPoint: const L10nStr(
            'His wife asks you to prescribe Deprexis. What is the correct clinical response?',
            'Die Ehefrau bittet um Deprexis. Was ist die korrekte klinische Antwort?',
          ),
          prompt: const L10nStr('Severe depression and DiGA eligibility', 'Schwere Depression und DiGA-Eignung'),
          options: const [
            L10nStr(
              'Prescribe Deprexis — approved for depression; self-directed activity may help severe depression.',
              'Deprexis verordnen — für Depression zugelassen; selbstgesteuerte Aktivität kann bei schwerer Depression helfen.',
            ),
            L10nStr(
              'Do not prescribe a DiGA. PHQ-9 21 with passive suicidal ideation and major functional impairment needs urgent psychiatric assessment and likely pharmacotherapy/crisis support — not a self-directed digital tool as primary care.',
              'Keine DiGA verordnen. PHQ-9 21 mit passiver Suizidalität und schwerer Funktionsbeeinträchtigung erfordert dringliche psychiatrische Abklärung und wahrscheinlich Pharmakotherapie/Krisenunterstützung — keine selbstgesteuerte App als Primärversorgung.',
            ),
            L10nStr(
              'Prescribe Deprexis plus urgent psychiatry referral to keep him engaged while waiting.',
              'Deprexis plus dringliche Psychiatrie-Überweisung, um ihn während der Wartezeit zu binden.',
            ),
            L10nStr(
              'Prescribe Elona because it is indicated for severe depression while Deprexis is only mild-to-moderate.',
              'Elona verordnen, da es für schwere Depression indiziert ist, Deprexis nur mild-mittel.',
            ),
          ],
          rationale: const L10nStr(
            'Severe depression with passive suicidal ideation and functional collapse is not appropriate for primary DiGA intervention. Suicidality is an exclusion across depression DiGAs. Urgent psychiatric referral and safety assessment today are required.',
            'Schwere Depression mit passiver Suizidalität und funktionellem Zusammenbruch ist nicht für eine primäre DiGA-Intervention geeignet. Suizidalität ist Ausschlusskriterium. Dringliche psychiatrische Überweisung und Sicherheitsbeurteilung heute erforderlich.',
          ),
          teachingPearl: const L10nStr(
            'DiGAs supplement care; they do not substitute for it. Prescription-eligible ICD code is necessary but not sufficient — severity and safety take precedence.',
            'DiGAs ergänzen die Versorgung; sie ersetzen sie nicht. Ein verordnungsfähiger ICD-Code ist notwendig, aber nicht hinreichend — Schweregrad und Sicherheit haben Vorrang.',
          ),
        ),
      ];

  static List<SimulationQuestion> _insomniaTrack(AppLanguage language) => [
        _q(
          id: 'ins-2-1-diagnose',
          phase: SimulationQuizPhase.diagnose,
          correctIndex: 2,
          language: language,
          title: const L10nStr(
            'Scenario 2.1 — Somnio vs HelloBetter Schlafen',
            'Szenario 2.1 — Somnio vs HelloBetter Schlafen',
          ),
          vignette: const L10nStr(
            'Frau Gabriele Fuchs, 46, nurse on rotating shifts: 9 months difficulty maintaining sleep, 3–4 nightly awakenings, unrefreshing sleep. ISI: 16. No hypnotics. PHQ-9: 5. No prior CBT experience; prefers "flexible, manageable steps" over rigid daily programmes. GKV (Barmer). Failed sleep hygiene twice — wants more than advice.',
            'Frau Gabriele Fuchs, 46, Pflegekraft im Schichtdienst: seit 9 Monaten Durchschlafstörungen, 3–4 nächtliche Wachphasen, nicht erholsamer Schlaf. ISI: 16. Keine Hypnotika. PHQ-9: 5. Keine VT-Erfahrung; bevorzugt „flexible, machbare Schritte“ statt starre Tagesprogramme. GKV (Barmer). Schlafhygiene zweimal ohne Erfolg — wünscht mehr als Ratschläge.',
          ),
          decisionPoint: const L10nStr(
            'Two DiGAs are approved for non-organic insomnia: Somnio and HelloBetter Schlafen (both CBT-I). Which consideration is most clinically relevant?',
            'Zwei DiGAs sind für nicht-organische Insomnie zugelassen: Somnio und HelloBetter Schlafen (beide CBT-I). Welcher Aspekt ist klinisch am relevantesten?',
          ),
          prompt: const L10nStr('Choosing between insomnia DiGAs', 'Auswahl zwischen Insomnie-DiGAs'),
          options: const [
            L10nStr(
              'Prescribe Somnio because of higher app store ratings alone.',
              'Somnio allein wegen höherer App-Store-Bewertungen verordnen.',
            ),
            L10nStr(
              'Prescribe HelloBetter Schlafen because therapist messaging suits healthcare professionals.',
              'HelloBetter Schlafen verordnen, weil Therapeuten-Messaging zu Pflegekräften passt.',
            ),
            L10nStr(
              'Both are clinically appropriate; discuss structure and engagement fit — flexible self-paced vs guided support — given her preference for manageable steps.',
              'Beide sind klinisch geeignet; Struktur und Engagement besprechen — flexibel vs. begleitet — gemäß ihrer Präferenz für machbare Schritte.',
            ),
            L10nStr(
              'Neither DiGA is appropriate — shift work requires sleep medicine referral only.',
              'Keine DiGA geeignet — Schichtarbeit erfordert nur Schlafmedizin-Überweisung.',
            ),
          ],
          rationale: const L10nStr(
            'Both are permanently listed for F51.0 and deliver CBT-I. No head-to-head trial. Ratings and profession-based assumptions are insufficient; engagement fit and programme structure should drive shared decision-making. Shift work complicates but does not automatically exclude CBT-I here.',
            'Beide sind dauerhaft für F51.0 gelistet und liefern CBT-I. Keine Head-to-Head-Studie. Bewertungen und Berufsannahmen reichen nicht; Engagement-Fit und Programmstruktur sollten die gemeinsame Entscheidung leiten. Schichtarbeit erschwert, schließt CBT-I hier nicht automatisch aus.',
          ),
          teachingPearl: const L10nStr(
            'HelloBetter Schlafen includes asynchronous therapist messaging — a decisive factor for patients who struggled with purely self-directed programmes.',
            'HelloBetter Schlafen bietet asynchrones Therapeuten-Messaging — entscheidend für Patientinnen, die rein selbstgesteuerte Programme nicht durchhielten.',
          ),
        ),
        _q(
          id: 'ins-2-1-prescribe',
          phase: SimulationQuizPhase.prescribe,
          correctIndex: 1,
          language: language,
          title: const L10nStr(
            'Scenario 2.1 — Somnio vs HelloBetter Schlafen (Prescribing)',
            'Szenario 2.1 — Somnio vs HelloBetter Schlafen (Verordnung)',
          ),
          vignette: const L10nStr(
            'You and Frau Fuchs agree on a CBT-I DiGA after shared decision-making. She reiterates she disengaged from rigid programmes before and wants realistic step sizes while working night shifts.',
            'Sie und Frau Fuchs einigen sich nach Shared Decision-making auf eine CBT-I-DiGA. Sie betont erneut, dass sie starre Programme abgebrochen hat und realistische Schrittgrößen im Nachtdienst braucht.',
          ),
          decisionPoint: const L10nStr(
            'Before activating the prescription, what is the most important documentation step?',
            'Was ist vor Aktivierung der Verordnung der wichtigste Dokumentationsschritt?',
          ),
          prompt: const L10nStr('Insomnia DiGA prescribing documentation', 'Dokumentation Insomnie-DiGA'),
          options: const [
            L10nStr(
              'Document only the app name — DiGA prescriptions need no clinical indication in the chart.',
              'Nur App-Namen dokumentieren — DiGA-Verordnungen brauchen keine Indikation.',
            ),
            L10nStr(
              'Document insomnia diagnosis (F51.0), prior non-pharmacological attempts, patient goals, chosen programme rationale, and planned follow-up to review adherence and ISI.',
              'Insomnie-Diagnose (F51.0), vorherige nicht-medikamentöse Versuche, Patientenziele, Programmbegründung und geplanten Follow-up zur Adhärenz- und ISI-Kontrolle dokumentieren.',
            ),
            L10nStr(
              'Document only Barmer insurance number for billing.',
              'Nur Barmer-Versichertennummer für Abrechnung dokumentieren.',
            ),
            L10nStr(
              'Defer documentation until after 90 days of app use.',
              'Dokumentation bis nach 90 Tagen App-Nutzung verschieben.',
            ),
          ],
          rationale: const L10nStr(
            'DiGA prescribing requires clear indication, prior care context, patient-centred rationale, and follow-up planning — especially when engagement risk is high.',
            'DiGA-Verordnung erfordert klare Indikation, Vorversorgung, patientenzentrierte Begründung und Follow-up-Planung — besonders bei hohem Abbruchrisiko.',
          ),
          teachingPearl: const L10nStr(
            'Engagement predictors (flexibility preference, prior failed sleep hygiene) belong in the chart — they justify programme choice and follow-up intensity.',
            'Engagement-Prädiktoren (Flexibilitätswunsch, gescheiterte Schlafhygiene) gehören in die Akte — sie begründen Programmwahl und Follow-up-Intensität.',
          ),
        ),
        _q(
          id: 'ins-2-1-followup',
          phase: SimulationQuizPhase.followUp,
          correctIndex: 1,
          language: language,
          title: const L10nStr('Scenario 2.1 — Follow-up', 'Szenario 2.1 — Verlauf'),
          vignette: const L10nStr(
            'Frau Fuchs returns at 6 weeks. She used the prescribed insomnia DiGA regularly. ISI improved from 16 to 11. She still has occasional shift-related sleep disruption but reports better daytime function.',
            'Frau Fuchs kommt nach 6 Wochen wieder. Sie nutzte die verordnete Insomnie-DiGA regelmäßig. ISI verbesserte sich von 16 auf 11. Gelegentliche schichtbedingte Schlafstörungen, aber bessere Tagesfunktion.',
          ),
          decisionPoint: const L10nStr('What is the best follow-up action?', 'Was ist die beste Verlaufsmaßnahme?'),
          prompt: const L10nStr('Insomnia DiGA follow-up', 'Verlauf Insomnie-DiGA'),
          options: const [
            L10nStr(
              'Stop all sleep assessment — ISI < 12 means treatment is finished forever.',
              'Schlafbeurteilung beenden — ISI < 12 bedeutet Behandlung für immer abgeschlossen.',
            ),
            L10nStr(
              'Review adherence data if available, reinforce CBT-I skills, adjust expectations for shift work, and plan continued monitoring until sustained response.',
              'Adhärenzdaten prüfen, CBT-I-Fertigkeiten festigen, Erwartungen bei Schichtarbeit anpassen und Monitoring bis zur stabilen Response planen.',
            ),
            L10nStr(
              'Switch immediately to zopiclone because digital treatment cannot help shift workers.',
              'Sofort auf Zopiclon wechseln, weil digitale Therapie Schichtarbeitern nicht hilft.',
            ),
            L10nStr(
              'Discharge without documentation because improvement is adequate.',
              'Entlassen ohne Dokumentation, weil die Besserung ausreicht.',
            ),
          ],
          rationale: const L10nStr(
            'Meaningful improvement warrants continued structured follow-up, reinforcement, and documentation — not abrupt cessation or automatic pharmacotherapy.',
            'Sinnvolle Besserung rechtfertigt strukturiertes Follow-up, Festigung und Dokumentation — kein abruptes Beenden oder automatische Pharmakotherapie.',
          ),
        ),
      ];

  static List<SimulationQuestion> _kalmedaTrack(AppLanguage language) => [
        _q(
          id: 'kal-1-diagnose',
          phase: SimulationQuizPhase.diagnose,
          correctIndex: 1,
          language: language,
          title: const L10nStr(
            'Kalmeda — Sudden hearing loss is not a DiGA moment',
            'Kalmeda — Plötzlicher Hörverlust ist kein DiGA-Moment',
          ),
          vignette: const L10nStr(
            'Herr Martin Lehmann, 52, accountant, presents today with 48 hours of sudden unilateral hearing loss and loud tinnitus on the right. He feels blocked and anxious. He read online about Kalmeda and asks you to prescribe it immediately. No vertigo. No facial weakness. No head trauma. Otherwise healthy. GKV (TK). Uses a smartphone confidently. Tinnitus duration: 2 days.',
            'Herr Martin Lehmann, 52, Buchhalter, stellt sich heute mit seit 48 Stunden plötzlichem einseitigem Hörverlust und lautem Tinnitus rechts vor. Er fühlt sich verstopft und ängstlich. Er las online über Kalmeda und bittet um sofortige Verordnung. Kein Schwindel. Keine Fazialisparese. Kein Kopftrauma. Sonst gesund. GKV (TK). Smartphone-sicher. Tinnitus-Dauer: 2 Tage.',
          ),
          decisionPoint: const L10nStr(
            'What is the correct clinical response before any tinnitus DiGA is considered?',
            'Was ist die korrekte klinische Antwort, bevor eine Tinnitus-DiGA erwogen wird?',
          ),
          prompt: const L10nStr('Kalmeda safety — acute presentation', 'Kalmeda-Sicherheit — akute Vorstellung'),
          options: const [
            L10nStr(
              'Prescribe Kalmeda today — tinnitus is the indication and early app use may prevent chronicity.',
              'Kalmeda heute verordnen — Tinnitus ist die Indikation und frühe App-Nutzung verhindert Chronifizierung.',
            ),
            L10nStr(
              'Do not prescribe Kalmeda now. Sudden unilateral hearing loss is an ENT/urgent red flag requiring prompt in-person assessment (e.g. sudden sensorineural hearing loss pathway) before chronic tinnitus DiGA care.',
              'Kalmeda jetzt nicht verordnen. Plötzlicher einseitiger Hörverlust ist ein HNO-/Dringlichkeits-Red-Flag mit zeitnaher Abklärung (z. B. plötzlicher sensorineuraler Hörverlust) vor chronischer Tinnitus-DiGA.',
            ),
            L10nStr(
              'Prescribe Kalmeda and arrange ENT review in 4–6 weeks if symptoms persist.',
              'Kalmeda verordnen und HNO in 4–6 Wochen bei Persistenz.',
            ),
            L10nStr(
              'Prescribe Kalmeda only if audiometry is normal — hearing loss excludes apps entirely forever.',
              'Kalmeda nur bei normaler Audiometrie — Hörverlust schließt Apps dauerhaft aus.',
            ),
          ],
          rationale: const L10nStr(
            'Kalmeda is for chronic subjective tinnitus with functional burden after appropriate assessment — not for acute sudden hearing loss. SSHL requires urgent evaluation (steroids/time-sensitive care). Delaying assessment to start a DiGA is unsafe.',
            'Kalmeda ist für chronischen subjektiven Tinnitus mit Funktionsbeeinträchtigung nach Abklärung — nicht für akuten plötzlichen Hörverlust. SSHL erfordert dringliche Abklärung (steroid-/zeitkritisch). Abklärung zugunsten einer DiGA zu verzögern ist unsicher.',
          ),
          teachingPearl: const L10nStr(
            'Patient requests for a named DiGA do not replace red-flag triage. The most common prescribing error here is treating the label "tinnitus" without the timeline and red-flag context.',
            'Patientenwünsche nach einer DiGA ersetzen kein Red-Flag-Triage. Der häufigste Fehler: das Label „Tinnitus“ ohne Zeitverlauf und Red Flags behandeln.',
          ),
        ),
        _q(
          id: 'kal-2-prescribe',
          phase: SimulationQuizPhase.prescribe,
          correctIndex: 1,
          language: language,
          title: const L10nStr(
            'Kalmeda — Appropriate chronic tinnitus candidate',
            'Kalmeda — Geeignete chronische Tinnitus-Kandidatin',
          ),
          vignette: const L10nStr(
            'Frau Petra Weiss, 44, returns after ENT assessment 3 months ago excluded acute pathology. She has had bilateral subjective tinnitus for 14 months with sleep disturbance and difficulty concentrating at work (documented functional impairment). Stable mood. PHQ-9: 4. Motivated for structured digital therapy. GKV (Barmer). Smartphone capable. She asks for Kalmeda specifically after her ENT letter supported conservative management.',
            'Frau Petra Weiss, 44, kommt nach HNO-Abklärung vor 3 Monaten ohne akute Pathologie. Seit 14 Monaten bilateraler subjektiver Tinnitus mit Schlafstörung und Konzentrationsproblemen (dokumentierte Funktionsbeeinträchtigung). Stabile Stimmung. PHQ-9: 4. Motiviert für strukturierte digitale Therapie. GKV (Barmer). Smartphone-fähig. Wünscht Kalmeda nach HNO-Brief für konservatives Management.',
          ),
          decisionPoint: const L10nStr(
            'Which prescribing approach is most appropriate for Frau Weiss?',
            'Welcher Verordnungsansatz ist für Frau Weiss am angemessensten?',
          ),
          prompt: const L10nStr('Kalmeda eligibility and prescribing', 'Kalmeda-Eignung und Verordnung'),
          options: const [
            L10nStr(
              'Issue Kalmeda without documentation — the ENT letter is sufficient external proof.',
              'Kalmeda ohne Dokumentation — HNO-Brief reicht als externer Nachweis.',
            ),
            L10nStr(
              'Confirm chronic indication (e.g. H93.1 context), document functional impairment, rule out exclusions, explain Kalmeda as structured education/exercises (not emergency care), set therapy goals, and schedule follow-up to review adherence and outcomes.',
              'Chronische Indikation bestätigen (z. B. H93.1), Funktionsbeeinträchtigung dokumentieren, Ausschlüsse prüfen, Kalmeda als strukturierte Schulung/Übungen erklären, Therapieziele setzen und Follow-up planen.',
            ),
            L10nStr(
              'Prescribe Kalmeda only if tinnitus is unilateral — bilateral tinnitus is an exclusion.',
              'Kalmeda nur bei einseitigem Tinnitus — bilateral ist Ausschluss.',
            ),
            L10nStr(
              'Defer Kalmeda until she has failed every possible medication trial.',
              'Kalmeda verschieben bis jeder Medikamentenversuch gescheitert ist.',
            ),
          ],
          rationale: const L10nStr(
            'She fits a chronic tinnitus pathway: duration, functional burden, ENT red flags addressed, engagement, and GKV eligibility. DiGA prescribing still requires full documentation, patient information, and follow-up — companion criteria mirror this.',
            'Sie passt zum chronischen Tinnitus-Pfad: Dauer, Funktionsbeeinträchtigung, Red Flags geklärt, Engagement, GKV. DiGA-Verordnung erfordert dennoch volle Dokumentation, Aufklärung und Follow-up.',
          ),
          teachingPearl: const L10nStr(
            'Kalmeda patient guidance should explicitly cover when to stop app use and seek urgent care (sudden hearing change, neurological symptoms). This reduces medicolegal risk and aligns with companion contraindication teaching.',
            'Patientenaufklärung zu Kalmeda sollte klar nennen, wann App-Nutzung stoppen und dringliche Hilfe suchen (plötzliche Höränderung, neurologische Symptome).',
          ),
        ),
        _q(
          id: 'kal-3-followup',
          phase: SimulationQuizPhase.followUp,
          correctIndex: 1,
          language: language,
          title: const L10nStr(
            'Kalmeda — Worsening distress at follow-up',
            'Kalmeda — Zunehmende Belastung im Verlauf',
          ),
          vignette: const L10nStr(
            'Frau Weiss returns at 6 weeks. She used Kalmeda most days but reports increased tinnitus-related anxiety, avoidance of social situations, and new difficulty sleeping despite app use. She denies suicidal ideation but says she feels "hopeless about ever getting better." PHQ-9 today: 12 (moderate, increased from 4). Tinnitus loudness unchanged on VAS.',
            'Frau Weiss kommt nach 6 Wochen. Sie nutzte Kalmeda an den meisten Tagen, berichtet aber mehr tinnitusbedingte Angst, Vermeidung sozialer Situationen und neue Schlafprobleme trotz App. Keine Suizidgedanken, fühlt sich aber „hoffnungslos“. PHQ-9 heute: 12 (mittel, von 4 gestiegen). Tinnitus-Lautstärke unverändert.',
          ),
          decisionPoint: const L10nStr(
            'What is the best next clinical step?',
            'Was ist der beste nächste klinische Schritt?',
          ),
          prompt: const L10nStr('Kalmeda follow-up — when to escalate', 'Kalmeda-Verlauf — wann eskalieren'),
          options: const [
            L10nStr(
              'Continue Kalmeda unchanged — six weeks is too early to judge outcome.',
              'Kalmeda unverändert fortsetzen — sechs Wochen sind zu früh.',
            ),
            L10nStr(
              'Reassess mental health comorbidity, consider psychology/psychiatry referral, review whether Kalmeda remains appropriate, and document a stepped-care plan — DiGA alone may be insufficient if mood disorder is emerging.',
              'Psychische Komorbidität neu beurteilen, Psychologie/Psychiatrie erwägen, Kalmeda-Eignung prüfen und Stufenplan dokumentieren — DiGA allein kann bei aufkommender Störung unzureichend sein.',
            ),
            L10nStr(
              'Stop Kalmeda and tell her nothing else can help.',
              'Kalmeda stoppen und mitteilen, dass nichts mehr hilft.',
            ),
            L10nStr(
              'Switch to a different tinnitus DiGA without further assessment because engagement was good.',
              'Andere Tinnitus-DiGA ohne weitere Abklärung wechseln, weil Adhärenz gut war.',
            ),
          ],
          rationale: const L10nStr(
            'Rising PHQ-9 and functional avoidance signal need to broaden care beyond the DiGA. Continue or stop Kalmeda only after reassessment; psychiatric comorbidity and suicidality risk must be evaluated per exclusion/caution criteria.',
            'Steigender PHQ-9 und Vermeidung erfordern erweiterte Versorgung jenseits der DiGA. Kalmeda erst nach Re-Evaluation fortsetzen/stoppen; psychische Komorbidität und Suizidalität prüfen.',
          ),
          teachingPearl: const L10nStr(
            'DiGA follow-up is not only adherence monitoring — it is a safety review. Worsening mood with unchanged somatic symptoms is a common reason to escalate beyond digital therapy.',
            'DiGA-Follow-up ist nicht nur Adhärenz-Kontrolle, sondern Sicherheitsreview. Verschlechterte Stimmung bei unveränderten somatischen Symptomen ist häufiger Eskalationsgrund.',
          ),
        ),
      ];

  static List<SimulationQuestion> _viviraTrack(AppLanguage language) => [
        _q(
          id: 'viv-1-diagnose',
          phase: SimulationQuizPhase.diagnose,
          correctIndex: 1,
          language: language,
          title: const L10nStr(
            'Vivira — Red flags before back-pain DiGA',
            'Vivira — Red Flags vor Rückenschmerz-DiGA',
          ),
          vignette: const L10nStr(
            'Frau Sonja Richter, 38, office worker, presents with 4 months of lower back pain radiating to the left leg. Pain worse with coughing. New difficulty lifting her foot when walking (foot drop sensation). Saddle anaesthesia when she sits. Bladder urgency started yesterday. Otherwise previously well. She asks for Vivira because a colleague used it. GKV (AOK).',
            'Frau Sonja Richter, 38, Büroangestellte, seit 4 Monaten Rückenschmerzen mit Ausstrahlung ins linke Bein. Schmerzen beim Husten stärker. Neue Schwierigkeit, den Fuß beim Gehen anzuheben (Fußheberschwäche). Sattel-Anästhesie beim Sitzen. Blasendrängen seit gestern. Sonst bisher gesund. Wünscht Vivira, weil eine Kollegin es nutzte. GKV (AOK).',
          ),
          decisionPoint: const L10nStr(
            'What is the correct response to her request for Vivira?',
            'Was ist die korrekte Antwort auf ihren Vivira-Wunsch?',
          ),
          prompt: const L10nStr('Vivira — neurological red flags', 'Vivira — neurologische Red Flags'),
          options: const [
            L10nStr(
              'Prescribe Vivira — chronic low back pain is the indication and exercise therapy will help sciatica.',
              'Vivira verordnen — chronische Kreuzschmerzen sind Indikation und Übung hilft bei Ischialgie.',
            ),
            L10nStr(
              'Do not prescribe Vivira. New leg weakness, saddle anaesthesia, and bladder symptoms require urgent exclusion of cauda equina / significant nerve compression — emergency or same-day specialist assessment, not a home exercise DiGA.',
              'Vivira nicht verordnen. Neue Beinschwäche, Sattel-Anästhesie und Blasensymptome erfordern dringliche Ausschlussdiagnostik Cauda-equina-/Nervenkompression — Notfall oder Tagspezialist, keine Heimübungs-DiGA.',
            ),
            L10nStr(
              'Prescribe Vivira and advise her to stop if leg pain increases.',
              'Vivira verordnen und bei zunehmenden Beinschmerzen stoppen.',
            ),
            L10nStr(
              'Prescribe Vivira only for the back component and ignore leg symptoms.',
              'Vivira nur für den Rücken verordnen und Beinsymptome ignorieren.',
            ),
          ],
          rationale: const L10nStr(
            'Vivira is for chronic non-specific low back pain after appropriate diagnostics. Cauda equina red flags are absolute priorities — digital exercise programmes must not delay urgent evaluation.',
            'Vivira ist für chronische unspezifische Kreuzschmerzen nach Abklärung. Cauda-equina-Red-Flags haben Vorrang — digitale Übungsprogramme dürfen dringliche Abklärung nicht verzögern.',
          ),
          teachingPearl: const L10nStr(
            'Always document red-flag assessment before any back-pain DiGA prescription. Companion Vivira contraindications explicitly include cauda equina suspicion.',
            'Red-Flag-Assessment vor jeder Rückenschmerz-DiGA dokumentieren. Vivira-Kontraindikationen umfassen ausdrücklich Cauda-equina-Verdacht.',
          ),
        ),
        _q(
          id: 'viv-2-prescribe',
          phase: SimulationQuizPhase.prescribe,
          correctIndex: 1,
          language: language,
          title: const L10nStr(
            'Vivira — Appropriate chronic LBP candidate',
            'Vivira — Geeigneter chronischer Kreuzschmerz-Kandidat',
          ),
          vignette: const L10nStr(
            'Herr Thomas Berger, 51, gardener, has had chronic non-specific low back pain for 9 months after a lifting injury. No red flags on examination today. Prior physiotherapy helped partially; he wants structured home exercises. Independent with smartphone. BMI 27. PHQ-9: 3. Pain interferes with work 2–3 days per week. GKV (TK). Imaging showed mild degenerative change only; no surgical indication.',
            'Herr Thomas Berger, 51, Gärtner, seit 9 Monaten chronische unspezifische Kreuzschmerzen nach Hebeunfall. Heute keine Red Flags. Physiotherapie half teilweise; er wünscht strukturierte Heimübungen. Smartphone-sicher. BMI 27. PHQ-9: 3. Schmerzen beeinträchtigen Arbeit 2–3 Tage/Woche. GKV (TK). Bildgebung nur milde degenerative Veränderungen.',
          ),
          decisionPoint: const L10nStr(
            'Which statement best supports prescribing Vivira for Herr Berger?',
            'Welche Aussage stützt eine Vivira-Verordnung für Herrn Berger am besten?',
          ),
          prompt: const L10nStr('Vivira indication and shared decision', 'Vivira-Indikation und Shared Decision'),
          options: const [
            L10nStr(
              'Vivira replaces all need for movement advice — no follow-up required.',
              'Vivira ersetzt Bewegungsberatung vollständig — kein Follow-up nötig.',
            ),
            L10nStr(
              'He fits a chronic non-specific LBP pathway after red-flag exclusion; Vivira can support progressive exercise therapy at home with documented goals, expectations (including temporary soreness), and scheduled review of function and adherence.',
              'Er passt nach Red-Flag-Ausschluss zum chronischen unspezifischen Kreuzschmerz-Pfad; Vivira unterstützt progressive Heimübungen mit dokumentierten Zielen, Erwartungen (inkl. vorübergehender Muskelkater) und geplantem Funktions-/Adhärenz-Review.',
            ),
            L10nStr(
              'Vivira is only for patients under 40 — age excludes him.',
              'Vivira nur unter 40 Jahren — Alter schließt ihn aus.',
            ),
            L10nStr(
              'Vivira should be prescribed only after opioid trial failure.',
              'Vivira erst nach gescheitertem Opioidversuch.',
            ),
          ],
          rationale: const L10nStr(
            'Duration, non-specific LBP, prior conservative care, functional impact, and capacity for home exercise align with Vivira-style pathways. Documentation and follow-up remain mandatory.',
            'Dauer, unspezifische Kreuzschmerzen, konservative Vortherapie, Funktionsbeeinträchtigung und Heimübungsfähigkeit passen zum Vivira-Pfad. Dokumentation und Follow-up bleiben Pflicht.',
          ),
          teachingPearl: const L10nStr(
            'Set expectations: exercise-based DiGAs may cause temporary soreness with loading — patients need clear stop rules (neurological symptoms, severe worsening) matching companion patient guidance.',
            'Erwartungen setzen: übungsbasierte DiGAs können vorübergehenden Muskelkater verursachen — klare Stop-Regeln (neurologische Symptome, starke Verschlechterung) gemäß Patientenaufklärung.',
          ),
        ),
        _q(
          id: 'viv-3-followup',
          phase: SimulationQuizPhase.followUp,
          correctIndex: 1,
          language: language,
          title: const L10nStr(
            'Vivira — Soreness vs deterioration',
            'Vivira — Muskelkater vs Verschlechterung',
          ),
          vignette: const L10nStr(
            'Herr Berger returns at 4 weeks. He completed ~70% of prescribed sessions. He reports increased muscle soreness in the back after new exercises but no leg symptoms, no numbness, and improved walking tolerance. Pain score down from 6/10 to 4/10. He asks if he should stop the app because of soreness.',
            'Herr Berger kommt nach 4 Wochen. ~70 % der Sitzungen absolviert. Mehr Muskelkater im Rücken nach neuen Übungen, aber keine Beinsymptome, keine Taubheit, bessere Gehtoleranz. Schmerz von 6/10 auf 4/10. Fragt, ob er wegen Muskelkater stoppen soll.',
          ),
          decisionPoint: const L10nStr('What is the best advice?', 'Was ist der beste Rat?'),
          prompt: const L10nStr('Vivira follow-up', 'Vivira-Verlauf'),
          options: const [
            L10nStr(
              'Stop Vivira immediately — any increase in pain means the programme is harmful.',
              'Vivira sofort stoppen — jede Schmerzsteigerung bedeutet Schaden.',
            ),
            L10nStr(
              'Reassure within expected loading response if no red flags: adjust intensity, reinforce pacing, continue monitoring; stop and reassess urgently if neurological or cauda equina symptoms appear.',
              'Bei erwarteter Belastungsreaktion ohne Red Flags beruhigen: Intensität anpassen, Pacing festigen, Monitoring fortsetzen; bei neurologischen/Cauda-equina-Symptomen dringlich stoppen und neu beurteilen.',
            ),
            L10nStr(
              'Ignore soreness and double exercise volume to speed recovery.',
              'Muskelkater ignorieren und Übungsumfang verdoppeln.',
            ),
            L10nStr(
              'Switch to complete bed rest for 2 weeks.',
              'Vollständige Bettruhe für 2 Wochen.',
            ),
          ],
          rationale: const L10nStr(
            'Expected post-exercise soreness with functional improvement and no red flags supports continued graded activity. Distinguish this from dangerous deterioration.',
            'Erwarteter Muskelkater bei Funktionsverbesserung und ohne Red Flags spricht für fortgesetzte gestufte Aktivität. Von gefährlicher Verschlechterung unterscheiden.',
          ),
          teachingPearl: const L10nStr(
            'Follow-up should capture adherence %, functional outcomes, and safety netting — the same data insurers and quality circles increasingly expect from DiGA pathways.',
            'Follow-up sollte Adhärenz %, Funktionsoutcomes und Safety-Netting erfassen — Daten, die Kostenträger zunehmend erwarten.',
          ),
        ),
      ];

  static List<SimulationQuestion> _cardioTrack(AppLanguage language) => [
        _q(
          id: 'cardio-1-diagnose',
          phase: SimulationQuizPhase.diagnose,
          correctIndex: 1,
          language: language,
          title: const L10nStr(
            'CardioCoach — Who is the right patient?',
            'CardioCoach — Wer ist der richtige Patient?',
          ),
          vignette: const L10nStr(
            'Frau Helga Schuster, 58, has known hypertension for 5 years on ramipril 5 mg. Home BP log (2 weeks): average 142/88 mmHg. Asymptomatic. BMI 31. Sedentary job. Wants a "blood pressure app" her insurer mentioned (CardioCoach-style lifestyle DiGA). No chest pain. No dyspnoea. eGFR normal last year. No diabetes yet. GKV (DAK).',
            'Frau Helga Schuster, 58, seit 5 Jahren Hypertonie mit Ramipril 5 mg. Heim-BD-Protokoll (2 Wochen): Ø 142/88 mmHg. Asymptomatisch. BMI 31. Sitzende Tätigkeit. Wünscht „Blutdruck-App“ vom Kostenträger (CardioCoach-ähnliche Lifestyle-DiGA). Keine Thoraxschmerzen. Keine Dyspnoe. eGFR letztes Jahr normal. Noch kein Diabetes. GKV (DAK).',
          ),
          decisionPoint: const L10nStr(
            'Before recommending a hypertension lifestyle DiGA, what is the essential first step?',
            'Was ist vor Empfehlung einer Hypertonie-Lifestyle-DiGA der wesentliche erste Schritt?',
          ),
          prompt: const L10nStr('CardioCoach — clinical assessment', 'CardioCoach — klinische Beurteilung'),
          options: const [
            L10nStr(
              'Prescribe the DiGA immediately — lifestyle apps always lower BP without other changes.',
              'DiGA sofort verordnen — Lifestyle-Apps senken BD immer ohne andere Maßnahmen.',
            ),
            L10nStr(
              'Confirm current BP control targets, medication adherence, secondary causes if indicated, and whether digital lifestyle support is an appropriate adjunct — not a substitute for antihypertensive optimisation where BP remains above target.',
              'Aktuelle BD-Ziele, Medikamentenadhärenz, sekundäre Ursachen prüfen und klären, ob digitale Lifestyle-Unterstützung ein sinnvolles Add-on ist — kein Ersatz für Antihypertensiva-Optimierung bei Zielwertüberschreitung.',
            ),
            L10nStr(
              'Only prescribe if BP is already normal — elevated BP excludes DiGA use.',
              'Nur bei normalem BD verordnen — erhöhter BD schließt DiGA aus.',
            ),
            L10nStr(
              'Refer to cardiology before any lifestyle intervention in all hypertensive patients.',
              'Vor jeder Lifestyle-Intervention alle Hypertoniker an Kardiologie überweisen.',
            ),
          ],
          rationale: const L10nStr(
            'CardioCoach-type programmes support adherence and lifestyle change in suitable patients. Uncontrolled hypertension still requires medication review and structured cardiovascular risk management first.',
            'CardioCoach-ähnliche Programme unterstützen Adhärenz und Lifestyle bei geeigneten Patientinnen. Unkontrollierte Hypertonie erfordert zuerst Medikationsreview und strukturiertes kardiovaskuläres Risikomanagement.',
          ),
          teachingPearl: const L10nStr(
            'Position DiGAs as adjunctive to guideline-based hypertension care — useful for your presentation when discussing physician concerns about "apps replacing medicine."',
            'DiGAs als Ergänzung zur leitliniengerechten Hypertonieversorgung positionieren — hilfreich bei Sorge „Apps ersetzen Medizin“.',
          ),
        ),
        _q(
          id: 'cardio-2-prescribe',
          phase: SimulationQuizPhase.prescribe,
          correctIndex: 1,
          language: language,
          title: const L10nStr(
            'CardioCoach — Prescribing and documentation',
            'CardioCoach — Verordnung und Dokumentation',
          ),
          vignette: const L10nStr(
            'You agree Frau Schuster is suitable for a hypertension lifestyle DiGA alongside medication review. She is motivated to track steps, salt reduction, and home BP. Ramipril dose will be uptitrated at next visit if BP remains high.',
            'Sie stimmen zu, dass Frau Schuster für eine Hypertonie-Lifestyle-DiGA neben Medikationsreview geeignet ist. Sie möchte Schritte, Salzreduktion und Heim-BD tracken. Ramipril-Dosis wird bei weiter hohem BD beim nächsten Termin gesteigert.',
          ),
          decisionPoint: const L10nStr(
            'What must be documented when prescribing CardioCoach (demo pathway)?',
            'Was muss bei CardioCoach-Verordnung (Demo-Pfad) dokumentiert werden?',
          ),
          prompt: const L10nStr('CardioCoach prescribing', 'CardioCoach-Verordnung'),
          options: const [
            L10nStr(
              'Only the app download code — clinical notes are optional for DiGAs.',
              'Nur App-Download-Code — klinische Notizen optional.',
            ),
            L10nStr(
              'Document hypertension diagnosis, current BP readings, concurrent medication plan, lifestyle goals, patient consent/data information, and follow-up interval to review BP and app adherence.',
              'Hypertonie-Diagnose, aktuelle BD-Werte, Medikationsplan, Lifestyle-Ziele, Einwilligung/Datenschutz und Follow-up-Intervall für BD und Adhärenz dokumentieren.',
            ),
            L10nStr(
              'Document only BMI — other fields are unnecessary.',
              'Nur BMI dokumentieren — Rest unnötig.',
            ),
            L10nStr(
              'Documentation can wait until 90-day DiGA completion report.',
              'Dokumentation bis 90-Tage-DiGA-Bericht warten.',
            ),
          ],
          rationale: const L10nStr(
            'DiGA prescriptions require the same clinical seriousness as drug prescriptions: indication, plan, safety netting, and follow-up.',
            'DiGA-Verordnungen erfordern dieselbe klinische Sorgfalt wie Medikamente: Indikation, Plan, Safety-Netting und Follow-up.',
          ),
          teachingPearl: const L10nStr(
            'Link DiGA goals to measurable outcomes (home BP trend, weight, steps) so follow-up visits have objective discussion points.',
            'DiGA-Ziele an messbare Outcomes koppeln (Heim-BD-Trend, Gewicht, Schritte) für objektive Verlaufsgespräche.',
          ),
        ),
        _q(
          id: 'cardio-3-followup',
          phase: SimulationQuizPhase.followUp,
          correctIndex: 1,
          language: language,
          title: const L10nStr(
            'CardioCoach — Follow-up at 8 weeks',
            'CardioCoach — Verlauf nach 8 Wochen',
          ),
          vignette: const L10nStr(
            'Frau Schuster returns at 8 weeks. She used the app regularly. Home BP average now 132/82 mmHg. Lost 2 kg. Reports occasional dizziness when standing quickly — started after ramipril dose increase 3 weeks ago. No syncope. She asks if she can stop antihypertensives because the app is working.',
            'Frau Schuster nach 8 Wochen: App regelmäßig genutzt. Heim-BD Ø 132/82 mmHg. 2 kg abgenommen. Gelegentlicher Schwindel beim schnellen Aufstehen — seit Ramipril-Dosissteigerung vor 3 Wochen. Keine Synkope. Fragt, ob sie Antihypertensiva absetzen kann, weil die App wirkt.',
          ),
          decisionPoint: const L10nStr(
            'What is the best clinical response?',
            'Was ist die beste klinische Antwort?',
          ),
          prompt: const L10nStr('CardioCoach follow-up', 'CardioCoach-Verlauf'),
          options: const [
            L10nStr(
              'Stop all antihypertensive drugs immediately — the DiGA solved hypertension.',
              'Alle Antihypertensiva sofort stoppen — DiGA hat Hypertonie gelöst.',
            ),
            L10nStr(
              'Praise lifestyle gains, do not stop medication without a structured plan, assess orthostatic symptoms and medication timing, continue combined lifestyle + pharmacotherapy with documented BP targets.',
              'Lifestyle-Erfolg loben, Medikamente nicht ohne Plan absetzen, orthostatische Symptome und Einnahmezeit prüfen, kombinierte Lifestyle- und Pharmakotherapie mit dokumentierten BD-Zielen fortsetzen.',
            ),
            L10nStr(
              'Stop the DiGA because BP improved — only drugs are needed now.',
              'DiGA stoppen, weil BD besser — jetzt nur noch Medikamente.',
            ),
            L10nStr(
              'Ignore dizziness — it is unrelated to treatment.',
              'Schwindel ignorieren — behandlungsunabhängig.',
            ),
          ],
          rationale: const L10nStr(
            'Improved BP reflects combined intervention. DiGAs rarely replace indicated medication abruptly. Orthostatic symptoms need review after dose changes.',
            'Verbesserter BD spiegelt kombinierte Intervention. DiGAs ersetzen selten abrupt indizierte Medikation. Orthostatische Symptome nach Dosisänderung prüfen.',
          ),
          teachingPearl: const L10nStr(
            'Successful DiGA follow-up reinforces shared success (adherence + lifestyle) while avoiding dangerous binary thinking (app vs pills).',
            'Erfolgreiches DiGA-Follow-up betont gemeinsamen Erfolg (Adhärenz + Lifestyle) ohne gefährliches Entweder-oder (App vs. Tabletten).',
          ),
        ),
      ];

  static List<SimulationQuestion> _genericTrack(AppLanguage language) => [
        _q(
          id: 'gen-diag',
          phase: SimulationQuizPhase.diagnose,
          correctIndex: 0,
          language: language,
          title: const L10nStr('General DiGA case', 'Allgemeiner DiGA-Fall'),
          vignette: const L10nStr(
            'Patient eligible for a DiGA pathway; complete diagnostic and safety assessment first.',
            'Patient für DiGA-Pfad geeignet; zuerst Diagnostik und Sicherheitsbeurteilung abschließen.',
          ),
          decisionPoint: const L10nStr(
            'What is the best first diagnostic focus?',
            'Was ist der beste erste diagnostische Fokus?',
          ),
          prompt: const L10nStr('Diagnostic focus', 'Diagnostischer Fokus'),
          options: const [
            L10nStr('Confirm indication and exclude red flags', 'Indikation bestätigen und Red Flags ausschließen'),
            L10nStr('Start therapy without assessment', 'Therapie ohne Beurteilung starten'),
            L10nStr('Ignore symptom duration', 'Symptomdauer ignorieren'),
            L10nStr('Prescribe based on preference only', 'Nur nach Präferenz verordnen'),
          ],
          rationale: const L10nStr(
            'DiGA eligibility requires correct diagnosis and safety screening.',
            'DiGA-Eignung erfordert korrekte Diagnose und Sicherheits-Screening.',
          ),
        ),
        _q(
          id: 'gen-pres',
          phase: SimulationQuizPhase.prescribe,
          correctIndex: 2,
          language: language,
          title: const L10nStr('General DiGA prescribing', 'Allgemeine DiGA-Verordnung'),
          vignette: const L10nStr(
            'DiGA prescription planned after shared decision-making.',
            'DiGA-Verordnung nach Shared Decision-making geplant.',
          ),
          decisionPoint: const L10nStr(
            'What should be documented during prescribing?',
            'Was soll bei der Verordnung dokumentiert werden?',
          ),
          prompt: const L10nStr('Prescribing documentation', 'Verordnungsdokumentation'),
          options: const [
            L10nStr('Only patient age', 'Nur Patientenalter'),
            L10nStr('Only insurance card number', 'Nur Versichertennummer'),
            L10nStr('Indication, goals, and safety considerations', 'Indikation, Ziele und Sicherheitsaspekte'),
            L10nStr('No documentation needed', 'Keine Dokumentation nötig'),
          ],
          rationale: const L10nStr(
            'Documentation protects patients and supports continuity of care.',
            'Dokumentation schützt Patienten und unterstützt Versorgungskontinuität.',
          ),
        ),
        _q(
          id: 'gen-fu',
          phase: SimulationQuizPhase.followUp,
          correctIndex: 0,
          language: language,
          title: const L10nStr('General DiGA follow-up', 'Allgemeiner DiGA-Verlauf'),
          vignette: const L10nStr(
            'Patient returns after starting the prescribed DiGA.',
            'Patient kehrt nach Start der verordneten DiGA zurück.',
          ),
          decisionPoint: const L10nStr(
            'Which follow-up action strengthens learning quality?',
            'Welche Verlaufsmaßnahme stärkt die Lernqualität?',
          ),
          prompt: const L10nStr('Follow-up', 'Verlauf'),
          options: const [
            L10nStr('Review outcomes and adapt plan if needed', 'Outcomes prüfen und Plan bei Bedarf anpassen'),
            L10nStr('Skip all reassessment', 'Keine Re-Evaluation'),
            L10nStr('Repeat same advice regardless of progress', 'Gleichen Rat unabhängig vom Fortschritt wiederholen'),
            L10nStr('End pathway after first login', 'Pfad nach erstem Login beenden'),
          ],
          rationale: const L10nStr(
            'Structured follow-up improves outcomes and prescribing quality.',
            'Strukturiertes Follow-up verbessert Outcomes und Verordnungsqualität.',
          ),
        ),
      ];
}
