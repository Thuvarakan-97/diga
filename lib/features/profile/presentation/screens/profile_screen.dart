import 'package:diga/core/constants/app_routes.dart';
import 'package:diga/core/locale/app_locale_provider.dart';
import 'package:diga/core/theme/app_colors.dart';
import 'package:diga/core/theme/app_radii.dart';
import 'package:diga/core/theme/app_spacing.dart';
import 'package:diga/features/auth/presentation/providers/auth_providers.dart';
import 'package:diga/features/gamification/presentation/providers/gamification_providers.dart';
import 'package:diga/features/gamification/presentation/widgets/level_progress_card.dart';
import 'package:diga/features/gamification/presentation/widgets/xp_summary_card.dart';
import 'package:diga/l10n/app_localizations.dart';
import 'package:diga/shared/extensions/context_l10n.dart';
import 'package:diga/shared/widgets/widgets.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:package_info_plus/package_info_plus.dart';

/// Account hub: identity, preferences, grouped settings, app meta, sign-out.
class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  String _displayName(WidgetRef ref, AppLocalizations l10n, bool demo) {
    final user = ref.watch(firebaseAuthStateProvider).valueOrNull;
    if (demo && user == null) {
      return l10n.profileDemoDisplayName;
    }
    if (user?.displayName != null && user!.displayName!.trim().isNotEmpty) {
      return user.displayName!.trim();
    }
    final email = user?.email;
    if (email != null && email.contains('@')) {
      return email.split('@').first;
    }
    if (user != null) {
      return l10n.homeDoctorFallback;
    }
    return l10n.profileDemoDisplayName;
  }

  Widget? _statusBanner(AppLocalizations l10n) {
    final firebaseReady = Firebase.apps.isNotEmpty;
    if (!firebaseReady) {
      return InfoBanner(
        title: l10n.profileBannerLocalTitle,
        message: l10n.profileBannerLocalBody,
        style: InfoBannerStyle.warning,
        leadingIcon: Icons.cloud_off_outlined,
      );
    }
    return null;
  }

  Widget? _demoBanner(AppLocalizations l10n, bool demo) {
    if (!demo) return null;
    if (Firebase.apps.isEmpty) return null;
    return InfoBanner(
      title: l10n.profileBannerDemoTitle,
      message: l10n.profileBannerDemoBody,
      style: InfoBannerStyle.info,
      leadingIcon: Icons.science_outlined,
    );
  }

  ({String label, Color fg, Color bg, Color border}) _envStyle(AppLocalizations l10n, bool demo) {
    if (Firebase.apps.isEmpty) {
      return (
        label: l10n.profileEnvironmentLocal,
        fg: AppColors.secondary,
        bg: AppColors.secondaryContainer.withValues(alpha: 0.85),
        border: AppColors.secondary.withValues(alpha: 0.2),
      );
    }
    if (demo) {
      return (
        label: l10n.profileEnvironmentDemo,
        fg: AppColors.warning,
        bg: AppColors.warningSoft,
        border: AppColors.warning.withValues(alpha: 0.22),
      );
    }
    return (
      label: l10n.profileEnvironmentConnected,
      fg: AppColors.success,
      bg: AppColors.successSoft,
      border: AppColors.success.withValues(alpha: 0.2),
    );
  }

  Future<void> _showAbout(BuildContext context, AppLocalizations l10n) async {
    final info = await PackageInfo.fromPlatform();
    if (!context.mounted) return;
    showAboutDialog(
      context: context,
      applicationName: l10n.appTitle,
      applicationVersion: l10n.profileVersionLine(info.version, info.buildNumber),
      applicationLegalese: l10n.profileAboutLegalese,
      children: [
        const SizedBox(height: AppSpacing.md),
        Text(l10n.profileAboutBody, style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }

  Future<void> _signOut(BuildContext context, WidgetRef ref) async {
    await ref.read(authRepositoryProvider).signOut();
    ref.read(demoModeProvider.notifier).state = false;
    if (context.mounted) context.go(AppRoutes.login);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    final language = ref.watch(appLanguageProvider);
    final demo = ref.watch(demoModeProvider);
    final user = ref.watch(firebaseAuthStateProvider).valueOrNull;
    final name = _displayName(ref, l10n, demo);
    final email = user?.email;
    final env = _envStyle(l10n, demo);
    final localBanner = _statusBanner(l10n);
    final demoBanner = _demoBanner(l10n, demo);
    final showSignOut = demo || user != null;
    final game = ref.watch(gamificationProfileProvider).valueOrNull;

    return Scaffold(
      backgroundColor: AppColors.surface,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.only(bottom: AppSpacing.xxl),
          children: [
            AppPageHeader(
              title: l10n.profileTitle,
              subtitle: l10n.profilePageSubtitle,
            ),
            const SizedBox(height: AppSpacing.sm),
            ProfileHeaderCard(
              displayName: name,
              roleLabel: l10n.profileRoleDoctor,
              email: email,
            ),
            if (localBanner != null) ...[
              const SizedBox(height: AppSpacing.md),
              localBanner,
            ],
            if (demoBanner != null) ...[
              const SizedBox(height: AppSpacing.md),
              demoBanner,
            ],
            if (game != null) ...[
              const SizedBox(height: AppSpacing.md),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.pageHorizontal),
                child: Row(
                  children: [
                    Expanded(child: XPSummaryCard(totalXp: game.xp.totalXp, weeklyGain: game.streak.sessionsThisWeek * 60)),
                    const SizedBox(width: AppSpacing.sm),
                    Expanded(child: LevelProgressCard(level: game.level)),
                  ],
                ),
              ),
            ],
            const SizedBox(height: AppSpacing.sectionGap),
            SectionHeader(title: l10n.profileSectionPreferences),
            const SizedBox(height: AppSpacing.sm),
            SettingsSectionCard(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                    AppSpacing.md,
                    AppSpacing.md,
                    AppSpacing.md,
                    AppSpacing.sm,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        l10n.profileLanguageHeading,
                        style: theme.textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: theme.colorScheme.onSurface,
                        ),
                      ),
                      const SizedBox(height: AppSpacing.xs),
                      Text(
                        l10n.profileLanguageDescription,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: AppColors.textMuted,
                          height: 1.4,
                        ),
                      ),
                      const SizedBox(height: AppSpacing.md),
                      SizedBox(
                        width: double.infinity,
                        child: SegmentedButton<AppLanguage>(
                          segments: [
                            ButtonSegment(
                              value: AppLanguage.en,
                              label: Padding(
                                padding: const EdgeInsets.symmetric(vertical: AppSpacing.xxs),
                                child: Text(l10n.profileLanguageEnglish),
                              ),
                            ),
                            ButtonSegment(
                              value: AppLanguage.de,
                              label: Padding(
                                padding: const EdgeInsets.symmetric(vertical: AppSpacing.xxs),
                                child: Text(l10n.profileLanguageGerman),
                              ),
                            ),
                          ],
                          selected: {language},
                          onSelectionChanged: (selected) {
                            ref.read(appLanguageProvider.notifier).state = selected.first;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.sectionGap),
            SectionHeader(title: l10n.profileSectionAccount),
            const SizedBox(height: AppSpacing.sm),
            SettingsSectionCard(
              children: [
                SettingsTile(
                  icon: Icons.badge_outlined,
                  title: l10n.profileTilePersonalDetails,
                  subtitle: l10n.profileTilePersonalDetailsDesc,
                  onTap: () => context.push(AppRoutes.profilePersonalDetails),
                ),
                SettingsTile(
                  icon: Icons.notifications_none_rounded,
                  title: l10n.profileTileNotifications,
                  subtitle: l10n.profileTileNotificationsDesc,
                  onTap: () => context.push(AppRoutes.profileNotifications),
                ),
                SettingsTile(
                  icon: Icons.shield_outlined,
                  title: l10n.profileTilePrivacy,
                  subtitle: l10n.profileTilePrivacyDesc,
                  onTap: () => context.push(AppRoutes.profilePrivacy),
                ),
                SettingsTile(
                  icon: Icons.help_outline_rounded,
                  title: l10n.profileTileHelp,
                  subtitle: l10n.profileTileHelpDesc,
                  onTap: () => context.push(AppRoutes.profileHelp),
                ),
                SettingsTile(
                  icon: Icons.info_outline_rounded,
                  title: l10n.profileTileAbout,
                  subtitle: l10n.appTitle,
                  onTap: () => _showAbout(context, l10n),
                  showDivider: false,
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.sectionGap),
            SectionHeader(title: l10n.profileSectionAppInfo),
            const SizedBox(height: AppSpacing.sm),
            SettingsSectionCard(
              children: [
                _ProfileAppMetaBlock(
                  l10n: l10n,
                  envLabel: env.label,
                  envForeground: env.fg,
                  envBackground: env.bg,
                  envBorder: env.border,
                ),
              ],
            ),
            if (showSignOut) ...[
              const SizedBox(height: AppSpacing.sectionGap),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.pageHorizontal),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      l10n.profileSignOutHint,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: AppColors.textMuted,
                        height: 1.45,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.md),
                    OutlinedButton.icon(
                      onPressed: () => _signOut(context, ref),
                      icon: const Icon(Icons.logout_rounded, size: 20),
                      label: Text(l10n.authSignOut),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: AppColors.danger,
                        iconColor: AppColors.danger,
                        side: BorderSide(color: AppColors.danger.withValues(alpha: 0.35)),
                        padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(AppRadii.md),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _ProfileAppMetaBlock extends StatefulWidget {
  const _ProfileAppMetaBlock({
    required this.l10n,
    required this.envLabel,
    required this.envForeground,
    required this.envBackground,
    required this.envBorder,
  });

  final AppLocalizations l10n;
  final String envLabel;
  final Color envForeground;
  final Color envBackground;
  final Color envBorder;

  @override
  State<_ProfileAppMetaBlock> createState() => _ProfileAppMetaBlockState();
}

class _ProfileAppMetaBlockState extends State<_ProfileAppMetaBlock> {
  late final Future<PackageInfo> _packageInfo = PackageInfo.fromPlatform();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return FutureBuilder<PackageInfo>(
      future: _packageInfo,
      builder: (context, snap) {
        final version = snap.data?.version ?? '—';
        final build = snap.data?.buildNumber ?? '—';
        return Padding(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.l10n.profileVersionLine(version, build),
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: theme.colorScheme.onSurface,
                ),
              ),
              const SizedBox(height: AppSpacing.md),
              Row(
                children: [
                  Text(
                    widget.l10n.profileAppStatusLabel,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: AppColors.textMuted,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  _EnvCapsule(
                    label: widget.envLabel,
                    foreground: widget.envForeground,
                    background: widget.envBackground,
                    borderColor: widget.envBorder,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class _EnvCapsule extends StatelessWidget {
  const _EnvCapsule({
    required this.label,
    required this.foreground,
    required this.background,
    required this.borderColor,
  });

  final String label;
  final Color foreground;
  final Color background;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm, vertical: AppSpacing.xxs),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(AppRadii.pill),
        border: Border.all(color: borderColor),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: foreground,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.15,
            ),
      ),
    );
  }
}


