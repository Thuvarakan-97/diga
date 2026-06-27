import 'package:diga/core/theme/app_colors.dart';
import 'package:diga/core/theme/app_radii.dart';
import 'package:diga/core/theme/app_spacing.dart';
import 'package:diga/features/diga_modules/presentation/models/clinical_domain_data.dart';
import 'package:diga/features/diga_modules/presentation/widgets/clinical_domain_card.dart';
import 'package:diga/shared/widgets/app_page_header.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ModuleListScreen extends StatefulWidget {
  const ModuleListScreen({super.key});

  @override
  State<ModuleListScreen> createState() => _ModuleListScreenState();
}

class _ModuleListScreenState extends State<ModuleListScreen> {
  final _search = TextEditingController();
  String _query = '';

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

  bool _matches(ClinicalDomain domain) {
    if (_query.isEmpty) return true;
    final q = _query.toLowerCase();
    return domain.name.toLowerCase().contains(q) ||
        domain.countLabel.toLowerCase().contains(q) ||
        domain.scenarios.any((s) => s.title.toLowerCase().contains(q) || s.meta.toLowerCase().contains(q));
  }

  @override
  Widget build(BuildContext context) {
    final visible = ClinicalDomainData.domains.where(_matches).toList();
    return Scaffold(
      backgroundColor: AppColors.surface,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: AppPageHeader(
                title: 'Scenarios',
                subtitle: 'All clinical domains',
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.pageHorizontal),
                child: TextField(
                  controller: _search,
                  decoration: InputDecoration(
                    hintText: 'Search domains or scenarios',
                    prefixIcon: const Icon(Icons.search_rounded, color: AppColors.textMuted),
                    filled: true,
                    fillColor: AppColors.card,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(AppRadii.lg),
                      borderSide: BorderSide(color: AppColors.outline.withValues(alpha: 0.45)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(AppRadii.lg),
                      borderSide: BorderSide(color: AppColors.outline.withValues(alpha: 0.45)),
                    ),
                  ),
                ),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: AppSpacing.lg)),
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.pageHorizontal,
                0,
                AppSpacing.pageHorizontal,
                AppSpacing.xxl,
              ),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 280,
                  mainAxisSpacing: AppSpacing.md,
                  crossAxisSpacing: AppSpacing.md,
                  childAspectRatio: 0.72,
                ),
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final d = visible[index];
                    return ClinicalDomainCard(
                      domain: d,
                      onTap: () => context.push('/modules/${d.id}'),
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
