import 'package:flutter/material.dart';
import 'package:nexus/app/common/values/app_colors.dart';
import 'package:nexus/app/modules/home/controllers/home_controller.dart';
import 'package:nexus/app/modules/home/widgets/gmail_summary.dart';
import 'package:nexus/app/modules/home/widgets/meetings.dart';
import 'package:nexus/app/modules/home/widgets/slack_summary.dart';
import 'package:nexus/app/modules/home/widgets/task_card.dart';
import 'package:nexus/app/modules/home/widgets/task_chart.dart';

import 'dashboard_right_drawer.dart';

class DashboardView extends StatelessWidget {
  final HomeController controller;
  const DashboardView({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Hi Shanimol,',
                      style: TextStyle(
                        fontSize: 24,
                        color: AppColors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Text(
                      'Here is an overview on what’s on your work plate today.',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.black.withOpacity(0.56),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: TaskCard(
                                controller: controller,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: Meetings(
                                controller: controller,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 19,
                        ),
                        updates(),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
              child: RightDrawer(
            controller: controller,
          )
              // Calendar(
              //   controller: controller,
              ),
        ],
      ),
    );
  }

  Widget updates() {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(22),
        ),
      ),
      child: Row(
        children: [
          TaskChart(),
          SizedBox(
            width: 14,
          ),
          GmailSummary(
            controller: controller,
          ),
          SizedBox(
            width: 14,
          ),
          SlackSummary(
            controller: controller,
          ),
        ],
      ),
    );
  }
}
