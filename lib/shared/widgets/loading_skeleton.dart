import 'package:diga/core/theme/app_colors.dart';
import 'package:diga/core/theme/app_radii.dart';
import 'package:diga/core/theme/app_spacing.dart';
import 'package:flutter/material.dart';

/// Simple pulse skeleton (no extra packages).
class LoadingSkeleton extends StatefulWidget {
  const LoadingSkeleton({super.key, this.height = 14, this.width = double.infinity});

  final double height;
  final double width;

  @override
  State<LoadingSkeleton> createState() => _LoadingSkeletonState();
}

class _LoadingSkeletonState extends State<LoadingSkeleton> with SingleTickerProviderStateMixin {
  late final AnimationController _c = AnimationController(vsync: this, duration: const Duration(milliseconds: 1200))
    ..repeat(reverse: true);

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final box = Container(
      height: widget.height,
      decoration: BoxDecoration(
        color: AppColors.surfaceVariant,
        borderRadius: BorderRadius.circular(AppRadii.sm),
      ),
    );
    final sized = widget.width.isFinite ? SizedBox(width: widget.width, child: box) : box;

    return AnimatedBuilder(
      animation: _c,
      builder: (context, child) {
        return Opacity(
          opacity: 0.35 + _c.value * 0.45,
          child: child,
        );
      },
      child: sized,
    );
  }
}

/// Block of skeleton lines for card placeholders.
class LoadingSkeletonBlock extends StatelessWidget {
  const LoadingSkeletonBlock({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.sizeOf(context).width - AppSpacing.pageHorizontal * 2;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.pageHorizontal, vertical: AppSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const LoadingSkeleton(width: 160, height: 18),
          const SizedBox(height: AppSpacing.sm),
          LoadingSkeleton(width: w, height: 12),
          const SizedBox(height: AppSpacing.xs),
          LoadingSkeleton(width: w * 0.72, height: 12),
        ],
      ),
    );
  }
}
