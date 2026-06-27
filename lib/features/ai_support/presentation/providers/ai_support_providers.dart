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
import 'package:diga/features/diga_modules/presentation/models/clinical_domain_data.dart';
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

final aiRecommendationProvider = FutureProvider.family<AIRecommendation, String>((ref, completedModuleId) async {
  if (!ref.watch(aiSupportEnabledProvider)) {
    final nextDomain = ClinicalDomainData.byId(
      ClinicalDomainData.suggestNextDomain(ClinicalDomainData.mapModuleToDomain(completedModuleId)),
    );
    return AIRecommendation(
      nextDomainId: nextDomain.id,
      title: 'Recommended next domain: ${nextDomain.name}',
      reason: 'AI recommendations are currently disabled in this environment.',
      weakAreas: const ['Feature disabled'],
      suggestedDifficulty: 'Standard',
    );
  }
  final profile = await ref.watch(gamificationProfileProvider.future);
  return ref.watch(aiSupportRepositoryProvider).fetchRecommendation(
        accuracyPercent: profile.accuracyPercent,
        streakDays: profile.streak.activeDays,
        completedModuleId: completedModuleId,
      );
});

final conversationScenarioProvider = FutureProvider.family<ConversationScenario, String>((ref, moduleId) {
  return ref.watch(aiSupportRepositoryProvider).fetchConversationScenario(moduleId);
});

