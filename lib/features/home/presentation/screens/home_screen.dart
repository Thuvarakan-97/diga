import 'package:diga/core/constants/app_routes.dart';
import 'package:diga/core/theme/app_colors.dart';
import 'package:diga/core/theme/app_radii.dart';
import 'package:diga/core/theme/app_spacing.dart';
import 'package:diga/features/auth/presentation/providers/auth_providers.dart';
import 'package:diga/features/diga_modules/presentation/models/clinical_domain_data.dart';
import 'package:diga/features/diga_modules/presentation/widgets/clinical_domain_card.dart';
import 'package:diga/features/diga_modules/presentation/widgets/domain_cover_illustration.dart';
import 'package:diga/features/diga_modules/presentation/widgets/domain_visuals.dart';
import 'package:diga/shared/extensions/context_l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  String _greeting(BuildContext context) {
    final l10n = context.l10n;
    final h = DateTime.now().hour;
    if (h < 12) return l10n.homeGreetingMorning;
    if (h < 17) return l10n.homeGreetingAfternoon;
    return l10n.homeGreetingEvening;
  }

  String _displayName(WidgetRef ref, BuildContext context) {
    final l10n = context.l10n;
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
    final name = _displayName(ref, context);
    final domains = ClinicalDomainData.domains;
    final continueDomain = ClinicalDomainData.byId('mental');
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: AppColors.surface,
      body: ListView(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.pageHorizontal,
          AppSpacing.sm,
          AppSpacing.pageHorizontal,
          AppSpacing.xxl,
        ),
        children: [
          _HeroBanner(greeting: _greeting(context), name: name, subtitle: l10n.homeDashboardSubtitle),
          const SizedBox(height: AppSpacing.lg),
          Text(
            l10n.homeStatsTitle.toUpperCase(),
            style: theme.textTheme.labelSmall?.copyWith(
              letterSpacing: 0.8,
              fontWeight: FontWeight.w700,
              color: AppColors.textMuted,
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          const Row(
            children: [
              Expanded(
                child: _StatCard(
                  value: '7',
                  label: 'Day streak',
                  sub: '🔥 Personal best',
                  icon: Icons.local_fire_department_rounded,
                  tint: Color(0xFFFF7043),
                ),
              ),
              SizedBox(width: AppSpacing.sm),
              Expanded(
                child: _StatCard(
                  value: '24',
                  label: 'Completed',
                  sub: '+3 this week',
                  icon: Icons.check_circle_outline_rounded,
                  tint: AppColors.success,
                ),
              ),
              SizedBox(width: AppSpacing.sm),
              Expanded(
                child: _StatCard(
                  value: '83%',
                  label: 'Accuracy',
                  sub: '+4.1% last week',
                  icon: Icons.trending_up_rounded,
                  tint: AppColors.primary,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.lg),
          Row(
            children: [
              Expanded(
                child: Text(
                  l10n.homeContinueTitle.toUpperCase(),
                  style: theme.textTheme.labelSmall?.copyWith(
                    letterSpacing: 0.8,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textMuted,
                  ),
                ),
              ),
              TextButton(
                onPressed: () => context.go(AppRoutes.modules),
                child: Text(l10n.homeSeeModules),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.xs),
          _ContinueCard(
            domain: continueDomain,
            scenarioTitle: continueDomain.scenarios.first.title,
            onTap: () => context.push('/modules/mental'),
          ),
          const SizedBox(height: AppSpacing.lg),
          Text(
            'ALL DOMAINS',
            style: theme.textTheme.labelSmall?.copyWith(
              letterSpacing: 0.8,
              fontWeight: FontWeight.w700,
              color: AppColors.textMuted,
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 280,
              crossAxisSpacing: AppSpacing.sm,
              mainAxisSpacing: AppSpacing.sm,
              childAspectRatio: 0.72,
            ),
            itemCount: domains.length,
            itemBuilder: (context, index) {
              final d = domains[index];
              return ClinicalDomainCard(
                domain: d,
                compact: true,
                showScenarioCount: true,
                onTap: () => context.push('/modules/${d.id}'),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _HeroBanner extends StatelessWidget {
  const _HeroBanner({
    required this.greeting,
    required this.name,
    required this.subtitle,
  });

  final String greeting;
  final String name;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.primaryDark, AppColors.primary, AppColors.primaryLight],
        ),
        borderRadius: BorderRadius.circular(AppRadii.lg),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.28),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$greeting, $name 👋',
            style: theme.textTheme.titleLarge?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            subtitle,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: Colors.white.withValues(alpha: 0.88),
              height: 1.4,
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.16),
                  borderRadius: BorderRadius.circular(AppRadii.pill),
                ),
                child: const Text(
                  'Level 12',
                  style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w700),
                ),
              ),
              const SizedBox(width: AppSpacing.sm),
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(AppRadii.pill),
                  child: LinearProgressIndicator(
                    value: 0.34,
                    minHeight: 6,
                    color: AppColors.accentSoft,
                    backgroundColor: Colors.white.withValues(alpha: 0.22),
                  ),
                ),
              ),
              const SizedBox(width: AppSpacing.sm),
              Text(
                '3,450 / 5,000 XP',
                style: theme.textTheme.labelSmall?.copyWith(
                  color: Colors.white.withValues(alpha: 0.92),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  const _StatCard({
    required this.value,
    required this.label,
    required this.sub,
    required this.icon,
    required this.tint,
  });

  final String value;
  final String label;
  final String sub;
  final IconData icon;
  final Color tint;

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(AppSpacing.sm),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(AppRadii.md),
        border: Border.all(color: AppColors.outline.withValues(alpha: 0.3)),
        boxShadow: [
          BoxShadow(
            color: tint.withValues(alpha: 0.08),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 16, color: tint),
              const Spacer(),
            ],
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(value, style: t.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800, color: tint)),
          Text(label, style: t.textTheme.bodySmall),
          Text(sub, style: t.textTheme.labelSmall?.copyWith(color: tint, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}

class _ContinueCard extends StatelessWidget {
  const _ContinueCard({
    required this.domain,
    required this.scenarioTitle,
    required this.onTap,
  });

  final ClinicalDomain domain;
  final String scenarioTitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final visuals = DomainVisuals.forId(domain.id);
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(AppRadii.lg),
        onTap: onTap,
        child: Ink(
          decoration: BoxDecoration(
            color: AppColors.card,
            borderRadius: BorderRadius.circular(AppRadii.lg),
            border: Border.all(color: AppColors.outline.withValues(alpha: 0.3)),
            boxShadow: [
              BoxShadow(
                color: visuals.glow.withValues(alpha: 0.14),
                blurRadius: 14,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(AppRadii.lg),
            child: IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    width: 108,
                    child: DomainCoverIllustration(
                      domain: domain,
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(AppSpacing.md),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                                decoration: BoxDecoration(
                                  color: visuals.accent,
                                  borderRadius: BorderRadius.circular(AppRadii.pill),
                                ),
                                child: Text(
                                  domain.name,
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w700,
                                    color: visuals.gradient.first,
                                  ),
                                ),
                              ),
                              const Spacer(),
                              Icon(Icons.play_circle_fill_rounded, color: visuals.gradient.first),
                            ],
                          ),
                          const SizedBox(height: AppSpacing.sm),
                          Text(
                            scenarioTitle,
                            style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w800),
                          ),
                          const SizedBox(height: AppSpacing.xxs),
                          Text(
                            'Step 2 of 4 · Scenario 1.1',
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.textMuted),
                          ),
                          const SizedBox(height: AppSpacing.sm),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(AppRadii.pill),
                            child: LinearProgressIndicator(
                              value: 0.33,
                              minHeight: 4,
                              color: visuals.gradient.first,
                              backgroundColor: AppColors.outline.withValues(alpha: 0.35),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
