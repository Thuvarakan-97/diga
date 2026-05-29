import 'package:diga/core/theme/app_spacing.dart';
import 'package:diga/features/profile/presentation/providers/profile_settings_provider.dart';
import 'package:diga/features/profile/presentation/widgets/profile_subpage_scaffold.dart';
import 'package:diga/features/profile/presentation/widgets/settings_switch_tile.dart';
import 'package:diga/shared/extensions/context_l10n.dart';
import 'package:diga/shared/widgets/info_banner.dart';
import 'package:diga/shared/widgets/settings_section_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NotificationsScreen extends ConsumerWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final prefs = ref.watch(notificationPreferencesProvider);
    final ctrl = ref.read(notificationPreferencesProvider.notifier);

    return ProfileSubpageScaffold(
      title: l10n.profileTileNotifications,
      subtitle: l10n.profileNotificationsSubtitle,
      children: [
        InfoBanner(
          title: l10n.profileNotificationsBannerTitle,
          message: l10n.profileNotificationsBannerBody,
          leadingIcon: Icons.notifications_active_outlined,
        ),
        const SizedBox(height: AppSpacing.lg),
        SettingsSectionCard(
          children: [
            SettingsSwitchTile(
              title: l10n.profileNotifModuleUpdates,
              subtitle: l10n.profileNotifModuleUpdatesDesc,
              value: prefs.moduleUpdates,
              onChanged: ctrl.setModuleUpdates,
            ),
            SettingsSwitchTile(
              title: l10n.profileNotifStreak,
              subtitle: l10n.profileNotifStreakDesc,
              value: prefs.streakReminders,
              onChanged: ctrl.setStreakReminders,
            ),
            SettingsSwitchTile(
              title: l10n.profileNotifWeeklyDigest,
              subtitle: l10n.profileNotifWeeklyDigestDesc,
              value: prefs.weeklyProgressDigest,
              onChanged: ctrl.setWeeklyDigest,
            ),
            SettingsSwitchTile(
              title: l10n.profileNotifEmail,
              subtitle: l10n.profileNotifEmailDesc,
              value: prefs.emailSummaries,
              onChanged: ctrl.setEmailSummaries,
            ),
            SettingsSwitchTile(
              title: l10n.profileNotifProduct,
              subtitle: l10n.profileNotifProductDesc,
              value: prefs.productUpdates,
              onChanged: ctrl.setProductUpdates,
              showDivider: false,
            ),
          ],
        ),
      ],
    );
  }
}
