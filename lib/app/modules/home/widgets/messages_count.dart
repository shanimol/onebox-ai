import 'package:flutter/material.dart';
import 'package:nexus/app/common/values/app_colors.dart';
import 'package:nexus/gen/assets.gen.dart';

class MessagesCount extends StatelessWidget {
  const MessagesCount({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      padding: EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(22),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Assets.images.logoCollection.image(
                height: 37,
                width: 109,
              ),
              Assets.images.menu.image(
                height: 33,
                width: 33,
              )
            ],
          ),
          SizedBox(
            height: 18,
          ),
          RichText(
            text: TextSpan(
                text: '12',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  color: AppColors.black,
                ),
                children: [
                  TextSpan(
                    text: ' New messages',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.black,
                    ),
                  )
                ]),
          ),
          SizedBox(
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
    );
  }
}
