import 'package:diga/l10n/app_localizations.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

/// Maps [FirebaseAuthException.code] to localized user-facing messages.
String authErrorMessage(FirebaseAuthException error, AppLocalizations l10n) {
  switch (error.code) {
    case 'email-already-in-use':
      return l10n.authErrorEmailInUse;
    case 'wrong-password':
    case 'invalid-credential':
      return l10n.authErrorWrongPassword;
    case 'user-not-found':
      return l10n.authErrorUserNotFound;
    case 'invalid-email':
      return l10n.authErrorInvalidEmail;
    case 'weak-password':
      return l10n.authErrorWeakPassword;
    case 'too-many-requests':
      return l10n.authErrorTooManyRequests;
    case 'network-request-failed':
      return l10n.authErrorNetwork;
    case 'google-sign-in-cancelled':
      return l10n.authErrorGoogleCancelled;
    case 'popup-closed-by-user':
      return l10n.authErrorGoogleCancelled;
    default:
      return error.message ?? l10n.authErrorGeneric;
  }
}

String authPlatformErrorMessage(
  PlatformException error,
  AppLocalizations l10n,
) {
  if (error.code == 'sign_in_failed') return l10n.authErrorGoogleSetup;
  if (error.code == 'network_error') return l10n.authErrorNetwork;
  return l10n.authErrorGeneric;
}
