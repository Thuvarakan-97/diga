import 'package:diga/shared/extensions/context_l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_routes.dart';
import '../providers/auth_providers.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  bool _minDelayDone = false;

  @override
  void initState() {
    super.initState();
    Future<void>.delayed(const Duration(milliseconds: 600), () {
      if (mounted) setState(() => _minDelayDone = true);
    });
  }

  void _routeIfReady(AuthSessionStatus status) {
    if (!_minDelayDone || !mounted || status == AuthSessionStatus.loading) return;
    context.go(status == AuthSessionStatus.authed ? AppRoutes.home : AppRoutes.login);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final status = ref.watch(authSessionStatusProvider);

    ref.listen(authSessionStatusProvider, (_, next) => _routeIfReady(next));
    WidgetsBinding.instance.addPostFrameCallback((_) => _routeIfReady(status));

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const FlutterLogo(size: 96),
            const SizedBox(height: 24),
            Text(l10n.appTitle, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600)),
            const SizedBox(height: 8),
            Text(l10n.splashLoading, style: const TextStyle(color: Colors.black54)),
            const SizedBox(height: 24),
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
