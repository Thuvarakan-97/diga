import '../models/ai_feedback.dart';
import '../models/ai_patient_case.dart';
import '../models/ai_recommendation.dart';
import '../models/conversation_scenario.dart';

abstract class AISupportRepository {
  Future<List<AIPatientCase>> fetchPatientCases(String moduleId);
  Future<AIFeedback> fetchFeedback(String moduleId);
  Future<AIRecommendation> fetchRecommendation({
    required int accuracyPercent,
    required int streakDays,
    String? completedModuleId,
  });
  Future<ConversationScenario> fetchConversationScenario(String moduleId);
}

