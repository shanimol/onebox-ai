import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nexus/app/data/models/task.dart';
import 'package:nexus/app/modules/home/controllers/home_controller.dart';
import 'package:nexus/gen/assets.gen.dart';

import 'action_item.dart';
import 'dragging_action_item.dart';

class TaskCard extends StatelessWidget {
  final HomeController controller;
  const TaskCard({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Column(
        children: [
          Row(
            children: [
              Assets.images.task.image(
                height: 27,
                width: 27,
              ),
              SizedBox(
                width: 12,
              ),
              Text(
                "Tasks",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  height: 24.38 / 20,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 11,
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xFFFBFBFB),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(19),
                  topRight: Radius.circular(19),
                ),
              ),
              child: Obx(
                () {
                  return ListView.separated(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 12,
                    ),
                    itemBuilder: (context, index) {
                      var task = controller.tasks[index];
                      return Draggable<Task>(
                        data: task,
                        childWhenDragging: ActionItem(
                          title: task.title,
                          summary: task.summary,
                          actionId: task.id,
                          source: task.sourceType,
                        ),
                        feedback: Material(
                          child: DraggingActionItem(
                            title: task.title,
                            summary: task.summary,
                            actionId: task.id,
                            source: task.sourceType,
                          ),
                        ),
                        child: ActionItem(
                          title: task.title,
                          summary: task.summary,
                          actionId: task.id,
                          source: task.sourceType,
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 7);
                    },
                    itemCount: controller.tasks.length,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
