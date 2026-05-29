import 'package:diga/core/theme/app_colors.dart';
import 'package:diga/core/theme/app_spacing.dart';
import 'package:diga/features/gamification/domain/models/achievement.dart';
import 'package:diga/shared/widgets/diga_surface_card.dart';
import 'package:flutter/material.dart';

class AchievementBanner extends StatelessWidget {
  const AchievementBanner({super.key, required this.achievement});

  final Achievement achievement;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DigaSurfaceCard(
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Row(
        children: [
          const Icon(Icons.emoji_events_outlined, color: AppColors.accent),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(achievement.title, style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w700)),
              Text('${achievement.message} (+${achievement.xpAwarded} XP)', style: theme.textTheme.bodySmall),
            ]),
          ),
        ],
      ),
    );
  }
}

