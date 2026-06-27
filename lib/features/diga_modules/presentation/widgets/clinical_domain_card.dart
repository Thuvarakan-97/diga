import 'package:diga/core/theme/app_colors.dart';
import 'package:diga/core/theme/app_radii.dart';
import 'package:diga/core/theme/app_spacing.dart';
import 'package:diga/features/diga_modules/presentation/models/clinical_domain_data.dart';
import 'package:diga/features/diga_modules/presentation/widgets/domain_cover_illustration.dart';
import 'package:diga/features/diga_modules/presentation/widgets/domain_visuals.dart';
import 'package:flutter/material.dart';

/// Domain tile with header info and a themed cover illustration.
class ClinicalDomainCard extends StatelessWidget {
  const ClinicalDomainCard({
    super.key,
    required this.domain,
    required this.onTap,
    this.compact = false,
    this.showScenarioCount = false,
  });

  final ClinicalDomain domain;
  final VoidCallback onTap;
  final bool compact;
  final bool showScenarioCount;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final visuals = DomainVisuals.forId(domain.id);
    final subtitle = showScenarioCount
        ? '${domain.scenarios.length} scenarios · ${domain.countLabel}'
        : domain.countLabel;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppRadii.lg),
        child: Ink(
          decoration: BoxDecoration(
            color: AppColors.card,
            borderRadius: BorderRadius.circular(AppRadii.lg),
            border: Border.all(color: AppColors.outline.withValues(alpha: 0.3)),
            boxShadow: [
              BoxShadow(
                color: visuals.glow.withValues(alpha: 0.12),
                blurRadius: 14,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(AppRadii.lg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(
                    compact ? AppSpacing.sm : AppSpacing.md,
                    compact ? AppSpacing.sm : AppSpacing.md,
                    compact ? AppSpacing.sm : AppSpacing.md,
                    AppSpacing.xs,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(7),
                            decoration: BoxDecoration(
                              color: visuals.accent,
                              borderRadius: BorderRadius.circular(AppRadii.pill),
                            ),
                            child: Icon(domain.icon, size: compact ? 16 : 18, color: visuals.gradient.first),
                          ),
                          const Spacer(),
                          _ProgressBadge(progress: domain.progress, accent: visuals.gradient.first),
                        ],
                      ),
                      SizedBox(height: compact ? AppSpacing.xs : AppSpacing.sm),
                      Text(
                        domain.name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w800,
                          height: 1.2,
                        ),
                      ),
                      const SizedBox(height: AppSpacing.xxs),
                      Text(
                        subtitle,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.bodySmall?.copyWith(color: AppColors.textMuted),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      DomainCoverIllustration(
                        domain: domain,
                        borderRadius: BorderRadius.zero,
                      ),
                      Positioned(
                        left: AppSpacing.sm,
                        right: AppSpacing.sm,
                        bottom: AppSpacing.sm,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(AppRadii.pill),
                          child: LinearProgressIndicator(
                            value: domain.progress / 100,
                            minHeight: compact ? 3 : 4,
                            color: Colors.white,
                            backgroundColor: Colors.white.withValues(alpha: 0.28),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ProgressBadge extends StatelessWidget {
  const _ProgressBadge({required this.progress, required this.accent});

  final int progress;
  final Color accent;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: accent.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(AppRadii.pill),
      ),
      child: Text(
        '$progress%',
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: accent,
              fontWeight: FontWeight.w800,
            ),
      ),
    );
  }
}
