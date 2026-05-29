import 'package:diga/core/theme/app_colors.dart';
import 'package:diga/core/theme/app_radii.dart';
import 'package:diga/core/theme/app_spacing.dart';
import 'package:diga/core/theme/app_shadows.dart';
import 'package:flutter/material.dart';

/// Simple weekly bar visualization (mock trend — not clinical analytics).
class LearningTrendPanel extends StatelessWidget {
  const LearningTrendPanel({
    super.key,
    required this.title,
    required this.caption,
    required this.values,
    required this.dayLabels,
  });

  final String title;
  final String caption;
  final List<double> values;
  final List<String> dayLabels;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    assert(values.length == dayLabels.length, 'Trend bars and labels must match.');

    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.primaryContainer.withValues(alpha: 0.45),
            AppColors.card,
          ],
        ),
        borderRadius: BorderRadius.circular(AppRadii.lg + 2),
        border: Border.all(color: AppColors.outline.withValues(alpha: 0.35)),
        boxShadow: AppShadows.cardSubtle(context),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            caption,
            style: theme.textTheme.bodySmall?.copyWith(color: AppColors.textMuted, height: 1.4),
          ),
          const SizedBox(height: AppSpacing.lg),
          SizedBox(
            height: 120,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                for (var i = 0; i < values.length; i++)
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 3),
                      child: Column(
                        children: [
                          Expanded(
                            child: LayoutBuilder(
                              builder: (context, constraints) {
                                final h = constraints.maxHeight * values[i].clamp(0.08, 1.0);
                                return Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Container(
                                    width: double.infinity,
                                    height: h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.vertical(top: Radius.circular(AppRadii.sm)),
                                      gradient: LinearGradient(
                                        begin: Alignment.bottomCenter,
                                        end: Alignment.topCenter,
                                        colors: [
                                          AppColors.primary.withValues(alpha: 0.35),
                                          AppColors.accent,
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          const SizedBox(height: AppSpacing.xs),
                          Text(
                            dayLabels[i],
                            style: theme.textTheme.labelSmall?.copyWith(
                              color: AppColors.textMuted,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
