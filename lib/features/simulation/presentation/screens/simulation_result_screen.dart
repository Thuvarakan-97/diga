import 'package:diga/core/constants/app_routes.dart';
import 'package:diga/core/theme/app_colors.dart';
import 'package:diga/core/theme/app_spacing.dart';
import 'package:diga/features/ai_support/presentation/providers/ai_support_providers.dart';
import 'package:diga/features/ai_support/presentation/widgets/conversation_scenario_card.dart';
import 'package:diga/features/gamification/presentation/providers/gamification_providers.dart';
import 'package:diga/features/gamification/presentation/widgets/badge_card.dart';
import 'package:diga/features/gamification/presentation/widgets/recommendation_card.dart';
import 'package:diga/features/simulation/presentation/providers/simulation_quiz_provider.dart';
import 'package:diga/features/simulation/presentation/widgets/question_answer_review_card.dart';
import 'package:diga/shared/extensions/context_l10n.dart';
import 'package:diga/shared/widgets/diga_surface_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SimulationResultScreen extends ConsumerWidget {
  const SimulationResultScreen({super.key, required this.moduleId});

  final String moduleId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final reward = ref.watch(simulationRewardPreviewProvider(moduleId));
    final quiz = ref.watch(simulationQuizControllerProvider(moduleId));
    final recommendation = ref.watch(aiRecommendationProvider).valueOrNull;
    final scenario = ref.watch(conversationScenarioProvider(moduleId)).valueOrNull;

    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(title: Text(l10n.simulationResultTitle)),
      body: reward.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => const Center(child: Text('Unable to load result summary.')),
        data: (summary) {
          final scorePercent = quiz.scorePercent;
          final accuracyPercent = quiz.accuracyPercent;
          final phaseBreakdown = quiz.phaseBreakdown;

          return ListView(
            padding: const EdgeInsets.all(AppSpacing.md),
            children: [
              DigaSurfaceCard(
                padding: const EdgeInsets.all(AppSpacing.md),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(l10n.moduleLabel(moduleId), style: Theme.of(context).textTheme.titleSmall),
                    const SizedBox(height: AppSpacing.xs),
                    Text(
                      'Score $scorePercent% | Accuracy $accuracyPercent%',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800),
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    Text(summary.encouragement, style: Theme.of(context).textTheme.bodyMedium),
                    const SizedBox(height: AppSpacing.xs),
                    Text(
                      'Marks: ${quiz.correctAnswers}/${quiz.totalQuestions}',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.sm),
              DigaSurfaceCard(
                padding: const EdgeInsets.all(AppSpacing.md),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('XP earned', style: Theme.of(context).textTheme.labelLarge?.copyWith(color: AppColors.accent)),
                    const SizedBox(height: AppSpacing.xs),
                    Text(
                      '+${summary.xpEarned} XP',
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w800),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.sectionGap),
              Text(
                'Answer review',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: AppSpacing.xs),
              Text(
                'Review your choices, correct answers, and clinical explanations for each phase.',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.textMuted, height: 1.4),
              ),
              const SizedBox(height: AppSpacing.md),
              for (final question in quiz.questions) ...[
                QuestionAnswerReviewCard(
                  question: question,
                  selectedIndex: quiz.selectedFor(question.id),
                ),
                const SizedBox(height: AppSpacing.sm),
              ],
              const SizedBox(height: AppSpacing.sm),
              DigaSurfaceCard(
                padding: const EdgeInsets.all(AppSpacing.md),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Score breakdown',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    for (final entry in phaseBreakdown.entries) ...[
                      Text('${entry.key}: ${entry.value}%'),
                      const SizedBox(height: 6),
                    ],
                  ],
                ),
              ),
              if (summary.unlockedBadges.isNotEmpty) ...[
                const SizedBox(height: AppSpacing.sectionGap),
                Text(
                  'Badges unlocked',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: AppSpacing.sm),
                for (final badge in summary.unlockedBadges) ...[
                  BadgeCard(badge: badge),
                  const SizedBox(height: AppSpacing.sm),
                ],
              ],
              if (recommendation != null) ...[
                const SizedBox(height: AppSpacing.sm),
                RecommendationCard(
                  recommendation: recommendation,
                  onTap: () => context.push(AppRoutes.moduleDetail(recommendation.nextModuleId)),
                ),
              ],
              if (scenario != null) ...[
                const SizedBox(height: AppSpacing.sm),
                ConversationScenarioCard(scenario: scenario),
              ],
              const SizedBox(height: AppSpacing.lg),
              FilledButton(
                onPressed: () => context.go(AppRoutes.modules),
                child: Text(l10n.simulationBackToModuleList),
              ),
            ],
          );
        },
      ),
    );
  }
}
