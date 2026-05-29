import 'package:diga/core/constants/app_routes.dart';
import 'package:diga/core/theme/app_colors.dart';
import 'package:diga/core/theme/app_spacing.dart';
import 'package:diga/features/ai_support/presentation/providers/ai_support_providers.dart';
import 'package:diga/features/gamification/presentation/providers/gamification_providers.dart';
import 'package:diga/features/gamification/presentation/widgets/badge_card.dart';
import 'package:diga/features/gamification/presentation/widgets/level_progress_card.dart';
import 'package:diga/features/gamification/presentation/widgets/recommendation_card.dart';
import 'package:diga/features/gamification/presentation/widgets/streak_card.dart';
import 'package:diga/features/gamification/presentation/widgets/xp_summary_card.dart';
import 'package:diga/features/progress/presentation/data/progress_mock_data.dart';
import 'package:diga/features/progress/presentation/widgets/learning_trend_panel.dart';
import 'package:diga/l10n/app_localizations.dart';
import 'package:diga/shared/extensions/context_l10n.dart';
import 'package:diga/shared/widgets/app_page_header.dart';
import 'package:diga/shared/widgets/empty_state_view.dart';
import 'package:diga/shared/widgets/module_performance_card.dart';
import 'package:diga/shared/widgets/progress_overview_card.dart';
import 'package:diga/shared/widgets/recent_result_tile.dart';
import 'package:diga/shared/widgets/section_header.dart';
import 'package:diga/shared/widgets/summary_stat_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ProgressDashboardScreen extends ConsumerWidget {
  const ProgressDashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final snapshot = ProgressMockData.build(l10n);

    return Scaffold(
      backgroundColor: AppColors.surface,
      body: SafeArea(
        child: snapshot.hasProgress
            ? _ProgressBody(snapshot: snapshot)
            : ListView(
                padding: const EdgeInsets.only(bottom: AppSpacing.xxl),
                children: [
                  AppPageHeader(title: l10n.progressTitle, subtitle: l10n.progressPageSubtitle),
                  EmptyStateView(
                    icon: Icons.insights_outlined,
                    title: l10n.progressEmptyTitle,
                    message: l10n.progressEmptyBody,
                    actionLabel: l10n.progressEmptyCta,
                    onAction: () => context.go(AppRoutes.modules),
                  ),
                ],
              ),
      ),
    );
  }
}

class _ProgressBody extends ConsumerWidget {
  const _ProgressBody({required this.snapshot});

  final ProgressSnapshot snapshot;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final gamification = ref.watch(gamificationProfileProvider).valueOrNull;
    final recommendation = ref.watch(aiRecommendationProvider).valueOrNull;

