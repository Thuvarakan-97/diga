import 'package:diga/shared/models/model_json.dart';

class Achievement {
  const Achievement({
    required this.id,
    required this.title,
    required this.message,
    required this.xpAwarded,
    required this.earnedAt,
    this.badgeId,
  });

  final String id;
  final String title;
  final String message;
  final int xpAwarded;
  final DateTime earnedAt;
  final String? badgeId;

  factory Achievement.fromJson(Map<String, dynamic> json) => Achievement(
        id: readString(json, 'id'),
        title: readString(json, 'title'),
        message: readString(json, 'message'),
        xpAwarded: readInt(json, 'xpAwarded'),
        earnedAt: readDateTime(json, 'earnedAt'),
        badgeId: readStringOrNull(json, 'badgeId'),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'message': message,
        'xpAwarded': xpAwarded,
        'earnedAt': earnedAt.toUtc().toIso8601String(),
        if (badgeId != null) 'badgeId': badgeId,
      };
}

