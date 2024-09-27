import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nexus/app/data/models/task.dart';
import 'package:nexus/app/modules/home/controllers/home_controller.dart';
import 'package:nexus/gen/assets.gen.dart';

class Calendar extends StatelessWidget {
  final HomeController controller;
  const Calendar({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return _buildCalendarView();
  }

  Widget _buildCalendarView() {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 14,
              horizontal: 12,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Color(0xFF695DF0),
                          width: 4,
                        ),
                      ),
                    ),
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      children: [
                        Assets.images.calendarHome.image(
                          height: 20,
                          width: 20,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        const Text(
                          "Calendar",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            height: 19.5 / 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Assets.images.calendarHomeSuffix.image(
                  height: 42,
                  width: 42,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 11,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Tuesday",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    height: 19.5 / 16,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    const Text(
                      "September 24,2024",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        height: 14.63 / 12,
                      ),
                    ),
                    const SizedBox(
                      width: 7,
                    ),
                    Transform.rotate(
                      angle: pi / 2,
                      child: const Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 10,
            ),
            decoration: const BoxDecoration(
              color: Color(0xFF695DF0),
            ),
            width: double.infinity,
            child: const Text(
              "Working from office",
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w500,
                height: 14.63 / 12,
              ),
            ),
          ),
          Expanded(
            child: Obx(
              () {
                return ListView.separated(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 25.22,
                  ),
                  itemBuilder: (context, index) {
                    return Obx(
                      () => Row(
                        children: [
                          Text(
                            "${controller.calendarTask[index].date?.hour ?? 5}:00",
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              height: 17.07 / 14,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            child: controller.calendarTask[index].task != null
                                ? Container(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 9,
                                      horizontal: 8,
                                    ),
                                    color: Color(0xFFEDECFA),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Text(
                                                controller.calendarTask[index]
                                                        .task?.title ??
                                                    '',
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                  height: 17.07 / 14,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              // const SizedBox(
                                              //   height: 8,
                                              // ),
                                              // Container(
                                              //   decoration: BoxDecoration(
                                              //     border: Border.all(
                                              //       color: Colors.black
                                              //           .withOpacity(0.5),
                                              //       width: 1,
                                              //     ),
                                              //     borderRadius:
                                              //         BorderRadius.circular(
                                              //             999),
                                              //   ),
                                              //   padding: const EdgeInsets
                                              //       .symmetric(
                                              //     horizontal: 10,
                                              //     vertical: 3,
                                              //   ),
                                              //   child: const Text(
                                              //     "Remove Task",
                                              //     style: TextStyle(
                                              //       fontSize: 12,
                                              //       fontWeight:
                                              //           FontWeight.w500,
                                              //       height: 14.63 / 12,
                                              //     ),
                                              //   ),
                                              // ),
                                            ],
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            controller.calendarTask[index]
                                                .task = null;
                                            controller.calendarTask.refresh();
                                          },
                                          child: Container(
                                            color: Colors.transparent,
                                            child: Icon(
                                              Icons.close,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                : DragTarget<Task>(
                                    onAcceptWithDetails: (details) {
                                      controller.calendarTask[index].task =
                                          details.data;
                                      controller.calendarTask.refresh();
                                    },
                                    builder: (
                                      BuildContext context,
                                      List<Task?> candidateData,
                                      List<dynamic> rejectedData,
                                    ) {
                                      if (candidateData.isNotEmpty) {
                                        return Container(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 9,
                                            horizontal: 8,
                                          ),
                                          color: Color(0xFFEDECFA),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Text(
                                                candidateData[0]?.title ?? '',
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                  height: 17.07 / 14,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              // const SizedBox(
                                              //   height: 8,
                                              // ),
                                              // Container(
                                              //   decoration: BoxDecoration(
                                              //     border: Border.all(
                                              //       color: Colors.white
                                              //           .withOpacity(0.5),
                                              //       width: 1,
                                              //     ),
                                              //     borderRadius:
                                              //         BorderRadius.circular(
                                              //             999),
                                              //   ),
                                              //   padding:
                                              //       const EdgeInsets.symmetric(
                                              //     horizontal: 10,
                                              //     vertical: 3,
                                              //   ),
                                              //   child: const Text(
                                              //     "View Details",
                                              //     style: TextStyle(
                                              //       color: Colors.white,
                                              //       fontSize: 12,
                                              //       fontWeight: FontWeight.w500,
                                              //       height: 14.63 / 12,
                                              //     ),
                                              //   ),
                                              // ),
                                            ],
                                          ),
                                        );
                                      }
                                      return SizedBox(
                                        height: 63,
                                        child: Center(
                                          child: Container(
                                            height: 17,
                                            decoration: BoxDecoration(
                                              border: Border(
                                                bottom: BorderSide(
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
                                                  width: 1,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                          )
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 13,
                    );
                  },
                  itemCount: controller.calendarTask.length,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
