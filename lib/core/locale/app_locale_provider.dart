import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Supported UI languages. **English is the default** (`en`).
enum AppLanguage {
  en('en'),
  de('de');

  const AppLanguage(this.code);
  final String code;

  Locale get locale => Locale(code);
}

/// Currently selected app language (persist to storage in a later step).
final appLanguageProvider = StateProvider<AppLanguage>((ref) => AppLanguage.en);

final appLocaleProvider = Provider<Locale>((ref) => ref.watch(appLanguageProvider).locale);
