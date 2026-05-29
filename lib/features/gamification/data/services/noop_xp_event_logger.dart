import 'package:diga/features/gamification/domain/models/module_outcome.dart';
import 'package:diga/features/gamification/domain/services/xp_event_logger.dart';

class NoopXpEventLogger implements XpEventLogger {
  const NoopXpEventLogger();

  @override
  Future<void> logModuleCompletion({
    required String userId,
    required ModuleOutcome outcome,
    required int xpAwarded,
  }) async {}
}
