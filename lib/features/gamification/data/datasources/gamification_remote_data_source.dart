import 'package:diga/features/gamification/domain/models/gamification_profile.dart';
import 'package:diga/features/gamification/domain/models/leaderboard_entry.dart';

abstract class GamificationRemoteDataSource {
  Future<GamificationProfile?> fetchProfile(String userId);
  Future<void> upsertProfile(GamificationProfile profile);
  Future<List<LeaderboardEntry>?> fetchLeaderboard();
}
