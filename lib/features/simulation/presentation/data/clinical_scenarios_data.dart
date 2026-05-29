import 'package:diga/features/simulation/domain/models/simulation_question.dart';
import 'package:diga/features/simulation/domain/models/simulation_quiz_phase.dart';

/// DiGA LAB clinical scenario bank (SET 1–3) — replace with CMS/API later.
abstract final class ClinicalScenariosData {
  static List<SimulationQuestion> forModule(String moduleId) {
    switch (moduleId.toLowerCase()) {
      case 'velibra':
        return _depressionTrack;
      case 'insomnia':
        return _insomniaTrack;
      case 'kalmeda':
        return _kalmedaTrack;
      case 'vivira':
        return _viviraTrack;
      case 'cardio':
        return _cardioTrack;
      default:
        return _genericTrack;
    }
  }

  // SET 1 + SET 3 (depression) mapped to Velibra module
  static final _depressionTrack = <SimulationQuestion>[
    SimulationQuestion(
      id: 'dep-1-1-diagnose',
      phase: SimulationQuizPhase.diagnose,
      scenarioTitle: 'Scenario 1.1 — Which Depression DiGA and Why',
      vignette:
          'Dr. Lena Hartmann sees Frau Sandra Holz, 34, secondary school teacher: 6 weeks low mood, anhedonia, poor sleep, poor concentration. PHQ-9: 13 (moderate). No prior psychiatric history. No suicidal ideation. No medication. Confident smartphone user. Declines antidepressants; aware of 4–6 month CBT wait; asks which app is best. GKV eligible (TK). Choice between five approved depression DiGAs.',
      decisionPoint:
          'Which of the following most accurately reflects the clinical differences between depression DiGAs that should guide your choice for Frau Holz?',
      prompt: 'Choosing between depression DiGAs',
      options: [
        'All five depression DiGAs are equally suitable — let the patient choose by interface only.',
        'Deprexis and Selfapy have the strongest RCT evidence; for this motivated, CBT-familiar patient with moderate depression, either is appropriate; choice can include patient preference after brief programme description.',
        'Only Selfapy is appropriate because she has moderate (not mild) depression.',
        'Prescribing any one without psychiatrist advice is a clinical risk — psychiatry must choose the app.',
      ],
      correctIndex: 1,
      rationale:
          'Patient preference matters, but evidence differentiates options. Deprexis has strong trial support for permanent listing; Selfapy suits CBT-familiar patients. Severity does not restrict to one app (option C is wrong). GPs may choose between DiGAs without mandatory psychiatry (option D is wrong).',
      teachingPearl:
          'Deprexis showed ~32% reduction in health insurance costs vs ~13% in passive control in routine care — useful for insurer discussions. Acknowledge evidence limitations (risk of bias) when speaking with sceptical colleagues.',
    ),
    SimulationQuestion(
      id: 'dep-1-2-prescribe',
      phase: SimulationQuizPhase.prescribe,
      scenarioTitle: 'Scenario 1.2 — The Absolute Contraindication',
      vignette:
          'Herr Daniel Kraft, 29, requests a depression DiGA. PHQ-9: 17. Low mood, hopelessness, poor sleep, work impairment for 3 months. Reports mood "goes up and down" — week-long periods of high energy, little sleep but feeling great, excessive spending, multiple projects. Last episode 6 weeks ago, 8 days. Never psychiatrically assessed. No medication. GKV (AOK).',
      decisionPoint: 'What is the correct clinical response to his request for a depression DiGA?',
      prompt: 'Depression DiGA safety screen',
      options: [
        'Prescribe Selfapy or Deprexis — PHQ-9 confirms depression; mood variation is normal in depression.',
        'Do not prescribe any depression DiGA now. Episodic elevated mood, reduced sleep need, increased energy, and impulsive spending suggest bipolar spectrum disorder; CBT depression DiGA without psychiatric assessment is inappropriate and potentially harmful.',
        'Prescribe a DiGA but tell him to stop if mood elevates — apps monitor instability.',
        'Prescribe Novego because it is approved for comorbid mood instability with depression.',
      ],
      correctIndex: 1,
      rationale:
          'Hypomanic features (8 days elevated mood, decreased sleep need, impulsivity) raise bipolar spectrum concern. Bipolar disorders are exclusions for depression DiGAs; CBT-focused depression tools can risk manic switch without mood stabilisation. Refer for mood disorder assessment first.',
      teachingPearl:
          'The directory lists approved diagnoses, but safety depends on diagnostic accuracy. A depression DiGA in undiagnosed bipolar disorder is a diagnostic error, not merely a prescribing error.',
    ),
    SimulationQuestion(
      id: 'dep-3-1-followup',
      phase: SimulationQuizPhase.followUp,
      scenarioTitle: 'Scenario 3.1 — Appears Perfect, But Is Not',
      vignette:
          'Herr Friedrich Becker, 55, retired: 7 months low mood, poor sleep, early waking, 4 kg weight loss, anhedonia, reduced concentration. PHQ-9: 21 (severe). Wife reports he barely left the house for 6 weeks. Denies active suicidal ideation but says "I wouldn\'t mind not waking up." GKV (TK). Smartphone available. Wife researched Deprexis and asks you to prescribe it.',
      decisionPoint: 'His wife asks you to prescribe Deprexis. What is the correct clinical response?',
      prompt: 'Severe depression and DiGA eligibility',
      options: [
        'Prescribe Deprexis — approved for depression; self-directed activity may help severe depression.',
        'Do not prescribe a DiGA. PHQ-9 21 with passive suicidal ideation and major functional impairment needs urgent psychiatric assessment and likely pharmacotherapy/crisis support — not a self-directed digital tool as primary care.',
        'Prescribe Deprexis plus urgent psychiatry referral to keep him engaged while waiting.',
        'Prescribe Elona because it is indicated for severe depression while Deprexis is only mild-to-moderate.',
      ],
      correctIndex: 1,
      rationale:
          'Severe depression with passive suicidal ideation and functional collapse is not appropriate for primary DiGA intervention. Suicidality is an exclusion across depression DiGAs. Urgent psychiatric referral and safety assessment today are required.',
      teachingPearl:
          'DiGAs supplement care; they do not substitute for it. Prescription-eligible ICD code is necessary but not sufficient — severity and safety take precedence.',
    ),
  ];

