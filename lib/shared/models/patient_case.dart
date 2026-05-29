import 'model_json.dart';

/// Laboratory value line shown in Diagnose phase (fictional educational case).
class LabValue {
  const LabValue({
    required this.name,
    required this.value,
    this.unit,
    this.referenceRange,
  });

  final String name;
  final String value;
  final String? unit;
  final String? referenceRange;

  factory LabValue.fromJson(Map<String, dynamic> json) {
    return LabValue(
      name: readString(json, 'name'),
      value: readString(json, 'value'),
      unit: readStringOrNull(json, 'unit'),
      referenceRange: readStringOrNull(json, 'referenceRange'),
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'value': value,
        if (unit != null) 'unit': unit,
        if (referenceRange != null) 'referenceRange': referenceRange,
      };
}

/// Fictional standardized patient vignette for a module simulation.
class PatientCase {
  const PatientCase({
    required this.id,
    required this.moduleId,
    required this.title,
    required this.ageYears,
    this.sex,
    required this.symptoms,
    required this.history,
    required this.labValues,
    this.presentingComplaint,
  });

  final String id;
  final String moduleId;
  final String title;
  final int ageYears;
  final String? sex;
  final List<String> symptoms;
  final List<String> history;
  final List<LabValue> labValues;
  final String? presentingComplaint;

  factory PatientCase.fromJson(Map<String, dynamic> json) {
    return PatientCase(
      id: readString(json, 'id'),
      moduleId: readString(json, 'moduleId'),
      title: readString(json, 'title'),
      ageYears: readInt(json, 'ageYears'),
      sex: readStringOrNull(json, 'sex'),
      symptoms: readStringList(json, 'symptoms'),
      history: readStringList(json, 'history'),
      labValues: readMapList(json, 'labValues').map(LabValue.fromJson).toList(growable: false),
      presentingComplaint: readStringOrNull(json, 'presentingComplaint'),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'moduleId': moduleId,
        'title': title,
        'ageYears': ageYears,
        if (sex != null) 'sex': sex,
        'symptoms': symptoms,
        'history': history,
        'labValues': labValues.map((e) => e.toJson()).toList(growable: false),
        if (presentingComplaint != null) 'presentingComplaint': presentingComplaint,
      };
}
