import 'package:diga/core/constants/app_routes.dart';
import 'package:diga/core/constants/app_keys.dart';
import 'package:diga/core/theme/app_colors.dart';
import 'package:diga/core/theme/app_radii.dart';
import 'package:diga/core/theme/app_spacing.dart';
import 'package:diga/core/validators/input_validators.dart';
import 'package:diga/features/auth/presentation/utils/auth_error_messages.dart';
import 'package:diga/features/auth/presentation/widgets/auth_page_shell.dart';
import 'package:diga/features/auth/presentation/widgets/google_sign_in_button.dart';
import 'package:diga/shared/extensions/context_l10n.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

import '../../../../firebase_options.dart';
import '../providers/auth_providers.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _password = TextEditingController();
  bool _busy = false;
  bool _obscurePassword = true;

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  Future<void> _runAuth(Future<void> Function() action) async {
    final l10n = context.l10n;
    setState(() => _busy = true);
    try {
      await action();
      appScaffoldMessengerKey.currentState?.showSnackBar(
        SnackBar(
          backgroundColor: AppColors.success,
          behavior: SnackBarBehavior.floating,
          content: Row(
            children: [
              const Icon(
                Icons.check_circle_outline_rounded,
                color: Colors.white,
              ),
              const SizedBox(width: AppSpacing.sm),
              Expanded(child: Text(l10n.authSignInSuccess)),
            ],
          ),
        ),
      );
      if (mounted) context.go(AppRoutes.home);
    } on FirebaseAuthException catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(authErrorMessage(e, l10n))));
      }
    } on PlatformException catch (e, stackTrace) {
      if (kDebugMode) debugPrint('Google sign-in failed: $e\n$stackTrace');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(authPlatformErrorMessage(e, l10n))),
        );
      }
    } on UnsupportedError catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(l10n.demoContinueButton)));
      }
    } catch (error, stackTrace) {
      if (kDebugMode) {
        debugPrint('Sign-in follow-up failed: $error\n$stackTrace');
      }
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(l10n.authErrorGeneric)));
      }
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    await _runAuth(
      () => ref
          .read(authRepositoryProvider)
          .signInWithEmailAndPassword(
            email: _email.text,
            password: _password.text,
          ),
    );
  }

  Future<void> _signInWithGoogle() async {
    await _runAuth(() => ref.read(authRepositoryProvider).signInWithGoogle());
  }

  void _demoMode() {
    ref.read(demoModeProvider.notifier).state = true;
    context.go(AppRoutes.home);
  }

  Future<void> _forgotPassword() async {
    final l10n = context.l10n;
    final emailCtrl = TextEditingController(text: _email.text.trim());
    final formKey = GlobalKey<FormState>();
    final sent = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(l10n.authForgotPassword),
        content: Form(
          key: formKey,
          child: TextFormField(
            controller: emailCtrl,
            decoration: InputDecoration(labelText: l10n.authEmailLabel),
            validator: (v) => InputValidators.email(v, l10n),
            keyboardType: TextInputType.emailAddress,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(MaterialLocalizations.of(ctx).cancelButtonLabel),
          ),
          FilledButton(
            onPressed: () {
              if (formKey.currentState!.validate()) Navigator.pop(ctx, true);
            },
            child: Text(l10n.authSendReset),
          ),
        ],
      ),
    );
    if (sent != true || !mounted) return;
    try {
      await ref
          .read(authRepositoryProvider)
          .sendPasswordResetEmail(emailCtrl.text);
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(l10n.authResetSent)));
      }
    } on FirebaseAuthException catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(authErrorMessage(e, l10n))));
      }
    } on UnsupportedError catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(l10n.demoContinueButton)));
      }
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(l10n.authErrorGeneric)));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    final firebaseReady = ref.watch(firebaseReadyProvider);
    final showDemo = !firebaseReady && kDebugMode;

    return AuthPageShell(
      busy: _busy,
      form: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: AppColors.primaryContainer,
                    borderRadius: BorderRadius.circular(AppRadii.md),
                  ),
                  child: const Icon(
                    Icons.health_and_safety_rounded,
                    color: AppColors.primary,
                    size: 26,
                  ),
                ),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        l10n.loginAudienceLabel,
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: AppColors.accent,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 0.8,
                        ),
                      ),
                      const SizedBox(height: AppSpacing.xxs),
                      Text(
                        l10n.loginWelcome,
                        style: theme.textTheme.headlineSmall?.copyWith(
                          color: AppColors.primaryDark,
                          fontWeight: FontWeight.w800,
                          letterSpacing: -0.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              l10n.loginFormSubtitle,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: AppColors.textMuted,
                height: 1.5,
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            if (kIsWeb && !firebaseReady) ...[
              const SizedBox(height: AppSpacing.md),
              Container(
                padding: const EdgeInsets.all(AppSpacing.sm),
                decoration: BoxDecoration(
                  color: AppColors.warningSoft,
                  borderRadius: BorderRadius.circular(AppRadii.sm),
                  border: Border.all(
                    color: AppColors.warning.withValues(alpha: 0.35),
                  ),
                ),
                child: Text(
                  DefaultFirebaseOptions.isWebConfigured
                      ? l10n.authErrorGeneric
                      : l10n.authFirebaseWebSetup,
                  style: theme.textTheme.bodySmall?.copyWith(height: 1.4),
                ),
              ),
            ],
            const SizedBox(height: AppSpacing.lg),
            if (firebaseReady) ...[
              GoogleSignInButton(onPressed: _signInWithGoogle, busy: _busy),
              const SizedBox(height: AppSpacing.lg),
              AuthDividerLabel(label: l10n.authOrContinueWith),
              const SizedBox(height: AppSpacing.lg),
            ],
            AuthTextField(
              controller: _email,
              label: l10n.authEmailLabel,
              icon: Icons.mail_outline_rounded,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              validator: (v) => InputValidators.email(v, l10n),
            ),
            const SizedBox(height: AppSpacing.md),
            AuthTextField(
              controller: _password,
              label: l10n.authPasswordLabel,
              icon: Icons.lock_outline_rounded,
              obscureText: _obscurePassword,
              textInputAction: TextInputAction.done,
              onFieldSubmitted: (_) => _submit(),
              validator: (v) => InputValidators.password(v, l10n),
              suffix: IconButton(
                icon: Icon(
                  _obscurePassword
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  size: 20,
                  color: AppColors.textMuted,
                ),
                onPressed: () =>
                    setState(() => _obscurePassword = !_obscurePassword),
              ),
            ),
            const SizedBox(height: AppSpacing.xs),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: _forgotPassword,
                style: TextButton.styleFrom(
                  foregroundColor: AppColors.primary,
                  textStyle: const TextStyle(fontWeight: FontWeight.w600),
                ),
                child: Text(l10n.authForgotPassword),
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            FilledButton(
              onPressed: _busy ? null : _submit,
              style: FilledButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppRadii.md),
                ),
                elevation: 0,
              ),
              child: Text(
                l10n.authSignInCta,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
            ),
            if (showDemo) ...[
              const SizedBox(height: AppSpacing.sm),
              TextButton(
                onPressed: _busy ? null : _demoMode,
                child: Text(l10n.demoContinueButton),
              ),
            ],
          ],
        ),
      ),
      footer: TextButton(
        onPressed: _busy ? null : () => context.push(AppRoutes.register),
        style: TextButton.styleFrom(
          foregroundColor: AppColors.primary,
          textStyle: const TextStyle(fontWeight: FontWeight.w600),
        ),
        child: Text(l10n.authNoAccountLink),
      ),
    );
  }
}
