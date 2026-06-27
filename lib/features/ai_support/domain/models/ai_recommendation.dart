import 'package:diga/shared/models/model_json.dart';

class AIRecommendation {
  const AIRecommendation({
    required this.nextDomainId,
    required this.title,
    required this.reason,
    required this.weakAreas,
    required this.suggestedDifficulty,
    this.nextModuleId,
  });

  final String nextDomainId;
  final String title;
  final String reason;
  final List<String> weakAreas;
  final String suggestedDifficulty;

  /// Optional legacy module route for API payloads.
  final String? nextModuleId;

  factory AIRecommendation.fromJson(Map<String, dynamic> json) => AIRecommendation(
        nextDomainId: readString(
          json,
          'nextDomainId',
          defaultValue: readStringOrNull(json, 'nextModuleId') ?? 'mental',
        ),
        title: readString(json, 'title'),
        reason: readString(json, 'reason'),
        weakAreas: readStringList(json, 'weakAreas'),
        suggestedDifficulty: readString(json, 'suggestedDifficulty'),
        nextModuleId: readStringOrNull(json, 'nextModuleId'),
      );

  Map<String, dynamic> toJson() => {
        'nextDomainId': nextDomainId,
        'title': title,
        'reason': reason,
        'weakAreas': weakAreas,
        'suggestedDifficulty': suggestedDifficulty,
        if (nextModuleId != null) 'nextModuleId': nextModuleId,
      };
}

