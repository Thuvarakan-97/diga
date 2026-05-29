import 'package:diga/l10n/app_localizations.dart';

/// Demo analytics payload — replace with Firestore/repository later.
abstract final class ProgressMockData {
  /// Set to `true` to preview the empty dashboard state.
  static const bool previewEmpty = false;

  static ProgressSnapshot build(AppLocalizations l10n) {
    if (previewEmpty) {
      return const ProgressSnapshot(hasProgress: false);
    }

    final trendDays = l10n.progressTrendDaysBlock.split('|');
    final trendValues = [0.35, 0.55, 0.42, 0.68, 0.5, 0.78, 0.46];

    return ProgressSnapshot(
      hasProgress: true,
      modulesCompleted: 2,
      modulesTotal: 6,
      avgScoreDisplay: '82%',
      accuracyDisplay: '87%',
      weeklySessionsDisplay: '4',
      fractionLabel: l10n.progressOverviewFraction(2, 6),
      overviewHint: l10n.progressOverviewHint,
      recent: [
        RecentResultItem(
          moduleId: 'kalmeda',
          title: l10n.moduleKalmedaDemo,
          condition: l10n.moduleKalmedaSubtitle,
          score: '88%',
          date: l10n.progressDateApr8,
          completed: true,
        ),
        RecentResultItem(
          moduleId: 'vivira',
          title: l10n.moduleViviraDemo,
          condition: l10n.moduleViviraSubtitle,
          score: '72%',
          date: l10n.progressDateApr5,
          completed: false,
        ),
        RecentResultItem(
          moduleId: 'velibra',
          title: l10n.moduleVelibraDemo,
          condition: l10n.moduleVelibraSubtitle,
          score: '91%',
          date: l10n.progressDateMar28,
          completed: true,
        ),
      ],
      performance: [
        ModulePerfItem(
          moduleId: 'kalmeda',
          title: l10n.moduleKalmedaDemo,
          subtitle: l10n.moduleKalmedaSubtitle,
          scorePercent: 88,
          progress: 0.88,
          attempts: 3,
          lastActive: l10n.progressLastActiveApr8,
        ),
        ModulePerfItem(
          moduleId: 'vivira',
          title: l10n.moduleViviraDemo,
          subtitle: l10n.moduleViviraSubtitle,
          scorePercent: 72,
          progress: 0.72,
          attempts: 2,
          lastActive: l10n.progressLastActiveApr5,
        ),
        ModulePerfItem(
          moduleId: 'cardio',
          title: l10n.moduleCardioDemo,
          subtitle: l10n.moduleCardioSubtitle,
          scorePercent: 64,
          progress: 0.64,
          attempts: 1,
          lastActive: l10n.progressLastActiveMar20,
        ),
      ],
      trendValues: trendValues,
      trendDayLabels: trendDays,
    );
  }
}

class ProgressSnapshot {
  const ProgressSnapshot({
    required this.hasProgress,
    this.modulesCompleted = 0,
    this.modulesTotal = 0,
    this.avgScoreDisplay = '—',
    this.accuracyDisplay = '—',
    this.weeklySessionsDisplay = '—',
    this.fractionLabel = '',
    this.overviewHint,
    this.recent = const [],
    this.performance = const [],
    this.trendValues = const [],
    this.trendDayLabels = const [],
  });

  final bool hasProgress;
  final int modulesCompleted;
  final int modulesTotal;
  final String avgScoreDisplay;
  final String accuracyDisplay;
  final String weeklySessionsDisplay;
  final String fractionLabel;
  final String? overviewHint;
  final List<RecentResultItem> recent;
  final List<ModulePerfItem> performance;
  final List<double> trendValues;
  final List<String> trendDayLabels;
}

class RecentResultItem {
  const RecentResultItem({
    required this.moduleId,
    required this.title,
    required this.condition,
    required this.score,
    required this.date,
    required this.completed,
  });

  final String moduleId;
  final String title;
  final String condition;
  final String score;
  final String date;
  final bool completed;
}

class ModulePerfItem {
  const ModulePerfItem({
    required this.moduleId,
    required this.title,
    required this.subtitle,
    required this.scorePercent,
    required this.progress,
    required this.attempts,
    required this.lastActive,
  });

  final String moduleId;
  final String title;
  final String subtitle;
  final int scorePercent;
  final double progress;
  final int attempts;
  final String lastActive;
}
