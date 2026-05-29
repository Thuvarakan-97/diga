import 'package:diga/core/config/app_environment.dart';
import 'package:diga/core/config/feature_flag_providers.dart';
import 'package:diga/features/ai_support/data/datasources/ai_support_remote_data_source.dart';
import 'package:diga/features/ai_support/data/datasources/api_ai_support_data_source.dart';
import 'package:diga/features/ai_support/data/repositories/backend_ready_ai_support_repository.dart';
import 'package:diga/features/ai_support/data/repositories/mock_ai_support_repository.dart';
import 'package:diga/features/ai_support/domain/models/ai_feedback.dart';
import 'package:diga/features/ai_support/domain/models/ai_patient_case.dart';
import 'package:diga/features/ai_support/domain/models/ai_recommendation.dart';
import 'package:diga/features/ai_support/domain/models/conversation_scenario.dart';
import 'package:diga/features/ai_support/domain/repositories/ai_support_repository.dart';
import 'package:diga/features/gamification/presentation/providers/gamification_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final aiSupportRemoteDataSourceProvider = Provider<AiSupportRemoteDataSource>((ref) {
  final env = ref.watch(appEnvironmentProvider);
  if (env == AppEnvironment.staging || env == AppEnvironment.prod) {
    return const ApiAiSupportDataSource();
  }
  return const ApiAiSupportDataSource();
});

final aiSupportRepositoryProvider = Provider<AISupportRepository>((ref) {
  final fallback = MockAISupportRepository();
  if (!ref.watch(aiSupportEnabledProvider)) return fallback;
  return BackendReadyAiSupportRepository(
    fallback: fallback,
    remote: ref.watch(aiSupportRemoteDataSourceProvider),
  );
});

final aiPatientCasesProvider = FutureProvider.family<List<AIPatientCase>, String>((ref, moduleId) {
  return ref.watch(aiSupportRepositoryProvider).fetchPatientCases(moduleId);
});

final aiFeedbackProvider = FutureProvider.family<AIFeedback, String>((ref, moduleId) {
  return ref.watch(aiSupportRepositoryProvider).fetchFeedback(moduleId);
});

final aiRecommendationProvider = FutureProvider<AIRecommendation>((ref) async {
  if (!ref.watch(aiSupportEnabledProvider)) {
    return const AIRecommendation(
      nextModuleId: 'kalmeda',
      title: 'AI recommendations are currently disabled',
      reason: 'This environment has AI support turned off via feature flag.',
      weakAreas: ['Feature disabled'],
      suggestedDifficulty: 'Standard',
    );
  }
  final profile = await ref.watch(gamificationProfileProvider.future);
  return ref.watch(aiSupportRepositoryProvider).fetchRecommendation(
        accuracyPercent: profile.accuracyPercent,
        streakDays: profile.streak.activeDays,
      );
});

final conversationScenarioProvider = FutureProvider.family<ConversationScenario, String>((ref, moduleId) {
  return ref.watch(aiSupportRepositoryProvider).fetchConversationScenario(moduleId);
});

