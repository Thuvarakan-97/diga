import 'package:diga/features/ai_support/data/datasources/ai_support_remote_data_source.dart';
import 'package:diga/features/ai_support/domain/models/ai_feedback.dart';
import 'package:diga/features/ai_support/domain/models/ai_patient_case.dart';
import 'package:diga/features/ai_support/domain/models/ai_recommendation.dart';
import 'package:diga/features/ai_support/domain/models/conversation_scenario.dart';

class ApiAiSupportDataSource implements AiSupportRemoteDataSource {
  const ApiAiSupportDataSource();

  @override
  Future<AIFeedback?> fetchFeedback(String moduleId) async => null;

  @override
  Future<List<AIPatientCase>?> fetchPatientCases(String moduleId) async => null;

  @override
  Future<AIRecommendation?> fetchRecommendation({
    required int accuracyPercent,
    required int streakDays,
  }) async =>
      null;

  @override
  Future<ConversationScenario?> fetchConversationScenario(String moduleId) async => null;
}
