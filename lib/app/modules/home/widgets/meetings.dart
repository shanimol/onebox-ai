import 'package:flutter/material.dart';
import 'package:nexus/app/common/event_bus/events.dart';
import 'package:nexus/app/widgets/common/animated_tap.dart';
import 'package:nexus/gen/assets.gen.dart';

import '../../../common/values/app_colors.dart';

class Meetings extends StatefulWidget {
  const Meetings({super.key});

  @override
  State<Meetings> createState() => _MeetingsState();
}

class _MeetingsState extends State<Meetings> {
  int? selectedIndex;
  @override
  Widget build(BuildContext context) {
    return Container(
      //width: 470,
      height: 310,
      padding: const EdgeInsets.only(
        top: 9,
        left: 16,
        right: 16,
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
          Row(
            children: [
              Assets.images.gmeet.image(
                height: 27,
                width: 27,
              ),
              SizedBox(
                width: 27,
              ),
              const Text(
                'Meetings',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 17),
          Expanded(child: upcomingMeetings()),
        ],
      ),
    );
  }

  Widget upcomingMeetings() {
    return Container(
      color: Color(0xFFFBFBFB),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'TODAY',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w500,
                  height: 14 / 12,
                ),
              ),
              Text(
                ' Sept 16, 2024',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w500,
                  height: 14 / 12,
                ),
              )
            ],
          ),
          const SizedBox(height: 8),
          Expanded(
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return listItem(
                  name: 'Unilever & The Brand tech group',
                  time: '4:00PM - 5:00PM',
                  index: index,
                );
              },
              separatorBuilder: (context, index) => const SizedBox(height: 7),
              itemCount: 10, // Increase the itemCount for better scrolling test
            ),
          ),
        ],
      ),
    );
  }

  Widget listItem({String? name, String? time, required int index}) {
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
                  color: Color(0xFFD72F59),
                  width: 2,
                )
              : Border.all(
                  color: Colors.transparent,
                ),
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: selectedIndex == index ? Color(0xFFFCF0F3) : Colors.white,
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
                          fontFamily: 'Montserrat',
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
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Text(
                            time ?? '',
                            style: const TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
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
                    message: 'Prepare me for tomorrow\'s meeting with joy'));
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(7),
                  ),
                  color: Color(0xFF050505),
                ),
                child: const Text(
                  'Prep Me',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
