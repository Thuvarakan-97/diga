import 'package:diga/core/theme/app_colors.dart';
import 'package:diga/core/theme/app_radii.dart';
import 'package:diga/core/theme/app_shadows.dart';
import 'package:flutter/material.dart';

/// White elevated surface with soft shadow — base for dashboard cards.
class DigaSurfaceCard extends StatelessWidget {
  const DigaSurfaceCard({
    super.key,
    required this.child,
    this.padding,
    this.onTap,
    this.elevation = CardElevation.soft,
  });

  final Widget child;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onTap;
  final CardElevation elevation;

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(AppRadii.lg);
    final decoration = BoxDecoration(
      color: AppColors.card,
      borderRadius: radius,
      border: Border.all(color: AppColors.outline.withValues(alpha: 0.35)),
      boxShadow: elevation == CardElevation.soft ? AppShadows.cardSoft(context) : AppShadows.cardSubtle(context),
    );

    final content = Padding(
      padding: padding ?? EdgeInsets.zero,
      child: child,
    );

    if (onTap != null) {
      return Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: radius,
          child: Ink(decoration: decoration, child: content),
        ),
      );
    }

    return DecoratedBox(decoration: decoration, child: content);
  }
}

enum CardElevation { soft, subtle }
