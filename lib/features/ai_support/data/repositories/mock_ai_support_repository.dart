import 'package:diga/features/ai_support/domain/models/ai_feedback.dart';
import 'package:diga/features/ai_support/domain/models/ai_patient_case.dart';
import 'package:diga/features/ai_support/domain/models/ai_recommendation.dart';
import 'package:diga/features/ai_support/domain/models/conversation_scenario.dart';
import 'package:diga/features/ai_support/domain/repositories/ai_support_repository.dart';

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
    return const [
      AIPatientCase(
        id: 'case-1',
        moduleId: 'kalmeda',
        age: 47,
        symptoms: ['Persistent tinnitus > 8 months', 'Sleep disturbance', 'Concentration issues'],
        medicalHistory: ['No acute hearing loss', 'Mild anxiety history'],
        labValues: {'TSH': '2.1 mIU/L', 'HbA1c': '5.6%'},
        severity: 'moderate',
        variationNotes: 'AI variation seed focuses on psychosomatic burden and adherence risk.',
      ),
    ];
  }

  @override
  Future<AIRecommendation> fetchRecommendation({required int accuracyPercent, required int streakDays}) async {
    final difficulty = accuracyPercent >= 85 ? 'Standard+' : 'Intro';
    return AIRecommendation(
      nextModuleId: 'vivira',
      title: 'Recommended next module: Vivira (demo)',
      reason: 'Your recent scores show strong diagnosis skills; Vivira will strengthen prescribing consistency in musculoskeletal cases.',
      weakAreas: const ['Follow-up plan specificity', 'Contraindication documentation'],
      suggestedDifficulty: difficulty,
    );
  }

  @override
  Future<ConversationScenario> fetchConversationScenario(String moduleId) async {
    return const ConversationScenario(
      id: 'conv-kalmeda-1',
      moduleId: 'kalmeda',
      title: 'Patient concern clarification',
      patientName: 'Mr. Keller',
      initialPrompt: 'Doctor, I am not sure whether this app can really help my tinnitus. What should I expect?',
      suggestedQuestions: [
        'How much does tinnitus affect your sleep and work?',
        'Have you noticed any sudden worsening recently?',
        'Would a daily digital routine be realistic for you?',
      ],
    );
  }
}

