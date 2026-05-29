import 'package:diga/l10n/app_localizations.dart';

/// Shared form validation using localized messages.
abstract final class InputValidators {
  static String? email(String? raw, AppLocalizations l10n) {
    final v = raw?.trim() ?? '';
    if (v.isEmpty) return l10n.validationEmailRequired;
    final emailPattern = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailPattern.hasMatch(v)) return l10n.validationEmailInvalid;
    return null;
  }

  static String? password(String? raw, AppLocalizations l10n) {
    final v = raw ?? '';
    if (v.isEmpty) return l10n.validationPasswordRequired;
    if (v.length < 8) return l10n.validationPasswordMin;
    return null;
  }

  static String? passwordMatch(String? password, String? confirm, AppLocalizations l10n) {
    if ((password ?? '') != (confirm ?? '')) return l10n.validationPasswordMismatch;
    return null;
  }
}
