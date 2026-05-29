import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diga/core/config/app_environment.dart';
import 'package:diga/core/config/feature_flag_providers.dart';
import 'package:diga/features/gamification/data/datasources/api_gamification_data_source.dart';
import 'package:diga/features/gamification/data/datasources/firebase_gamification_data_source.dart';
import 'package:diga/features/gamification/data/datasources/gamification_remote_data_source.dart';
import 'package:diga/features/gamification/data/repositories/backend_ready_gamification_repository.dart';
import 'package:diga/features/gamification/data/repositories/mock_gamification_repository.dart';
import 'package:diga/features/gamification/data/services/firebase_xp_event_logger.dart';
import 'package:diga/features/gamification/data/services/noop_xp_event_logger.dart';
import 'package:diga/features/gamification/domain/models/badge.dart';
import 'package:diga/features/gamification/domain/models/gamification_profile.dart';
import 'package:diga/features/gamification/domain/models/leaderboard_entry.dart';
import 'package:diga/features/gamification/domain/models/module_outcome.dart';
import 'package:diga/features/gamification/domain/models/simulation_reward_preview.dart';
import 'package:diga/features/gamification/domain/repositories/gamification_repository.dart';
import 'package:diga/features/gamification/domain/services/xp_event_logger.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final xpEventLoggerProvider = Provider<XpEventLogger>((ref) {
  if (Firebase.apps.isNotEmpty) {
    return FirebaseXpEventLogger(FirebaseAnalytics.instance);
  }
  return const NoopXpEventLogger();
});

final gamificationRemoteDataSourceProvider = Provider<GamificationRemoteDataSource>((ref) {
  final env = ref.watch(appEnvironmentProvider);
  if (Firebase.apps.isNotEmpty) {
    return FirebaseGamificationDataSource(FirebaseFirestore.instance);
  }
  if (env == AppEnvironment.staging || env == AppEnvironment.prod) {
    return const ApiGamificationDataSource();
  }
  return const ApiGamificationDataSource();
});

final gamificationRepositoryProvider = Provider<GamificationRepository>((ref) {
  final fallback = MockGamificationRepository();
  final enabled = ref.watch(gamificationEnabledProvider);
  if (!enabled) return fallback;

  return BackendReadyGamificationRepository(
    fallbackRepository: fallback,
    remoteDataSource: ref.watch(gamificationRemoteDataSourceProvider),
    eventLogger: ref.watch(xpEventLoggerProvider),
  );
});

const _activeUserId = 'demo-doctor';

final gamificationProfileProvider = FutureProvider<GamificationProfile>((ref) {
  return ref.watch(gamificationRepositoryProvider).fetchProfile(_activeUserId);
});

final leaderboardPreviewProvider = FutureProvider<List<LeaderboardEntry>>((ref) {
  return ref.watch(gamificationRepositoryProvider).fetchLeaderboard();
});

final badgesProvider = Provider<List<Badge>>((ref) {
  return ref.watch(gamificationProfileProvider).maybeWhen(
        data: (profile) => profile.badges,
        orElse: () => const [],
      );
});

final streakProvider = Provider<int>((ref) {
  return ref.watch(gamificationProfileProvider).maybeWhen(
        data: (profile) => profile.streak.activeDays,
        orElse: () => 0,
      );
});

class GamificationController extends AsyncNotifier<GamificationProfile> {
  @override
  Future<GamificationProfile> build() {
    return ref.read(gamificationRepositoryProvider).fetchProfile(_activeUserId);
  }

  Future<void> completeModule(ModuleOutcome outcome) async {
    final updated = await ref.read(gamificationRepositoryProvider).registerModuleCompletion(
          userId: _activeUserId,
          outcome: outcome,
        );
    state = AsyncData(updated);
    ref.invalidate(gamificationProfileProvider);
  }
}

final gamificationControllerProvider = AsyncNotifierProvider<GamificationController, GamificationProfile>(
  GamificationController.new,
);

final simulationRewardPreviewProvider = FutureProvider.family<SimulationRewardPreview, String>((ref, moduleId) {
  return ref.watch(gamificationRepositoryProvider).buildRewardPreview(moduleId);
});

