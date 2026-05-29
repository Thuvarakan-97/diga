/// Canonical path strings and small helpers for query/path params.
///
/// Auth redirects (Firebase) will be layered on top in the auth feature; keep paths centralized here.
abstract final class AppRoutes {
  static const splash = '/splash';
  static const login = '/login';
  static const register = '/register';

  /// Tab shell branches
  static const home = '/home';
  static const modules = '/modules';
  static const companion = '/companion';
  static const progress = '/progress';
  static const profile = '/profile';
  static const profilePersonalDetails = '/profile/personal-details';
  static const profileNotifications = '/profile/notifications';
  static const profilePrivacy = '/profile/privacy';
  static const profileHelp = '/profile/help';

  static String moduleDetail(String moduleId) => '/modules/$moduleId';

  static String simulationDiagnose(String moduleId) => '/modules/$moduleId/simulation/diagnose';

  static String simulationPrescribe(String moduleId) => '/modules/$moduleId/simulation/prescribe';

  static String simulationFollowUp(String moduleId) => '/modules/$moduleId/simulation/follow-up';

  static String simulationResult(String moduleId) => '/modules/$moduleId/simulation/result';

  /// Optional focus module for companion deep links (`?moduleId=`).
  static String companionFocused(String moduleId) => '$companion?moduleId=$moduleId';
}

/// Maps branch index to route path (must match [goRouter] shell branch order).
abstract final class MainShellBranch {
  static const paths = <String>[
    AppRoutes.home,
    AppRoutes.modules,
    AppRoutes.companion,
    AppRoutes.progress,
    AppRoutes.profile,
  ];

  static int indexForLocation(String location) {
    final uri = Uri.parse(location);
    final path = uri.path;
    for (var i = 0; i < paths.length; i++) {
      if (path.startsWith(paths[i])) return i;
    }
    return 0;
  }
}
