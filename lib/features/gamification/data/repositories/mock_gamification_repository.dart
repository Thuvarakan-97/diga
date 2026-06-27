import 'dart:math';

import 'package:diga/features/diga_modules/presentation/models/clinical_domain_data.dart';
import 'package:diga/features/gamification/domain/models/achievement.dart';
import 'package:diga/features/gamification/domain/models/badge.dart';
import 'package:diga/features/gamification/domain/models/gamification_profile.dart';
import 'package:diga/features/gamification/domain/models/leaderboard_entry.dart';
import 'package:diga/features/gamification/domain/models/module_outcome.dart';
import 'package:diga/features/gamification/domain/models/simulation_reward_preview.dart';
import 'package:diga/features/gamification/domain/models/user_level.dart';
import 'package:diga/features/gamification/domain/models/user_streak.dart';
import 'package:diga/features/gamification/domain/models/user_xp.dart';
import 'package:diga/features/gamification/domain/repositories/gamification_repository.dart';

class MockGamificationRepository implements GamificationRepository {
  MockGamificationRepository();

  GamificationProfile _profile = GamificationProfile(
    userId: 'demo-doctor',
    xp: const UserXP(totalXp: 860, baseXp: 700, bonusXp: 160),
    level: UserLevel.fromTotalXp(860),
    streak: UserStreak(
      activeDays: 4,
      bestDays: 8,
      lastLearningDay: DateTime.now().subtract(const Duration(hours: 18)),
      sessionsThisWeek: 4,
    ),
    badges: [
      Badge(id: 'perfect_diagnosis', title: 'Perfect Diagnosis', description: 'Diagnose phase >= 95% accuracy', icon: 'stethoscope', unlocked: true, unlockedAt: DateTime.now().subtract(const Duration(days: 3))),
      Badge(id: 'fast_learner', title: 'Fast Learner', description: 'Complete a module in one sitting', icon: 'bolt', unlocked: true, unlockedAt: DateTime.now().subtract(const Duration(days: 2))),
      const Badge(id: 'clinical_master', title: 'Clinical Master', description: 'Score >= 90% on 3 modules', icon: 'verified'),
      Badge(id: 'streak_builder', title: 'Streak Builder', description: 'Maintain 4-day learning streak', icon: 'local_fire_department', unlocked: true, unlockedAt: DateTime.now().subtract(const Duration(days: 1))),
      const Badge(id: 'module_explorer', title: 'Module Explorer', description: 'Finish all starter modules', icon: 'explore'),
    ],
    accuracyPercent: 87,
    modulesCompleted: 2,
    phasePerformance: const {'Diagnose': 92, 'Prescribe': 84, 'Follow-Up': 81},
    recentAchievements: [
      Achievement(
        id: 'achv_streak_4',
        title: 'Streak Builder',
        message: 'You maintained a 4-day learning streak.',
        xpAwarded: 20,
        earnedAt: DateTime.now().subtract(const Duration(days: 1)),
        badgeId: 'streak_builder',
      ),
    ],
    lastModuleId: 'kalmeda',
  );

  @override
  Future<GamificationProfile> fetchProfile(String userId) async => _profile;

  @override
  Future<List<LeaderboardEntry>> fetchLeaderboard() async {
    return [
      const LeaderboardEntry(rank: 1, userId: 'd1', displayName: 'Dr. Hoffmann', totalXp: 2240, levelTitle: 'DiGA Practitioner'),
      const LeaderboardEntry(rank: 2, userId: 'd2', displayName: 'Dr. Weber', totalXp: 1810, levelTitle: 'DiGA Practitioner'),
      LeaderboardEntry(rank: 3, userId: _profile.userId, displayName: 'You', totalXp: _profile.xp.totalXp, levelTitle: _profile.level.title, isCurrentUser: true),
    ];
  }

