import '../models/module_outcome.dart';

abstract class XpEventLogger {
  Future<void> logModuleCompletion({
    required String userId,
    required ModuleOutcome outcome,
    required int xpAwarded,
  });
}
