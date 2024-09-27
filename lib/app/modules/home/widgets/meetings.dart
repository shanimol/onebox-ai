import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:nexus/app/common/event_bus/events.dart';
import 'package:nexus/app/data/models/meeting.dart';
import 'package:nexus/app/modules/home/controllers/home_controller.dart';
import 'package:nexus/app/widgets/common/animated_tap.dart';
import 'package:nexus/gen/assets.gen.dart';

import '../../../common/values/app_colors.dart';

class Meetings extends StatefulWidget {
  final HomeController controller;
  Meetings({required this.controller, super.key});

  @override
  State<Meetings> createState() => _MeetingsState();
}

class _MeetingsState extends State<Meetings> {
  int? selectedIndex;
  @override
  Widget build(BuildContext context) {
    return Container(
      //width: 470,
      height: 370,
      padding: const EdgeInsets.only(
        left: 7,
        right: 7,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        boxShadow: [
          BoxShadow(
            color: AppColors.gray32.withOpacity(.2),
            blurRadius: 10,
            spreadRadius: 5,
          ),
        ],
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 9,
              left: 9,
              right: 9,
            ),
            child: Row(
              children: [
                Assets.images.gmeet.image(
                  height: 27,
                  width: 27,
                ),
                const SizedBox(
                  width: 27,
                ),
                const Text(
                  'Meetings',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 17),
          Expanded(child: upcomingMeetings()),
        ],
      ),
    );
  }

  Widget upcomingMeetings() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(9),
        ),
        color: Color(0xFFFBFBFB),
      ),
      child: SingleChildScrollView(
        child: Obx(() {
          return Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'UPCOMING: ${upcomingMeetingsList.length}',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          height: 14 / 12,
                        ),
                      ),
                      Text(
                        DateFormat("MMM dd, yyyy").format(DateTime.now()),
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          height: 14 / 12,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 8),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return listItem(
                        name: upcomingMeetingsList[index].name ?? '',
                        time:
                            '${formattedTime(upcomingMeetingsList[index].startTime)} - ${formattedTime(upcomingMeetingsList[index].endTime)}',
                        index: index,
                        buttonTitle: 'Prep me',
                      );
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 7),
                    itemCount: upcomingMeetingsList.length,
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'COMPLETED: ${completedMeetingsList.length}',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          height: 14 / 12,
                        ),
                      ),
                      Text(
                        DateFormat("MMM dd, yyyy").format(DateTime.now()),
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          height: 14 / 12,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 8),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return listItem(
                          name: completedMeetingsList[index].name ?? '',
                          time:
                              '${formattedTime(completedMeetingsList[index].startTime)} - ${formattedTime(completedMeetingsList[index].endTime)}',
                          index: index,
                          buttonTitle: 'View insights');
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 7),
                    itemCount: completedMeetingsList.length,
                  ),
                ],
              ),
            ],
          );
        }),
      ),
    );
  }

  Widget listItem(
      {String? name, String? time, required int index, String? buttonTitle}) {
    return AnimatedTap(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: index == selectedIndex
              ? Border.all(
                  color: const Color(0xFF695DF0),
                  width: 2,
                )
              : Border.all(
                  color: Colors.transparent,
                ),
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          color: selectedIndex == index
              ? const Color(0xFF695DF0).withOpacity(0.09)
              : Colors.white,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Assets.images.logo.image(
              height: 42,
              width: 42,
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(width: 11),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        name ?? '',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          Assets.images.clock.image(
                            height: 16,
                            width: 16,
                            color: Colors.black.withOpacity(0.5),
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          Text(
                            time ?? '',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.black.withOpacity(0.5),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            AnimatedTap(
              onTap: () {
                eventBus.fire(ChatEvent(
                    message:
                        'Summarize all my chat communications received in the last 24 hrs.'));
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(7),
                  ),
                  border: Border.all(
                    color: selectedIndex == index
                        ? Colors.transparent
                        : Colors.black.withOpacity(0.07),
                  ),
                  color: Colors.white,
                ),
                child: Text(
                  buttonTitle ?? '',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0XFF181818),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Meeting> get upcomingMeetingsList => widget.controller.meetings
      .where((e) => (e.startTime ?? DateTime.now()).isAfter(DateTime.now()))
      .toList();

  String formattedTime(DateTime? date) {
    return DateFormat('ha').format(date ?? DateTime.now()).toUpperCase(); // C
  }

  List<Meeting> get completedMeetingsList => widget.controller.meetings
      .where((e) => (e.startTime ?? DateTime.now()).isBefore(DateTime.now()))
      .toList();
}
