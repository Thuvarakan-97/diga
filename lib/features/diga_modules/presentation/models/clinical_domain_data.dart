import 'package:flutter/material.dart';

class ClinicalScenarioItem {
  const ClinicalScenarioItem({
    required this.id,
    required this.tag,
    required this.title,
    required this.meta,
    required this.moduleId,
    this.locked = false,
    this.done = false,
  });

  final String id;
  final String tag;
  final String title;
  final String meta;
  final String moduleId;
  final bool locked;
  final bool done;
}

class ClinicalDomain {
  const ClinicalDomain({
    required this.id,
    required this.name,
    required this.countLabel,
    required this.progress,
    required this.icon,
    required this.heroDescription,
    required this.scenarios,
  });

  final String id;
  final String name;
  final String countLabel;
  final int progress;
  final IconData icon;
  final String heroDescription;
  final List<ClinicalScenarioItem> scenarios;
}

abstract final class ClinicalDomainData {
  static const domains = <ClinicalDomain>[
    ClinicalDomain(
      id: 'mental',
      name: 'Mental Health',
      countLabel: '31 DiGAs',
      progress: 33,
      icon: Icons.psychology_alt_outlined,
      heroDescription:
          'Depression, insomnia, anxiety disorders and bipolar spectrum. Learn when DiGA prescribing is appropriate - and when it is not.',
      scenarios: [
        ClinicalScenarioItem(
          id: 'mental-1',
          tag: 'Depression',
          title: 'Which depression DiGA and why',
          meta: 'Scenario 1.1 - +200 XP',
          moduleId: 'velibra',
        ),
        ClinicalScenarioItem(
          id: 'mental-2',
          tag: 'Safety',
          title: 'The absolute contraindication',
          meta: 'Scenario 1.2 - +200 XP',
          moduleId: 'velibra',
          locked: true,
        ),
        ClinicalScenarioItem(
          id: 'mental-3',
          tag: 'Insomnia',
          title: 'Somnio vs HelloBetter Schlafen',
          meta: 'Scenario 2.1 - +200 XP',
          moduleId: 'insomnia',
          locked: true,
        ),
      ],
    ),
    ClinicalDomain(
      id: 'msk',
      name: 'Musculoskeletal System',
      countLabel: '7 DiGAs',
      progress: 0,
      icon: Icons.accessibility_new_outlined,
      heroDescription:
          'Chronic back pain and movement rehabilitation pathways. Focus on red flags, eligibility, and digital exercise fit.',
      scenarios: [
        ClinicalScenarioItem(
          id: 'msk-1',
          tag: 'Back pain',
          title: 'Chronic low back pain - first DiGA choice',
          meta: 'Vivira pathway - +200 XP',
          moduleId: 'vivira',
        ),
        ClinicalScenarioItem(
          id: 'msk-2',
          tag: 'Safety',
          title: 'When physiotherapy takes precedence',
          meta: 'Escalation scenario - +200 XP',
          moduleId: 'vivira',
          locked: true,
        ),
      ],
    ),
    ClinicalDomain(
      id: 'uro',
      name: 'Urogenital System',
      countLabel: '6 DiGAs',
      progress: 50,
      icon: Icons.water_drop_outlined,
      heroDescription:
          'Urinary and pelvic-floor focused care. Navigate eligibility and long-term engagement with digital interventions.',
      scenarios: [
        ClinicalScenarioItem(
          id: 'uro-1',
          tag: 'Incontinence',
          title: 'Stress vs urge incontinence - does it matter?',
          meta: 'Eligibility edge case - +200 XP',
          moduleId: 'generic-uro',
          done: true,
        ),
        ClinicalScenarioItem(
          id: 'uro-2',
          tag: 'Eligibility',
          title: 'Male patient requesting pelvic-floor DiGA',
          meta: 'Case triage - +200 XP',
          moduleId: 'generic-uro',
          locked: true,
        ),
      ],
    ),
    ClinicalDomain(
      id: 'meta',
      name: 'Metabolic Diseases & Digestive System',
      countLabel: '5 + 1 (IBS)',
      progress: 0,
      icon: Icons.monitor_heart_outlined,
      heroDescription:
          'Type 2 diabetes, obesity and IBS related digital pathways with evidence-based selection and follow-up.',
      scenarios: [
        ClinicalScenarioItem(
          id: 'meta-1',
          tag: 'Diabetes',
          title: 'T2D with inadequate glycaemic control',
          meta: 'Metabolic pathway - +200 XP',
          moduleId: 'generic-meta',
        ),
        ClinicalScenarioItem(
          id: 'meta-2',
          tag: 'IBS',
          title: 'Irritable bowel - is there a DiGA?',
          meta: 'IBS special case - +200 XP',
          moduleId: 'generic-meta',
        ),
      ],
    ),
    ClinicalDomain(
      id: 'neuro',
      name: 'Nervous System & Sensory Organs',
      countLabel: '3 + 2',
      progress: 0,
      icon: Icons.visibility_outlined,
      heroDescription:
          'Tinnitus and migraine focused pathways. Evaluate red flags first, then choose the right digital support model.',
      scenarios: [
        ClinicalScenarioItem(
          id: 'neuro-1',
          tag: 'Tinnitus',
          title: 'Tinnitus DiGA selection',
          meta: 'Kalmeda fit - +200 XP',
          moduleId: 'kalmeda',
        ),
        ClinicalScenarioItem(
          id: 'neuro-2',
          tag: 'Migraine',
          title: 'Chronic migraine - digital prophylaxis?',
          meta: 'Evidence review - +200 XP',
          moduleId: 'generic-neuro',
          locked: true,
        ),
      ],
    ),
    ClinicalDomain(
      id: 'cvs',
      name: 'CVS & Oncology',
      countLabel: '2 + 2',
      progress: 0,
      icon: Icons.favorite_border_rounded,
      heroDescription:
          'Cardiovascular risk and oncology supportive pathways. Use DiGAs as adjuncts to guideline-based care.',
      scenarios: [
        ClinicalScenarioItem(
          id: 'cvs-1',
          tag: 'Hypertension',
          title: 'CardioCoach hypertension pathway',
          meta: 'Scenario set - +200 XP',
          moduleId: 'cardio',
        ),
        ClinicalScenarioItem(
          id: 'cvs-2',
          tag: 'Oncology',
          title: 'Cancer diagnosis support DiGA',
          meta: 'Supportive care - +200 XP',
          moduleId: 'generic-cvs',
          locked: true,
        ),
      ],
    ),
  ];