    return ListView(
      padding: const EdgeInsets.only(bottom: AppSpacing.xxl),
      children: [
        AppPageHeader(title: l10n.progressTitle, subtitle: l10n.progressPageSubtitle),
        if (gamification != null) ...[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.pageHorizontal),
            child: Row(
              children: [
                Expanded(child: XPSummaryCard(totalXp: gamification.xp.totalXp, weeklyGain: gamification.streak.sessionsThisWeek * 60)),
                const SizedBox(width: AppSpacing.sm),
                Expanded(child: StreakCard(streak: gamification.streak)),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.pageHorizontal),
            child: LevelProgressCard(level: gamification.level),
          ),
          const SizedBox(height: AppSpacing.sectionGap),
          SectionHeader(title: 'Earned badges'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.pageHorizontal),
            child: Column(
              children: [
                for (final badge in gamification.badges.where((e) => e.unlocked)) ...[
                  BadgeCard(badge: badge),
                  const SizedBox(height: AppSpacing.sm),
                ],
              ],
            ),
          ),
          if (recommendation != null) ...[
            const SizedBox(height: AppSpacing.md),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.pageHorizontal),
              child: RecommendationCard(
                recommendation: recommendation,
                onTap: () => context.push(AppRoutes.moduleDetail(recommendation.nextModuleId)),
              ),
            ),
          ],
          const SizedBox(height: AppSpacing.sectionGap),
        ],
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.pageHorizontal),
          child: LayoutBuilder(
            builder: (context, c) {
              final wide = c.maxWidth >= 840;
              final cross = wide ? 4 : 2;
              final aspect = wide ? 1.22 : 1.38;
              return GridView.count(
                crossAxisCount: cross,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: AppSpacing.sm,
                mainAxisSpacing: AppSpacing.sm,
                childAspectRatio: aspect,
                children: [
                  SummaryStatCard(icon: Icons.check_circle_outline_rounded, label: l10n.progressStatModulesDone, value: '${snapshot.modulesCompleted}', iconBackground: AppColors.successSoft, iconColor: AppColors.success),
                  SummaryStatCard(icon: Icons.stacked_line_chart_rounded, label: l10n.progressStatAvgScore, value: snapshot.avgScoreDisplay),
                  SummaryStatCard(icon: Icons.center_focus_strong_rounded, label: l10n.progressStatAccuracy, value: snapshot.accuracyDisplay, iconBackground: AppColors.accentSoft.withValues(alpha: 0.5), iconColor: AppColors.accent),
                  SummaryStatCard(icon: Icons.calendar_view_week_rounded, label: l10n.progressStatWeeklySessions, value: snapshot.weeklySessionsDisplay, iconBackground: AppColors.warningSoft, iconColor: AppColors.warning),
                ],
              );
            },
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.pageHorizontal),
          child: ProgressOverviewCard(
            title: l10n.progressOverviewTitle,
            fractionLabel: snapshot.fractionLabel,
            completed: snapshot.modulesCompleted,
            total: snapshot.modulesTotal,
            hint: snapshot.overviewHint,
          ),
        ),
        const SizedBox(height: AppSpacing.sectionGap),
        SectionHeader(title: l10n.progressSectionRecent),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.pageHorizontal),
          child: Column(
            children: [
              for (final r in snapshot.recent) ...[
                RecentResultTile(
                  moduleTitle: r.title,
                  condition: r.condition,
                  scoreLabel: r.score,
                  dateLabel: r.date,
                  statusLabel: r.completed ? l10n.progressStatusCompleted : l10n.progressStatusInProgress,
                  completedStyle: r.completed,
                  onTap: () => context.push(AppRoutes.moduleDetail(r.moduleId)),
                ),
                const SizedBox(height: AppSpacing.sm),
              ],
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.sectionGap),
        SectionHeader(title: l10n.progressSectionPerformance),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.pageHorizontal),
          child: LayoutBuilder(
            builder: (context, c) {
              if (c.maxWidth >= 720) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (var i = 0; i < snapshot.performance.length; i++) ...[
                      if (i > 0) const SizedBox(width: AppSpacing.sm),
                      Expanded(child: _perfCard(context, snapshot.performance[i], l10n)),
                    ],
                  ],
                );
              }
              return Column(
                children: [
                  for (final p in snapshot.performance) ...[
                    _perfCard(context, p, l10n),
                    const SizedBox(height: AppSpacing.sm),
                  ],
                ],
              );
            },
          ),
        ),
        const SizedBox(height: AppSpacing.sectionGap),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.pageHorizontal),
          child: LearningTrendPanel(
            title: l10n.progressSectionTrend,
            caption: l10n.progressTrendCaption,
            values: snapshot.trendValues,
            dayLabels: snapshot.trendDayLabels,
          ),
        ),
      ],
    );
  }

  Widget _perfCard(BuildContext context, ModulePerfItem p, AppLocalizations l10n) {
    return ModulePerformanceCard(
      title: p.title,
      subtitle: p.subtitle,
      scorePercent: p.scorePercent,
      progress: p.progress,
      attemptsLabel: l10n.progressAttemptsCount(p.attempts),
      lastActiveLabel: p.lastActive,
      onTap: () => context.push(AppRoutes.moduleDetail(p.moduleId)),
    );
  }
}

