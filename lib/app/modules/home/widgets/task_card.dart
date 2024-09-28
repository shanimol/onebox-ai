import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nexus/app/data/models/task.dart';
import 'package:nexus/app/modules/home/controllers/home_controller.dart';
import 'package:nexus/app/widgets/common/animated_tap.dart';
import 'package:nexus/gen/assets.gen.dart';

import '../../../common/values/app_colors.dart';
import 'action_item.dart';
import 'dragging_action_item.dart';

class TaskCard extends StatelessWidget {
  final HomeController controller;
  const TaskCard({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(
            19,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.gray32.withOpacity(.2),
            blurRadius: 10,
            spreadRadius: 5,
          ),
        ],
      ),
      height: 370,
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
                    "Top Priorities",
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
                                ? const Color(0xFF695DF0)
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
                                  ? const Color(0xFF695DF0)
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
                                  19,
                                ),
                              ),
                              color: controller.taskCardSectionIndex.value == 0
                                  ? const Color(0xFF695DF0)
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
                                ? const Color(0xFF695DF0)
                                : const Color(0xFFF0F2F5),
                          ),
                        ),
                      ),
                      child: Row(
                        children: [
                          Text(
                            'All',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              height: 20.3 / 14,
                              color: controller.taskCardSectionIndex.value == 1
                                  ? const Color(0xFF695DF0)
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
                                  19,
                                ),
                              ),
                              color: controller.taskCardSectionIndex.value == 1
                                  ? const Color(0xFF695DF0)
                                  : const Color(0xFFF0F2F5),
                            ),
                            child: Center(
                              child: Text(
                                '${allTasks.length}',
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
                  const SizedBox(
                    width: 3,
                  ),
                  AnimatedTap(
                    onTap: () {
                      controller.taskCardSectionIndex.value = 2;
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: controller.taskCardSectionIndex.value == 2
                                ? const Color(0xFF695DF0)
                                : const Color(0xFFF0F2F5),
                          ),
                        ),
                      ),
                      child: Row(
                        children: [
                          Text(
                            'Completed',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              height: 20.3 / 14,
                              color: controller.taskCardSectionIndex.value == 2
                                  ? const Color(0xFF695DF0)
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
                                  19,
                                ),
                              ),
                              color: controller.taskCardSectionIndex.value == 2
                                  ? const Color(0xFF695DF0)
                                  : const Color(0xFFF0F2F5),
                            ),
                            child: Center(
                              child: Text(
                                '${getCompletedTask.length}',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  height: 20.3 / 14,
                                  color:
                                      controller.taskCardSectionIndex.value == 2
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
                    bottomLeft: Radius.circular(19),
                    bottomRight: Radius.circular(19),
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
                            : controller.taskCardSectionIndex.value == 1
                                ? allTasks[index]
                                : getCompletedTask[index];
                        if (task.status == Status.COMPLETED) {
                          return ActionItem(
                            task: task,
                            source: getSourceForTask(task),
                            onMarkTaskDone: (id) {
                              controller.markTaskDone(
                                id,
                              );
                            },
                          );
                        }
                        return Draggable<Task>(
                          data: task,
                          childWhenDragging: ActionItem(
                            task: task,
                            source: getSourceForTask(task),
                            onMarkTaskDone: (id) {
                              controller.markTaskDone(
                                id,
                              );
                            },
                          ),
                          feedback: Material(
                            child: DraggingActionItem(
                              title: task.senderName,
                              summary: task.content,
                              actionId: task.id,
                              source: task.sourceType,
                            ),
                          ),
                          child: ActionItem(
                            task: task,
                            source: getSourceForTask(task),
                            onMarkTaskDone: (id) {
                              controller.markTaskDone(
                                id,
                              );
                            },
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(height: 7);
                      },
                      itemCount: controller.taskCardSectionIndex.value == 0
                          ? priortyTasks.length
                          : controller.taskCardSectionIndex.value == 1
                              ? allTasks.length
                              : getCompletedTask.length,
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

  List<Task> get priortyTasks => controller.tasks
      .where((e) => e.status == Status.PENDING && (e.priority ?? 0) < 4)
      .toList();

  List<Task> get allTasks =>
      controller.tasks.where((e) => e.status == Status.PENDING).toList();

  List<Task> get getCompletedTask =>
      controller.tasks.where((e) => e.status == Status.COMPLETED).toList();

  Source getSourceForTask(Task task) {
    if (controller.emaildata.any((element) => element.id == task.sourceId)) {
      return Source.Gmail;
    } else {
      return Source.Slack;
    }
  }
}
