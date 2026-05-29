import 'achievement.dart';
import 'badge.dart';
import 'package:diga/shared/models/model_json.dart';
import 'user_level.dart';
import 'user_streak.dart';
import 'user_xp.dart';

class GamificationProfile {
  const GamificationProfile({
    required this.userId,
    required this.xp,
    required this.level,
    required this.streak,
    required this.badges,
    required this.accuracyPercent,
    required this.modulesCompleted,
    required this.phasePerformance,
    required this.recentAchievements,
    this.lastModuleId,
  });

  final String userId;
  final UserXP xp;
  final UserLevel level;
  final UserStreak streak;
  final List<Badge> badges;
  final int accuracyPercent;
  final int modulesCompleted;
  final Map<String, int> phasePerformance;
  final List<Achievement> recentAchievements;
  final String? lastModuleId;

  int get unlockedBadgeCount => badges.where((b) => b.unlocked).length;

  factory GamificationProfile.fromJson(Map<String, dynamic> json) {
    return GamificationProfile(
      userId: readString(json, 'userId'),
      xp: UserXP.fromJson(readMap(json, 'xp')),
      level: UserLevel.fromJson(readMap(json, 'level')),
      streak: UserStreak.fromJson(readMap(json, 'streak')),
      badges: readMapList(json, 'badges').map(Badge.fromJson).toList(growable: false),
      accuracyPercent: readInt(json, 'accuracyPercent'),
      modulesCompleted: readInt(json, 'modulesCompleted'),
      phasePerformance: readMap(json, 'phasePerformance').map((k, v) => MapEntry(k, (v as num?)?.round() ?? 0)),
      recentAchievements: readMapList(json, 'recentAchievements')
          .map(Achievement.fromJson)
          .toList(growable: false),
      lastModuleId: readStringOrNull(json, 'lastModuleId'),
    );
  }

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'xp': xp.toJson(),
        'level': level.toJson(),
        'streak': streak.toJson(),
        'badges': badges.map((e) => e.toJson()).toList(growable: false),
        'accuracyPercent': accuracyPercent,
        'modulesCompleted': modulesCompleted,
        'phasePerformance': phasePerformance,
        'recentAchievements': recentAchievements.map((e) => e.toJson()).toList(growable: false),
        if (lastModuleId != null) 'lastModuleId': lastModuleId,
      };

  GamificationProfile copyWith({
    UserXP? xp,
    UserLevel? level,
    UserStreak? streak,
    List<Badge>? badges,
    int? accuracyPercent,
    int? modulesCompleted,
    Map<String, int>? phasePerformance,
    List<Achievement>? recentAchievements,
    String? lastModuleId,
  }) {
    return GamificationProfile(
      userId: userId,
      xp: xp ?? this.xp,
      level: level ?? this.level,
      streak: streak ?? this.streak,
      badges: badges ?? this.badges,
      accuracyPercent: accuracyPercent ?? this.accuracyPercent,
      modulesCompleted: modulesCompleted ?? this.modulesCompleted,
      phasePerformance: phasePerformance ?? this.phasePerformance,
      recentAchievements: recentAchievements ?? this.recentAchievements,
      lastModuleId: lastModuleId ?? this.lastModuleId,
    );
  }
}

