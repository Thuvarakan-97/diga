import 'package:diga/shared/models/model_json.dart';

class UserStreak {
  const UserStreak({
    required this.activeDays,
    required this.bestDays,
    this.lastLearningDay,
    required this.sessionsThisWeek,
  });

  final int activeDays;
  final int bestDays;
  final DateTime? lastLearningDay;
  final int sessionsThisWeek;

  factory UserStreak.fromJson(Map<String, dynamic> json) => UserStreak(
        activeDays: readInt(json, 'activeDays'),
        bestDays: readInt(json, 'bestDays'),
        lastLearningDay: readDateTimeOrNull(json, 'lastLearningDay'),
        sessionsThisWeek: readInt(json, 'sessionsThisWeek'),
      );

  Map<String, dynamic> toJson() => {
        'activeDays': activeDays,
        'bestDays': bestDays,
        if (lastLearningDay != null) 'lastLearningDay': lastLearningDay!.toUtc().toIso8601String(),
        'sessionsThisWeek': sessionsThisWeek,
      };
}

