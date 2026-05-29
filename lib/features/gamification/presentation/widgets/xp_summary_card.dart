import 'package:diga/core/theme/app_colors.dart';
import 'package:diga/shared/widgets/diga_surface_card.dart';
import 'package:flutter/material.dart';

class XPSummaryCard extends StatelessWidget {
  const XPSummaryCard({
    super.key,
    required this.totalXp,
    required this.weeklyGain,
  });

  final int totalXp;
  final int weeklyGain;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DigaSurfaceCard(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Total XP', style: theme.textTheme.labelMedium?.copyWith(color: AppColors.textMuted)),
          const SizedBox(height: 6),
          Text('$totalXp', style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w800)),
          const SizedBox(height: 10),
          Text('+$weeklyGain this week', style: theme.textTheme.bodySmall?.copyWith(color: AppColors.success, fontWeight: FontWeight.w700)),
        ],
      ),
    );
  }
}

