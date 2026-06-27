import 'achievement.dart';
import 'badge.dart';

class SimulationRewardPreview {
  const SimulationRewardPreview({
    required this.moduleId,
    required this.scorePercent,
    required this.accuracyPercent,
    required this.phaseBreakdown,
    required this.xpEarned,
    required this.unlockedBadges,
    required this.encouragement,
    required this.nextDomainId,
    required this.nextDomainName,
    this.nextModuleId,
    this.nextModuleTitle,
    this.latestAchievement,
  });

  final String moduleId;
  final int scorePercent;
  final int accuracyPercent;
  final Map<String, int> phaseBreakdown;
  final int xpEarned;
  final List<Badge> unlockedBadges;
  final String encouragement;
  final String nextDomainId;
  final String nextDomainName;
  final String? nextModuleId;
  final String? nextModuleTitle;
  final Achievement? latestAchievement;
}

