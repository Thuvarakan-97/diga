import '../models/gamification_profile.dart';
import '../models/leaderboard_entry.dart';
import '../models/module_outcome.dart';
import '../models/simulation_reward_preview.dart';

abstract class GamificationRepository {
  Future<GamificationProfile> fetchProfile(String userId);

  Future<GamificationProfile> registerModuleCompletion({
    required String userId,
    required ModuleOutcome outcome,
  });

  Future<SimulationRewardPreview> buildRewardPreview(String moduleId);

  Future<List<LeaderboardEntry>> fetchLeaderboard();
}

