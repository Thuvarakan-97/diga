import 'package:diga/shared/models/model_json.dart';

class UserLevel {
  const UserLevel({
    required this.index,
    required this.title,
    required this.currentXp,
    required this.currentLevelXp,
    required this.nextLevelXp,
  });

  final int index;
  final String title;
  final int currentXp;
  final int currentLevelXp;
  final int nextLevelXp;

  double get progress {
    final span = (nextLevelXp - currentLevelXp).clamp(1, 1 << 30);
    return ((currentXp - currentLevelXp) / span).clamp(0, 1).toDouble();
  }

  int get xpToNextLevel => (nextLevelXp - currentXp).clamp(0, 1 << 30);

  static const _titles = <String>[
    'Beginner Doctor',
    'Junior Prescriber',
    'DiGA Practitioner',
    'DiGA Expert',
  ];

  static const _thresholds = <int>[0, 600, 1400, 2600, 4200];

  static UserLevel fromTotalXp(int totalXp) {
    var idx = 0;
    for (var i = 0; i < _thresholds.length - 1; i++) {
      if (totalXp >= _thresholds[i]) idx = i;
    }
    final safeIdx = idx.clamp(0, _titles.length - 1);
    final nextBase = _thresholds[(safeIdx + 1).clamp(0, _thresholds.length - 1)];
    return UserLevel(
      index: safeIdx,
      title: _titles[safeIdx],
      currentXp: totalXp,
      currentLevelXp: _thresholds[safeIdx],
      nextLevelXp: safeIdx == _titles.length - 1 ? nextBase + 1200 : nextBase,
    );
  }

  factory UserLevel.fromJson(Map<String, dynamic> json) => UserLevel(
        index: readInt(json, 'index'),
        title: readString(json, 'title'),
        currentXp: readInt(json, 'currentXp'),
        currentLevelXp: readInt(json, 'currentLevelXp'),
        nextLevelXp: readInt(json, 'nextLevelXp'),
      );

  Map<String, dynamic> toJson() => {
        'index': index,
        'title': title,
        'currentXp': currentXp,
        'currentLevelXp': currentLevelXp,
        'nextLevelXp': nextLevelXp,
      };
}

