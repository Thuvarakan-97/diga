import 'package:diga/core/theme/app_spacing.dart';
import 'package:flutter/material.dart';

/// Horizontally scrollable filter chips (used on Modules screen later).
class FilterChipGroup extends StatelessWidget {
  const FilterChipGroup({
    super.key,
    required this.labels,
    required this.selected,
    required this.onSelectedChanged,
  });

  final List<String> labels;
  final Set<String> selected;
  final ValueChanged<String> onSelectedChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.pageHorizontal),
        itemCount: labels.length,
        separatorBuilder: (context, index) => const SizedBox(width: AppSpacing.xs),
        itemBuilder: (context, index) {
          final label = labels[index];
          final isSelected = selected.contains(label);
          return FilterChip(
            label: Text(label),
            selected: isSelected,
            onSelected: (_) => onSelectedChanged(label),
            showCheckmark: false,
          );
        },
      ),
    );
  }
}
