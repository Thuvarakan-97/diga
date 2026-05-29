import 'package:diga/core/theme/app_colors.dart';
import 'package:diga/core/theme/app_spacing.dart';
import 'package:diga/features/gamification/domain/models/user_streak.dart';
import 'package:diga/shared/widgets/diga_surface_card.dart';
import 'package:flutter/material.dart';

class StreakCard extends StatelessWidget {
  const StreakCard({super.key, required this.streak});

  final UserStreak streak;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DigaSurfaceCard(
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Row(
        children: [
          Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(color: AppColors.warningSoft, borderRadius: BorderRadius.circular(12)),
            child: const Icon(Icons.local_fire_department_outlined, color: AppColors.warning),
          ),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('${streak.activeDays} day streak', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800)),
              Text('Best ${streak.bestDays} days · ${streak.sessionsThisWeek} sessions this week', style: theme.textTheme.bodySmall?.copyWith(color: AppColors.textMuted)),
            ]),
          ),
        ],
      ),
    );
  }
}

