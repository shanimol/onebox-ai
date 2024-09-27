import 'package:flutter/material.dart';
import 'package:nexus/app/common/values/app_colors.dart';
import 'package:nexus/gen/assets.gen.dart';

class Summary extends StatelessWidget {
  const Summary({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 340,
      //height: 320,
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
              Assets.images.gmail.image(
                height: 20,
                width: 20,
              ),
              const SizedBox(
                width: 6,
              ),
              const Text(
                'GMAIL',
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
          const Text(
            'data',
            style: TextStyle(
              color: AppColors.black,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            'data',
            style: TextStyle(
              color: AppColors.black.withOpacity(0.56),
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
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
                  color: AppColors.black.withOpacity(0.56),
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
                    child: const Text(
                      'djsdhbksbkdjhkd',
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
              SizedBox(
                width: 8,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(8),
                  ),
                  color: Color(0xFFD72F59),
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
}
