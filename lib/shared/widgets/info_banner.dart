import 'package:diga/core/theme/app_colors.dart';
import 'package:diga/core/theme/app_radii.dart';
import 'package:diga/core/theme/app_spacing.dart';
import 'package:flutter/material.dart';

enum InfoBannerStyle { info, success, warning }

/// Inline informational banner (demo mode, tips, compliance hints).
class InfoBanner extends StatelessWidget {
  const InfoBanner({
    super.key,
    this.title,
    required this.message,
    this.leadingIcon,
    this.style = InfoBannerStyle.info,
  });

  /// Optional bold line above [message] (e.g. “Demo mode”).
  final String? title;
  final String message;
  final IconData? leadingIcon;
  final InfoBannerStyle style;

  @override
  Widget build(BuildContext context) {
    final (Color bg, Color border, Color iconColor, IconData icon) = switch (style) {
      InfoBannerStyle.info => (
          AppColors.primaryContainer.withValues(alpha: 0.55),
          AppColors.primary.withValues(alpha: 0.15),
          AppColors.primary,
          leadingIcon ?? Icons.info_outline_rounded,
        ),
      InfoBannerStyle.success => (
          AppColors.successSoft,
          AppColors.success.withValues(alpha: 0.2),
          AppColors.success,
          leadingIcon ?? Icons.check_circle_outline_rounded,
        ),
      InfoBannerStyle.warning => (
          AppColors.warningSoft,
          AppColors.warning.withValues(alpha: 0.25),
          AppColors.warning,
          leadingIcon ?? Icons.warning_amber_rounded,
        ),
    };

    final theme = Theme.of(context);
    final onSurface = theme.colorScheme.onSurface;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: AppSpacing.pageHorizontal),
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(AppRadii.md),
        border: Border.all(color: border),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: iconColor, size: 22),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (title != null) ...[
                  Text(
                    title!,
                    style: theme.textTheme.titleSmall?.copyWith(
                      color: onSurface,
                      fontWeight: FontWeight.w700,
                      height: 1.25,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.xs),
                ],
                Text(
                  message,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: onSurface.withValues(alpha: title != null ? 0.88 : 1),
                    height: 1.4,
                    fontWeight: FontWeight.w500,
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
