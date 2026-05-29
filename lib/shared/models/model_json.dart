/// Shared JSON helpers for Firestore/API maps without depending on Firebase SDKs here.
String readString(Map<String, dynamic> json, String key, {String defaultValue = ''}) {
  final v = json[key];
  if (v == null) return defaultValue;
  return v.toString();
}

String? readStringOrNull(Map<String, dynamic> json, String key) {
  final v = json[key];
  if (v == null) return null;
  final s = v.toString();
  return s.isEmpty ? null : s;
}

bool readBool(Map<String, dynamic> json, String key, {bool defaultValue = false}) {
  final v = json[key];
  if (v is bool) return v;
  if (v is num) return v != 0;
  if (v is String) return v.toLowerCase() == 'true' || v == '1';
  return defaultValue;
}

int readInt(Map<String, dynamic> json, String key, {int defaultValue = 0}) {
  final v = json[key];
  if (v is int) return v;
  if (v is num) return v.round();
  if (v is String) return int.tryParse(v) ?? defaultValue;
  return defaultValue;
}

double readDouble(Map<String, dynamic> json, String key, {double defaultValue = 0}) {
  final v = json[key];
  if (v is double) return v;
  if (v is num) return v.toDouble();
  if (v is String) return double.tryParse(v) ?? defaultValue;
  return defaultValue;
}

DateTime? readDateTimeOrNull(Map<String, dynamic> json, String key) {
  final v = json[key];
  if (v == null) return null;
  if (v is DateTime) return v;
  if (v is String) return DateTime.tryParse(v);
  if (v is int) return DateTime.fromMillisecondsSinceEpoch(v, isUtc: true);
  return null;
}

DateTime readDateTime(Map<String, dynamic> json, String key, {DateTime? defaultValue}) {
  return readDateTimeOrNull(json, key) ?? defaultValue ?? DateTime.fromMillisecondsSinceEpoch(0, isUtc: true);
}

List<String> readStringList(Map<String, dynamic> json, String key) {
  final v = json[key];
  if (v is! List) return const [];
  return v.map((e) => e?.toString() ?? '').where((s) => s.isNotEmpty).toList(growable: false);
}

List<Map<String, dynamic>> readMapList(Map<String, dynamic> json, String key) {
  final v = json[key];
  if (v is! List) return const [];
  return v
      .whereType<Map>()
      .map((e) => e.map((k, v) => MapEntry(k.toString(), v)))
      .map(Map<String, dynamic>.from)
      .toList(growable: false);
}

Map<String, dynamic> readMap(Map<String, dynamic> json, String key) {
  final v = json[key];
  if (v is! Map) return const {};
  return Map<String, dynamic>.from(v.map((k, v) => MapEntry(k.toString(), v)));
}
