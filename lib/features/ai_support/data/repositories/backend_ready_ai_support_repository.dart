import 'package:diga/features/ai_support/data/datasources/ai_support_remote_data_source.dart';
import 'package:diga/features/ai_support/domain/models/ai_feedback.dart';
import 'package:diga/features/ai_support/domain/models/ai_patient_case.dart';
import 'package:diga/features/ai_support/domain/models/ai_recommendation.dart';
import 'package:diga/features/ai_support/domain/models/conversation_scenario.dart';
import 'package:diga/features/ai_support/domain/repositories/ai_support_repository.dart';

class BackendReadyAiSupportRepository implements AISupportRepository {
  BackendReadyAiSupportRepository({
    required AISupportRepository fallback,
    required AiSupportRemoteDataSource remote,
  })  : _fallback = fallback,
        _remote = remote;

  final AISupportRepository _fallback;
  final AiSupportRemoteDataSource _remote;

  @override
  Future<AIFeedback> fetchFeedback(String moduleId) async {
    final remote = await _remote.fetchFeedback(moduleId);
    return remote ?? _fallback.fetchFeedback(moduleId);
  }

  @override
  Future<List<AIPatientCase>> fetchPatientCases(String moduleId) async {
    final remote = await _remote.fetchPatientCases(moduleId);
    return remote ?? _fallback.fetchPatientCases(moduleId);
  }

  @override
  Future<AIRecommendation> fetchRecommendation({
    required int accuracyPercent,
    required int streakDays,
    String? completedModuleId,
  }) async {
    final remote = await _remote.fetchRecommendation(
      accuracyPercent: accuracyPercent,
      streakDays: streakDays,
      completedModuleId: completedModuleId,
    );
    return remote ??
        _fallback.fetchRecommendation(
          accuracyPercent: accuracyPercent,
          streakDays: streakDays,
          completedModuleId: completedModuleId,
        );
  }

  @override
  Future<ConversationScenario> fetchConversationScenario(String moduleId) async {
    final remote = await _remote.fetchConversationScenario(moduleId);
    return remote ?? _fallback.fetchConversationScenario(moduleId);
  }
}
