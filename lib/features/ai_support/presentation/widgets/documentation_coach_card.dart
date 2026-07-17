import 'package:diga/core/theme/app_colors.dart';
import 'package:diga/core/theme/app_radii.dart';
import 'package:diga/core/theme/app_spacing.dart';
import 'package:diga/features/ai_support/domain/services/ai_tutor_engine.dart';
import 'package:diga/shared/extensions/context_l10n.dart';
import 'package:diga/shared/widgets/diga_surface_card.dart';
import 'package:flutter/material.dart';

/// Free-text documentation draft with rule-based AI checklist feedback.
class DocumentationCoachCard extends StatefulWidget {
  const DocumentationCoachCard({super.key});

  @override
  State<DocumentationCoachCard> createState() => _DocumentationCoachCardState();
}

class _DocumentationCoachCardState extends State<DocumentationCoachCard> {
  final _controller = TextEditingController();
  DocumentationCoachResult? _result;
  bool _analysed = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _analyse() {
    if (_controller.text.trim().length < 20) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(context.l10n.aiDocTooShort)),
      );
      return;
    }
    setState(() {
      _result = DocumentationCoachEngine.analyse(_controller.text, context.l10n);
      _analysed = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);

    return DigaSurfaceCard(
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.primaryContainer,
                  borderRadius: BorderRadius.circular(AppRadii.sm),
                ),
                child: const Icon(Icons.description_outlined, color: AppColors.primary, size: 22),
              ),
              const SizedBox(width: AppSpacing.sm),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.aiDocCoachTitle,
                      style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w800),
                    ),
                    Text(
                      l10n.aiDocCoachSubtitle,
                      style: theme.textTheme.bodySmall?.copyWith(color: AppColors.textMuted),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          TextField(
            controller: _controller,
            maxLines: 5,
            decoration: InputDecoration(
              hintText: l10n.aiDocCoachHint,
              filled: true,
              fillColor: AppColors.surfaceVariant.withValues(alpha: 0.5),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(AppRadii.md)),
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          FilledButton.icon(
            onPressed: _analyse,
            icon: const Icon(Icons.auto_fix_high_rounded, size: 18),
            label: Text(l10n.aiDocCoachAnalyse),
            style: FilledButton.styleFrom(
              backgroundColor: AppColors.primary,
              minimumSize: const Size(double.infinity, 44),
            ),
          ),
          if (_analysed && _result != null) ...[
            const SizedBox(height: AppSpacing.md),
            Row(
              children: [
                Text(
                  l10n.aiDocCoachScore(_result!.scorePercent),
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w800,
                    color: _result!.scorePercent >= 60 ? AppColors.success : AppColors.warning,
                  ),
                ),
                const Spacer(),
                SizedBox(
                  width: 48,
                  height: 48,
                  child: CircularProgressIndicator(
                    value: _result!.scorePercent / 100,
                    strokeWidth: 5,
                    color: _result!.scorePercent >= 60 ? AppColors.success : AppColors.warning,
                    backgroundColor: AppColors.outline.withValues(alpha: 0.3),
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(_result!.feedback, style: theme.textTheme.bodyMedium?.copyWith(height: 1.45)),
            const SizedBox(height: AppSpacing.sm),
            for (final item in _result!.items)
              Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      item.met ? Icons.check_circle_rounded : Icons.radio_button_unchecked_rounded,
                      size: 18,
                      color: item.met ? AppColors.success : AppColors.textMuted,
                    ),
                    const SizedBox(width: 8),
                    Expanded(child: Text(item.label, style: theme.textTheme.bodySmall)),
                  ],
                ),
              ),
          ],
        ],
      ),
    );
  }
}
