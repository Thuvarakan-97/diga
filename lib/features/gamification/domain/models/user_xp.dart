import 'package:diga/shared/models/model_json.dart';

class UserXP {
  const UserXP({
    required this.totalXp,
    required this.baseXp,
    required this.bonusXp,
    this.lastAwardedAt,
  });

  final int totalXp;
  final int baseXp;
  final int bonusXp;
  final DateTime? lastAwardedAt;

  factory UserXP.fromJson(Map<String, dynamic> json) => UserXP(
        totalXp: readInt(json, 'totalXp'),
        baseXp: readInt(json, 'baseXp'),
        bonusXp: readInt(json, 'bonusXp'),
        lastAwardedAt: readDateTimeOrNull(json, 'lastAwardedAt'),
      );

  Map<String, dynamic> toJson() => {
        'totalXp': totalXp,
        'baseXp': baseXp,
        'bonusXp': bonusXp,
        if (lastAwardedAt != null) 'lastAwardedAt': lastAwardedAt!.toUtc().toIso8601String(),
      };

  UserXP copyWith({
    int? totalXp,
    int? baseXp,
    int? bonusXp,
    DateTime? lastAwardedAt,
  }) {
    return UserXP(
      totalXp: totalXp ?? this.totalXp,
      baseXp: baseXp ?? this.baseXp,
      bonusXp: bonusXp ?? this.bonusXp,
      lastAwardedAt: lastAwardedAt ?? this.lastAwardedAt,
    );
  }
}