  static ClinicalDomain byId(String id) =>
      domains.firstWhere((d) => d.id == id, orElse: () => domains.first);

  static const domainOrder = <String>['mental', 'msk', 'uro', 'meta', 'neuro', 'cvs'];

  static ClinicalDomain domainForModule(String moduleId) =>
      byId(mapModuleToDomain(moduleId));

  static String mapModuleToDomain(String moduleId) {
    switch (moduleId) {
      case 'velibra':
      case 'insomnia':
        return 'mental';
      case 'vivira':
        return 'msk';
      case 'kalmeda':
        return 'neuro';
      case 'cardio':
        return 'cvs';
      case 'generic-uro':
        return 'uro';
      case 'generic-meta':
        return 'meta';
      case 'generic-neuro':
        return 'neuro';
      case 'generic-cvs':
        return 'cvs';
      default:
        if (domainOrder.contains(moduleId)) return moduleId;
        return 'mental';
    }
  }

  static String suggestNextDomain(String currentDomainId) {
    final idx = domainOrder.indexOf(currentDomainId);
    if (idx < 0) return domainOrder.first;
    return domainOrder[(idx + 1) % domainOrder.length];
  }

  static String recommendationReason(String nextDomainId) {
    return switch (nextDomainId) {
      'mental' =>
        'Build foundational prescribing confidence across depression, insomnia, and safety screening scenarios.',
      'msk' =>
        'Your recent mental health performance is solid. Musculoskeletal cases strengthen red-flag triage and exercise-based DiGA selection.',
      'uro' =>
        'Next, practise urogenital pathways with eligibility checks and long-term adherence planning.',
      'meta' =>
        'Metabolic and digestive scenarios help you align lifestyle DiGAs with medication and follow-up targets.',
      'neuro' =>
        'Sensory and neurological cases focus on ENT red flags, migraine criteria, and escalation rules.',
      'cvs' =>
        'Cardiovascular and oncology support scenarios reinforce adjunctive digital care within guideline pathways.',
      _ => 'Continue with the next clinical domain to broaden your prescribing portfolio.',
    };
  }
}
