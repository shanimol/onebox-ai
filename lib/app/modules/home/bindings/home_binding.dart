import 'package:get/get.dart';
import 'package:nexus/app/common/di/injectable.dart';
import 'package:nexus/app/data/repository/app.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    // Get.put<HomeController>(
    //   () => HomeController(repository: getIt<AppRepository>()),
    // );
    Get.put<HomeController>(
      HomeController(repository: getIt<IAppRepository>()),
    );
  }
}
