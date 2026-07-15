import 'package:diga/core/theme/app_colors.dart';
import 'package:diga/core/theme/app_radii.dart';
import 'package:diga/core/theme/app_spacing.dart';
import 'package:diga/features/ai_support/domain/models/exam_ai_learning_report.dart';
import 'package:diga/shared/extensions/context_l10n.dart';
import 'package:diga/shared/widgets/diga_surface_card.dart';
import 'package:flutter/material.dart';

/// AI learning report with optional "submit" confirmation for post-exam coaching.
class ExamAiLearningReportCard extends StatelessWidget {
  const ExamAiLearningReportCard({
    super.key,
    required this.report,
    required this.submitted,
    required this.onSubmit,
  });

  final ExamAiLearningReport report;
  final bool submitted;
  final VoidCallback onSubmit;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);

    return DigaSurfaceCard(
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.accent.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(AppRadii.sm),
                ),
                child: const Icon(Icons.auto_awesome_rounded, color: AppColors.accent, size: 22),
              ),
              const SizedBox(width: AppSpacing.sm),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.aiReportTitle,
                      style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w800),
                    ),
                    Text(
                      l10n.aiReportSubtitle,
                      style: theme.textTheme.bodySmall?.copyWith(color: AppColors.textMuted),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          Text(report.summary, style: theme.textTheme.bodyMedium?.copyWith(height: 1.45)),
          if (report.weakPhases.isNotEmpty) ...[
            const SizedBox(height: AppSpacing.md),
            Text(
              l10n.aiReportWeakAreas,
              style: theme.textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: AppSpacing.xs),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                for (final area in report.weakPhases)
                  Chip(
                    label: Text(area, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
                    backgroundColor: AppColors.warningSoft,
                    side: BorderSide(color: AppColors.warning.withValues(alpha: 0.35)),
                    visualDensity: VisualDensity.compact,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
              ],
            ),
          ],
          if (report.focusItems.isNotEmpty) ...[
            const SizedBox(height: AppSpacing.md),
            Text(
              l10n.aiReportFocusTitle,
              style: theme.textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: AppSpacing.sm),
            for (var i = 0; i < report.focusItems.length; i++) ...[
              if (i > 0) const SizedBox(height: AppSpacing.sm),
              _FocusItemTile(item: report.focusItems[i], index: i + 1),
            ],
          ],
          const SizedBox(height: AppSpacing.md),
          Text(
            l10n.aiReportTipsTitle,
            style: theme.textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: AppSpacing.xs),
          for (final tip in report.teachingTips)
            Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.lightbulb_outline_rounded, size: 16, color: AppColors.accent),
                  const SizedBox(width: 8),
                  Expanded(child: Text(tip, style: theme.textTheme.bodySmall?.copyWith(height: 1.4))),
                ],
              ),
            ),
          if (report.nextSteps.isNotEmpty) ...[
            const SizedBox(height: AppSpacing.sm),
            Text(
              l10n.aiReportNextStepsTitle,
              style: theme.textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: AppSpacing.xs),
            for (final step in report.nextSteps)
              Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Text('• $step', style: theme.textTheme.bodySmall?.copyWith(height: 1.4)),
              ),
          ],
          const SizedBox(height: AppSpacing.md),
          if (submitted)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: AppSpacing.sm),
              decoration: BoxDecoration(
                color: AppColors.successSoft,
                borderRadius: BorderRadius.circular(AppRadii.md),
                border: Border.all(color: AppColors.success.withValues(alpha: 0.35)),
              ),
              child: Row(
                children: [
                  const Icon(Icons.check_circle_rounded, color: AppColors.success, size: 20),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      l10n.aiReportSubmitted,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: AppColors.success,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            )
          else
            FilledButton.icon(
              onPressed: onSubmit,
              icon: const Icon(Icons.upload_file_rounded, size: 18),
              label: Text(l10n.aiReportSubmitCta),
              style: FilledButton.styleFrom(
                backgroundColor: AppColors.accent,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadii.md)),
              ),
            ),
        ],
      ),
    );
  }
}

class _FocusItemTile extends StatelessWidget {
  const _FocusItemTile({required this.item, required this.index});

  final ExamAiFocusItem item;
  final int index;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.sm),
      decoration: BoxDecoration(
        color: AppColors.surfaceVariant.withValues(alpha: 0.55),
        borderRadius: BorderRadius.circular(AppRadii.sm),
        border: Border.all(color: AppColors.outline.withValues(alpha: 0.35)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$index. ${item.phaseLabel}',
            style: theme.textTheme.labelMedium?.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 4),
          Text(item.prompt, style: theme.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w600, height: 1.35)),
          const SizedBox(height: 4),
          Text(item.rationale, style: theme.textTheme.bodySmall?.copyWith(color: AppColors.textMuted, height: 1.4)),
        ],
      ),
    );
  }
}
