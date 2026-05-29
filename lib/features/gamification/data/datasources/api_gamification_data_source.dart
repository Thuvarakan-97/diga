import 'package:diga/features/gamification/data/datasources/gamification_remote_data_source.dart';
import 'package:diga/features/gamification/domain/models/gamification_profile.dart';
import 'package:diga/features/gamification/domain/models/leaderboard_entry.dart';

class ApiGamificationDataSource implements GamificationRemoteDataSource {
  const ApiGamificationDataSource();

  @override
  Future<GamificationProfile?> fetchProfile(String userId) async {
    // API integration stub for future backend rollout.
    return null;
  }

  @override
  Future<List<LeaderboardEntry>?> fetchLeaderboard() async {
    // API integration stub for future backend rollout.
    return null;
  }

  @override
  Future<void> upsertProfile(GamificationProfile profile) async {
    // API integration stub for future backend rollout.
  }
}
