import 'package:diga/shared/models/model_json.dart';

class AIRecommendation {
  const AIRecommendation({
    required this.nextModuleId,
    required this.title,
    required this.reason,
    required this.weakAreas,
    required this.suggestedDifficulty,
  });

  final String nextModuleId;
  final String title;
  final String reason;
  final List<String> weakAreas;
  final String suggestedDifficulty;

  factory AIRecommendation.fromJson(Map<String, dynamic> json) => AIRecommendation(
        nextModuleId: readString(json, 'nextModuleId'),
        title: readString(json, 'title'),
        reason: readString(json, 'reason'),
        weakAreas: readStringList(json, 'weakAreas'),
        suggestedDifficulty: readString(json, 'suggestedDifficulty'),
      );

  Map<String, dynamic> toJson() => {
        'nextModuleId': nextModuleId,
        'title': title,
        'reason': reason,
        'weakAreas': weakAreas,
        'suggestedDifficulty': suggestedDifficulty,
      };
}

