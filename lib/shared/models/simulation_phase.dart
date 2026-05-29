import 'model_json.dart';
import 'feedback_item.dart';
import 'follow_up_outcome.dart';
import 'icd_code.dart';
import 'patient_case.dart';

/// Which part of the 3-phase simulation this content block belongs to.
enum SimulationPhaseKind {
  diagnose,
  prescribe,
  followUp;

  static SimulationPhaseKind parse(String raw) {
    for (final v in SimulationPhaseKind.values) {
      if (v.name == raw) return v;
    }
    return SimulationPhaseKind.diagnose;
  }
}

/// Generic labeled option (therapy goal, management decision, etc.).
class SelectOption {
  const SelectOption({required this.id, required this.label});

  final String id;
  final String label;

  factory SelectOption.fromJson(Map<String, dynamic> json) {
    return SelectOption(
      id: readString(json, 'id'),
      label: readString(json, 'label'),
    );
  }

  Map<String, dynamic> toJson() => {'id': id, 'label': label};
}

/// Documentation checklist row; `expectedChecked` is the correct completion for scoring.
class ChecklistItem {
  const ChecklistItem({
    required this.id,
    required this.label,
    required this.expectedChecked,
  });

  final String id;
  final String label;
  final bool expectedChecked;

  factory ChecklistItem.fromJson(Map<String, dynamic> json) {
    return ChecklistItem(
      id: readString(json, 'id'),
      label: readString(json, 'label'),
      expectedChecked: readBool(json, 'expectedChecked'),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'label': label,
        'expectedChecked': expectedChecked,
      };
}

/// Content for exactly one simulation phase (Diagnose, Prescribe, or Follow-up).
///
/// Fields are optional by phase; repositories/UI should use [kind] to decide what is required.
class SimulationPhase {
  const SimulationPhase({
    required this.id,
    required this.moduleId,
    required this.kind,
    required this.order,
    required this.title,
    this.subtitle,
    this.teachingIntro,
    this.patientCase,
    this.qualifiesQuestion,
    this.correctAnswerQualifies,
    this.feedbackIfCorrect,
    this.feedbackIfIncorrect,
    this.icdOptions,
    this.therapyGoalOptions,
    this.correctTherapyGoalId,
    this.documentationChecklist,
    this.followUpOutcome,
    this.managementOptions,
    this.correctManagementOptionId,
    this.feedbackManagementCorrect,
    this.feedbackManagementIncorrect,
    this.finalFeedback,
  });

  final String id;
  final String moduleId;
  final SimulationPhaseKind kind;
  final int order;
  final String title;
  final String? subtitle;
  final String? teachingIntro;

  // Diagnose
  final PatientCase? patientCase;
  final String? qualifiesQuestion;
  final bool? correctAnswerQualifies;
  final FeedbackItem? feedbackIfCorrect;
  final FeedbackItem? feedbackIfIncorrect;

  // Prescribe
  final List<ICDCode>? icdOptions;
  final List<SelectOption>? therapyGoalOptions;
  final String? correctTherapyGoalId;
  final List<ChecklistItem>? documentationChecklist;

  // Follow-up
  final FollowUpOutcome? followUpOutcome;
  final List<SelectOption>? managementOptions;
  final String? correctManagementOptionId;
  final FeedbackItem? feedbackManagementCorrect;
  final FeedbackItem? feedbackManagementIncorrect;
  final FeedbackItem? finalFeedback;

