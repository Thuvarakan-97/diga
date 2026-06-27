import 'package:diga/core/theme/app_colors.dart';
import 'package:diga/core/theme/app_radii.dart';
import 'package:diga/core/theme/app_spacing.dart';
import 'package:diga/features/simulation/domain/models/simulation_question.dart';
import 'package:diga/features/simulation/domain/models/simulation_quiz_phase.dart';
import 'package:diga/features/simulation/presentation/widgets/clinical_scenario_panel.dart';
import 'package:diga/shared/extensions/context_l10n.dart';
import 'package:diga/shared/widgets/diga_surface_card.dart';
import 'package:flutter/material.dart';

/// Full answer review for one phase — used on the result screen only.
class QuestionAnswerReviewCard extends StatelessWidget {
  const QuestionAnswerReviewCard({
    super.key,
    required this.question,
    required this.selectedIndex,
    this.questionNumber,
  });

  final SimulationQuestion question;
  final int? selectedIndex;
  final int? questionNumber;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    final answered = selectedIndex != null;
    final correct = answered && question.isCorrect(selectedIndex!);
    final correctLabel = '${String.fromCharCode(65 + question.correctIndex)}. '
        '${question.options[question.correctIndex]}';
    final yourLabel = answered
        ? '${String.fromCharCode(65 + selectedIndex!)}. ${question.options[selectedIndex!]}'
        : l10n.simulationNoAnswerRecorded;

    return DigaSurfaceCard(
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              if (questionNumber != null) ...[
                Text(
                  '#$questionNumber',
                  style: theme.textTheme.labelMedium?.copyWith(
                    fontWeight: FontWeight.w800,
                    color: AppColors.textMuted,
                  ),
                ),
                const SizedBox(width: AppSpacing.sm),
              ],
              Container(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm, vertical: AppSpacing.xxs),
                decoration: BoxDecoration(
                  color: AppColors.primaryContainer.withValues(alpha: 0.6),
                  borderRadius: BorderRadius.circular(AppRadii.pill),
                ),
                child: Text(
                  question.phase.displayLabel(l10n),
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(width: AppSpacing.sm),
              Expanded(
                child: Text(
                  question.scenarioTitle,
                  style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            question.decisionPoint,
            style: theme.textTheme.bodySmall?.copyWith(color: AppColors.textMuted, height: 1.35),
          ),
          const SizedBox(height: AppSpacing.md),
          ClinicalAnswerExplanationCard(
            isCorrect: correct,
            rationale: question.rationale,
            teachingPearl: question.teachingPearl,
            yourAnswerLabel: yourLabel,
            correctAnswerLabel: correct ? null : correctLabel,
          ),
        ],
      ),
    );
  }
}
