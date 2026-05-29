import 'package:diga/core/constants/app_routes.dart';
import 'package:diga/core/theme/app_colors.dart';
import 'package:diga/core/theme/app_radii.dart';
import 'package:diga/core/theme/app_spacing.dart';
import 'package:diga/features/diga_modules/presentation/models/module_card_data.dart';
import 'package:diga/l10n/app_localizations.dart';
import 'package:diga/shared/extensions/context_l10n.dart';
import 'package:diga/shared/widgets/app_page_header.dart';
import 'package:diga/shared/widgets/empty_state_view.dart';
import 'package:diga/shared/widgets/module_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// DiGA catalog: header → search → specialty filters → [ModuleCard] list.
class ModuleListScreen extends StatefulWidget {
  const ModuleListScreen({super.key});

  @override
  State<ModuleListScreen> createState() => _ModuleListScreenState();
}

class _ModuleListScreenState extends State<ModuleListScreen> {
  final _search = TextEditingController();
  String _query = '';
  String _filterId = 'all';

  @override
  void initState() {
    super.initState();
    _search.addListener(() => setState(() => _query = _search.text.trim()));
  }

  @override
  void dispose() {
    _search.dispose();
    super.dispose();
  }

  List<ModuleCardData> _allModules(AppLocalizations l10n) {
    return [
      ModuleCardData(
        id: 'kalmeda',
        title: l10n.moduleKalmedaDemo,
        condition: l10n.moduleKalmedaSubtitle,
        description: l10n.homeModuleDescKalmeda,
        durationLabel: l10n.homeDuration12,
        verifiedLabel: l10n.homeVerifiedApr2025,
        specialtyFilterId: 'ent',
        specialtyTag: l10n.modulesFilterEnt,
        difficultyTag: l10n.moduleDifficultyIntro,
        progress: 0.42,
        ctaIsContinue: true,
      ),
      ModuleCardData(
        id: 'vivira',
        title: l10n.moduleViviraDemo,
        condition: l10n.moduleViviraSubtitle,
        description: l10n.homeModuleDescVivira,
        durationLabel: l10n.homeDuration20,
        verifiedLabel: l10n.homeVerifiedApr2025,
        specialtyFilterId: 'pain',
        specialtyTag: l10n.modulesFilterPain,
        difficultyTag: l10n.moduleDifficultyStandard,
        progress: null,
        ctaIsContinue: false,
      ),
      ModuleCardData(
        id: 'velibra',
        title: l10n.moduleVelibraDemo,
        condition: l10n.moduleVelibraSubtitle,
        description: l10n.moduleVelibraDesc,
        durationLabel: l10n.homeDuration20,
        verifiedLabel: l10n.homeVerifiedApr2025,
        specialtyFilterId: 'mental',
        specialtyTag: l10n.modulesFilterMental,
        difficultyTag: l10n.moduleDifficultyStandard,
        progress: null,
        ctaIsContinue: false,
      ),
      ModuleCardData(
        id: 'insomnia',
        title: l10n.moduleInsomniaDemo,
        condition: l10n.moduleInsomniaSubtitle,
        description: l10n.moduleInsomniaDesc,
        durationLabel: l10n.moduleDuration15,
        verifiedLabel: l10n.homeVerifiedApr2025,
        specialtyFilterId: 'mental',
        specialtyTag: l10n.modulesFilterMental,
        difficultyTag: l10n.moduleDifficultyStandard,
        progress: null,
        ctaIsContinue: false,
      ),
      ModuleCardData(
        id: 'cardio',
        title: l10n.moduleCardioDemo,
        condition: l10n.moduleCardioSubtitle,
        description: l10n.moduleCardioDesc,
        durationLabel: l10n.moduleDuration15,
        verifiedLabel: l10n.homeVerifiedApr2025,
        specialtyFilterId: 'gp',
        specialtyTag: l10n.modulesFilterGp,
        difficultyTag: l10n.moduleDifficultyIntro,
        progress: 0.08,
        ctaIsContinue: true,
      ),
    ];
  }

  List<({String id, String label})> _filters(AppLocalizations l10n) => [
        (id: 'all', label: l10n.modulesFilterAll),
        (id: 'ent', label: l10n.modulesFilterEnt),
        (id: 'gp', label: l10n.modulesFilterGp),
        (id: 'pain', label: l10n.modulesFilterPain),
        (id: 'mental', label: l10n.modulesFilterMental),
      ];

