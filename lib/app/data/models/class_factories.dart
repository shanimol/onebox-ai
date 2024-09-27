class ClassFactories {
  ClassFactories._();

  static final classFactoriesMap = <Type, Function>{
    // User: (dynamic x) => User.fromJson(x),
  };
}

abstract class JsonParsableClass {
  JsonParsableClass.fromJson();
}