  static final _insomniaTrack = <SimulationQuestion>[
    SimulationQuestion(
      id: 'ins-2-1-diagnose',
      phase: SimulationQuizPhase.diagnose,
      scenarioTitle: 'Scenario 2.1 — Somnio vs HelloBetter Schlafen',
      vignette:
          'Frau Gabriele Fuchs, 46, nurse on rotating shifts: 9 months difficulty maintaining sleep, 3–4 nightly awakenings, unrefreshing sleep. ISI: 16. No hypnotics. PHQ-9: 5. No prior CBT experience; prefers "flexible, manageable steps" over rigid daily programmes. GKV (Barmer). Failed sleep hygiene twice — wants more than advice.',
      decisionPoint:
          'Two DiGAs are approved for non-organic insomnia: Somnio and HelloBetter Schlafen (both CBT-I). Which consideration is most clinically relevant?',
      prompt: 'Choosing between insomnia DiGAs',
      options: [
        'Prescribe Somnio because of higher app store ratings alone.',
        'Prescribe HelloBetter Schlafen because therapist messaging suits healthcare professionals.',
        'Both are clinically appropriate; discuss structure and engagement fit — flexible self-paced vs guided support — given her preference for manageable steps.',
        'Neither DiGA is appropriate — shift work requires sleep medicine referral only.',
      ],
      correctIndex: 2,
      rationale:
          'Both are permanently listed for F51.0 and deliver CBT-I. No head-to-head trial. Ratings and profession-based assumptions are insufficient; engagement fit and programme structure should drive shared decision-making. Shift work complicates but does not automatically exclude CBT-I here.',
      teachingPearl:
          'HelloBetter Schlafen includes asynchronous therapist messaging — a decisive factor for patients who struggled with purely self-directed programmes.',
    ),
    SimulationQuestion(
      id: 'ins-2-1-prescribe',
      phase: SimulationQuizPhase.prescribe,
      scenarioTitle: 'Scenario 2.1 — Somnio vs HelloBetter Schlafen (Prescribing)',
      vignette:
          'You and Frau Fuchs agree on a CBT-I DiGA after shared decision-making. She reiterates she disengaged from rigid programmes before and wants realistic step sizes while working night shifts.',
      decisionPoint: 'Before activating the prescription, what is the most important documentation step?',
      prompt: 'Insomnia DiGA prescribing documentation',
      options: [
        'Document only the app name — DiGA prescriptions need no clinical indication in the chart.',
        'Document insomnia diagnosis (F51.0), prior non-pharmacological attempts, patient goals, chosen programme rationale, and planned follow-up to review adherence and ISI.',
        'Document only Barmer insurance number for billing.',
        'Defer documentation until after 90 days of app use.',
      ],
      correctIndex: 1,
      rationale:
          'DiGA prescribing requires clear indication, prior care context, patient-centred rationale, and follow-up planning — especially when engagement risk is high.',
      teachingPearl:
          'Engagement predictors (flexibility preference, prior failed sleep hygiene) belong in the chart — they justify programme choice and follow-up intensity.',
    ),
    SimulationQuestion(
      id: 'ins-2-1-followup',
      phase: SimulationQuizPhase.followUp,
      scenarioTitle: 'Scenario 2.1 — Follow-up',
      vignette:
          'Frau Fuchs returns at 6 weeks. She used the prescribed insomnia DiGA regularly. ISI improved from 16 to 11. She still has occasional shift-related sleep disruption but reports better daytime function.',
      decisionPoint: 'What is the best follow-up action?',
      prompt: 'Insomnia DiGA follow-up',
      options: [
        'Stop all sleep assessment — ISI < 12 means treatment is finished forever.',
        'Review adherence data if available, reinforce CBT-I skills, adjust expectations for shift work, and plan continued monitoring until sustained response.',
        'Switch immediately to zopiclone because digital treatment cannot help shift workers.',
        'Discharge without documentation because improvement is adequate.',
      ],
      correctIndex: 1,
      rationale:
          'Meaningful improvement warrants continued structured follow-up, reinforcement, and documentation — not abrupt cessation or automatic pharmacotherapy.',
    ),
  ];

