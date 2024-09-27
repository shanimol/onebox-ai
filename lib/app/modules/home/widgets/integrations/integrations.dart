import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:google_sign_in_web/web_only.dart' as web;
import 'package:nexus/app/modules/home/controllers/home_controller.dart';
import 'package:sidebarx/sidebarx.dart';

import '../../../../../gen/assets.gen.dart';
import '../../../../common/integrations/googleSignIn.dart';
import '../../../../common/values/app_colors.dart';
import 'card.dart';
import 'integrations_side_bar.dart';

typedef HandleSignInFn = Future<void> Function();

Widget buildSignInButton({HandleSignInFn? onPressed}) {
  return web.renderButton();
}

class Integrations extends StatefulWidget {
  final HomeController controller;
  Integrations({Key? key, required this.controller}) : super(key: key);

  @override
  State<Integrations> createState() => _IntegrationsState();
}

class _IntegrationsState extends State<Integrations> {
  final _controller = SidebarXController(selectedIndex: 0, extended: true);
  final _key = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    GoogleSignInApi.googleSignIn.onCurrentUserChanged
        .listen((GoogleSignInAccount? account) async {
      Fluttertoast.showToast(
          msg: "User Signed In ${account?.email.toString()}",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 10,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    });
    GoogleSignInApi.googleSignIn.signInSilently();
  }

  @override
  Widget build(BuildContext context) => Scaffold(body: Builder(
        builder: (context) {
          final isSmallScreen = MediaQuery.of(context).size.width < 600;
          return Scaffold(
            key: _key,
            backgroundColor: AppColors.nexusBg,
            drawer: ExampleSidebarXForIntegrations(controller: _controller),
            body: Row(
              children: [
                if (!isSmallScreen)
                  ExampleSidebarXForIntegrations(controller: _controller),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(45.0),
                    child: ListView(
                      children: [
                        IntegrationCard(
                          icon: Assets.images.google.image(
                            height: 24,
                            width: 24,
                          ),
                          title: 'Google',
                          description:
                              'Send feedback from internal stakeholders or users directly to Prodigy',
                          isConnected: false,
                          onConnectPressed: () {},
                          isGoogle: true,
                        ),
                        SizedBox(height: 24),
                        IntegrationCard(
                          icon: Assets.images.slack1.image(
                            height: 24,
                            width: 24,
                          ),
                          title: 'Slack',
                          description:
                              'Send feedback from internal stakeholders or users directly to Prodigy',
                          isConnected: false,
                          onConnectPressed: () {},
                        ),
                        // Add more IntegrationCard instances as needed
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ));
}
