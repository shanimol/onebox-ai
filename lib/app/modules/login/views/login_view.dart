import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:google_sign_in_web/google_sign_in_web.dart';
import 'package:google_sign_in_web/web_only.dart' as web;
import 'package:nexus/app/common/values/app_colors.dart';
import 'package:nexus/app/widgets/common/animated_filled_button.dart';
import 'package:nexus/app/widgets/common/animated_tap.dart';
import 'package:nexus/gen/assets.gen.dart';

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
          timeInSecForIosWeb: 4,
          backgroundColor: Color(0xFF695DF0),
          textColor: Colors.white,
          fontSize: 16.0);
      Get.offNamed(Routes.HOME);
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
        body: Row(
      children: [
        Expanded(
          flex: 3,
          child: Padding(
            padding: EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Assets.images.logoViolet.image(
                      height: 30,
                      width: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'OneBox.ai',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 180),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        //crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            "Get started",
                            style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 8),
                          Text(
                            "You can login with your phone number or email address.",
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.grey[600],
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 32),
                          // Phone Number Input
                          Container(
                            width: 400,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: Colors.grey,
                              ),
                            ),
                            child: SizedBox(
                              width: 400,
                              child: Row(
                                children: [
                                  Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 12.0),
                                    decoration: BoxDecoration(
                                      border: Border(
                                        right: BorderSide(color: Colors.grey),
                                      ),
                                    ),
                                    child: DropdownButton<String>(
                                      value: '+91',
                                      items: <String>['+91', '+1', '+44', '+61']
                                          .map<DropdownMenuItem<String>>(
                                              (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                      onChanged: (_) {},
                                    ),
                                  ),
                                  Expanded(
                                    child: TextField(
                                      decoration: InputDecoration(
                                        hintText: 'Phone Number',
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.all(16.0),
                                      ),
                                      keyboardType: TextInputType.phone,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 16),
                          Text(
                            "Or",
                            style:
                                TextStyle(fontSize: 16.0, color: Colors.grey),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 16),
                          // Work Email Input
                          SizedBox(
                            width: 400,
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Enter Your Email',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                                contentPadding: EdgeInsets.all(16.0),
                              ),
                              keyboardType: TextInputType.emailAddress,
                            ),
                          ),
                          SizedBox(height: 32),
                          // Continue Button
                          AnimatedTap(
                            onTap: () {},
                            child: Container(
                              width: 400,
                              decoration: BoxDecoration(
                                color: Color(0xFF695DF0),
                              ),
                              padding: EdgeInsets.all(8),
                              child: Center(
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 32),
                          buildSignInButton(),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
            flex: 2, child: Assets.images.loginImage.image(fit: BoxFit.fill))
      ],
    ));
  }

  Widget buildSignInButton() {
    return web.renderButton(
        configuration: GSIButtonConfiguration(
      size: GSIButtonSize.large,
      minimumWidth: 400,
    ));
  }
}
