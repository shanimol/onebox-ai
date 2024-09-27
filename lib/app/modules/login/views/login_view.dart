import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:google_sign_in_web/web_only.dart' as web;

import '../../../common/integrations/googleSignIn.dart';
import '../../../routes/app_pages.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    GoogleSignInApi.googleSignIn.onCurrentUserChanged
        .listen((GoogleSignInAccount? account) async {
      Fluttertoast.showToast(
          msg: "User Signed In${account?.email.toString()}",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 10,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      Get.toNamed(Routes.HOME);
    });
    GoogleSignInApi.googleSignIn.signInSilently();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('LoginView'),
      //   centerTitle: true,
      // ),
      body: Center(
        child: buildSignInButton(),
      ),
    );
  }

  Widget buildSignInButton() {
    return web.renderButton();
  }
}
