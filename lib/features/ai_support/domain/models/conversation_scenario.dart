import 'package:diga/shared/models/model_json.dart';

class ConversationScenario {
  const ConversationScenario({
    required this.id,
    required this.moduleId,
    required this.title,
    required this.patientName,
    required this.initialPrompt,
    required this.suggestedQuestions,
  });

  final String id;
  final String moduleId;
  final String title;
  final String patientName;
  final String initialPrompt;
  final List<String> suggestedQuestions;

  factory ConversationScenario.fromJson(Map<String, dynamic> json) => ConversationScenario(
        id: readString(json, 'id'),
        moduleId: readString(json, 'moduleId'),
        title: readString(json, 'title'),
        patientName: readString(json, 'patientName'),
        initialPrompt: readString(json, 'initialPrompt'),
        suggestedQuestions: readStringList(json, 'suggestedQuestions'),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'moduleId': moduleId,
        'title': title,
        'patientName': patientName,
        'initialPrompt': initialPrompt,
        'suggestedQuestions': suggestedQuestions,
      };
}