  static final _kalmedaTrack = <SimulationQuestion>[
    SimulationQuestion(
      id: 'kal-1-diagnose',
      phase: SimulationQuizPhase.diagnose,
      scenarioTitle: 'Kalmeda — Sudden hearing loss is not a DiGA moment',
      vignette:
          'Herr Martin Lehmann, 52, accountant, presents today with 48 hours of sudden unilateral hearing loss and loud tinnitus on the right. He feels blocked and anxious. He read online about Kalmeda and asks you to prescribe it immediately. No vertigo. No facial weakness. No head trauma. Otherwise healthy. GKV (TK). Uses a smartphone confidently. Tinnitus duration: 2 days.',
      decisionPoint: 'What is the correct clinical response before any tinnitus DiGA is considered?',
      prompt: 'Kalmeda safety — acute presentation',
      options: [
        'Prescribe Kalmeda today — tinnitus is the indication and early app use may prevent chronicity.',
        'Do not prescribe Kalmeda now. Sudden unilateral hearing loss is an ENT/urgent red flag requiring prompt in-person assessment (e.g. sudden sensorineural hearing loss pathway) before chronic tinnitus DiGA care.',
        'Prescribe Kalmeda and arrange ENT review in 4–6 weeks if symptoms persist.',
        'Prescribe Kalmeda only if audiometry is normal — hearing loss excludes apps entirely forever.',
      ],
      correctIndex: 1,
      rationale:
          'Kalmeda is for chronic subjective tinnitus with functional burden after appropriate assessment — not for acute sudden hearing loss. SSHL requires urgent evaluation (steroids/time-sensitive care). Delaying assessment to start a DiGA is unsafe.',
      teachingPearl:
          'Patient requests for a named DiGA do not replace red-flag triage. The most common prescribing error here is treating the label "tinnitus" without the timeline and red-flag context.',
    ),
    SimulationQuestion(
      id: 'kal-2-prescribe',
      phase: SimulationQuizPhase.prescribe,
      scenarioTitle: 'Kalmeda — Appropriate chronic tinnitus candidate',
      vignette:
          'Frau Petra Weiss, 44, returns after ENT assessment 3 months ago excluded acute pathology. She has had bilateral subjective tinnitus for 14 months with sleep disturbance and difficulty concentrating at work (documented functional impairment). Stable mood. PHQ-9: 4. Motivated for structured digital therapy. GKV (Barmer). Smartphone capable. She asks for Kalmeda specifically after her ENT letter supported conservative management.',
      decisionPoint: 'Which prescribing approach is most appropriate for Frau Weiss?',
      prompt: 'Kalmeda eligibility and prescribing',
      options: [
        'Issue Kalmeda without documentation — the ENT letter is sufficient external proof.',
        'Confirm chronic indication (e.g. H93.1 context), document functional impairment, rule out exclusions, explain Kalmeda as structured education/exercises (not emergency care), set therapy goals, and schedule follow-up to review adherence and outcomes.',
        'Prescribe Kalmeda only if tinnitus is unilateral — bilateral tinnitus is an exclusion.',
        'Defer Kalmeda until she has failed every possible medication trial.',
      ],
      correctIndex: 1,
      rationale:
          'She fits a chronic tinnitus pathway: duration, functional burden, ENT red flags addressed, engagement, and GKV eligibility. DiGA prescribing still requires full documentation, patient information, and follow-up — companion criteria mirror this.',
      teachingPearl:
          'Kalmeda patient guidance should explicitly cover when to stop app use and seek urgent care (sudden hearing change, neurological symptoms). This reduces medicolegal risk and aligns with companion contraindication teaching.',
    ),
    SimulationQuestion(
      id: 'kal-3-followup',
      phase: SimulationQuizPhase.followUp,
      scenarioTitle: 'Kalmeda — Worsening distress at follow-up',
      vignette:
          'Frau Weiss returns at 6 weeks. She used Kalmeda most days but reports increased tinnitus-related anxiety, avoidance of social situations, and new difficulty sleeping despite app use. She denies suicidal ideation but says she feels "hopeless about ever getting better." PHQ-9 today: 12 (moderate, increased from 4). Tinnitus loudness unchanged on VAS.',
      decisionPoint: 'What is the best next clinical step?',
      prompt: 'Kalmeda follow-up — when to escalate',
      options: [
        'Continue Kalmeda unchanged — six weeks is too early to judge outcome.',
        'Reassess mental health comorbidity, consider psychology/psychiatry referral, review whether Kalmeda remains appropriate, and document a stepped-care plan — DiGA alone may be insufficient if mood disorder is emerging.',
        'Stop Kalmeda and tell her nothing else can help.',
        'Switch to a different tinnitus DiGA without further assessment because engagement was good.',
      ],
      correctIndex: 1,
      rationale:
          'Rising PHQ-9 and functional avoidance signal need to broaden care beyond the DiGA. Continue or stop Kalmeda only after reassessment; psychiatric comorbidity and suicidality risk must be evaluated per exclusion/caution criteria.',
      teachingPearl:
          'DiGA follow-up is not only adherence monitoring — it is a safety review. Worsening mood with unchanged somatic symptoms is a common reason to escalate beyond digital therapy.',
    ),
  ];

