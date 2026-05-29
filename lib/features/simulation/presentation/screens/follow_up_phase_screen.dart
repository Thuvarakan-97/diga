import 'package:diga/core/theme/app_colors.dart';
import 'package:diga/core/theme/app_spacing.dart';
import 'package:diga/features/gamification/domain/models/module_outcome.dart';
import 'package:diga/features/gamification/presentation/providers/gamification_providers.dart';
import 'package:diga/shared/extensions/context_l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_routes.dart';
import '../providers/simulation_quiz_provider.dart';
import '../widgets/clinical_scenario_panel.dart';

class FollowUpPhaseScreen extends ConsumerWidget {
  const FollowUpPhaseScreen({super.key, required this.moduleId});

  final String moduleId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final quiz = ref.watch(simulationQuizControllerProvider(moduleId));
    final question = quiz.questionFor(SimulationQuizPhase.followUp);
    final selected = quiz.selectedFor(question.id);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.simulationPhase3Title)),
      body: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: ListView(
          children: [
            Text(l10n.moduleLabel(moduleId)),
            const SizedBox(height: AppSpacing.md),
            ClinicalScenarioPanel(
              question: question,
              selectedIndex: selected,
              onSelect: (index) {
                ref.read(simulationQuizControllerProvider(moduleId).notifier).answerQuestion(question.id, index);
              },
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              'Submit to see your score, explanations, and XP on the results screen.',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.textMuted),
            ),
            const SizedBox(height: AppSpacing.md),
            FilledButton(
              onPressed: selected == null
                  ? null
                  : () async {
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
                    },
              child: Text(l10n.simulationToResult),
            ),
          ],
        ),
      ),
    );
  }
}
