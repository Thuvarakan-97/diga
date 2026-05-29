import 'model_json.dart';
import 'simulation_phase.dart';

/// High-level DiGA learning module (Kalmeda, Vivira, …).
class DiGAModule {
  const DiGAModule({
    required this.id,
    required this.slug,
    required this.name,
    required this.shortDescription,
    required this.conditionLabel,
    this.specialtyTags = const [],
    required this.estimatedMinutes,
    required this.lastVerifiedAt,
    this.difficultyTag,
    this.moduleTypeTag,
    required this.contentVersionId,
    this.heroImageUrl,
    this.phases = const [],
    this.isPilot = true,
    this.updatedAt,
  });

  final String id;
  final String slug;
  final String name;
  final String shortDescription;
  final String conditionLabel;
  final List<String> specialtyTags;
  final int estimatedMinutes;
  final DateTime lastVerifiedAt;
  final String? difficultyTag;
  final String? moduleTypeTag;
  final String contentVersionId;
  final String? heroImageUrl;

  /// Ordered simulation phases; production may load from subcollection instead.
  final List<SimulationPhase> phases;
  final bool isPilot;
  final DateTime? updatedAt;

  factory DiGAModule.fromJson(Map<String, dynamic> json) {
    return DiGAModule(
      id: readString(json, 'id'),
      slug: readString(json, 'slug'),
      name: readString(json, 'name'),
      shortDescription: readString(json, 'shortDescription'),
      conditionLabel: readString(json, 'conditionLabel'),
      specialtyTags: readStringList(json, 'specialtyTags'),
      estimatedMinutes: readInt(json, 'estimatedMinutes'),
      lastVerifiedAt: readDateTime(json, 'lastVerifiedAt'),
      difficultyTag: readStringOrNull(json, 'difficultyTag'),
      moduleTypeTag: readStringOrNull(json, 'moduleTypeTag'),
      contentVersionId: readString(json, 'contentVersionId'),
      heroImageUrl: readStringOrNull(json, 'heroImageUrl'),
      phases: readMapList(json, 'phases').map(SimulationPhase.fromJson).toList(growable: false),
      isPilot: readBool(json, 'isPilot', defaultValue: true),
      updatedAt: readDateTimeOrNull(json, 'updatedAt'),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'slug': slug,
        'name': name,
        'shortDescription': shortDescription,
        'conditionLabel': conditionLabel,
        'specialtyTags': specialtyTags,
        'estimatedMinutes': estimatedMinutes,
        'lastVerifiedAt': lastVerifiedAt.toUtc().toIso8601String(),
        if (difficultyTag != null) 'difficultyTag': difficultyTag,
        if (moduleTypeTag != null) 'moduleTypeTag': moduleTypeTag,
        'contentVersionId': contentVersionId,
        if (heroImageUrl != null) 'heroImageUrl': heroImageUrl,
        'phases': phases.map((e) => e.toJson()).toList(growable: false),
        'isPilot': isPilot,
        if (updatedAt != null) 'updatedAt': updatedAt!.toUtc().toIso8601String(),
      };
}
