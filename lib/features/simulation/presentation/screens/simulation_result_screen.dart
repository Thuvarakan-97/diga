import 'package:diga/core/constants/app_routes.dart';
import 'package:diga/core/theme/app_colors.dart';
import 'package:diga/core/theme/app_radii.dart';
import 'package:diga/core/theme/app_spacing.dart';
import 'package:diga/features/ai_support/presentation/providers/ai_support_providers.dart';
import 'package:diga/features/ai_support/presentation/widgets/conversation_scenario_card.dart';
import 'package:diga/features/ai_support/presentation/widgets/exam_ai_learning_report_card.dart';
import 'package:diga/features/diga_modules/presentation/models/clinical_domain_data.dart';
import 'package:diga/features/diga_modules/presentation/providers/scenario_progress_provider.dart';
import 'package:diga/features/gamification/presentation/providers/gamification_providers.dart';
import 'package:diga/features/gamification/presentation/widgets/badge_card.dart';
import 'package:diga/features/gamification/presentation/widgets/recommendation_card.dart';
import 'package:diga/features/simulation/presentation/providers/simulation_quiz_provider.dart';
import 'package:diga/features/simulation/presentation/widgets/exam_pass_celebration.dart';
import 'package:diga/features/simulation/presentation/widgets/question_answer_review_card.dart';
import 'package:diga/l10n/app_localizations.dart';
import 'package:diga/shared/extensions/context_l10n.dart';
import 'package:diga/shared/widgets/diga_surface_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SimulationResultScreen extends ConsumerStatefulWidget {
  const SimulationResultScreen({super.key, required this.moduleId});

  final String moduleId;

  @override
  ConsumerState<SimulationResultScreen> createState() => _SimulationResultScreenState();
}

class _SimulationResultScreenState extends ConsumerState<SimulationResultScreen> {
  bool _showCelebration = true;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final reward = ref.watch(simulationRewardPreviewProvider(widget.moduleId));
    final liveQuiz = ref.watch(simulationQuizControllerProvider(widget.moduleId));
    final cachedQuiz = ref.watch(simulationQuizResultCacheProvider(widget.moduleId));
    final quiz = (cachedQuiz != null && cachedQuiz.answers.isNotEmpty) ? cachedQuiz : liveQuiz;
    final recommendation = ref.watch(aiRecommendationProvider(widget.moduleId)).valueOrNull;
    final scenario = ref.watch(conversationScenarioProvider(widget.moduleId)).valueOrNull;
    final aiReport = ref.watch(examAiLearningReportProvider((moduleId: widget.moduleId, l10n: l10n)));
    final reportSubmitted = ref.watch(submittedAiLearningReportsProvider).contains(widget.moduleId);
    final completedDomain = ClinicalDomainData.domainForModule(widget.moduleId);
    ref.watch(scenarioProgressProvider);
    final progress = ref.read(scenarioProgressProvider.notifier);
    final nextScenarioInDomain = progress.nextPlayableInDomain(completedDomain);
    final passed = quiz.scorePercent >= examPassScoreThreshold;

    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(title: Text(l10n.simulationResultTitle)),
      body: reward.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text(l10n.simulationUnableToLoadResult)),
        data: (summary) {
          final scorePercent = quiz.scorePercent;
          final accuracyPercent = quiz.accuracyPercent;
          final phaseBreakdown = quiz.phaseBreakdownFor(l10n);
          final nextDomain = ClinicalDomainData.byId(summary.nextDomainId);

          return Stack(
            children: [
              ListView(
                padding: const EdgeInsets.all(AppSpacing.md),
                children: [
                  _CompletedDomainCard(
                    domain: completedDomain,
                    scorePercent: scorePercent,
                    accuracyPercent: accuracyPercent,
                    marks: '${quiz.correctAnswers}/${quiz.totalQuestions}',
                    encouragement: summary.encouragement,
                    l10n: l10n,
                    passed: passed,
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  DigaSurfaceCard(
                    padding: const EdgeInsets.all(AppSpacing.md),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          l10n.simulationXpEarned,
                          style: Theme.of(context).textTheme.labelLarge?.copyWith(color: AppColors.accent),
                        ),
                        const SizedBox(height: AppSpacing.xs),
                        Text(
                          l10n.simulationXpEarnedValue(summary.xpEarned),
                          style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w800),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: AppSpacing.md),
                  if (aiReport != null) ...[
                    ExamAiLearningReportCard(
                      report: aiReport,
                      submitted: reportSubmitted,
                      onSubmit: () {
                        final current = ref.read(submittedAiLearningReportsProvider);
                        ref.read(submittedAiLearningReportsProvider.notifier).state = {
                          ...current,
                          widget.moduleId,
                        };
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(l10n.aiReportSubmitted)),
                        );
                      },
                    ),
                    const SizedBox(height: AppSpacing.md),
                  ],
                  if (nextScenarioInDomain != null)
                    _DomainNextStepCard(
                      domain: completedDomain,
                      scenarioTitle: nextScenarioInDomain.title,
                      heading: l10n.simulationContinueNextScenario,
                      onTap: () => context.pushReplacement(
                        AppRoutes.simulationDiagnose(
                          nextScenarioInDomain.moduleId,
                          scenarioId: nextScenarioInDomain.id,
                        ),
                      ),
                      l10n: l10n,
                    )
                  else
                    _DomainNextStepCard(
                      domain: nextDomain,
                      scenarioTitle: summary.nextModuleTitle ?? nextDomain.scenarios.first.title,
                      heading: l10n.simulationContinueNextDomain,
                      onTap: () => context.pushReplacement(AppRoutes.moduleDetail(nextDomain.id)),
                      l10n: l10n,
                    ),
                  const SizedBox(height: AppSpacing.sectionGap),
                  Text(
                    l10n.simulationAnswerReviewTitle,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(height: AppSpacing.xs),
                  Text(
                    l10n.simulationAnswerReviewSubtitle,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.textMuted, height: 1.4),
                  ),
                  const SizedBox(height: AppSpacing.md),
                  for (var i = 0; i < quiz.questions.length; i++) ...[
                    QuestionAnswerReviewCard(
                      question: quiz.questions[i],
                      selectedIndex: quiz.selectedFor(quiz.questions[i].id),
                      questionNumber: i + 1,
                    ),
                    const SizedBox(height: AppSpacing.sm),
                  ],
                  DigaSurfaceCard(
                    padding: const EdgeInsets.all(AppSpacing.md),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          l10n.simulationScoreBreakdown,
                          style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(height: AppSpacing.sm),
                        for (final entry in phaseBreakdown.entries) ...[
                          Row(
                            children: [
                              Expanded(child: Text(entry.key)),
                              Text('${entry.value}%', style: const TextStyle(fontWeight: FontWeight.w700)),
                            ],
                          ),
                          const SizedBox(height: 6),
                        ],
                      ],
                    ),
                  ),
                  if (summary.unlockedBadges.isNotEmpty) ...[
                    const SizedBox(height: AppSpacing.sectionGap),
                    Text(
                      l10n.simulationBadgesUnlocked,
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
                      onTap: () => context.push('/modules/${recommendation.nextDomainId}'),
                    ),
                  ],
                  if (scenario != null) ...[
                    const SizedBox(height: AppSpacing.sm),
                    ConversationScenarioCard(scenario: scenario),
                  ],
                  const SizedBox(height: AppSpacing.lg),
                  OutlinedButton(
                    onPressed: () => context.go(AppRoutes.moduleDetail(completedDomain.id)),
                    child: Text(l10n.simulationBackToScenarios),
                  ),
                ],
              ),
              if (_showCelebration)
                ExamPassCelebration(
                  scorePercent: scorePercent,
                  message: passed
                      ? l10n.simulationExamPassedBanner(scorePercent)
                      : l10n.simulationExamFailedBanner(scorePercent),
                  variant: passed
                      ? ExamCelebrationVariant.passed
                      : ExamCelebrationVariant.failed,
                  onDismiss: () => setState(() => _showCelebration = false),
                ),
            ],
          );
        },
      ),
    );
  }
}

