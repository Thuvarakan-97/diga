import 'package:diga/core/theme/app_colors.dart';
import 'package:diga/core/theme/app_radii.dart';
import 'package:diga/core/theme/app_spacing.dart';
import 'package:diga/core/theme/app_shadows.dart';
import 'package:flutter/material.dart';

/// Expandable reference block for clinical-style companion screens.
enum InfoSectionVariant {
  /// White card, neutral border.
  standard,

  /// Soft red tint for warnings / contraindications.
  alert,

  /// Muted surface for long-form patient text.
  guidance,
}

class InfoSectionCard extends StatelessWidget {
  const InfoSectionCard({
    super.key,
    required this.title,
    required this.child,
    this.leadingIcon,
    this.initiallyExpanded = false,
    this.variant = InfoSectionVariant.standard,
  });

  final String title;
  final Widget child;
  final IconData? leadingIcon;
  final bool initiallyExpanded;
  final InfoSectionVariant variant;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final (Color bg, Color border, Color iconBg) = switch (variant) {
      InfoSectionVariant.standard => (
          AppColors.card,
          AppColors.outline.withValues(alpha: 0.4),
          AppColors.primaryContainer.withValues(alpha: 0.5),
        ),
      InfoSectionVariant.alert => (
          AppColors.dangerSoft.withValues(alpha: 0.55),
          AppColors.danger.withValues(alpha: 0.22),
          AppColors.dangerSoft,
        ),
      InfoSectionVariant.guidance => (
          AppColors.primaryContainer.withValues(alpha: 0.35),
          AppColors.outline.withValues(alpha: 0.35),
          AppColors.secondaryContainer.withValues(alpha: 0.8),
        ),
    };

    final radius = BorderRadius.circular(AppRadii.lg);

    return DecoratedBox(
      decoration: BoxDecoration(
        color: bg,
        borderRadius: radius,
        border: Border.all(color: border),
        boxShadow: AppShadows.cardSubtle(context),
      ),
      child: ClipRRect(
        borderRadius: radius,
        child: Theme(
          data: theme.copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            initiallyExpanded: initiallyExpanded,
            tilePadding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: AppSpacing.xs),
            childrenPadding: const EdgeInsets.fromLTRB(
              AppSpacing.md,
              0,
              AppSpacing.md,
              AppSpacing.md,
            ),
            shape: const Border(),
            collapsedShape: const Border(),
            leading: leadingIcon == null
                ? null
                : Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: iconBg,
                      borderRadius: BorderRadius.circular(AppRadii.sm),
                    ),
                    child: Icon(
                      leadingIcon,
                      size: 22,
                      color: variant == InfoSectionVariant.alert ? AppColors.danger : AppColors.primary,
                    ),
                  ),
            title: Text(
              title,
              style: theme.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w800,
                letterSpacing: -0.15,
                color: variant == InfoSectionVariant.alert ? AppColors.danger : const Color(0xFF1C252C),
              ),
            ),
            iconColor: AppColors.textMuted,
            collapsedIconColor: AppColors.textMuted,
            children: [child],
          ),
        ),
      ),
    );
  }
}
