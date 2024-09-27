import 'package:get/get.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();

    // GoogleSignInApi.googleSignIn.onCurrentUserChanged
    //     .listen((GoogleSignInAccount? account) async {
    //   Fluttertoast.showToast(
    //       msg: "User Signed In${account?.email.toString()}",
    //       toastLength: Toast.LENGTH_LONG,
    //       gravity: ToastGravity.CENTER,
    //       timeInSecForIosWeb: 10,
    //       backgroundColor: Colors.red,
    //       textColor: Colors.white,
    //       fontSize: 16.0);
    //   Get.toNamed(Routes.HOME);
    // });
    // GoogleSignInApi.googleSignIn.signInSilently();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
