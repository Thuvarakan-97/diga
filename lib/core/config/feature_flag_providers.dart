import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app_environment.dart';
import 'feature_flags.dart';

final appEnvironmentProvider = Provider<AppEnvironment>((ref) => AppEnvironment.fromDartDefine());
final gamificationEnabledProvider = Provider<bool>((ref) => FeatureFlags.enableGamification);
final aiSupportEnabledProvider = Provider<bool>((ref) => FeatureFlags.enableAiSupport);
