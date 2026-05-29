import 'model_json.dart';

/// Immutable outcome of a completed module attempt.
class ModuleResult {
  const ModuleResult({
    required this.id,
    required this.userId,
    required this.moduleId,
    required this.score,
    required this.maxScore,
    required this.accuracyPercent,
    required this.completedAt,
    this.attemptNumber = 1,
    this.phaseScores = const {},
    this.notes,
  });

  final String id;
  final String userId;
  final String moduleId;
  final int score;
  final int maxScore;

  /// 0–100; content/repo may compute from weighted items.
  final double accuracyPercent;
  final DateTime completedAt;
  final int attemptNumber;

  /// Keys typically match [SimulationPhaseKind.name].
  final Map<String, int> phaseScores;
  final String? notes;

  factory ModuleResult.fromJson(Map<String, dynamic> json) {
    final rawPhase = json['phaseScores'];
    final phaseScores = <String, int>{};
    if (rawPhase is Map) {
      rawPhase.forEach((k, v) {
        final key = k.toString();
        if (v is int) {
          phaseScores[key] = v;
        } else if (v is num) {
          phaseScores[key] = v.round();
        }
      });
    }
    return ModuleResult(
      id: readString(json, 'id'),
      userId: readString(json, 'userId'),
      moduleId: readString(json, 'moduleId'),
      score: readInt(json, 'score'),
      maxScore: readInt(json, 'maxScore'),
      accuracyPercent: readDouble(json, 'accuracyPercent'),
      completedAt: readDateTime(json, 'completedAt'),
      attemptNumber: readInt(json, 'attemptNumber', defaultValue: 1),
      phaseScores: phaseScores,
      notes: readStringOrNull(json, 'notes'),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'userId': userId,
        'moduleId': moduleId,
        'score': score,
        'maxScore': maxScore,
        'accuracyPercent': accuracyPercent,
        'completedAt': completedAt.toUtc().toIso8601String(),
        'attemptNumber': attemptNumber,
        'phaseScores': phaseScores,
        if (notes != null) 'notes': notes,
      };
}
