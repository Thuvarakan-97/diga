import 'package:diga/shared/models/model_json.dart';

class Badge {
  const Badge({
    required this.id,
    required this.title,
    required this.description,
    required this.icon,
    this.unlocked = false,
    this.unlockedAt,
  });

  final String id;
  final String title;
  final String description;
  final String icon;
  final bool unlocked;
  final DateTime? unlockedAt;

  factory Badge.fromJson(Map<String, dynamic> json) => Badge(
        id: readString(json, 'id'),
        title: readString(json, 'title'),
        description: readString(json, 'description'),
        icon: readString(json, 'icon'),
        unlocked: readBool(json, 'unlocked'),
        unlockedAt: readDateTimeOrNull(json, 'unlockedAt'),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'icon': icon,
        'unlocked': unlocked,
        if (unlockedAt != null) 'unlockedAt': unlockedAt!.toUtc().toIso8601String(),
      };

  Badge copyWith({bool? unlocked, DateTime? unlockedAt}) => Badge(
        id: id,
        title: title,
        description: description,
        icon: icon,
        unlocked: unlocked ?? this.unlocked,
        unlockedAt: unlockedAt ?? this.unlockedAt,
      );
}

