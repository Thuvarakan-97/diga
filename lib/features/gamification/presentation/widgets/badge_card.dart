import 'package:diga/core/theme/app_colors.dart';
import 'package:diga/core/theme/app_radii.dart';
import 'package:diga/core/theme/app_spacing.dart';
import 'package:diga/features/gamification/domain/models/badge.dart' as gm;
import 'package:diga/shared/widgets/diga_surface_card.dart';
import 'package:flutter/material.dart';

class BadgeCard extends StatelessWidget {
  const BadgeCard({super.key, required this.badge});

  final gm.Badge badge;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = badge.unlocked ? AppColors.success : AppColors.textMuted;
    return DigaSurfaceCard(
      padding: const EdgeInsets.all(AppSpacing.md),
      elevation: CardElevation.subtle,
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: (badge.unlocked ? AppColors.successSoft : AppColors.surfaceVariant),
              borderRadius: BorderRadius.circular(AppRadii.sm),
            ),
            alignment: Alignment.center,
            child: Icon(Icons.workspace_premium_rounded, color: color),
          ),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(badge.title, style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w700)),
              const SizedBox(height: 2),
              Text(badge.description, maxLines: 2, overflow: TextOverflow.ellipsis, style: theme.textTheme.bodySmall),
            ]),
          ),
        ],
      ),
    );
  }
}


