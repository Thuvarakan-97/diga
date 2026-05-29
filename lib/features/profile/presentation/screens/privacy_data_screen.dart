import 'package:diga/core/theme/app_spacing.dart';
import 'package:diga/features/profile/presentation/widgets/profile_subpage_scaffold.dart';
import 'package:diga/l10n/app_localizations.dart';
import 'package:diga/shared/extensions/context_l10n.dart';
import 'package:diga/shared/widgets/diga_surface_card.dart';
import 'package:diga/shared/widgets/info_banner.dart';
import 'package:diga/shared/widgets/settings_section_card.dart';
import 'package:diga/shared/widgets/settings_tile.dart';
import 'package:flutter/material.dart';

class PrivacyDataScreen extends StatelessWidget {
  const PrivacyDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return ProfileSubpageScaffold(
      title: l10n.profileTilePrivacy,
      subtitle: l10n.profilePrivacySubtitle,
      children: [
        InfoBanner(
          title: l10n.profilePrivacyBannerTitle,
          message: l10n.profilePrivacyBannerBody,
          leadingIcon: Icons.shield_outlined,
          style: InfoBannerStyle.info,
        ),
        const SizedBox(height: AppSpacing.lg),
        DigaSurfaceCard(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: Text(
            l10n.profilePrivacyDataBody,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(height: 1.45),
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        SettingsSectionCard(
          children: [
            SettingsTile(
              icon: Icons.download_outlined,
              title: l10n.profilePrivacyExportTitle,
              subtitle: l10n.profilePrivacyExportDesc,
              onTap: () => _snack(context, l10n.profilePrivacyExportSnack),
            ),
            SettingsTile(
              icon: Icons.history_rounded,
              title: l10n.profilePrivacyActivityTitle,
              subtitle: l10n.profilePrivacyActivityDesc,
              onTap: () => _snack(context, l10n.profilePrivacyActivitySnack),
            ),
            SettingsTile(
              icon: Icons.delete_outline_rounded,
              title: l10n.profilePrivacyDeleteTitle,
              subtitle: l10n.profilePrivacyDeleteDesc,
              onTap: () => _confirmDelete(context, l10n),
              showDivider: false,
            ),
          ],
        ),
      ],
    );
  }

  void _snack(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), behavior: SnackBarBehavior.floating),
    );
  }

  void _confirmDelete(BuildContext context, AppLocalizations l10n) {
    showDialog<void>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(l10n.profilePrivacyDeleteDialogTitle),
        content: Text(l10n.profilePrivacyDeleteDialogBody),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: Text(l10n.profilePrivacyCancel)),
          FilledButton(
            onPressed: () {
              Navigator.pop(ctx);
              _snack(context, l10n.profilePrivacyDeleteDemoSnack);
            },
            child: Text(l10n.profilePrivacyDeleteConfirm),
          ),
        ],
      ),
    );
  }
}
