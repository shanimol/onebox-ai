import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/integrations/googleSignIn.dart';
import '../../../routes/app_pages.dart';

class SplashController extends GetxController
    with GetSingleTickerProviderStateMixin {
  //TODO: Implement SplashController
  late AnimationController controller;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
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
