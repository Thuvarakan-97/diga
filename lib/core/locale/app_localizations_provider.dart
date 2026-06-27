import 'package:diga/l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app_locale_provider.dart';

/// [AppLocalizations] resolved from the current [appLanguageProvider].
final appLocalizationsProvider = Provider<AppLocalizations>((ref) {
  final locale = ref.watch(appLocaleProvider);
  return lookupAppLocalizations(locale);
});