  @override
  Future<SimulationRewardPreview> buildRewardPreview(String moduleId) async {
    final score = 88;
    final accuracy = 90;
    final xp = _calculateXp(scorePercent: score, firstAttempt: true, streakDays: _profile.streak.activeDays);
    final unlocked = _profile.badges.where((b) => b.unlocked).take(2).toList(growable: false);
    final currentDomain = ClinicalDomainData.domainForModule(moduleId);
    final nextDomainId = ClinicalDomainData.suggestNextDomain(currentDomain.id);
    final nextDomain = ClinicalDomainData.byId(nextDomainId);
    return SimulationRewardPreview(
      moduleId: moduleId,
      scorePercent: score,
      accuracyPercent: accuracy,
      phaseBreakdown: const {'Diagnose': 94, 'Prescribe': 86, 'Follow-Up': 84},
      xpEarned: xp,
      unlockedBadges: unlocked,
      encouragement: 'Excellent clinical reasoning. Keep this pace to reach the next level quickly.',
      nextDomainId: nextDomainId,
      nextDomainName: nextDomain.name,
      nextModuleId: nextDomain.scenarios.first.moduleId,
      nextModuleTitle: nextDomain.scenarios.first.title,
      latestAchievement: _profile.recentAchievements.firstOrNull,
    );
  }

  @override
  Future<GamificationProfile> registerModuleCompletion({required String userId, required ModuleOutcome outcome}) async {
    final gainedXp = _calculateXp(
      scorePercent: outcome.scorePercent,
      firstAttempt: outcome.firstAttempt,
      streakDays: _profile.streak.activeDays,
    );

    final newTotalXp = _profile.xp.totalXp + gainedXp;
    final highScoreBonus = outcome.scorePercent >= 90 ? 50 : 0;
    final firstAttemptBonus = outcome.firstAttempt ? 20 : 0;

    final updatedBadges = _profile.badges.map((badge) {
      if (!badge.unlocked && badge.id == 'clinical_master' && outcome.scorePercent >= 90) {
        return badge.copyWith(unlocked: true, unlockedAt: DateTime.now());
      }
      return badge;
    }).toList(growable: false);

    final achievement = Achievement(
      id: 'module_${outcome.moduleId}_${DateTime.now().millisecondsSinceEpoch}',
      title: 'Module complete',
      message: 'Finished ${outcome.moduleId.toUpperCase()} with ${outcome.scorePercent}% score.',
      xpAwarded: gainedXp,
      earnedAt: DateTime.now(),
    );

    _profile = _profile.copyWith(
      xp: UserXP(
        totalXp: newTotalXp,
        baseXp: _profile.xp.baseXp + 100,
        bonusXp: _profile.xp.bonusXp + highScoreBonus + firstAttemptBonus,
        lastAwardedAt: DateTime.now(),
      ),
      level: UserLevel.fromTotalXp(newTotalXp),
      modulesCompleted: _profile.modulesCompleted + 1,
      accuracyPercent: ((_profile.accuracyPercent + outcome.accuracyPercent) / 2).round(),
      badges: updatedBadges,
      recentAchievements: [achievement, ..._profile.recentAchievements].take(5).toList(growable: false),
      streak: UserStreak(
        activeDays: _profile.streak.activeDays + 1,
        bestDays: max(_profile.streak.bestDays, _profile.streak.activeDays + 1),
        sessionsThisWeek: _profile.streak.sessionsThisWeek + 1,
        lastLearningDay: outcome.completedAt,
      ),
      lastModuleId: outcome.moduleId,
    );

    return _profile;
  }

  int _calculateXp({required int scorePercent, required bool firstAttempt, required int streakDays}) {
    final completion = 100;
    final accuracyBonus = scorePercent >= 90 ? 50 : 0;
    final firstAttemptBonus = firstAttempt ? 20 : 0;
    final streakBonus = streakDays >= 3 ? 20 : 0;
    return completion + accuracyBonus + firstAttemptBonus + streakBonus;
  }
}

