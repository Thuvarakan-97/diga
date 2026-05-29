import 'package:diga/shared/models/model_json.dart';

class AIPatientCase {
  const AIPatientCase({
    required this.id,
    required this.moduleId,
    required this.age,
    required this.symptoms,
    required this.medicalHistory,
    required this.labValues,
    required this.severity,
    required this.variationNotes,
  });

  final String id;
  final String moduleId;
  final int age;
  final List<String> symptoms;
  final List<String> medicalHistory;
  final Map<String, String> labValues;
  final String severity;
  final String variationNotes;

  factory AIPatientCase.fromJson(Map<String, dynamic> json) => AIPatientCase(
        id: readString(json, 'id'),
        moduleId: readString(json, 'moduleId'),
        age: readInt(json, 'age'),
        symptoms: readStringList(json, 'symptoms'),
        medicalHistory: readStringList(json, 'medicalHistory'),
        labValues: readMap(json, 'labValues').map((k, v) => MapEntry(k, v.toString())),
        severity: readString(json, 'severity'),
        variationNotes: readString(json, 'variationNotes'),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'moduleId': moduleId,
        'age': age,
        'symptoms': symptoms,
        'medicalHistory': medicalHistory,
        'labValues': labValues,
        'severity': severity,
        'variationNotes': variationNotes,
      };
}

