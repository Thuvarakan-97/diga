import 'package:diga/core/theme/app_colors.dart';
import 'package:diga/core/theme/app_radii.dart';
import 'package:diga/core/theme/app_spacing.dart';
import 'package:diga/features/ai_support/domain/services/ai_tutor_engine.dart';
import 'package:diga/features/ai_support/presentation/widgets/ai_tutor_chat_screen.dart';
import 'package:diga/shared/extensions/context_l10n.dart';
import 'package:diga/shared/widgets/diga_surface_card.dart';
import 'package:flutter/material.dart';

/// Entry hub for post-exam AI coaching features (demo).
class AiCoachHubCard extends StatelessWidget {
  const AiCoachHubCard({
    super.key,
    required this.tutorContext,
    required this.onOpenDocumentation,
  });

  final AiTutorContext tutorContext;
  final VoidCallback onOpenDocumentation;

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
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColors.primary.withValues(alpha: 0.9),
                      AppColors.accent.withValues(alpha: 0.85),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(AppRadii.md),
                ),
                child: const Icon(Icons.smart_toy_rounded, color: Colors.white, size: 24),
              ),
              const SizedBox(width: AppSpacing.sm),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.aiCoachHubTitle,
                      style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w800),
                    ),
                    Text(
                      l10n.aiCoachHubSubtitle,
                      style: theme.textTheme.bodySmall?.copyWith(color: AppColors.textMuted),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          _ActionTile(
            icon: Icons.psychology_alt_rounded,
            title: l10n.aiCoachHubTutor,
            subtitle: l10n.aiCoachHubTutorDesc,
            color: AppColors.primary,
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (_) => AiTutorChatScreen(tutorContext: tutorContext),
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          _ActionTile(
            icon: Icons.forum_outlined,
            title: l10n.aiCoachHubPatient,
            subtitle: l10n.aiCoachHubPatientDesc(tutorContext.patientName),
            color: AppColors.accent,
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (_) => AiTutorChatScreen(tutorContext: tutorContext, patientMode: true),
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          _ActionTile(
            icon: Icons.description_outlined,
            title: l10n.aiCoachHubDoc,
            subtitle: l10n.aiCoachHubDocDesc,
            color: const Color(0xFF5C6BC0),
            onTap: onOpenDocumentation,
          ),
        ],
      ),
    );
  }
}

class _ActionTile extends StatelessWidget {
  const _ActionTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color.withValues(alpha: 0.06),
      borderRadius: BorderRadius.circular(AppRadii.md),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppRadii.md),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.sm),
          child: Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: color.withValues(alpha: 0.15),
                child: Icon(icon, color: color, size: 20),
              ),
              const SizedBox(width: AppSpacing.sm),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 14)),
                    Text(
                      subtitle,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: AppColors.textMuted,
                            height: 1.3,
                          ),
                    ),
                  ],
                ),
              ),
              Icon(Icons.chevron_right_rounded, color: color.withValues(alpha: 0.7)),
            ],
          ),
        ),
      ),
    );
  }
}
