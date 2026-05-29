import 'package:diga/features/gamification/domain/models/module_outcome.dart';
import 'package:diga/features/gamification/domain/services/xp_event_logger.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

class FirebaseXpEventLogger implements XpEventLogger {
  const FirebaseXpEventLogger(this._analytics);

  final FirebaseAnalytics _analytics;

  @override
  Future<void> logModuleCompletion({
    required String userId,
    required ModuleOutcome outcome,
    required int xpAwarded,
  }) async {
    await _analytics.logEvent(
      name: 'gamification_xp_awarded',
      parameters: {
        'user_id': userId,
        'module_id': outcome.moduleId,
        'score_percent': outcome.scorePercent,
        'accuracy_percent': outcome.accuracyPercent,
        'first_attempt': outcome.firstAttempt,
        'xp_awarded': xpAwarded,
      },
    );
  }
}
