import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:nexus/app/modules/home/widgets/meetings.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Column(
      children: [
        //Meetings(),
      ],
    ));
  }
}
