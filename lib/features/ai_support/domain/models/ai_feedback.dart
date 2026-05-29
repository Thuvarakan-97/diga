import 'package:diga/shared/models/model_json.dart';

class AIFeedback {
  const AIFeedback({
    required this.shortExplanation,
    required this.detailedExplanation,
    required this.reasoningSteps,
    required this.teachingTips,
  });

  final String shortExplanation;
  final String detailedExplanation;
  final List<String> reasoningSteps;
  final List<String> teachingTips;

  factory AIFeedback.fromJson(Map<String, dynamic> json) => AIFeedback(
        shortExplanation: readString(json, 'shortExplanation'),
        detailedExplanation: readString(json, 'detailedExplanation'),
        reasoningSteps: readStringList(json, 'reasoningSteps'),
        teachingTips: readStringList(json, 'teachingTips'),
      );

  Map<String, dynamic> toJson() => {
        'shortExplanation': shortExplanation,
        'detailedExplanation': detailedExplanation,
        'reasoningSteps': reasoningSteps,
        'teachingTips': teachingTips,
      };
}

