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
import 'package:diga/features/ai_support/domain/models/exam_ai_learning_report.dart';
import 'package:diga/features/ai_support/domain/repositories/ai_support_repository.dart';
import 'package:diga/features/diga_modules/presentation/models/clinical_domain_data.dart';
import 'package:diga/features/gamification/presentation/providers/gamification_providers.dart';
import 'package:diga/features/simulation/presentation/providers/simulation_quiz_provider.dart';
import 'package:diga/l10n/app_localizations.dart';
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
  final live = ref.watch(simulationQuizControllerProvider(completedModuleId));
  final cached = ref.watch(simulationQuizResultCacheProvider(completedModuleId));
  final quiz = (cached != null && cached.answers.isNotEmpty) ? cached : live;
  final accuracy = quiz.answers.isNotEmpty ? quiz.accuracyPercent : profile.accuracyPercent;

  final recommendation = await ref.watch(aiSupportRepositoryProvider).fetchRecommendation(
        accuracyPercent: accuracy,
        streakDays: profile.streak.activeDays,
        completedModuleId: completedModuleId,
      );

  if (quiz.answers.isEmpty) return recommendation;

  final weakFromQuiz = <String>[];
  final phaseTotals = <String, ({int correct, int total})>{};
  for (final q in quiz.questions) {
    final key = q.phase.name;
    final bucket = phaseTotals[key] ?? (correct: 0, total: 0);
    final selected = quiz.answers[q.id];
    final ok = selected != null && q.isCorrect(selected);
    phaseTotals[key] = (
      correct: bucket.correct + (ok ? 1 : 0),
      total: bucket.total + 1,
    );
  }
  for (final entry in phaseTotals.entries) {
    final pct = entry.value.total == 0 ? 100 : ((entry.value.correct / entry.value.total) * 100).round();
    if (pct < 70) {
      weakFromQuiz.add('${entry.key} ($pct%)');
    }
  }

  if (weakFromQuiz.isEmpty) return recommendation;
  return AIRecommendation(
    nextDomainId: recommendation.nextDomainId,
    title: recommendation.title,
    reason: recommendation.reason,
    weakAreas: weakFromQuiz,
    suggestedDifficulty: recommendation.suggestedDifficulty,
    nextModuleId: recommendation.nextModuleId,
  );
});

final conversationScenarioProvider = FutureProvider.family<ConversationScenario, String>((ref, moduleId) {
  return ref.watch(aiSupportRepositoryProvider).fetchConversationScenario(moduleId);
});

/// Modules for which the learner has submitted the AI learning report (in-session).
final submittedAiLearningReportsProvider = StateProvider<Set<String>>((ref) => {});

/// Personalized coaching report from the completed exam attempt.
final examAiLearningReportProvider =
    Provider.family<ExamAiLearningReport?, ({String moduleId, AppLocalizations l10n})>((ref, args) {
  final live = ref.watch(simulationQuizControllerProvider(args.moduleId));
  final cached = ref.watch(simulationQuizResultCacheProvider(args.moduleId));
  final quiz = (cached != null && cached.answers.isNotEmpty) ? cached : live;
  if (quiz.answers.isEmpty || quiz.questions.isEmpty) return null;
  return ExamAiReportBuilder.build(quiz: quiz, l10n: args.l10n);
});

