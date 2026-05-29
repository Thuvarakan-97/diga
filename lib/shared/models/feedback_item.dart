import 'model_json.dart';

/// Teaching feedback shown after an answer or at end of a phase.
class FeedbackItem {
  const FeedbackItem({
    required this.id,
    required this.title,
    required this.body,
    this.relatedPhaseKey,
    this.scoreDelta,
  });

  final String id;
  final String title;
  final String body;

  /// Optional key linking feedback to simulation phase (`diagnose`, `prescribe`, `followUp`).
  final String? relatedPhaseKey;

  /// Points to add/subtract for scoring; content-defined.
  final int? scoreDelta;

  factory FeedbackItem.fromJson(Map<String, dynamic> json) {
    return FeedbackItem(
      id: readString(json, 'id'),
      title: readString(json, 'title'),
      body: readString(json, 'body'),
      relatedPhaseKey: readStringOrNull(json, 'relatedPhaseKey'),
      scoreDelta: json.containsKey('scoreDelta') ? readInt(json, 'scoreDelta') : null,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'body': body,
        if (relatedPhaseKey != null) 'relatedPhaseKey': relatedPhaseKey,
        if (scoreDelta != null) 'scoreDelta': scoreDelta,
      };
}
