/// Runtime feature flags via `--dart-define`.
///
/// Example:
/// `flutter run --dart-define=ENABLE_GAMIFICATION=true --dart-define=ENABLE_AI_SUPPORT=true`
abstract final class FeatureFlags {
  static const bool enableGamification = bool.fromEnvironment('ENABLE_GAMIFICATION', defaultValue: true);
  static const bool enableAiSupport = bool.fromEnvironment('ENABLE_AI_SUPPORT', defaultValue: true);
}