  static final _viviraTrack = <SimulationQuestion>[
    SimulationQuestion(
      id: 'viv-1-diagnose',
      phase: SimulationQuizPhase.diagnose,
      scenarioTitle: 'Vivira — Red flags before back-pain DiGA',
      vignette:
          'Frau Sonja Richter, 38, office worker, presents with 4 months of lower back pain radiating to the left leg. Pain worse with coughing. New difficulty lifting her foot when walking (foot drop sensation). Saddle anaesthesia when she sits. Bladder urgency started yesterday. Otherwise previously well. She asks for Vivira because a colleague used it. GKV (AOK).',
      decisionPoint: 'What is the correct response to her request for Vivira?',
      prompt: 'Vivira — neurological red flags',
      options: [
        'Prescribe Vivira — chronic low back pain is the indication and exercise therapy will help sciatica.',
        'Do not prescribe Vivira. New leg weakness, saddle anaesthesia, and bladder symptoms require urgent exclusion of cauda equina / significant nerve compression — emergency or same-day specialist assessment, not a home exercise DiGA.',
        'Prescribe Vivira and advise her to stop if leg pain increases.',
        'Prescribe Vivira only for the back component and ignore leg symptoms.',
      ],
      correctIndex: 1,
      rationale:
          'Vivira is for chronic non-specific low back pain after appropriate diagnostics. Cauda equina red flags are absolute priorities — digital exercise programmes must not delay urgent evaluation.',
      teachingPearl:
          'Always document red-flag assessment before any back-pain DiGA prescription. Companion Vivira contraindications explicitly include cauda equina suspicion.',
    ),
    SimulationQuestion(
      id: 'viv-2-prescribe',
      phase: SimulationQuizPhase.prescribe,
      scenarioTitle: 'Vivira — Appropriate chronic LBP candidate',
      vignette:
          'Herr Thomas Berger, 51, gardener, has had chronic non-specific low back pain for 9 months after a lifting injury. No red flags on examination today. Prior physiotherapy helped partially; he wants structured home exercises. Independent with smartphone. BMI 27. PHQ-9: 3. Pain interferes with work 2–3 days per week. GKV (TK). Imaging showed mild degenerative change only; no surgical indication.',
      decisionPoint: 'Which statement best supports prescribing Vivira for Herr Berger?',
      prompt: 'Vivira indication and shared decision',
      options: [
        'Vivira replaces all need for movement advice — no follow-up required.',
        'He fits a chronic non-specific LBP pathway after red-flag exclusion; Vivira can support progressive exercise therapy at home with documented goals, expectations (including temporary soreness), and scheduled review of function and adherence.',
        'Vivira is only for patients under 40 — age excludes him.',
        'Vivira should be prescribed only after opioid trial failure.',
      ],
      correctIndex: 1,
      rationale:
          'Duration, non-specific LBP, prior conservative care, functional impact, and capacity for home exercise align with Vivira-style pathways. Documentation and follow-up remain mandatory.',
      teachingPearl:
          'Set expectations: exercise-based DiGAs may cause temporary soreness with loading — patients need clear stop rules (neurological symptoms, severe worsening) matching companion patient guidance.',
    ),
    SimulationQuestion(
      id: 'viv-3-followup',
      phase: SimulationQuizPhase.followUp,
      scenarioTitle: 'Vivira — Soreness vs deterioration',
      vignette:
          'Herr Berger returns at 4 weeks. He completed ~70% of prescribed sessions. He reports increased muscle soreness in the back after new exercises but no leg symptoms, no numbness, and improved walking tolerance. Pain score down from 6/10 to 4/10. He asks if he should stop the app because of soreness.',
      decisionPoint: 'What is the best advice?',
      prompt: 'Vivira follow-up',
      options: [
        'Stop Vivira immediately — any increase in pain means the programme is harmful.',
        'Reassure within expected loading response if no red flags: adjust intensity, reinforce pacing, continue monitoring; stop and reassess urgently if neurological or cauda equina symptoms appear.',
        'Ignore soreness and double exercise volume to speed recovery.',
        'Switch to complete bed rest for 2 weeks.',
      ],
      correctIndex: 1,
      rationale:
          'Expected post-exercise soreness with functional improvement and no red flags supports continued graded activity. Distinguish this from dangerous deterioration.',
      teachingPearl:
          'Follow-up should capture adherence %, functional outcomes, and safety netting — the same data insurers and quality circles increasingly expect from DiGA pathways.',
    ),
  ];

