import 'package:diga/core/validators/input_validators.dart';
import 'package:diga/features/auth/presentation/utils/auth_error_messages.dart';
import 'package:diga/features/auth/presentation/widgets/google_sign_in_button.dart';
import 'package:diga/shared/extensions/context_l10n.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_routes.dart';
import '../providers/auth_providers.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _confirm = TextEditingController();
  final _displayName = TextEditingController();
  bool _busy = false;

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    _confirm.dispose();
    _displayName.dispose();
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
    final l10n = context.l10n;
    if (!_formKey.currentState!.validate()) return;
    final mismatch = InputValidators.passwordMatch(_password.text, _confirm.text, l10n);
    if (mismatch != null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(mismatch)));
      return;
    }
    await _runAuth(
      () => ref.read(authRepositoryProvider).registerWithEmailAndPassword(
            email: _email.text,
            password: _password.text,
            displayName: _displayName.text.trim().isEmpty ? null : _displayName.text.trim(),
          ),
    );
  }

  Future<void> _signInWithGoogle() async {
    await _runAuth(() => ref.read(authRepositoryProvider).signInWithGoogle());
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final firebaseReady = ref.watch(firebaseReadyProvider);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.authRegisterTitle)),
      body: AbsorbPointer(
        absorbing: _busy,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (firebaseReady) ...[
                  GoogleSignInButton(onPressed: _signInWithGoogle, busy: _busy),
                  const SizedBox(height: 16),
                  AuthDividerLabel(label: l10n.authOrContinueWith),
                  const SizedBox(height: 16),
                ],
                TextFormField(
                  controller: _displayName,
                  decoration: InputDecoration(labelText: l10n.authDisplayNameLabel),
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 16),
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
                  textInputAction: TextInputAction.next,
                  validator: (v) => InputValidators.password(v, l10n),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _confirm,
                  decoration: InputDecoration(labelText: l10n.authPasswordConfirmLabel),
                  obscureText: true,
                  textInputAction: TextInputAction.done,
                  onFieldSubmitted: (_) => _submit(),
                  validator: (v) => InputValidators.password(v, l10n),
                ),
                const SizedBox(height: 24),
                FilledButton(onPressed: _busy ? null : _submit, child: Text(l10n.authCreateAccountCta)),
                const SizedBox(height: 12),
                OutlinedButton(
                  onPressed: _busy ? null : () => context.go(AppRoutes.login),
                  child: Text(l10n.authHaveAccountLink),
                ),
                if (_busy) const Padding(padding: EdgeInsets.only(top: 24), child: Center(child: CircularProgressIndicator())),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
