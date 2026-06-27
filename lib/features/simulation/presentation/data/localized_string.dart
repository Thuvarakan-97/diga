import 'package:diga/core/locale/app_locale_provider.dart';

/// Bilingual string pair for clinical scenario content.
class L10nStr {
  const L10nStr(this.en, this.de);

  final String en;
  final String de;

  String forLanguage(AppLanguage language) => language == AppLanguage.de ? de : en;
}

List<String> localizedOptions(AppLanguage language, List<L10nStr> options) =>
    options.map((o) => o.forLanguage(language)).toList(growable: false);
