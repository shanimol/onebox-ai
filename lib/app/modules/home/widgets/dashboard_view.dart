import 'package:flutter/material.dart';
import 'package:nexus/app/common/values/app_colors.dart';
import 'package:nexus/app/modules/home/widgets/action_item.dart';
import 'package:nexus/app/modules/home/widgets/meeting_count.dart';
import 'package:nexus/app/modules/home/widgets/meetings.dart';
import 'package:nexus/app/modules/home/widgets/messages_count.dart';
import 'package:nexus/app/modules/home/widgets/summary.dart';
import 'package:nexus/app/modules/home/widgets/task_chart.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Hi Shanimol,',
              style: TextStyle(
                fontSize: 34,
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
                const Row(
                  children: [
                    Expanded(
                      child: ActionItem(
                        title: 'ewqeqe',
                        summary: 'dhwvhgdvgqwd',
                        actionId: 'w',
                        source: NexusActionSource.figma,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Meetings(),
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
      child: const Row(
        children: [
          TaskChart(),
          SizedBox(
            width: 14,
          ),
          Summary(),
          SizedBox(
            width: 14,
          ),
          Summary(),
        ],
      ),
    );
  }
}