  bool _matchesFilter(ModuleCardData m) {
    if (_filterId == 'all') return true;
    return m.specialtyFilterId == _filterId;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    final modules = _allModules(l10n);
    final visible = modules.where((m) => _matchesFilter(m) && m.matchesSearch(_query)).toList();

    return Scaffold(
      backgroundColor: AppColors.surface,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: AppPageHeader(
                title: l10n.modulesPageTitle,
                subtitle: l10n.modulesPageSubtitle,
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.pageHorizontal),
                child: TextField(
                  controller: _search,
                  textInputAction: TextInputAction.search,
                  decoration: InputDecoration(
                    hintText: l10n.modulesSearchHint,
                    prefixIcon: const Icon(Icons.search_rounded, color: AppColors.textMuted),
                    filled: true,
                    fillColor: AppColors.card,
                    contentPadding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: AppSpacing.md),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(AppRadii.lg),
                      borderSide: BorderSide(color: AppColors.outline.withValues(alpha: 0.45)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(AppRadii.lg),
                      borderSide: BorderSide(color: AppColors.outline.withValues(alpha: 0.45)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(AppRadii.lg),
                      borderSide: const BorderSide(color: AppColors.primary, width: 1.4),
                    ),
                  ),
                ),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: AppSpacing.md)),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 40,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: AppSpacing.pageHorizontal),
                  itemCount: _filters(l10n).length,
                  separatorBuilder: (_, index) => const SizedBox(width: AppSpacing.xs),
                  itemBuilder: (context, index) {
                    final f = _filters(l10n)[index];
                    final selected = _filterId == f.id;
                    return FilterChip(
                      label: Text(f.label),
                      selected: selected,
                      showCheckmark: false,
                      onSelected: (_) => setState(() => _filterId = f.id),
                      selectedColor: AppColors.primaryContainer,
                      checkmarkColor: AppColors.primary,
                      labelStyle: theme.textTheme.labelLarge?.copyWith(
                        color: selected ? AppColors.primary : AppColors.secondary,
                        fontWeight: selected ? FontWeight.w800 : FontWeight.w600,
                      ),
                      side: BorderSide(
                        color: selected ? AppColors.primary.withValues(alpha: 0.35) : AppColors.outline.withValues(alpha: 0.65),
                      ),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadii.pill)),
                      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm, vertical: AppSpacing.xs),
                    );
                  },
                ),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: AppSpacing.lg)),
            if (visible.isEmpty)
              SliverFillRemaining(
                hasScrollBody: false,
                child: EmptyStateView(
                  icon: Icons.grid_view_rounded,
                  title: l10n.modulesEmptyTitle,
                  message: l10n.modulesEmptySubtitle,
                  actionLabel: l10n.modulesFilterAll,
                  onAction: () => setState(() {
                    _filterId = 'all';
                    _search.clear();
                    _query = '';
                  }),
                ),
              )
            else
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(
                  AppSpacing.pageHorizontal,
                  0,
                  AppSpacing.pageHorizontal,
                  AppSpacing.xxl,
                ),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final m = visible[index];
                      final pct = m.progress != null ? (m.progress!.clamp(0.0, 1.0) * 100).round() : 0;
                      return Padding(
                        padding: const EdgeInsets.only(bottom: AppSpacing.md),
                        child: ModuleCard(
                          title: m.title,
                          condition: m.condition,
                          description: m.description,
                          specialtyTag: m.specialtyTag,
                          difficultyTag: m.difficultyTag,
                          durationLabel: m.durationLabel,
                          verifiedLabel: m.verifiedLabel,
                          progress: m.progress,
                          progressLabel: m.progress != null ? l10n.modulesProgressLabel : null,
                          progressPercentText: m.progress != null ? l10n.modulesProgressPercent(pct) : null,
                          ctaLabel: m.ctaIsContinue ? l10n.homeCtaContinue : l10n.homeCtaStart,
                          onTap: () => context.push(AppRoutes.moduleDetail(m.id)),
                          onCta: () {
                            if (m.ctaIsContinue) {
                              context.push(AppRoutes.simulationPrescribe(m.id));
                            } else {
                              context.push(AppRoutes.simulationDiagnose(m.id));
                            }
                          },
                        ),
                      );
                    },
                    childCount: visible.length,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
