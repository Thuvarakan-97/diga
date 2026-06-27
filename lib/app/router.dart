import 'package:diga/l10n/app_localizations.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../core/constants/app_route_names.dart';
import '../core/constants/app_routes.dart';
import '../features/auth/presentation/providers/auth_providers.dart';
import '../features/auth/presentation/providers/auth_router_refresh.dart';
import '../features/auth/presentation/screens/login_screen.dart';
import '../features/auth/presentation/screens/register_screen.dart';
import '../features/auth/presentation/screens/splash_screen.dart';
import '../features/companion/presentation/screens/prescription_companion_screen.dart';
import '../features/diga_modules/presentation/screens/module_detail_screen.dart';
import '../features/diga_modules/presentation/screens/module_list_screen.dart';
import '../features/home/presentation/screens/home_screen.dart';
import '../features/profile/presentation/screens/help_support_screen.dart';
import '../features/profile/presentation/screens/notifications_screen.dart';
import '../features/profile/presentation/screens/personal_details_screen.dart';
import '../features/profile/presentation/screens/privacy_data_screen.dart';
import '../features/profile/presentation/screens/profile_screen.dart';
import '../features/progress/presentation/screens/progress_dashboard_screen.dart';
import '../features/simulation/presentation/screens/simulation_exam_screen.dart';
import 'package:diga/features/simulation/presentation/screens/simulation_result_screen.dart';
import 'main_shell.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

bool _isPublicRoute(String location) {
  return location == AppRoutes.splash ||
      location == AppRoutes.login ||
      location == AppRoutes.register;
}

/// Global [GoRouter] for the app (auth + demo-mode aware).
final goRouterProvider = Provider<GoRouter>((ref) {
  final refresh = ref.watch(authRouterRefreshProvider);

  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: AppRoutes.splash,
    refreshListenable: refresh,
    debugLogDiagnostics: kDebugMode,
    redirect: (context, state) {
      final loc = state.matchedLocation;
      final status = ref.read(authSessionStatusProvider);

      if (status == AuthSessionStatus.loading) {
        if (loc != AppRoutes.splash) return AppRoutes.splash;
        return null;
      }

      final authed = status == AuthSessionStatus.authed;

      if (_isPublicRoute(loc)) {
        if (authed && (loc == AppRoutes.login || loc == AppRoutes.register)) {
          return AppRoutes.home;
        }
        return null;
      }

      if (!authed) return AppRoutes.login;
      return null;
    },
    routes: [
      GoRoute(
        path: AppRoutes.splash,
        name: AppRouteNames.splash,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: AppRoutes.login,
        name: AppRouteNames.login,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: AppRoutes.register,
        name: AppRouteNames.register,
        builder: (context, state) => const RegisterScreen(),
      ),
      StatefulShellRoute.indexedStack(
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state, navigationShell) {
          return MainShell(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.home,
                name: AppRouteNames.home,
                builder: (context, state) => const HomeScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.modules,
                name: AppRouteNames.moduleList,
                builder: (context, state) => const ModuleListScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.companion,
                name: AppRouteNames.companion,
                builder: (context, state) {
                  final moduleId = state.uri.queryParameters['moduleId'];
                  return PrescriptionCompanionScreen(moduleId: moduleId);
                },
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.progress,
                name: AppRouteNames.progress,
                builder: (context, state) => const ProgressDashboardScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.profile,
                name: AppRouteNames.profile,
                builder: (context, state) => const ProfileScreen(),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: AppRoutes.profilePersonalDetails,
        name: AppRouteNames.profilePersonalDetails,
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const PersonalDetailsScreen(),
      ),
      GoRoute(
        path: AppRoutes.profileNotifications,
        name: AppRouteNames.profileNotifications,
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const NotificationsScreen(),
      ),
      GoRoute(
        path: AppRoutes.profilePrivacy,
        name: AppRouteNames.profilePrivacy,
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const PrivacyDataScreen(),
      ),
      GoRoute(
        path: AppRoutes.profileHelp,
        name: AppRouteNames.profileHelp,
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const HelpSupportScreen(),
      ),
      GoRoute(
        path: '/modules/:moduleId',
        name: AppRouteNames.moduleDetail,
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) {
          final moduleId = state.pathParameters['moduleId']!;
          return ModuleDetailScreen(moduleId: moduleId);
        },
      ),
      GoRoute(
        path: '/modules/:moduleId/simulation/diagnose',
        name: AppRouteNames.simulationDiagnose,
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) {
          final moduleId = state.pathParameters['moduleId']!;
          final scenarioId = state.uri.queryParameters['scenarioId'];
          return SimulationExamScreen(moduleId: moduleId, scenarioId: scenarioId);
        },
      ),
      GoRoute(
        path: '/modules/:moduleId/simulation/prescribe',
        name: AppRouteNames.simulationPrescribe,
        parentNavigatorKey: _rootNavigatorKey,
        redirect: (context, state) {
          final moduleId = state.pathParameters['moduleId']!;
          return AppRoutes.simulationDiagnose(moduleId);
        },
      ),
      GoRoute(
        path: '/modules/:moduleId/simulation/follow-up',
        name: AppRouteNames.simulationFollowUp,
        parentNavigatorKey: _rootNavigatorKey,
        redirect: (context, state) {
          final moduleId = state.pathParameters['moduleId']!;
          return AppRoutes.simulationDiagnose(moduleId);
        },
      ),
      GoRoute(
        path: '/modules/:moduleId/simulation/result',
        name: AppRouteNames.simulationResult,
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) {
          final moduleId = state.pathParameters['moduleId']!;
          return SimulationResultScreen(moduleId: moduleId);
        },
      ),
    ],
    errorBuilder: (context, state) {
      final l10n = AppLocalizations.of(context);
      return Scaffold(
        appBar: AppBar(title: Text(l10n?.errorRouteTitle ?? 'Error')),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Text(
              l10n != null
                  ? l10n.errorUnknownRoute(state.uri.toString())
                  : 'Route not found:\n${state.uri}',
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );
    },
  );
});
