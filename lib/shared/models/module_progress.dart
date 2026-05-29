import 'model_json.dart';
import 'simulation_phase.dart';

/// Per-user progress for one module (Firestore: `users/{uid}/module_progress/{moduleId}` or merged doc).
class ModuleProgress {
  const ModuleProgress({
    required this.userId,
    required this.moduleId,
    required this.status,
    this.lastPhaseCompleted,
    this.currentPhaseKind,
    required this.startedAt,
    required this.updatedAt,
    this.completedAt,
    this.completedPhases = const [],
    this.lastScore,
    this.lastAccuracyPercent,
  });

  final String userId;
  final String moduleId;
  final ModuleProgressStatus status;

  /// Highest completed phase order (0-based), if any.
  final int? lastPhaseCompleted;

  /// Phase the user should resume on; null if not started or fully complete.
  final SimulationPhaseKind? currentPhaseKind;
  final DateTime startedAt;
  final DateTime updatedAt;
  final DateTime? completedAt;

  /// Completed phase kinds for quick analytics.
  final List<SimulationPhaseKind> completedPhases;
  final int? lastScore;
  final double? lastAccuracyPercent;

  factory ModuleProgress.fromJson(Map<String, dynamic> json) {
    return ModuleProgress(
      userId: readString(json, 'userId'),
      moduleId: readString(json, 'moduleId'),
      status: ModuleProgressStatus.parse(readString(json, 'status')),
      lastPhaseCompleted: json.containsKey('lastPhaseCompleted') ? readInt(json, 'lastPhaseCompleted') : null,
      currentPhaseKind: readStringOrNull(json, 'currentPhaseKind') != null
          ? SimulationPhaseKind.parse(readString(json, 'currentPhaseKind'))
          : null,
      startedAt: readDateTime(json, 'startedAt'),
      updatedAt: readDateTime(json, 'updatedAt'),
      completedAt: readDateTimeOrNull(json, 'completedAt'),
      completedPhases: readStringList(json, 'completedPhases')
          .map(SimulationPhaseKind.parse)
          .toList(growable: false),
      lastScore: json.containsKey('lastScore') ? readInt(json, 'lastScore') : null,
      lastAccuracyPercent: json.containsKey('lastAccuracyPercent') ? readDouble(json, 'lastAccuracyPercent') : null,
    );
  }

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'moduleId': moduleId,
        'status': status.name,
        if (lastPhaseCompleted != null) 'lastPhaseCompleted': lastPhaseCompleted,
        if (currentPhaseKind != null) 'currentPhaseKind': currentPhaseKind!.name,
        'startedAt': startedAt.toUtc().toIso8601String(),
        'updatedAt': updatedAt.toUtc().toIso8601String(),
        if (completedAt != null) 'completedAt': completedAt!.toUtc().toIso8601String(),
        'completedPhases': completedPhases.map((e) => e.name).toList(growable: false),
        if (lastScore != null) 'lastScore': lastScore,
        if (lastAccuracyPercent != null) 'lastAccuracyPercent': lastAccuracyPercent,
      };

  ModuleProgress copyWith({
    String? userId,
    String? moduleId,
    ModuleProgressStatus? status,
    int? lastPhaseCompleted,
    SimulationPhaseKind? currentPhaseKind,
    DateTime? startedAt,
    DateTime? updatedAt,
    DateTime? completedAt,
    List<SimulationPhaseKind>? completedPhases,
    int? lastScore,
    double? lastAccuracyPercent,
  }) {
    return ModuleProgress(
      userId: userId ?? this.userId,
      moduleId: moduleId ?? this.moduleId,
      status: status ?? this.status,
      lastPhaseCompleted: lastPhaseCompleted ?? this.lastPhaseCompleted,
      currentPhaseKind: currentPhaseKind ?? this.currentPhaseKind,
      startedAt: startedAt ?? this.startedAt,
      updatedAt: updatedAt ?? this.updatedAt,
      completedAt: completedAt ?? this.completedAt,
      completedPhases: completedPhases ?? this.completedPhases,
      lastScore: lastScore ?? this.lastScore,
      lastAccuracyPercent: lastAccuracyPercent ?? this.lastAccuracyPercent,
    );
  }
}

enum ModuleProgressStatus {
  notStarted,
  inProgress,
  completed;

  static ModuleProgressStatus parse(String raw) {
    for (final v in ModuleProgressStatus.values) {
      if (v.name == raw) return v;
    }
    return ModuleProgressStatus.notStarted;
  }
}
