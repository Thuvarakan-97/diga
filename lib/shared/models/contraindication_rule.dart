import 'model_json.dart';

/// Contraindication or caution (content-driven).
class ContraindicationRule {
  const ContraindicationRule({
    required this.id,
    required this.text,
    this.severity,
    this.sortOrder = 0,
  });

  final String id;
  final String text;

  /// e.g. `absolute`, `relative`, `caution` — free string for MVP, validate in UI if needed.
  final String? severity;
  final int sortOrder;

  factory ContraindicationRule.fromJson(Map<String, dynamic> json) {
    return ContraindicationRule(
      id: readString(json, 'id'),
      text: readString(json, 'text'),
      severity: readStringOrNull(json, 'severity'),
      sortOrder: readInt(json, 'sortOrder'),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'text': text,
        if (severity != null) 'severity': severity,
        'sortOrder': sortOrder,
      };
}
