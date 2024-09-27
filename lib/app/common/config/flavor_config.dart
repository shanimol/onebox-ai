enum Flavor {
  dev,
  stg,
  prod,
}

class FlavorValues {
  final String baseUrl;

  // You can add other flavor values here
  FlavorValues({
    required this.baseUrl,
  });
}

class FlavorConfig {
  final Flavor flavor;
  final FlavorValues values;

  static FlavorConfig? _instance;

  FlavorConfig._internal(this.flavor, this.values);

  factory FlavorConfig({required Flavor flavor, required FlavorValues values}) {
    _instance ??= FlavorConfig._internal(
      flavor,
      values,
    );

    return _instance as FlavorConfig;
  }

  static FlavorConfig? get instance {
    return _instance;
  }

  static bool isDevelopment() {
    if (_instance == null) {
      return false;
    }

    return _instance!.flavor == Flavor.dev;
  }

  static bool isStaging() {
    if (_instance == null) {
      return false;
    }

    return _instance!.flavor == Flavor.stg;
  }

  static bool isProduction() {
    if (_instance == null) {
      return false;
    }

    return _instance!.flavor == Flavor.prod;
  }
}
