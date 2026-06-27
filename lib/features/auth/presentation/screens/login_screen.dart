import 'package:diga/core/validators/input_validators.dart';
import 'package:diga/features/auth/presentation/utils/auth_error_messages.dart';
import 'package:diga/features/auth/presentation/widgets/google_sign_in_button.dart';
import 'package:diga/shared/extensions/context_l10n.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_routes.dart';
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
      if (mounted) context.go(AppRoutes.home);
    } on FirebaseAuthException catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(authErrorMessage(e, l10n))),
        );
      }
    } on UnsupportedError catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(l10n.demoContinueButton)));
      }
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(l10n.authErrorGeneric)));
      }
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    await _runAuth(
      () => ref.read(authRepositoryProvider).signInWithEmailAndPassword(
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
          TextButton(onPressed: () => Navigator.pop(ctx, false), child: Text(MaterialLocalizations.of(ctx).cancelButtonLabel)),
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
      await ref.read(authRepositoryProvider).sendPasswordResetEmail(emailCtrl.text);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(l10n.authResetSent)));
      }
    } on FirebaseAuthException catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(authErrorMessage(e, l10n))),
        );
      }
    } on UnsupportedError catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(l10n.demoContinueButton)));
      }
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(l10n.authErrorGeneric)));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final firebaseReady = ref.watch(firebaseReadyProvider);
    final showDemo = !firebaseReady && kDebugMode;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.loginTitle)),
      body: AbsorbPointer(
        absorbing: _busy,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  l10n.loginHeadline,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 8),
                Text(
                  l10n.loginSubtitle,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.black54),
                ),
                if (kIsWeb && !firebaseReady) ...[
                  const SizedBox(height: 16),
                  Card(
                    color: Colors.amber.shade50,
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text(
                        DefaultFirebaseOptions.isWebConfigured
                            ? l10n.authErrorGeneric
                            : l10n.authFirebaseWebSetup,
                        style: const TextStyle(fontSize: 13, height: 1.4),
                      ),
                    ),
                  ),
                ],
                const SizedBox(height: 24),
                if (firebaseReady) ...[
                  GoogleSignInButton(onPressed: _signInWithGoogle, busy: _busy),
                  const SizedBox(height: 16),
                  AuthDividerLabel(label: l10n.authOrContinueWith),
                  const SizedBox(height: 16),
                ],
                TextFormField(
                  controller: _email,
                  decoration: InputDecoration(labelText: l10n.authEmailLabel),
                  keyboardType: TextInputType.emailAddress,
                  autocorrect: false,
                  textInputAction: TextInputAction.next,
                  validator: (v) => InputValidators.email(v, l10n),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _password,
                  decoration: InputDecoration(labelText: l10n.authPasswordLabel),
                  obscureText: true,
                  textInputAction: TextInputAction.done,
                  onFieldSubmitted: (_) => _submit(),
                  validator: (v) => InputValidators.password(v, l10n),
                ),
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(onPressed: _forgotPassword, child: Text(l10n.authForgotPassword)),
                ),
                const SizedBox(height: 8),
                FilledButton(onPressed: _busy ? null : _submit, child: Text(l10n.authSignInCta)),
                const SizedBox(height: 12),
                OutlinedButton(
                  onPressed: _busy ? null : () => context.push(AppRoutes.register),
                  child: Text(l10n.authNoAccountLink),
                ),
                if (showDemo) ...[
                  const SizedBox(height: 24),
                  OutlinedButton(
                    onPressed: _busy ? null : _demoMode,
                    child: Text(l10n.demoContinueButton),
                  ),
                ],
                if (_busy) const Padding(padding: EdgeInsets.only(top: 24), child: Center(child: CircularProgressIndicator())),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
