import 'package:diga/features/gamification/data/datasources/gamification_remote_data_source.dart';
import 'package:diga/features/gamification/domain/models/gamification_profile.dart';
import 'package:diga/features/gamification/domain/models/leaderboard_entry.dart';
import 'package:diga/features/gamification/domain/models/module_outcome.dart';
import 'package:diga/features/gamification/domain/models/simulation_reward_preview.dart';
import 'package:diga/features/gamification/domain/repositories/gamification_repository.dart';
import 'package:diga/features/gamification/domain/services/xp_event_logger.dart';

class BackendReadyGamificationRepository implements GamificationRepository {
  BackendReadyGamificationRepository({
    required GamificationRepository fallbackRepository,
    required GamificationRemoteDataSource remoteDataSource,
    required XpEventLogger eventLogger,
  })  : _fallback = fallbackRepository,
        _remote = remoteDataSource,
        _eventLogger = eventLogger;

  final GamificationRepository _fallback;
  final GamificationRemoteDataSource _remote;
  final XpEventLogger _eventLogger;

  @override
  Future<GamificationProfile> fetchProfile(String userId) async {
    final remote = await _remote.fetchProfile(userId);
    if (remote != null) return remote;
    return _fallback.fetchProfile(userId);
  }

  @override
  Future<List<LeaderboardEntry>> fetchLeaderboard() async {
    final remote = await _remote.fetchLeaderboard();
    if (remote != null && remote.isNotEmpty) return remote;
    return _fallback.fetchLeaderboard();
  }

  @override
  Future<SimulationRewardPreview> buildRewardPreview(String moduleId) {
    return _fallback.buildRewardPreview(moduleId);
  }

  @override
  Future<GamificationProfile> registerModuleCompletion({
    required String userId,
    required ModuleOutcome outcome,
  }) async {
    final updated = await _fallback.registerModuleCompletion(userId: userId, outcome: outcome);
    try {
      await _remote.upsertProfile(updated);
    } catch (_) {}

    final awarded = _calculateAwardedXp(outcome, updated.streak.activeDays);
    try {
      await _eventLogger.logModuleCompletion(userId: userId, outcome: outcome, xpAwarded: awarded);
    } catch (_) {}
    return updated;
  }

  int _calculateAwardedXp(ModuleOutcome outcome, int activeStreakDays) {
    final completion = 100;
    final accuracyBonus = outcome.scorePercent >= 90 ? 50 : 0;
    final firstAttemptBonus = outcome.firstAttempt ? 20 : 0;
    final streakBonus = activeStreakDays >= 3 ? 20 : 0;
    return completion + accuracyBonus + firstAttemptBonus + streakBonus;
  }
}