class _CompletedDomainCard extends StatelessWidget {
  const _CompletedDomainCard({
    required this.domain,
    required this.scorePercent,
    required this.accuracyPercent,
    required this.marks,
    required this.encouragement,
    required this.l10n,
    required this.passed,
  });

  final ClinicalDomain domain;
  final int scorePercent;
  final int accuracyPercent;
  final String marks;
  final String encouragement;
  final AppLocalizations l10n;
  final bool passed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DigaSurfaceCard(
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Container(
        decoration: passed
            ? BoxDecoration(
                borderRadius: BorderRadius.circular(AppRadii.md),
                gradient: LinearGradient(
                  colors: [
                    AppColors.successSoft,
                    AppColors.card,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              )
            : null,
        padding: passed ? const EdgeInsets.all(AppSpacing.sm) : null,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: passed ? AppColors.success.withValues(alpha: 0.15) : AppColors.primaryContainer,
                  child: Icon(
                    passed ? Icons.emoji_events_rounded : domain.icon,
                    color: passed ? AppColors.success : AppColors.primary,
                  ),
                ),
                const SizedBox(width: AppSpacing.sm),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        domain.name,
                        style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w800),
                      ),
                      Text(
                        domain.countLabel,
                        style: theme.textTheme.bodySmall?.copyWith(color: AppColors.textMuted),
                      ),
                    ],
                  ),
                ),
                if (passed)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors.success.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(AppRadii.pill),
                    ),
                    child: Text(
                      'PASSED',
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: AppColors.success,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: AppSpacing.md),
            Text(
              l10n.simulationScoreAccuracy(scorePercent, accuracyPercent),
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w800,
                color: passed ? AppColors.success : null,
              ),
            ),
            const SizedBox(height: AppSpacing.xs),
            Text(encouragement, style: theme.textTheme.bodyMedium?.copyWith(height: 1.45)),
            const SizedBox(height: AppSpacing.xs),
            Text(
              l10n.simulationMarks(marks),
              style: theme.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}

class _DomainNextStepCard extends StatelessWidget {
  const _DomainNextStepCard({
    required this.domain,
    required this.scenarioTitle,
    required this.onTap,
    required this.l10n,
    required this.heading,
  });

  final ClinicalDomain domain;
  final String scenarioTitle;
  final VoidCallback onTap;
  final AppLocalizations l10n;
  final String heading;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppRadii.lg),
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(AppRadii.lg),
          border: Border.all(color: AppColors.primary.withValues(alpha: 0.35)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              heading,
              style: theme.textTheme.labelMedium?.copyWith(
                color: AppColors.primary,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            Row(
              children: [
                CircleAvatar(
                  radius: 18,
                  backgroundColor: AppColors.primaryContainer,
                  child: Icon(domain.icon, size: 18, color: AppColors.primary),
                ),
                const SizedBox(width: AppSpacing.sm),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        domain.name,
                        style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w800),
                      ),
                      Text(
                        l10n.simulationSuggestedScenario(scenarioTitle),
                        style: theme.textTheme.bodySmall?.copyWith(color: AppColors.textMuted),
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.chevron_right_rounded),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
