enum AppEnvironment {
  dev,
  staging,
  prod;

  static AppEnvironment fromDartDefine() {
    const raw = String.fromEnvironment('APP_ENV', defaultValue: 'dev');
    return switch (raw.toLowerCase()) {
      'prod' || 'production' => AppEnvironment.prod,
      'staging' => AppEnvironment.staging,
      _ => AppEnvironment.dev,
    };
  }
}