  static final _cardioTrack = <SimulationQuestion>[
    SimulationQuestion(
      id: 'cardio-1-diagnose',
      phase: SimulationQuizPhase.diagnose,
      scenarioTitle: 'CardioCoach — Who is the right patient?',
      vignette:
          'Frau Helga Schuster, 58, has known hypertension for 5 years on ramipril 5 mg. Home BP log (2 weeks): average 142/88 mmHg. Asymptomatic. BMI 31. Sedentary job. Wants a "blood pressure app" her insurer mentioned (CardioCoach-style lifestyle DiGA). No chest pain. No dyspnoea. eGFR normal last year. No diabetes yet. GKV (DAK).',
      decisionPoint: 'Before recommending a hypertension lifestyle DiGA, what is the essential first step?',
      prompt: 'CardioCoach — clinical assessment',
      options: [
        'Prescribe the DiGA immediately — lifestyle apps always lower BP without other changes.',
        'Confirm current BP control targets, medication adherence, secondary causes if indicated, and whether digital lifestyle support is an appropriate adjunct — not a substitute for antihypertensive optimisation where BP remains above target.',
        'Only prescribe if BP is already normal — elevated BP excludes DiGA use.',
        'Refer to cardiology before any lifestyle intervention in all hypertensive patients.',
      ],
      correctIndex: 1,
      rationale:
          'CardioCoach-type programmes support adherence and lifestyle change in suitable patients. Uncontrolled hypertension still requires medication review and structured cardiovascular risk management first.',
      teachingPearl:
          'Position DiGAs as adjunctive to guideline-based hypertension care — useful for your presentation when discussing physician concerns about "apps replacing medicine."',
    ),
    SimulationQuestion(
      id: 'cardio-2-prescribe',
      phase: SimulationQuizPhase.prescribe,
      scenarioTitle: 'CardioCoach — Prescribing and documentation',
      vignette:
          'You agree Frau Schuster is suitable for a hypertension lifestyle DiGA alongside medication review. She is motivated to track steps, salt reduction, and home BP. Ramipril dose will be uptitrated at next visit if BP remains high.',
      decisionPoint: 'What must be documented when prescribing CardioCoach (demo pathway)?',
      prompt: 'CardioCoach prescribing',
      options: [
        'Only the app download code — clinical notes are optional for DiGAs.',
        'Document hypertension diagnosis, current BP readings, concurrent medication plan, lifestyle goals, patient consent/data information, and follow-up interval to review BP and app adherence.',
        'Document only BMI — other fields are unnecessary.',
        'Documentation can wait until 90-day DiGA completion report.',
      ],
      correctIndex: 1,
      rationale:
          'DiGA prescriptions require the same clinical seriousness as drug prescriptions: indication, plan, safety netting, and follow-up.',
      teachingPearl:
          'Link DiGA goals to measurable outcomes (home BP trend, weight, steps) so follow-up visits have objective discussion points.',
    ),
    SimulationQuestion(
      id: 'cardio-3-followup',
      phase: SimulationQuizPhase.followUp,
      scenarioTitle: 'CardioCoach — Follow-up at 8 weeks',
      vignette:
          'Frau Schuster returns at 8 weeks. She used the app regularly. Home BP average now 132/82 mmHg. Lost 2 kg. Reports occasional dizziness when standing quickly — started after ramipril dose increase 3 weeks ago. No syncope. She asks if she can stop antihypertensives because the app is working.',
      decisionPoint: 'What is the best clinical response?',
      prompt: 'CardioCoach follow-up',
      options: [
        'Stop all antihypertensive drugs immediately — the DiGA solved hypertension.',
        'Praise lifestyle gains, do not stop medication without a structured plan, assess orthostatic symptoms and medication timing, continue combined lifestyle + pharmacotherapy with documented BP targets.',
        'Stop the DiGA because BP improved — only drugs are needed now.',
        'Ignore dizziness — it is unrelated to treatment.',
      ],
      correctIndex: 1,
      rationale:
          'Improved BP reflects combined intervention. DiGAs rarely replace indicated medication abruptly. Orthostatic symptoms need review after dose changes.',
      teachingPearl:
          'Successful DiGA follow-up reinforces shared success (adherence + lifestyle) while avoiding dangerous binary thinking (app vs pills).',
    ),
  ];

