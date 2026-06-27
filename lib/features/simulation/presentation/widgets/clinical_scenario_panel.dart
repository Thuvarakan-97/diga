import 'package:diga/core/theme/app_colors.dart';
import 'package:diga/core/theme/app_radii.dart';
import 'package:diga/core/theme/app_spacing.dart';
import 'package:diga/features/simulation/domain/models/simulation_question.dart';
import 'package:diga/shared/extensions/context_l10n.dart';
import 'package:flutter/material.dart';

/// Vignette + MCQ options with optional post-answer feedback.
class ClinicalScenarioPanel extends StatelessWidget {
  const ClinicalScenarioPanel({
    super.key,
    required this.question,
    required this.selectedIndex,
    required this.onSelect,
    this.showFeedback = false,
  });

  final SimulationQuestion question;
  final int? selectedIndex;
  final ValueChanged<int> onSelect;
  final bool showFeedback;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    final answered = selectedIndex != null;
    final correct = answered && question.isCorrect(selectedIndex!);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            color: AppColors.primaryContainer.withValues(alpha: 0.35),
            borderRadius: BorderRadius.circular(AppRadii.md),
            border: Border.all(color: AppColors.outline.withValues(alpha: 0.35)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                question.scenarioTitle,
                style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: AppSpacing.sm),
              Text(
                question.vignette,
                style: theme.textTheme.bodyMedium?.copyWith(height: 1.45),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        Text(
          l10n.simulationDecisionPoint,
          style: theme.textTheme.labelLarge?.copyWith(
            color: AppColors.primary,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: AppSpacing.xs),
        Text(
          question.decisionPoint,
          style: theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600, height: 1.4),
        ),
        const SizedBox(height: AppSpacing.md),
        for (var i = 0; i < question.options.length; i++)
          Padding(
            padding: const EdgeInsets.only(bottom: AppSpacing.sm),
            child: Material(
              color: selectedIndex == i
                  ? AppColors.primaryContainer.withValues(alpha: 0.25)
                  : AppColors.card,
              borderRadius: BorderRadius.circular(AppRadii.md),
              child: InkWell(
                borderRadius: BorderRadius.circular(AppRadii.md),
                onTap: () => onSelect(i),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: AppSpacing.sm),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppRadii.md),
                    border: Border.all(
                      color: _optionBorderColor(context, i, answered, correct),
                      width: selectedIndex == i ? 1.5 : 1,
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          '${String.fromCharCode(65 + i)}. ${question.options[i]}',
                          style: theme.textTheme.bodyMedium?.copyWith(height: 1.35),
                        ),
                      ),
                      const SizedBox(width: AppSpacing.sm),
                      Icon(
                        selectedIndex == i ? Icons.check_circle_rounded : Icons.radio_button_unchecked_rounded,
                        color: selectedIndex == i ? theme.colorScheme.primary : AppColors.textMuted,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        if (showFeedback && answered) ...[
          const SizedBox(height: AppSpacing.xs),
          ClinicalAnswerExplanationCard(
            isCorrect: correct,
            rationale: question.rationale,
            teachingPearl: question.teachingPearl,
          ),
        ],
      ],
    );
  }

  Color _optionBorderColor(BuildContext context, int index, bool answered, bool overallCorrect) {
    if (selectedIndex != index) {
      return AppColors.outline.withValues(alpha: 0.35);
    }
    if (!showFeedback) {
      return Theme.of(context).colorScheme.primary;
    }
    if (!answered) return Theme.of(context).colorScheme.primary;
    return overallCorrect ? AppColors.success : AppColors.danger;
  }
}

/// Rationale + teaching pearl — shown on the result screen, not during questions.
class ClinicalAnswerExplanationCard extends StatelessWidget {
  const ClinicalAnswerExplanationCard({
    super.key,
    required this.isCorrect,
    required this.rationale,
    this.teachingPearl,
    this.yourAnswerLabel,
    this.correctAnswerLabel,
  });

  final bool isCorrect;
  final String rationale;
  final String? teachingPearl;
  final String? yourAnswerLabel;
  final String? correctAnswerLabel;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    final bg = isCorrect ? AppColors.successSoft : AppColors.dangerSoft;
    final fg = isCorrect ? AppColors.success : AppColors.danger;

    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(AppRadii.md),
        border: Border.all(color: fg.withValues(alpha: 0.25)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            isCorrect ? l10n.simulationCorrectLabel : l10n.simulationIncorrectLabel,
            style: theme.textTheme.titleSmall?.copyWith(color: fg, fontWeight: FontWeight.w800),
          ),
          if (yourAnswerLabel != null) ...[
            const SizedBox(height: AppSpacing.sm),
            Text(l10n.simulationYourAnswerLabel, style: theme.textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w700)),
            const SizedBox(height: AppSpacing.xxs),
            Text(yourAnswerLabel!, style: theme.textTheme.bodyMedium?.copyWith(height: 1.35)),
          ],
          if (correctAnswerLabel != null && !isCorrect) ...[
            const SizedBox(height: AppSpacing.sm),
            Text(l10n.simulationCorrectAnswerLabel, style: theme.textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w700)),
            const SizedBox(height: AppSpacing.xxs),
            Text(correctAnswerLabel!, style: theme.textTheme.bodyMedium?.copyWith(height: 1.35)),
          ],
          const SizedBox(height: AppSpacing.sm),
          Text(l10n.simulationExplanationLabel, style: theme.textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w700)),
          const SizedBox(height: AppSpacing.xxs),
          Text(rationale, style: theme.textTheme.bodyMedium?.copyWith(height: 1.4)),
          if (teachingPearl != null) ...[
            const SizedBox(height: AppSpacing.sm),
            Text(l10n.simulationTeachingPearlLabel, style: theme.textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w700)),
            const SizedBox(height: AppSpacing.xxs),
            Text(teachingPearl!, style: theme.textTheme.bodySmall?.copyWith(height: 1.4)),
          ],
        ],
      ),
    );
  }
}
