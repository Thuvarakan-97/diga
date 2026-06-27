import 'package:diga/features/ai_support/domain/models/ai_feedback.dart';
import 'package:diga/features/ai_support/domain/models/ai_patient_case.dart';
import 'package:diga/features/ai_support/domain/models/ai_recommendation.dart';
import 'package:diga/features/ai_support/domain/models/conversation_scenario.dart';
import 'package:diga/features/ai_support/domain/repositories/ai_support_repository.dart';
import 'package:diga/features/diga_modules/presentation/models/clinical_domain_data.dart';

class MockAISupportRepository implements AISupportRepository {
  @override
  Future<AIFeedback> fetchFeedback(String moduleId) async {
    return const AIFeedback(
      shortExplanation: 'You identified key criteria correctly but could tighten contraindication checks.',
      detailedExplanation:
          'Your prescribing pathway is aligned with guideline intent. The main improvement area is documenting exclusion criteria earlier and making follow-up timing explicit.',
      reasoningSteps: [
        'Mapped symptoms to eligible condition profile',
        'Validated indication and basic contraindications',
        'Selected DiGA with expected patient adherence',
      ],
      teachingTips: [
        'State red flags explicitly before prescribing',
        'Document baseline metrics for objective follow-up',
      ],
    );
  }

  @override
  Future<List<AIPatientCase>> fetchPatientCases(String moduleId) async {
    final domain = ClinicalDomainData.domainForModule(moduleId);
    return [
      AIPatientCase(
        id: 'case-1',
        moduleId: moduleId,
        age: 47,
        symptoms: _symptomsForDomain(domain.id),
        medicalHistory: ['No acute red flags on first review', 'Motivated for digital therapy'],
        labValues: const {'TSH': '2.1 mIU/L', 'HbA1c': '5.6%'},
        severity: 'moderate',
        variationNotes: 'AI variation seed for ${domain.name} scenario practice.',
      ),
    ];
  }

  @override
  Future<AIRecommendation> fetchRecommendation({
    required int accuracyPercent,
    required int streakDays,
    String? completedModuleId,
  }) async {
    final currentDomain = ClinicalDomainData.domainForModule(completedModuleId ?? 'mental');
    final nextDomainId = ClinicalDomainData.suggestNextDomain(currentDomain.id);
    final nextDomain = ClinicalDomainData.byId(nextDomainId);
    final difficulty = accuracyPercent >= 85 ? 'Standard+' : 'Intro';

    return AIRecommendation(
      nextDomainId: nextDomainId,
      title: 'Recommended next domain: ${nextDomain.name}',
      reason: ClinicalDomainData.recommendationReason(nextDomainId),
      weakAreas: const ['Follow-up plan specificity', 'Contraindication documentation'],
      suggestedDifficulty: difficulty,
      nextModuleId: nextDomain.scenarios.first.moduleId,
    );
  }

  @override
  Future<ConversationScenario> fetchConversationScenario(String moduleId) async {
    final domain = ClinicalDomainData.domainForModule(moduleId);
    return ConversationScenario(
      id: 'conv-${domain.id}-1',
      moduleId: moduleId,
      title: _conversationTitle(domain.id),
      patientName: _patientName(domain.id),
      initialPrompt: _conversationPrompt(domain.id),
      suggestedQuestions: _suggestedQuestions(domain.id),
    );
  }

  List<String> _symptomsForDomain(String domainId) {
    return switch (domainId) {
      'mental' => ['Low mood for 6 weeks', 'Sleep disruption', 'Reduced concentration'],
      'msk' => ['Chronic low back pain', 'Activity limitation', 'No acute neurological deficit'],
      'uro' => ['Stress incontinence', 'Pelvic floor weakness', 'Adherence concerns'],
      'meta' => ['Elevated HbA1c', 'Weight gain', 'Lifestyle motivation'],
      'neuro' => ['Chronic tinnitus', 'Sleep disturbance', 'Functional burden'],
      'cvs' => ['Uncontrolled hypertension', 'Low activity', 'Medication adherence issues'],
      _ => ['Symptoms under review', 'Patient requests digital support'],
    };
  }

  String _conversationTitle(String domainId) {
    return switch (domainId) {
      'mental' => 'Shared decision on depression DiGA',
      'msk' => 'Exercise expectations for back pain',
      'uro' => 'Pelvic floor programme expectations',
      'meta' => 'Lifestyle app expectations in T2D',
      'neuro' => 'Patient concern clarification',
      'cvs' => 'Blood pressure companion expectations',
      _ => 'Patient concern clarification',
    };
  }

  String _patientName(String domainId) {
    return switch (domainId) {
      'mental' => 'Frau Holz',
      'msk' => 'Herr Berger',
      'uro' => 'Frau Meier',
      'meta' => 'Frau Schuster',
      'neuro' => 'Mr. Keller',
      'cvs' => 'Herr Braun',
      _ => 'Patient',
    };
  }

  String _conversationPrompt(String domainId) {
    return switch (domainId) {
      'mental' =>
        'Doctor, I am unsure which depression app is right for me. Can you explain what I should expect?',
      'msk' =>
        'Will this exercise app really help my back pain, or should I continue physiotherapy only?',
      'uro' =>
        'I am embarrassed about incontinence. Is a digital pelvic-floor programme realistic for me?',
      'meta' =>
        'Can this diabetes app replace medication changes, or is it only for lifestyle support?',
      'neuro' =>
        'Doctor, I am not sure whether this app can really help my tinnitus. What should I expect?',
      'cvs' =>
        'If I use this blood pressure app, can I reduce my tablets soon?',
      _ => 'Doctor, what should I realistically expect from this digital therapy?',
    };
  }

  List<String> _suggestedQuestions(String domainId) {
    return switch (domainId) {
      'mental' => [
        'How much are symptoms affecting sleep and work?',
        'Have you noticed mood elevation or impulsive periods?',
        'Would a structured daily digital routine be realistic?',
      ],
      'msk' => [
        'Any leg weakness, numbness, or bladder symptoms?',
        'What helped or failed in previous physiotherapy?',
        'Can you commit to progressive home exercises?',
      ],
      'uro' => [
        'Is this stress or urge predominant?',
        'What barriers stopped prior pelvic-floor training?',
        'How often can you practise guided exercises?',
      ],
      'meta' => [
        'What are your current glucose and weight goals?',
        'How confident are you with nutrition tracking?',
        'Are medication changes already planned?',
      ],
      'neuro' => [
        'How much does tinnitus affect your sleep and work?',
        'Have you noticed any sudden worsening recently?',
        'Would a daily digital routine be realistic for you?',
      ],
      'cvs' => [
        'What are your home blood pressure readings?',
        'Any dizziness after dose changes?',
        'What lifestyle goals feel achievable this month?',
      ],
      _ => [
        'How are symptoms affecting daily function?',
        'What support do you need to stay adherent?',
      ],
    };
  }
}
