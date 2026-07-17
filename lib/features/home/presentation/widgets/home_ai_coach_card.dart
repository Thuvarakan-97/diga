import 'package:diga/core/theme/app_colors.dart';
import 'package:diga/core/theme/app_radii.dart';
import 'package:diga/core/theme/app_spacing.dart';
import 'package:diga/features/ai_support/domain/services/ai_tutor_engine.dart';
import 'package:diga/features/ai_support/presentation/widgets/ai_tutor_chat_screen.dart';
import 'package:diga/features/ai_support/presentation/widgets/documentation_coach_card.dart';
import 'package:diga/shared/extensions/context_l10n.dart';
import 'package:flutter/material.dart';

/// Compact AI Coach entry on the home dashboard.
class HomeAiCoachCard extends StatelessWidget {
  const HomeAiCoachCard({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    final tutorContext = AiTutorContext.forHome(l10n: l10n);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(AppRadii.lg),
        onTap: () => _openTutor(context, tutorContext),
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppRadii.lg),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                AppColors.primary.withValues(alpha: 0.08),
                AppColors.accent.withValues(alpha: 0.06),
              ],
            ),
            border: Border.all(color: AppColors.primary.withValues(alpha: 0.22)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(9),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [AppColors.primary, AppColors.accent],
                        ),
                        borderRadius: BorderRadius.circular(AppRadii.md),
                      ),
                      child: const Icon(Icons.smart_toy_rounded, color: Colors.white, size: 22),
                    ),
                    const SizedBox(width: AppSpacing.sm),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            l10n.homeAiCoachTitle,
                            style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w800),
                          ),
                          Text(
                            l10n.homeAiCoachSubtitle,
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: AppColors.textMuted,
                              height: 1.35,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(Icons.chevron_right_rounded, color: AppColors.primary.withValues(alpha: 0.7)),
                  ],
                ),
                const SizedBox(height: AppSpacing.sm),
                Wrap(
                  spacing: AppSpacing.xs,
                  runSpacing: AppSpacing.xs,
                  children: [
                    _ChipAction(
                      icon: Icons.psychology_alt_outlined,
                      label: l10n.aiCoachHubTutor,
                      onTap: () => _openTutor(context, tutorContext),
                    ),
                    _ChipAction(
                      icon: Icons.forum_outlined,
                      label: l10n.aiCoachHubPatient,
                      onTap: () => _openPatient(context, tutorContext),
                    ),
                    _ChipAction(
                      icon: Icons.description_outlined,
                      label: l10n.aiCoachHubDoc,
                      onTap: () => _openDocumentation(context),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _openTutor(BuildContext context, AiTutorContext tutorContext) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => AiTutorChatScreen(tutorContext: tutorContext),
      ),
    );
  }

  void _openPatient(BuildContext context, AiTutorContext tutorContext) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => AiTutorChatScreen(tutorContext: tutorContext, patientMode: true),
      ),
    );
  }

  void _openDocumentation(BuildContext context) {
    final l10n = context.l10n;
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => Scaffold(
          backgroundColor: AppColors.surface,
          appBar: AppBar(title: Text(l10n.aiDocCoachTitle)),
          body: ListView(
            padding: const EdgeInsets.all(AppSpacing.md),
            children: [DocumentationCoachCard()],
          ),
        ),
      ),
    );
  }
}

class _ChipAction extends StatelessWidget {
  const _ChipAction({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      avatar: Icon(icon, size: 16, color: AppColors.primary),
      label: Text(label, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
      backgroundColor: AppColors.card,
      side: BorderSide(color: AppColors.outline.withValues(alpha: 0.35)),
      onPressed: onTap,
    );
  }
}
