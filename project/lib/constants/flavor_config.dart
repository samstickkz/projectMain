class FlavorConfig {
  static bool isProduction() => bool.fromEnvironment('FLAVOR', defaultValue: false) == false;
  static bool isStaging() => bool.fromEnvironment('FLAVOR', defaultValue: false) == true;
}