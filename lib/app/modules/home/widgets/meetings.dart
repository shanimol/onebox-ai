import 'package:flutter/material.dart';
import 'package:nexus/app/widgets/common/animated_tap.dart';
import 'package:nexus/gen/assets.gen.dart';

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
        left: 7,
        right: 7,
      ),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 5,
            color: Colors.white.withOpacity(0.12),
          )
        ],
        borderRadius: const BorderRadius.all(
          Radius.circular(22),
        ),
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
                    fontFamily: 'Montserrat',
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
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(9),
        ),
        color: const Color(0xFFFBFBFB),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
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
                  color: const Color(0xFFD72F59),
                  width: 2,
                )
              : Border.all(
                  color: Colors.transparent,
                ),
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          color:
              selectedIndex == index ? const Color(0xFFFCF0F3) : Colors.white,
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
                          const SizedBox(
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
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(7),
                  ),
                  border: Border.all(
                    color: selectedIndex == index
                        ? Colors.black.withOpacity(0.07)
                        : Colors.transparent,
                  ),
                  color: Colors.white,
                ),
                child: const Text(
                  'Prep Me',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
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
}