  static final _genericTrack = <SimulationQuestion>[
    SimulationQuestion(
      id: 'gen-diag',
      phase: SimulationQuizPhase.diagnose,
      scenarioTitle: 'General DiGA case',
      vignette: 'Patient eligible for a DiGA pathway; complete diagnostic and safety assessment first.',
      decisionPoint: 'What is the best first diagnostic focus?',
      prompt: 'Diagnostic focus',
      options: [
        'Confirm indication and exclude red flags',
        'Start therapy without assessment',
        'Ignore symptom duration',
        'Prescribe based on preference only',
      ],
      correctIndex: 0,
      rationale: 'DiGA eligibility requires correct diagnosis and safety screening.',
    ),
    SimulationQuestion(
      id: 'gen-pres',
      phase: SimulationQuizPhase.prescribe,
      scenarioTitle: 'General DiGA prescribing',
      vignette: 'DiGA prescription planned after shared decision-making.',
      decisionPoint: 'What should be documented during prescribing?',
      prompt: 'Prescribing documentation',
      options: [
        'Only patient age',
        'Only insurance card number',
        'Indication, goals, and safety considerations',
        'No documentation needed',
      ],
      correctIndex: 2,
      rationale: 'Documentation protects patients and supports continuity of care.',
    ),
    SimulationQuestion(
      id: 'gen-fu',
      phase: SimulationQuizPhase.followUp,
      scenarioTitle: 'General DiGA follow-up',
      vignette: 'Patient returns after starting the prescribed DiGA.',
      decisionPoint: 'Which follow-up action strengthens learning quality?',
      prompt: 'Follow-up',
      options: [
        'Review outcomes and adapt plan if needed',
        'Skip all reassessment',
        'Repeat same advice regardless of progress',
        'End pathway after first login',
      ],
      correctIndex: 0,
      rationale: 'Structured follow-up improves outcomes and prescribing quality.',
    ),
  ];
}
