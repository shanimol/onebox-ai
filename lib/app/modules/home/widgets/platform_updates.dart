import 'package:flutter/material.dart';

class PlatformUpdates extends StatelessWidget {
  const PlatformUpdates({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 470,
      height: 310,
      padding: const EdgeInsets.only(
        top: 16,
        left: 20,
        right: 17,
      ),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(14),
        ),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'What’s been happeing',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          Expanded(child: updatesList()),
        ],
      ),
    );
  }

  Widget updatesList() {
    return ListView.separated(
      itemCount: 3,
      itemBuilder: (context, index) {
        return updatesListItem();
      },
      separatorBuilder: (context, index) {
        return SizedBox(
          height: 13,
        );
      },
    );
  }

  Widget updatesListItem() {
    return ExpansionTile(
      childrenPadding: EdgeInsets.only(
        left: 9,
        bottom: 8,
        right: 9,
      ),
      trailing: Text(
        'last updated: 12:25:45 ',
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
      collapsedBackgroundColor: Color(0xFFD3D3D3),
      collapsedIconColor: Colors.transparent,
      iconColor: Colors.transparent,
      backgroundColor: Color(0xFFF3F3F3),
      expandedCrossAxisAlignment: CrossAxisAlignment.start,
      title: Text(
        'GMAIL',
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
      children: [
        // Row(
        //   children: [
        //     Expanded(
        //       child: Text(
        //         'GMAIL',
        //         style: TextStyle(
        //           fontSize: 12,
        //           fontWeight: FontWeight.w600,
        //           fontFamily: 'Montserrat',
        //         ),
        //       ),
        //     ),
        //     Text(
        //       'last updated: 12:25:45 ',
        //       style: TextStyle(
        //         fontSize: 12,
        //         fontWeight: FontWeight.w500,
        //         fontFamily: 'Montserrat',
        //       ),
        //     )
        //   ],
        // ),
        // SizedBox(
        //   height: 12,
        // ),
        Text(
          '5 emails from @dev @shani @sumukh',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(
          height: 6,
        ),
        Text(
          'Lorem ipsum dolor sit amet consectetur. Quam amet ultrices fames accumsan enim vel. Proin vitae bibendum.',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        )
      ],
    );
  }
}
