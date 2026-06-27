import 'package:diga/core/constants/app_routes.dart';
import 'package:diga/core/theme/app_colors.dart';
import 'package:diga/core/theme/app_radii.dart';
import 'package:diga/core/theme/app_spacing.dart';
import 'package:diga/features/diga_modules/presentation/models/clinical_domain_data.dart';
import 'package:diga/features/progress/presentation/data/progress_mock_data.dart';
import 'package:diga/shared/extensions/context_l10n.dart';
import 'package:diga/shared/widgets/app_page_header.dart';
import 'package:diga/shared/widgets/empty_state_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProgressDashboardScreen extends StatelessWidget {
  const ProgressDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
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

class _ProgressBody extends StatelessWidget {
  const _ProgressBody({required this.snapshot});

  final ProgressSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    final domains = ClinicalDomainData.domains;

    return ListView(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.pageHorizontal,
        0,
        AppSpacing.pageHorizontal,
        AppSpacing.xxl,
      ),
      children: [
        AppPageHeader(
          title: context.l10n.progressTitle,
          subtitle: 'Track domain mastery and scenario outcomes',
        ),
        Row(
          children: [
            Expanded(
              child: _KpiCard(
                value: '${snapshot.modulesCompleted}/${snapshot.modulesTotal}',
                label: 'Modules done',
                sub: 'Target: complete all core tracks',
              ),
            ),
            const SizedBox(width: AppSpacing.sm),
            Expanded(
              child: _KpiCard(
                value: snapshot.avgScoreDisplay,
                label: 'Average score',
                sub: '${snapshot.weeklySessionsDisplay} sessions this week',
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.md),
        _DomainProgressPanel(domains: domains),
        const SizedBox(height: AppSpacing.md),
        Text(
          'Recent outcomes',
          style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w800),
        ),
        const SizedBox(height: AppSpacing.sm),
        for (final r in snapshot.recent) ...[
          _RecentOutcomeCard(
            title: r.title,
            subtitle: r.condition,
            score: r.score,
            status: r.completed ? 'Completed' : 'In progress',
            onTap: () => context.push(AppRoutes.moduleDetail(r.moduleId)),
          ),
          const SizedBox(height: AppSpacing.sm),
        ],
        const SizedBox(height: AppSpacing.md),
        Text(
          'Performance by module',
          style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w800),
        ),
        const SizedBox(height: AppSpacing.sm),
        for (final p in snapshot.performance) ...[
          _PerfCard(
            item: p,
            onTap: () => context.push(AppRoutes.moduleDetail(p.moduleId)),
          ),
          const SizedBox(height: AppSpacing.sm),
        ],
      ],
    );
  }
}

class _KpiCard extends StatelessWidget {
  const _KpiCard({required this.value, required this.label, required this.sub});
  final String value;
  final String label;
  final String sub;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(AppRadii.lg),
        border: Border.all(color: AppColors.outline.withValues(alpha: 0.35)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(value, style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w800)),
          const SizedBox(height: 2),
          Text(label, style: Theme.of(context).textTheme.bodyMedium),
          const SizedBox(height: 2),
          Text(sub, style: Theme.of(context).textTheme.labelSmall?.copyWith(color: AppColors.textMuted)),
        ],
      ),
    );
  }
}

class _DomainProgressPanel extends StatelessWidget {
  const _DomainProgressPanel({required this.domains});
  final List<ClinicalDomain> domains;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(AppRadii.lg),
        border: Border.all(color: AppColors.outline.withValues(alpha: 0.35)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Domain progression',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: AppSpacing.sm),
          for (final d in domains) ...[
            Text(d.name, style: Theme.of(context).textTheme.labelLarge),
            const SizedBox(height: 4),
            Row(
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(AppRadii.pill),
                    child: LinearProgressIndicator(
                      value: d.progress / 100,
                      minHeight: 5,
                      color: AppColors.primary,
                      backgroundColor: AppColors.outline.withValues(alpha: 0.35),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Text('${d.progress}%'),
              ],
            ),
            const SizedBox(height: AppSpacing.sm),
          ],
        ],
      ),
    );
  }
}

class _RecentOutcomeCard extends StatelessWidget {
  const _RecentOutcomeCard({
    required this.title,
    required this.subtitle,
    required this.score,
    required this.status,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final String score;
  final String status;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: AppColors.card,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadii.lg),
        side: BorderSide(color: AppColors.outline.withValues(alpha: 0.35)),
      ),
      title: Text(title, style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w700)),
      subtitle: Text('$subtitle · $status'),
      trailing: Text(score, style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w800)),
      onTap: onTap,
    );
  }
}

class _PerfCard extends StatelessWidget {
  const _PerfCard({required this.item, required this.onTap});
  final ModulePerfItem item;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppRadii.lg),
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(AppRadii.lg),
          border: Border.all(color: AppColors.outline.withValues(alpha: 0.35)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(item.title, style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w700)),
                ),
                Text('${item.scorePercent}%'),
              ],
            ),
            const SizedBox(height: 4),
            Text(item.subtitle, style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.textMuted)),
            const SizedBox(height: 8),
            ClipRRect(
              borderRadius: BorderRadius.circular(AppRadii.pill),
              child: LinearProgressIndicator(
                value: item.progress,
                minHeight: 5,
                color: AppColors.primary,
                backgroundColor: AppColors.outline.withValues(alpha: 0.35),
              ),
            ),
            const SizedBox(height: 6),
            Text(
              '${item.attempts} attempts · ${item.lastActive}',
              style: Theme.of(context).textTheme.labelSmall?.copyWith(color: AppColors.textMuted),
            ),
          ],
        ),
      ),
    );
  }
}
