import 'model_json.dart';

/// Single eligibility criterion line (educational content, not live decision logic).
class EligibilityRule {
  const EligibilityRule({
    required this.id,
    required this.text,
    this.groupId,
    this.sortOrder = 0,
  });

  final String id;
  final String text;

  /// Optional grouping for UI sections (e.g. `inclusion`, `exclusion_soft`).
  final String? groupId;
  final int sortOrder;

  factory EligibilityRule.fromJson(Map<String, dynamic> json) {
    return EligibilityRule(
      id: readString(json, 'id'),
      text: readString(json, 'text'),
      groupId: readStringOrNull(json, 'groupId'),
      sortOrder: readInt(json, 'sortOrder'),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'text': text,
        if (groupId != null) 'groupId': groupId,
        'sortOrder': sortOrder,
      };
}
