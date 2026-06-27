import 'package:diga/features/ai_support/domain/models/ai_feedback.dart';
import 'package:diga/features/ai_support/domain/models/ai_patient_case.dart';
import 'package:diga/features/ai_support/domain/models/ai_recommendation.dart';
import 'package:diga/features/ai_support/domain/models/conversation_scenario.dart';

abstract class AiSupportRemoteDataSource {
  Future<List<AIPatientCase>?> fetchPatientCases(String moduleId);
  Future<AIFeedback?> fetchFeedback(String moduleId);
  Future<AIRecommendation?> fetchRecommendation({
    required int accuracyPercent,
    required int streakDays,
    String? completedModuleId,
  });
  Future<ConversationScenario?> fetchConversationScenario(String moduleId);
}
