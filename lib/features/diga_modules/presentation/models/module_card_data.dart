/// UI row model for the module catalog (replace with repository data later).
class ModuleCardData {
  const ModuleCardData({
    required this.id,
    required this.title,
    required this.condition,
    required this.description,
    required this.durationLabel,
    required this.verifiedLabel,
    required this.specialtyFilterId,
    required this.specialtyTag,
    this.difficultyTag,
    this.progress,
    required this.ctaIsContinue,
  });

  final String id;
  final String title;
  final String condition;
  final String description;
  final String durationLabel;
  final String verifiedLabel;

  /// Matches filter chip id: `all` | `ent` | `gp` | `pain` | `mental`.
  final String specialtyFilterId;
  final String specialtyTag;
  final String? difficultyTag;

  /// 0–1 when user has started; `null` = not started.
  final double? progress;
  final bool ctaIsContinue;

  bool matchesSearch(String query) {
    if (query.isEmpty) return true;
    final q = query.toLowerCase();
    return title.toLowerCase().contains(q) ||
        condition.toLowerCase().contains(q) ||
        description.toLowerCase().contains(q) ||
        specialtyTag.toLowerCase().contains(q) ||
        (difficultyTag?.toLowerCase().contains(q) ?? false);
  }
}
