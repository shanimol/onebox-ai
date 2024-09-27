import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nexus/app/data/models/task.dart';
import 'package:nexus/app/modules/home/controllers/home_controller.dart';
import 'package:nexus/app/widgets/common/animated_tap.dart';
import 'package:nexus/gen/assets.gen.dart';

import 'action_item.dart';
import 'dragging_action_item.dart';

class TaskCard extends StatelessWidget {
  final HomeController controller;
  const TaskCard({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 310,
      child: Card(
        color: Colors.white,
        elevation: 0,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 12,
              ),
              child: Row(
                children: [
                  Assets.images.task.image(
                    height: 27,
                    width: 27,
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  const Text(
                    "Tasks",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      height: 24.38 / 20,
                    ),
                  ),
                ],
              ),
            ),
            Obx(() {
              return Row(
                children: [
                  AnimatedTap(
                    onTap: () {
                      controller.taskCardSectionIndex.value = 0;
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: controller.taskCardSectionIndex.value == 0
                                ? const Color(0xFFD72F59)
                                : const Color(0xFFF0F2F5),
                          ),
                        ),
                      ),
                      child: Row(
                        children: [
                          Text(
                            'Critical',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              height: 20.3 / 14,
                              color: controller.taskCardSectionIndex.value == 0
                                  ? const Color(0xFFD72F59)
                                  : const Color(0xFF344054),
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Container(
                            height: 17,
                            width: 24,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(
                                  12,
                                ),
                              ),
                              color: controller.taskCardSectionIndex.value == 0
                                  ? const Color(0xFFD72F59)
                                  : const Color(0xFFF0F2F5),
                            ),
                            child: Center(
                              child: Text(
                                '${priortyTasks.length}',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  height: 20.3 / 14,
                                  color:
                                      controller.taskCardSectionIndex.value == 0
                                          ? Colors.white
                                          : const Color(0xFF344054),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  AnimatedTap(
                    onTap: () {
                      controller.taskCardSectionIndex.value = 1;
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: controller.taskCardSectionIndex.value == 1
                                ? const Color(0xFFD72F59)
                                : const Color(0xFFF0F2F5),
                          ),
                        ),
                      ),
                      child: Row(
                        children: [
                          Text(
                            'All Tasks',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              height: 20.3 / 14,
                              color: controller.taskCardSectionIndex.value == 1
                                  ? const Color(0xFFD72F59)
                                  : const Color(0xFF344054),
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Container(
                            height: 17,
                            width: 24,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(
                                  12,
                                ),
                              ),
                              color: controller.taskCardSectionIndex.value == 1
                                  ? const Color(0xFFD72F59)
                                  : const Color(0xFFF0F2F5),
                            ),
                            child: Center(
                              child: Text(
                                '${controller.tasks.length}',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  height: 20.3 / 14,
                                  color:
                                      controller.taskCardSectionIndex.value == 1
                                          ? Colors.white
                                          : const Color(0xFF344054),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }),
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
                        var task = controller.taskCardSectionIndex.value == 0
                            ? priortyTasks[index]
                            : controller.tasks[index];
                        return Draggable<Task>(
                          data: task,
                          childWhenDragging: ActionItem(
                            task: task,
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
                            task: task,
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(height: 7);
                      },
                      itemCount: controller.taskCardSectionIndex.value == 0
                          ? priortyTasks.length
                          : controller.tasks.length,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Task> get priortyTasks =>
      controller.tasks.where((e) => (e.priority ?? 0) > 6).toList();
}
