import 'package:flutter/material.dart';
import 'package:nexus/app/common/util/exports.dart';
import 'package:nexus/gen/assets.gen.dart';

class MeetingCount extends StatelessWidget {
  const MeetingCount({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 95,
      width: 220,
      padding: const EdgeInsets.all(14),
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(22),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Assets.images.gmeet.image(
                height: 27,
                width: 27,
              ),
              const SizedBox(
                width: 15,
              ),
              const Text('Meetings Count',
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ))
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              const Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '4',
                    style: TextStyle(
                      fontSize: 29,
                      color: AppColors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 4.0),
                    child: Text(
                      '/6',
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                width: 13,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 17,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      color: const Color(0xFF00831E).withOpacity(
                        0.11,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Done: 3h 30m',
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xFF00831E),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Container(
                    height: 17,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      color: const Color(0xFF005483).withOpacity(
                        0.11,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Remaining: 2h 30m ',
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xFF005483),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
