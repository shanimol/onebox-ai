import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nexus/app/common/util/exports.dart';
import 'package:nexus/app/modules/dashboard/views/dashboard_view.dart';
import 'package:nexus/app/modules/home/widgets/meetings.dart';
import 'package:nexus/app/modules/home/widgets/platform_updates.dart';
import 'package:nexus/app/routes/app_pages.dart';
import 'package:sidebarx/sidebarx.dart';

import '../../../../gen/assets.gen.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        leading: Padding(
          padding: EdgeInsets.only(
            left: 16,
            top: 8,
            bottom: 8,
          ),
          child: Assets.images.union.image(
            height: 40,
            width: 40,
          ),
        ),
        title: Text(
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
                  left: 11,
                  right: 11,
                  //top: 29,
                  bottom: 29,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
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
                      height: 44,
                      width: 44,
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
                      height: 44,
                      width: 44,
                    );
                  },
                  onTap: () {
                    controller.selectedNavbarIndex.value = 1;
                  },
                ),
                SidebarXItem(
                  iconBuilder: (selected, hovered) {
                    return Assets.images.navbar3.image(
                      height: 44,
                      width: 44,
                    );
                  },
                  onTap: () {
                    controller.selectedNavbarIndex.value = 2;
                  },
                ),
                SidebarXItem(
                  iconBuilder: (selected, hovered) {
                    return Assets.images.navbar1.image(
                      height: 44,
                      width: 44,
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
                  color: Color(0xFFFBFBFB),
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
        return DashboardView();
      case 1:
        return Center(
          child: Text('Chat'),
        );
      case 2:
        return Center(
          child: Text('section 3'),
        );
      case 3:
        return Center(
          child: Text('section 4'),
        );
      // Display DashboardView when first item is selected

      default:
        return const Center(child: DashboardView()); // Fallback view
    }
  }
}
