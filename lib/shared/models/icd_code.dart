import 'model_json.dart';

/// ICD-10-GM code option used in simulation prescribe phase and companion.
class ICDCode {
  const ICDCode({
    required this.code,
    required this.label,
    this.description,
    this.isCorrectForCase = false,
  });

  final String code;
  final String label;
  final String? description;

  /// Content-driven: which option counts as correct for scoring (per case/module).
  final bool isCorrectForCase;

  factory ICDCode.fromJson(Map<String, dynamic> json) {
    return ICDCode(
      code: readString(json, 'code'),
      label: readString(json, 'label'),
      description: readStringOrNull(json, 'description'),
      isCorrectForCase: readBool(json, 'isCorrectForCase'),
    );
  }

  Map<String, dynamic> toJson() => {
        'code': code,
        'label': label,
        if (description != null) 'description': description,
        'isCorrectForCase': isCorrectForCase,
      };
}
