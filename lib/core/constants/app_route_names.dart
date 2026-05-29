/// Logical route names for `context.goNamed` / `pushNamed`.
///
/// Paths live in [AppRoutes]; keep names stable when refactoring URLs.
abstract final class AppRouteNames {
  static const splash = 'splash';
  static const login = 'login';
  static const register = 'register';
  static const home = 'home';
  static const moduleList = 'moduleList';
  static const companion = 'companion';
  static const progress = 'progress';
  static const profile = 'profile';
  static const profilePersonalDetails = 'profilePersonalDetails';
  static const profileNotifications = 'profileNotifications';
  static const profilePrivacy = 'profilePrivacy';
  static const profileHelp = 'profileHelp';
  static const moduleDetail = 'moduleDetail';
  static const simulationDiagnose = 'simulationDiagnose';
  static const simulationPrescribe = 'simulationPrescribe';
  static const simulationFollowUp = 'simulationFollowUp';
  static const simulationResult = 'simulationResult';
}
