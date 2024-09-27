import 'package:get/get.dart';

import '../../../common/integrations/googleSignIn.dart';
import '../../../routes/app_pages.dart';

class SplashController extends GetxController {
  //TODO: Implement SplashController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();

    Future.delayed(Duration(seconds: 2), () {
      if (GoogleSignInApi.googleSignIn.currentUser != null) {
        Get.toNamed(Routes.HOME);
      } else {
        Get.toNamed(Routes.LOGIN);
      }
    });
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
