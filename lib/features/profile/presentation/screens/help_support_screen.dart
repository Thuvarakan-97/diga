import 'package:diga/core/theme/app_colors.dart';
import 'package:diga/core/theme/app_spacing.dart';
import 'package:diga/features/profile/presentation/widgets/profile_subpage_scaffold.dart';
import 'package:diga/shared/extensions/context_l10n.dart';
import 'package:diga/shared/widgets/diga_surface_card.dart';
import 'package:diga/shared/widgets/settings_section_card.dart';
import 'package:diga/shared/widgets/settings_tile.dart';
import 'package:flutter/material.dart';

class HelpSupportScreen extends StatelessWidget {
  const HelpSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);

    return ProfileSubpageScaffold(
      title: l10n.profileTileHelp,
      subtitle: l10n.profileHelpSubtitle,
      children: [
        SettingsSectionCard(
          children: [
            SettingsTile(
              icon: Icons.menu_book_outlined,
              title: l10n.profileHelpGuideTitle,
              subtitle: l10n.profileHelpGuideDesc,
              onTap: () => _snack(context, l10n.profileHelpGuideSnack),
            ),
            SettingsTile(
              icon: Icons.mail_outline_rounded,
              title: l10n.profileHelpEmailTitle,
              subtitle: l10n.profileHelpEmailValue,
              onTap: () => _snack(context, l10n.profileHelpEmailSnack),
            ),
            SettingsTile(
              icon: Icons.bug_report_outlined,
              title: l10n.profileHelpBugTitle,
              subtitle: l10n.profileHelpBugDesc,
              onTap: () => _snack(context, l10n.profileHelpBugSnack),
              showDivider: false,
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.lg),
        Text(
          l10n.profileHelpFaqTitle,
          style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800),
        ),
        const SizedBox(height: AppSpacing.sm),
        _FaqItem(question: l10n.profileHelpFaq1Q, answer: l10n.profileHelpFaq1A),
        _FaqItem(question: l10n.profileHelpFaq2Q, answer: l10n.profileHelpFaq2A),
        _FaqItem(question: l10n.profileHelpFaq3Q, answer: l10n.profileHelpFaq3A),
      ],
    );
  }

  void _snack(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), behavior: SnackBarBehavior.floating),
    );
  }
}

class _FaqItem extends StatelessWidget {
  const _FaqItem({required this.question, required this.answer});

  final String question;
  final String answer;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.sm),
      child: DigaSurfaceCard(
        padding: EdgeInsets.zero,
        elevation: CardElevation.subtle,
        child: ExpansionTile(
          tilePadding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
          childrenPadding: const EdgeInsets.fromLTRB(AppSpacing.md, 0, AppSpacing.md, AppSpacing.md),
          title: Text(
            question,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600),
          ),
          children: [
            Text(
              answer,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.textMuted,
                    height: 1.45,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
