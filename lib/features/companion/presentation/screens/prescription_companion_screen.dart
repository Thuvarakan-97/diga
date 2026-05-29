import 'package:diga/core/theme/app_colors.dart';
import 'package:diga/core/theme/app_spacing.dart';
import 'package:diga/features/companion/presentation/data/companion_reference_data.dart';
import 'package:diga/shared/extensions/context_l10n.dart';
import 'package:diga/shared/widgets/app_page_header.dart';
import 'package:diga/shared/widgets/empty_state_view.dart';
import 'package:diga/shared/widgets/info_section_card.dart';
import 'package:flutter/material.dart';

/// Clinical-style DiGA reference: module selector + expandable section cards.
class PrescriptionCompanionScreen extends StatefulWidget {
  const PrescriptionCompanionScreen({super.key, this.moduleId});

  final String? moduleId;

  @override
  State<PrescriptionCompanionScreen> createState() => _PrescriptionCompanionScreenState();
}

class _PrescriptionCompanionScreenState extends State<PrescriptionCompanionScreen> {
  String? _selectedId;

  @override
  void initState() {
    super.initState();
    final initial = widget.moduleId?.toLowerCase();
    if (initial == 'kalmeda' || initial == 'vivira') {
      _selectedId = initial;
    }
  }

  @override
  void didUpdateWidget(covariant PrescriptionCompanionScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.moduleId != oldWidget.moduleId) {
      final initial = widget.moduleId?.toLowerCase();
      if (initial == 'kalmeda' || initial == 'vivira') {
        setState(() => _selectedId = initial);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    final data = CompanionReferenceData.forModule(_selectedId, l10n);

    return Scaffold(
      backgroundColor: AppColors.surface,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.only(bottom: AppSpacing.xxl),
          children: [
            AppPageHeader(
              title: l10n.companionPageTitle,
              subtitle: l10n.companionPageSubtitle,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.pageHorizontal),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.companionSelectorLabel,
                    style: theme.textTheme.labelLarge?.copyWith(
                      color: AppColors.textMuted,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.xs),
                  Wrap(
                    spacing: AppSpacing.sm,
                    runSpacing: AppSpacing.sm,
                    children: [
                      ChoiceChip(
                        label: Text(l10n.companionChipKalmeda),
                        selected: _selectedId == 'kalmeda',
                        onSelected: (v) => setState(() => _selectedId = v ? 'kalmeda' : null),
                      ),
                      ChoiceChip(
                        label: Text(l10n.companionChipVivira),
                        selected: _selectedId == 'vivira',
                        onSelected: (v) => setState(() => _selectedId = v ? 'vivira' : null),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            if (data == null)
              EmptyStateView(
                icon: Icons.medical_information_outlined,
                title: l10n.companionEmptyTitle,
                message: l10n.companionEmptyBody,
              )
            else ...[
              _SectionGap(
                child: InfoSectionCard(
                  title: l10n.companionSectionIcd,
                  leadingIcon: Icons.tag_rounded,
                  initiallyExpanded: true,
                  child: Wrap(
                    spacing: AppSpacing.xs,
                    runSpacing: AppSpacing.xs,
                    children: data.icdRows
                        .map(
                          (e) => Chip(
                            avatar: Icon(Icons.code_rounded, size: 16, color: AppColors.primary.withValues(alpha: 0.85)),
                            label: Text(
                              e.label.isEmpty ? e.code : '${e.code} · ${e.label}',
                              style: theme.textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w600),
                            ),
                            backgroundColor: AppColors.card,
                            side: BorderSide(color: AppColors.outline.withValues(alpha: 0.55)),
                            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xs),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
              _SectionGap(
                child: InfoSectionCard(
                  title: l10n.companionSectionEligibility,
                  leadingIcon: Icons.rule_folder_outlined,
                  initiallyExpanded: true,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for (final line in data.eligibilityLines) _BulletRow(icon: Icons.check_circle_outline_rounded, text: line),
                    ],
                  ),
                ),
              ),
              _SectionGap(
                child: InfoSectionCard(
                  title: l10n.companionSectionContra,
                  leadingIcon: Icons.health_and_safety_outlined,
                  variant: InfoSectionVariant.alert,
                  initiallyExpanded: false,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for (final line in data.contraindicationLines)
                        _BulletRow(icon: Icons.warning_amber_rounded, text: line, iconColor: AppColors.danger),
                    ],
                  ),
                ),
              ),
              _SectionGap(
                child: InfoSectionCard(
                  title: l10n.companionSectionDoc,
                  leadingIcon: Icons.fact_check_outlined,
                  initiallyExpanded: false,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for (final line in data.documentationLines)
                        _BulletRow(icon: Icons.check_box_outlined, text: line),
                    ],
                  ),
                ),
              ),
              _SectionGap(
                child: InfoSectionCard(
                  title: l10n.companionSectionPatient,
                  leadingIcon: Icons.people_outline_rounded,
                  variant: InfoSectionVariant.guidance,
                  initiallyExpanded: false,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for (var i = 0; i < data.patientGuidanceParagraphs.length; i++) ...[
                        if (i > 0) const SizedBox(height: AppSpacing.md),
                        Text(
                          data.patientGuidanceParagraphs[i],
                          style: theme.textTheme.bodyMedium?.copyWith(height: 1.5, color: const Color(0xFF263238)),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
              _SectionGap(
                child: InfoSectionCard(
                  title: l10n.companionSectionInsurance,
                  leadingIcon: Icons.receipt_long_outlined,
                  initiallyExpanded: false,
                  child: Text(
                    data.insuranceNotes,
                    style: theme.textTheme.bodySmall?.copyWith(
                      height: 1.45,
                      color: AppColors.textMuted,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _SectionGap extends StatelessWidget {
  const _SectionGap({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.pageHorizontal,
        0,
        AppSpacing.pageHorizontal,
        AppSpacing.md,
      ),
      child: child,
    );
  }
}

class _BulletRow extends StatelessWidget {
  const _BulletRow({required this.icon, required this.text, this.iconColor});

  final IconData icon;
  final String text;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.sm),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20, color: iconColor ?? AppColors.accent),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(height: 1.45),
            ),
          ),
        ],
      ),
    );
  }
}
