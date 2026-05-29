import 'model_json.dart';

/// Version stamp for synced educational content (modules, companion text).
class ContentVersion {
  const ContentVersion({
    required this.id,
    required this.semverLabel,
    required this.publishedAt,
    this.releaseNotes,
    this.modulesAffected = const [],
  });

  final String id;
  final String semverLabel;
  final DateTime publishedAt;
  final String? releaseNotes;
  final List<String> modulesAffected;

  factory ContentVersion.fromJson(Map<String, dynamic> json) {
    return ContentVersion(
      id: readString(json, 'id'),
      semverLabel: readString(json, 'semverLabel'),
      publishedAt: readDateTime(json, 'publishedAt'),
      releaseNotes: readStringOrNull(json, 'releaseNotes'),
      modulesAffected: readStringList(json, 'modulesAffected'),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'semverLabel': semverLabel,
        'publishedAt': publishedAt.toUtc().toIso8601String(),
        if (releaseNotes != null) 'releaseNotes': releaseNotes,
        'modulesAffected': modulesAffected,
      };
}
