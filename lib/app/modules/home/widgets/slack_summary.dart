import 'package:flutter/material.dart';
import 'package:nexus/app/common/values/app_colors.dart';
import 'package:nexus/app/data/models/slack.dart';
import 'package:nexus/app/data/models/user.dart';
import 'package:nexus/app/modules/home/controllers/home_controller.dart';
import 'package:nexus/gen/assets.gen.dart';

class SlackSummary extends StatelessWidget {
  final HomeController controller;
  const SlackSummary({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width <= 800 ? double.infinity : 340,
      padding: const EdgeInsets.all(12),
      decoration: const BoxDecoration(
        color: Color(0xFFFBFBFB),
        borderRadius: BorderRadius.all(
          Radius.circular(19),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Assets.images.slack.image(
                height: 20,
                width: 20,
              ),
              const SizedBox(
                width: 6,
              ),
              const Text(
                'SLACK',
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            '${controller.slackList.length} messages',
            style: const TextStyle(
              color: AppColors.black,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Channels: ',
                style: TextStyle(
                  color: AppColors.black.withOpacity(0.56),
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Expanded(
                child: Wrap(
                  children: List.generate(senderList.length, (index) {
                    return Text(
                      '#${senderList[index]?.channelName} ',
                      style: TextStyle(
                        color: AppColors.black.withOpacity(0.56),
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    );
                  }),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              Assets.images.summary.image(
                height: 16,
                width: 16,
              ),
              const SizedBox(
                width: 6,
              ),
              Text(
                'Summary',
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 6,
          ),
          Column(
            children: List.generate(3, (index) {
              return Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 10,
                    ),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(9),
                        ),
                        color: Color(0XFFF0F0F0)),
                    child: Text(
                      controller.slackList[index].summary ?? '',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                        color: AppColors.black.withOpacity(0.8),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  )
                ],
              );
            }),
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(8),
                      ),
                      border: Border.all(
                        color: AppColors.black.withOpacity(
                          0.1,
                        ),
                      )),
                  height: 36,
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Go to source',
                        style: TextStyle(
                          color: AppColors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Assets.images.source.image(
                        height: 16,
                        width: 16,
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                  color: Color(0xFF695DF0),
                ),
                height: 36,
                padding: const EdgeInsets.all(8),
                child: const Text(
                  'View details',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  List<Channel?> get senderList {
    return controller.slackList.map((e) => e.channel).toSet().toList();
  }
}
