import 'package:diga/shared/extensions/context_l10n.dart';
import 'package:flutter/material.dart';

/// "Continue with Google" button styled for login/register screens.
class GoogleSignInButton extends StatelessWidget {
  const GoogleSignInButton({super.key, required this.onPressed, this.busy = false});

  final VoidCallback? onPressed;
  final bool busy;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return OutlinedButton.icon(
      onPressed: busy ? null : onPressed,
      icon: busy
          ? const SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(strokeWidth: 2),
            )
          : const Icon(Icons.login_rounded, size: 20),
      label: Text(l10n.authSignInGoogle),
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 12),
      ),
    );
  }
}

/// Horizontal divider with centered label (e.g. "or").
class AuthDividerLabel extends StatelessWidget {
  const AuthDividerLabel({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider()),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(label, style: Theme.of(context).textTheme.bodySmall),
        ),
        const Expanded(child: Divider()),
      ],
    );
  }
}