  factory SimulationPhase.fromJson(Map<String, dynamic> json) {
    return SimulationPhase(
      id: readString(json, 'id'),
      moduleId: readString(json, 'moduleId'),
      kind: SimulationPhaseKind.parse(readString(json, 'kind')),
      order: readInt(json, 'order'),
      title: readString(json, 'title'),
      subtitle: readStringOrNull(json, 'subtitle'),
      teachingIntro: readStringOrNull(json, 'teachingIntro'),
      patientCase: json['patientCase'] is Map<String, dynamic>
          ? PatientCase.fromJson(Map<String, dynamic>.from(json['patientCase'] as Map))
          : null,
      qualifiesQuestion: readStringOrNull(json, 'qualifiesQuestion'),
      correctAnswerQualifies: json.containsKey('correctAnswerQualifies')
          ? readBool(json, 'correctAnswerQualifies')
          : null,
      feedbackIfCorrect: json['feedbackIfCorrect'] is Map<String, dynamic>
          ? FeedbackItem.fromJson(Map<String, dynamic>.from(json['feedbackIfCorrect'] as Map))
          : null,
      feedbackIfIncorrect: json['feedbackIfIncorrect'] is Map<String, dynamic>
          ? FeedbackItem.fromJson(Map<String, dynamic>.from(json['feedbackIfIncorrect'] as Map))
          : null,
      icdOptions: _readList(json, 'icdOptions', ICDCode.fromJson),
      therapyGoalOptions: _readList(json, 'therapyGoalOptions', SelectOption.fromJson),
      correctTherapyGoalId: readStringOrNull(json, 'correctTherapyGoalId'),
      documentationChecklist: _readList(json, 'documentationChecklist', ChecklistItem.fromJson),
      followUpOutcome: json['followUpOutcome'] is Map<String, dynamic>
          ? FollowUpOutcome.fromJson(Map<String, dynamic>.from(json['followUpOutcome'] as Map))
          : null,
      managementOptions: _readList(json, 'managementOptions', SelectOption.fromJson),
      correctManagementOptionId: readStringOrNull(json, 'correctManagementOptionId'),
      feedbackManagementCorrect: json['feedbackManagementCorrect'] is Map<String, dynamic>
          ? FeedbackItem.fromJson(Map<String, dynamic>.from(json['feedbackManagementCorrect'] as Map))
          : null,
      feedbackManagementIncorrect: json['feedbackManagementIncorrect'] is Map<String, dynamic>
          ? FeedbackItem.fromJson(Map<String, dynamic>.from(json['feedbackManagementIncorrect'] as Map))
          : null,
      finalFeedback: json['finalFeedback'] is Map<String, dynamic>
          ? FeedbackItem.fromJson(Map<String, dynamic>.from(json['finalFeedback'] as Map))
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'moduleId': moduleId,
        'kind': kind.name,
        'order': order,
        'title': title,
        if (subtitle != null) 'subtitle': subtitle,
        if (teachingIntro != null) 'teachingIntro': teachingIntro,
        if (patientCase != null) 'patientCase': patientCase!.toJson(),
        if (qualifiesQuestion != null) 'qualifiesQuestion': qualifiesQuestion,
        if (correctAnswerQualifies != null) 'correctAnswerQualifies': correctAnswerQualifies,
        if (feedbackIfCorrect != null) 'feedbackIfCorrect': feedbackIfCorrect!.toJson(),
        if (feedbackIfIncorrect != null) 'feedbackIfIncorrect': feedbackIfIncorrect!.toJson(),
        if (icdOptions != null) 'icdOptions': icdOptions!.map((e) => e.toJson()).toList(growable: false),
        if (therapyGoalOptions != null)
          'therapyGoalOptions': therapyGoalOptions!.map((e) => e.toJson()).toList(growable: false),
        if (correctTherapyGoalId != null) 'correctTherapyGoalId': correctTherapyGoalId,
        if (documentationChecklist != null)
          'documentationChecklist':
              documentationChecklist!.map((e) => e.toJson()).toList(growable: false),
        if (followUpOutcome != null) 'followUpOutcome': followUpOutcome!.toJson(),
        if (managementOptions != null)
          'managementOptions': managementOptions!.map((e) => e.toJson()).toList(growable: false),
        if (correctManagementOptionId != null) 'correctManagementOptionId': correctManagementOptionId,
        if (feedbackManagementCorrect != null) 'feedbackManagementCorrect': feedbackManagementCorrect!.toJson(),
        if (feedbackManagementIncorrect != null)
          'feedbackManagementIncorrect': feedbackManagementIncorrect!.toJson(),
        if (finalFeedback != null) 'finalFeedback': finalFeedback!.toJson(),
      };
}

List<T>? _readList<T>(
  Map<String, dynamic> json,
  String key,
  T Function(Map<String, dynamic>) map,
) {
  final v = json[key];
  if (v is! List) return null;
  final out = v
      .whereType<Map>()
      .map((e) => map(Map<String, dynamic>.from(e.map((k, v) => MapEntry(k.toString(), v)))))
      .toList(growable: false);
  return out.isEmpty ? null : out;
}
