import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:nexus/app/common/di/injectable.config.dart';

final getIt = GetIt.instance;

class ServiceEnv {
  const ServiceEnv._();

  static const String app = 'app';
  static const String test = 'test';
  static const String integrationTest = 'integration_test';
}

@InjectableInit()
Future<void> configureInjection() async {
  GetIt.instance.init(environment: ServiceEnv.app);
}

Future<void> configureTestInjection() async {
  GetIt.instance.init(environment: ServiceEnv.test);
}

Future<void> configureIntegrationTestInjection() async {
  GetIt.instance.init(environment: ServiceEnv.integrationTest);
}
