import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:nexus/app/common/util/exports.dart';
import 'package:nexus/app/modules/home/controllers/home_controller.dart';
import 'package:nexus/gen/assets.gen.dart';
import 'package:nexus/gen/fonts.gen.dart';

class TaskChart extends StatelessWidget {
  final HomeController controller;
  const TaskChart({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    List<TaskPercentageData> data = [
      TaskPercentageData(completedPercentage: 20, totalPercentage: 60),
      TaskPercentageData(completedPercentage: 10, totalPercentage: 30),
      TaskPercentageData(completedPercentage: 40, totalPercentage: 100),
      TaskPercentageData(completedPercentage: 20, totalPercentage: 70),
      TaskPercentageData(completedPercentage: 40, totalPercentage: 90),
    ];
    int maxPercentage = 100;
    int maxHeight = 180;

    List<double> totalHeightList = data
        .map((e) => ((e.totalPercentage ?? 0) / maxPercentage) * maxHeight)
        .toList();
    List<double> completedHeightList = data
        .map((e) => ((e.completedPercentage ?? 0) / maxPercentage) * maxHeight)
        .toList();
    List<Widget> iconList = [
      Assets.images.logo1.image(
        height: 20,
        width: 20,
      ),
      Assets.images.logo2.image(
        height: 20,
        width: 20,
      ),
      Assets.images.logo3.image(
        height: 20,
        width: 20,
      ),
      Assets.images.logo4.image(
        height: 20,
        width: 20,
      ),
      Assets.images.logo5.image(
        height: 20,
        width: 20,
      ),
    ];

    return SizedBox(
      height: 350,
      width: MediaQuery.of(context).size.width <= 800 ? double.infinity : 300,
      child: Stack(
        children: [
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(0),
                topRight: Radius.circular(0),
                bottomLeft: Radius.circular(22),
                bottomRight: Radius.circular(22),
              ),
              child: Container(
                padding: const EdgeInsets.only(
                  left: 18.0,
                  right: 18,
                  top: 56,
                  bottom: 16,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  //borderRadius: BorderRadius.circular(22),
                  border: Border.all(color: const Color(0XFFF0F0F0)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        blurRadius: 10,
                        spreadRadius: 2),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Obx(() {
                      return RichText(
                        text: TextSpan(
                            text: '$totalMessageCount',
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w600,
                                color: AppColors.black,
                                fontFamily: FontFamily.iBMPlexSans),
                            children: [
                              TextSpan(
                                text: ' New messages',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.black,
                                  fontFamily: FontFamily.iBMPlexSans,
                                ),
                              )
                            ]),
                      );
                    }),
                    const SizedBox(
                      height: 9,
                    ),
                    const LinearProgressIndicator(
                      minHeight: 10,
                      value: 0.5,
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      backgroundColor: Color(0xFFF0F0F0),
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Color(0xFF695DF0),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16,
              top: 16,
              bottom: 16,
            ),
            // width: 20,
            height: 212, // Adjust height for vertical layout
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(22),
              // boxShadow: [
              //   BoxShadow(
              //       color: Colors.grey.withOpacity(0.3),
              //       blurRadius: 10,
              //       spreadRadius: 2),
              // ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: List.generate(5, (index) {
                      return Row(children: [
                        buildVerticalBar(
                          totalHeightList[index],
                          completedHeightList[index],
                          iconList[index],
                        ),
                        const SizedBox(
                          width: 8,
                        )
                      ]);
                    }),
                  ),
                ),
                // Task completion percentage
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildVerticalBar(
      double totalHeight, double completedHeight, Widget icon) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        // Progress bar
        ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(7), topRight: Radius.circular(7)),
          child: Container(
            height: totalHeight -
                completedHeight, // Scale the height based on percentage
            width: 40,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 249, 247, 247),
            ),
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(
                bottom: 4.0,
                top: 9,
              ), // Add space for the icon
              child: Align(alignment: Alignment.topCenter, child: icon),
            ),
          ),
        ),
        Container(
          height: completedHeight, // Set a fixed height for background
          width: 40,
          decoration: BoxDecoration(
            color: Color(0xFF695DF0),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ],
    );
  }

  int get totalMessageCount {
    return (controller.emaildata.length) + (controller.slackData.length);
  }
}

class TaskPercentageData {
  int? totalPercentage;
  int? completedPercentage;

  TaskPercentageData({this.completedPercentage, this.totalPercentage});
}
