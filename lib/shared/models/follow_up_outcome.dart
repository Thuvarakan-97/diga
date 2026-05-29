import 'model_json.dart';

/// Scripted patient-reported outcome after N weeks (Follow-up phase input).
class FollowUpOutcome {
  const FollowUpOutcome({
    required this.id,
    required this.moduleId,
    required this.weeksAfterStart,
    required this.summary,
    this.detailBullets = const [],
    this.metrics = const {},
  });

  final String id;
  final String moduleId;
  final int weeksAfterStart;
  final String summary;
  final List<String> detailBullets;

  /// Optional structured metrics for UI badges/charts (all strings for Firestore simplicity).
  final Map<String, String> metrics;

  factory FollowUpOutcome.fromJson(Map<String, dynamic> json) {
    final rawMetrics = json['metrics'];
    final metrics = <String, String>{};
    if (rawMetrics is Map) {
      rawMetrics.forEach((k, v) {
        metrics[k.toString()] = v?.toString() ?? '';
      });
    }
    return FollowUpOutcome(
      id: readString(json, 'id'),
      moduleId: readString(json, 'moduleId'),
      weeksAfterStart: readInt(json, 'weeksAfterStart'),
      summary: readString(json, 'summary'),
      detailBullets: readStringList(json, 'detailBullets'),
      metrics: metrics,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'moduleId': moduleId,
        'weeksAfterStart': weeksAfterStart,
        'summary': summary,
        'detailBullets': detailBullets,
        'metrics': metrics,
      };
}
