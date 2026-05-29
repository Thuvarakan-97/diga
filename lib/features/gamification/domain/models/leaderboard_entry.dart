import 'package:diga/shared/models/model_json.dart';

class LeaderboardEntry {
  const LeaderboardEntry({
    required this.rank,
    required this.userId,
    required this.displayName,
    required this.totalXp,
    required this.levelTitle,
    this.isCurrentUser = false,
  });

  final int rank;
  final String userId;
  final String displayName;
  final int totalXp;
  final String levelTitle;
  final bool isCurrentUser;

  factory LeaderboardEntry.fromJson(Map<String, dynamic> json) => LeaderboardEntry(
        rank: readInt(json, 'rank'),
        userId: readString(json, 'userId'),
        displayName: readString(json, 'displayName'),
        totalXp: readInt(json, 'totalXp'),
        levelTitle: readString(json, 'levelTitle'),
        isCurrentUser: readBool(json, 'isCurrentUser'),
      );

  Map<String, dynamic> toJson() => {
        'rank': rank,
        'userId': userId,
        'displayName': displayName,
        'totalXp': totalXp,
        'levelTitle': levelTitle,
        'isCurrentUser': isCurrentUser,
      };
}

