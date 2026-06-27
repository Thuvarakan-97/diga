import 'package:diga/core/theme/app_colors.dart';
import 'package:diga/core/theme/app_radii.dart';
import 'package:diga/core/theme/app_spacing.dart';
import 'package:diga/features/diga_modules/presentation/models/clinical_domain_data.dart';
import 'package:diga/features/diga_modules/presentation/providers/scenario_progress_provider.dart';
import 'package:diga/features/gamification/domain/models/module_outcome.dart';
import 'package:diga/features/gamification/presentation/providers/gamification_providers.dart';
import 'package:diga/features/simulation/presentation/providers/simulation_quiz_provider.dart';
import 'package:diga/features/simulation/presentation/widgets/clinical_scenario_panel.dart';
import 'package:diga/shared/extensions/context_l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_routes.dart';

/// Domain exam — 5 clinical MCQs, one at a time.
class SimulationExamScreen extends ConsumerWidget {
  const SimulationExamScreen({
    super.key,
    required this.moduleId,
    this.scenarioId,
  });

  final String moduleId;
  final String? scenarioId;

  Future<void> _submitExam(
    BuildContext context,
    WidgetRef ref,
    SimulationQuizState quiz,
    String completedScenarioId,
  ) async {
    ref.read(simulationQuizResultCacheProvider(moduleId).notifier).state = quiz;
    ref.read(scenarioProgressProvider.notifier).completeScenario(completedScenarioId);

    await ref.read(gamificationControllerProvider.notifier).completeModule(
          ModuleOutcome(
            moduleId: moduleId,
            scorePercent: quiz.scorePercent,
            accuracyPercent: quiz.accuracyPercent,
            firstAttempt: quiz.isPerfectFirstAttempt,
            completedAt: DateTime.now(),
          ),
        );
    if (context.mounted) {
      context.pushReplacement(AppRoutes.simulationResult(moduleId));
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final quiz = ref.watch(simulationQuizControllerProvider(moduleId));
    final controller = ref.read(simulationQuizControllerProvider(moduleId).notifier);
    final domain = ClinicalDomainData.domainForModule(moduleId);
    final scenarioProgress = ref.read(scenarioProgressProvider.notifier);
    final activeScenarioId = scenarioId ?? scenarioProgress.inferScenarioIdForModule(moduleId);

    if (quiz.totalQuestions == 0) {
      return Scaffold(
        backgroundColor: AppColors.surface,
        appBar: AppBar(title: Text(l10n.simulationExamTitle)),
        body: Center(child: Text(l10n.simulationUnableToLoadResult)),
      );
    }

    final question = quiz.currentQuestion;
    final selected = quiz.selectedFor(question.id);
    final examProgress = (quiz.currentQuestionIndex + 1) / quiz.totalQuestions;

    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(title: Text(l10n.simulationExamTitle)),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(AppSpacing.md),
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(AppRadii.pill),
                    child: LinearProgressIndicator(
                      value: examProgress,
                      minHeight: 6,
                      color: AppColors.primary,
                      backgroundColor: AppColors.outline.withValues(alpha: 0.35),
                    ),
                  ),
                  const SizedBox(height: AppSpacing.md),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          domain.name,
                          style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w700),
                        ),
                      ),
                      Text(
                        l10n.simulationQuestionProgress(quiz.currentQuestionIndex + 1, quiz.totalQuestions),
                        style: Theme.of(context).textTheme.labelMedium?.copyWith(
                              color: AppColors.primary,
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm, vertical: AppSpacing.xxs),
                      decoration: BoxDecoration(
                        color: AppColors.primaryContainer.withValues(alpha: 0.6),
                        borderRadius: BorderRadius.circular(AppRadii.pill),
                      ),
                      child: Text(
                        question.phase.displayLabel(l10n),
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                              color: AppColors.primary,
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                    ),
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  ClinicalScenarioPanel(
                    question: question,
                    selectedIndex: selected,
                    onSelect: (index) => controller.answerQuestion(question.id, index),
                  ),
                ],
              ),
            ),
            const Divider(height: 1),
            Padding(
              padding: const EdgeInsets.all(AppSpacing.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    l10n.simulationExamAnsweredCount(quiz.answeredCount, quiz.totalQuestions),
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.textMuted),
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: quiz.isFirstQuestion ? null : controller.previousQuestion,
                          child: Text(l10n.simulationPreviousQuestion),
                        ),
                      ),
                      const SizedBox(width: AppSpacing.sm),
                      Expanded(
                        child: FilledButton(
                          onPressed: !quiz.currentAnswered
                              ? null
                              : () {
                                  if (quiz.isLastQuestion) {
                                    if (quiz.allAnswered && activeScenarioId != null) {
                                      _submitExam(context, ref, quiz, activeScenarioId);
                                    }
                                  } else {
                                    controller.nextQuestion();
                                  }
                                },
                          child: Text(
                            quiz.isLastQuestion ? l10n.simulationSubmitExam : l10n.simulationNextQuestion,
                          ),
                        ),
                      ),
                    ],
                  ),
                  if (quiz.isLastQuestion && quiz.currentAnswered && !quiz.allAnswered) ...[
                    const SizedBox(height: AppSpacing.xs),
                    Text(
                      l10n.simulationExamUnansweredWarning,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.warning),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
