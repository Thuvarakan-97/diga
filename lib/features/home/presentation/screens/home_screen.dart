import 'package:diga/core/constants/app_routes.dart';
import 'package:diga/core/theme/app_colors.dart';
import 'package:diga/core/theme/app_spacing.dart';
import 'package:diga/features/ai_support/presentation/providers/ai_support_providers.dart';
import 'package:diga/features/auth/presentation/providers/auth_providers.dart';
import 'package:diga/features/gamification/presentation/providers/gamification_providers.dart';
import 'package:diga/features/gamification/presentation/widgets/achievement_banner.dart';
import 'package:diga/features/gamification/presentation/widgets/badge_card.dart';
import 'package:diga/features/gamification/presentation/widgets/level_progress_card.dart';
import 'package:diga/features/gamification/presentation/widgets/recommendation_card.dart';
import 'package:diga/features/gamification/presentation/widgets/streak_card.dart';
import 'package:diga/features/gamification/presentation/widgets/xp_summary_card.dart';
import 'package:diga/features/home/presentation/widgets/continue_learning_card.dart';
import 'package:diga/l10n/app_localizations.dart';
import 'package:diga/shared/extensions/context_l10n.dart';
import 'package:diga/shared/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  static const _previewEmptyRecent = false;

  String _greeting(AppLocalizations l10n) {
    final h = DateTime.now().hour;
    if (h < 12) return l10n.homeGreetingMorning;
    if (h < 17) return l10n.homeGreetingAfternoon;
    return l10n.homeGreetingEvening;
  }

  String _displayName(WidgetRef ref, AppLocalizations l10n) {
    final user = ref.watch(firebaseAuthStateProvider).valueOrNull;
    if (user?.displayName != null && user!.displayName!.trim().isNotEmpty) {
      return user.displayName!.trim();
    }
    final email = user?.email;
    if (email != null && email.contains('@')) {
      return email.split('@').first;
    }
    return l10n.homeDoctorFallback;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    final name = _displayName(ref, l10n);
    final gamification = ref.watch(gamificationProfileProvider);
    final recommendation = ref.watch(aiRecommendationProvider).valueOrNull;

    return Scaffold(
      backgroundColor: AppColors.surface,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: AppPageHeader(
              title: '${_greeting(l10n)}, $name',
              subtitle: l10n.homeDashboardSubtitle,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.pageHorizontal),
              child: ContinueLearningCard(
                title: l10n.homeContinueTitle,
                moduleName: l10n.homeContinueModule,
                phaseLine: l10n.homeContinuePhase,
                hint: l10n.homeContinueHint,
                ctaLabel: l10n.homeContinueCta,
                onPressed: () => context.push(AppRoutes.simulationPrescribe('vivira')),
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: AppSpacing.sectionGap)),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.pageHorizontal),
              child: Text(
                'Gamification overview',
                style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800, color: const Color(0xFF1C252C)),
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: AppSpacing.sm)),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.pageHorizontal),
              child: gamification.maybeWhen(
                data: (profile) => Column(
                  children: [
                    Row(
                      children: [
                        Expanded(child: XPSummaryCard(totalXp: profile.xp.totalXp, weeklyGain: profile.streak.sessionsThisWeek * 60)),
                        const SizedBox(width: AppSpacing.sm),
                        Expanded(child: StreakCard(streak: profile.streak)),
                      ],
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    LevelProgressCard(level: profile.level),
                    if (profile.recentAchievements.isNotEmpty) ...[
                      const SizedBox(height: AppSpacing.sm),
                      AchievementBanner(achievement: profile.recentAchievements.first),
                    ],
                    if (recommendation != null) ...[
                      const SizedBox(height: AppSpacing.sm),
                      RecommendationCard(
                        recommendation: recommendation,
                        onTap: () => context.push(AppRoutes.moduleDetail(recommendation.nextModuleId)),
                      ),
                    ],
                  ],
                ),
                orElse: () => const LoadingSkeleton(height: 220),
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: AppSpacing.sectionGap)),
          SliverToBoxAdapter(child: SectionHeader(title: 'Badge preview', trailingLabel: l10n.homeSeeModules, onTrailingTap: () => context.go(AppRoutes.progress))),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 102,
              child: gamification.maybeWhen(
                data: (profile) => ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: AppSpacing.pageHorizontal),
                  scrollDirection: Axis.horizontal,
                  itemCount: profile.badges.length,
                  separatorBuilder: (context, index) => const SizedBox(width: AppSpacing.sm),
                  itemBuilder: (context, index) => SizedBox(width: 280, child: BadgeCard(badge: profile.badges[index])),
                ),
                orElse: () => const SizedBox.shrink(),
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: AppSpacing.sectionGap)),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.pageHorizontal),
              child: Text(
                l10n.homeStatsTitle,
                style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700, color: const Color(0xFF1C252C)),
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: AppSpacing.sm)),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.pageHorizontal),
              child: Row(
                children: [
                  MetricTile(icon: Icons.check_circle_outline_rounded, label: l10n.homeMetricModules, value: '2', iconBackground: AppColors.successSoft, iconColor: AppColors.success),
                  const SizedBox(width: AppSpacing.sm),
                  MetricTile(icon: Icons.center_focus_strong_rounded, label: l10n.homeMetricAccuracy, value: '87%', iconBackground: AppColors.primaryContainer.withValues(alpha: 0.7), iconColor: AppColors.primary),
                  const SizedBox(width: AppSpacing.sm),
                  MetricTile(icon: Icons.local_fire_department_outlined, label: l10n.homeMetricStreak, value: '3', iconBackground: AppColors.warningSoft, iconColor: AppColors.warning),
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: AppSpacing.sectionGap)),
          SliverToBoxAdapter(
            child: SectionHeader(
              title: l10n.homeSectionRecommended,
              trailingLabel: l10n.homeSeeModules,
              onTrailingTap: () => context.go(AppRoutes.modules),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.pageHorizontal),
              child: Column(
                children: [
                  DigaModuleCard(
                    title: l10n.moduleKalmedaDemo,
                    condition: l10n.moduleKalmedaSubtitle,
                    description: l10n.homeModuleDescKalmeda,
                    durationLabel: l10n.homeDuration12,
                    tagLabel: l10n.homeTagEnt,
                    verifiedLabel: l10n.homeVerifiedApr2025,
                    ctaLabel: l10n.homeCtaContinue,
                    onTap: () => context.push(AppRoutes.moduleDetail('kalmeda')),
                    onCta: () => context.push(AppRoutes.simulationDiagnose('kalmeda')),
                  ),
                  const SizedBox(height: AppSpacing.md),
                  DigaModuleCard(
                    title: l10n.moduleViviraDemo,
                    condition: l10n.moduleViviraSubtitle,
                    description: l10n.homeModuleDescVivira,
                    durationLabel: l10n.homeDuration20,
                    tagLabel: l10n.homeTagGp,
                    verifiedLabel: l10n.homeVerifiedApr2025,
                    ctaLabel: l10n.homeCtaStart,
                    onTap: () => context.push(AppRoutes.moduleDetail('vivira')),
                    onCta: () => context.push(AppRoutes.simulationDiagnose('vivira')),
                  ),
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: AppSpacing.sectionGap)),
          SliverToBoxAdapter(
            child: SectionHeader(
              title: l10n.homeSectionRecent,
              trailingLabel: l10n.homeSeeModules,
              onTrailingTap: () => context.go(AppRoutes.progress),
            ),
          ),
          if (_previewEmptyRecent)
            SliverToBoxAdapter(
              child: EmptyStateView(
                icon: Icons.history_rounded,
                title: l10n.homeEmptyActivityTitle,
                message: l10n.homeEmptyActivityBody,
                actionLabel: l10n.homeEmptyCta,
                onAction: () => context.go(AppRoutes.modules),
              ),
            )
          else
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.pageHorizontal),
                child: DigaSurfaceCard(
                  padding: const EdgeInsets.symmetric(vertical: AppSpacing.xs),
                  elevation: CardElevation.subtle,
                  child: Column(
                    children: [
                      _RecentTile(icon: Icons.verified_rounded, iconColor: AppColors.success, iconBg: AppColors.successSoft, title: l10n.homeRecentItem1Title, subtitle: l10n.homeRecentItem1Subtitle),
                      const Divider(height: 1),
                      _RecentTile(icon: Icons.article_outlined, iconColor: AppColors.accent, iconBg: AppColors.accentSoft.withValues(alpha: 0.35), title: l10n.homeRecentItem2Title, subtitle: l10n.homeRecentItem2Subtitle),
                    ],
                  ),
                ),
              ),
            ),
          const SliverToBoxAdapter(child: SizedBox(height: AppSpacing.xxl)),
        ],
      ),
    );
  }
}

class _RecentTile extends StatelessWidget {
  const _RecentTile({required this.icon, required this.iconColor, required this.iconBg, required this.title, required this.subtitle});

  final IconData icon;
  final Color iconColor;
  final Color iconBg;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: AppSpacing.xs),
      leading: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(color: iconBg, borderRadius: BorderRadius.circular(12)),
        child: Icon(icon, color: iconColor, size: 22),
      ),
      title: Text(title, style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600)),
      subtitle: Text(subtitle, style: theme.textTheme.bodySmall?.copyWith(color: AppColors.textMuted)),
      trailing: Icon(Icons.chevron_right_rounded, color: AppColors.textMuted.withValues(alpha: 0.6)),
      onTap: () => context.go(AppRoutes.progress),
    );
  }
}


