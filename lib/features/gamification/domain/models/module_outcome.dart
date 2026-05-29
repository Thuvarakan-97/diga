import 'package:diga/shared/models/model_json.dart';

class ModuleOutcome {
  const ModuleOutcome({
    required this.moduleId,
    required this.scorePercent,
    required this.accuracyPercent,
    required this.firstAttempt,
    required this.completedAt,
  });

  final String moduleId;
  final int scorePercent;
  final int accuracyPercent;
  final bool firstAttempt;
  final DateTime completedAt;

  factory ModuleOutcome.fromJson(Map<String, dynamic> json) => ModuleOutcome(
        moduleId: readString(json, 'moduleId'),
        scorePercent: readInt(json, 'scorePercent'),
        accuracyPercent: readInt(json, 'accuracyPercent'),
        firstAttempt: readBool(json, 'firstAttempt'),
        completedAt: readDateTime(json, 'completedAt'),
      );

  Map<String, dynamic> toJson() => {
        'moduleId': moduleId,
        'scorePercent': scorePercent,
        'accuracyPercent': accuracyPercent,
        'firstAttempt': firstAttempt,
        'completedAt': completedAt.toUtc().toIso8601String(),
      };
}

