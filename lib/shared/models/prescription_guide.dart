import 'model_json.dart';
import 'contraindication_rule.dart';
import 'eligibility_rule.dart';
import 'icd_code.dart';

/// Reference content for the prescription companion (per DiGA module).
class PrescriptionGuide {
  const PrescriptionGuide({
    required this.moduleId,
    required this.digaSummary,
    this.icdCodes = const [],
    this.eligibilityCriteria = const [],
    this.contraindications = const [],
    required this.documentationNotes,
    required this.insuranceNotes,
    required this.patientGuidanceSummary,
    this.contentVersionId,
    this.lastReviewedAt,
  });

  final String moduleId;
  final String digaSummary;
  final List<ICDCode> icdCodes;
  final List<EligibilityRule> eligibilityCriteria;
  final List<ContraindicationRule> contraindications;
  final String documentationNotes;
  final String insuranceNotes;
  final String patientGuidanceSummary;
  final String? contentVersionId;
  final DateTime? lastReviewedAt;

  factory PrescriptionGuide.fromJson(Map<String, dynamic> json) {
    return PrescriptionGuide(
      moduleId: readString(json, 'moduleId'),
      digaSummary: readString(json, 'digaSummary'),
      icdCodes: readMapList(json, 'icdCodes').map(ICDCode.fromJson).toList(growable: false),
      eligibilityCriteria:
          readMapList(json, 'eligibilityCriteria').map(EligibilityRule.fromJson).toList(growable: false),
      contraindications:
          readMapList(json, 'contraindications').map(ContraindicationRule.fromJson).toList(growable: false),
      documentationNotes: readString(json, 'documentationNotes'),
      insuranceNotes: readString(json, 'insuranceNotes'),
      patientGuidanceSummary: readString(json, 'patientGuidanceSummary'),
      contentVersionId: readStringOrNull(json, 'contentVersionId'),
      lastReviewedAt: readDateTimeOrNull(json, 'lastReviewedAt'),
    );
  }

  Map<String, dynamic> toJson() => {
        'moduleId': moduleId,
        'digaSummary': digaSummary,
        'icdCodes': icdCodes.map((e) => e.toJson()).toList(growable: false),
        'eligibilityCriteria': eligibilityCriteria.map((e) => e.toJson()).toList(growable: false),
        'contraindications': contraindications.map((e) => e.toJson()).toList(growable: false),
        'documentationNotes': documentationNotes,
        'insuranceNotes': insuranceNotes,
        'patientGuidanceSummary': patientGuidanceSummary,
        if (contentVersionId != null) 'contentVersionId': contentVersionId,
        if (lastReviewedAt != null) 'lastReviewedAt': lastReviewedAt!.toUtc().toIso8601String(),
      };
}
