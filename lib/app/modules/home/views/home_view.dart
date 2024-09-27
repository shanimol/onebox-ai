import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nexus/app/modules/home/widgets/dashboard_view.dart';
import 'package:sidebarx/sidebarx.dart';

import '../../../../gen/assets.gen.dart';
import '../../../common/values/app_colors.dart';
import '../controllers/home_controller.dart';
import '../widgets/chat/chat.dart';
import '../widgets/integrations/integrations.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        leading: Padding(
          padding: const EdgeInsets.only(
            left: 16,
            top: 8,
            bottom: 8,
          ),
          child: Assets.images.logoViolet.image(
            height: 40,
            width: 40,
          ),
        ),
        title: const Text(
          'OneBox.ai',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: AppColors.black,
          ),
        ),
        centerTitle: false,
      ),
      body: Obx(() {
        return Row(
          children: [
            // SidebarX for navigation
            SidebarX(
              controller: controller.sideBarController,
              theme: SidebarXTheme(
                margin: const EdgeInsets.only(
                  left: 10,
                  right: 11,
                  //top: 29,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    right: BorderSide(
                      color: AppColors.gray19.withOpacity(0.2),
                    ),
                  ),
                ),
                hoverColor: Colors.amberAccent,
                selectedItemDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.black.withOpacity(0.37),
                  ),
                ),
              ),
              items: [
                SidebarXItem(
                  iconBuilder: (selected, hovered) {
                    return Assets.images.navbar4.image(
                      height: 42,
                      width: 42,
                    );
                  },
                  //label: 'Home',
                  onTap: () {
                    controller.selectedNavbarIndex.value = 0;
                  },
                ),
                SidebarXItem(
                  iconBuilder: (selected, hovered) {
                    return Assets.images.navbar2.image(
                      height: 42,
                      width: 42,
                    );
                  },
                  onTap: () {
                    controller.selectedNavbarIndex.value = 1;
                  },
                ),
                SidebarXItem(
                  iconBuilder: (selected, hovered) {
                    return Assets.images.navbar3.image(
                      height: 42,
                      width: 42,
                    );
                  },
                  onTap: () {
                    controller.selectedNavbarIndex.value = 2;
                  },
                ),
                SidebarXItem(
                  iconBuilder: (selected, hovered) {
                    return Assets.images.navbar1.image(
                      height: 42,
                      width: 42,
                    );
                  },
                  onTap: () {
                    controller.selectedNavbarIndex.value = 3;
                  },
                ),
              ],
            ),
            Expanded(
              child: Container(
                  color: const Color(0xFFFBFBFB),
                  child: _getPageContent(controller.selectedNavbarIndex.value)),
            )
          ],
        );
      }),
    );
  }

  Widget _getPageContent(int index) {
    switch (index) {
      case 0:
        return DashboardView(
          controller: controller,
        );
      case 1:
        return Padding(
          padding: EdgeInsets.only(bottom: 24),
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: ChatPage(
              controller: controller,
            ),
          ),
        );
      case 2:
        // return SignInDemo();
        return Integrations(controller: controller);
      case 3:
        return const Center(
          child: Text('section 4'),
        );
      // Display DashboardView when first item is selected

      default:
        return Center(
            child: DashboardView(
          controller: controller,
        )); // Fallback view
    }
  }
}
