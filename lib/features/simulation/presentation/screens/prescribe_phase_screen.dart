import 'package:diga/core/theme/app_spacing.dart';
import 'package:diga/shared/extensions/context_l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_routes.dart';
import '../providers/simulation_quiz_provider.dart';
import '../widgets/clinical_scenario_panel.dart';

class PrescribePhaseScreen extends ConsumerWidget {
  const PrescribePhaseScreen({super.key, required this.moduleId});

  final String moduleId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final quiz = ref.watch(simulationQuizControllerProvider(moduleId));
    final question = quiz.questionFor(SimulationQuizPhase.prescribe);
    final selected = quiz.selectedFor(question.id);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.simulationPhase2Title)),
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
            const SizedBox(height: AppSpacing.md),
            FilledButton(
              onPressed: selected == null
                  ? null
                  : () => context.pushReplacement(AppRoutes.simulationFollowUp(moduleId)),
              child: Text(l10n.simulationNextToPhase3),
            ),
          ],
        ),
      ),
    );
  }
}
