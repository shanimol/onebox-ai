import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nexus/app/data/models/task.dart';
import 'package:nexus/gen/assets.gen.dart';

class ActionItem extends StatelessWidget {
  final Task? task;

  const ActionItem({
    super.key,
    required this.task,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return _buildDialog(context);
          },
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 9,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            8,
          ),
        ),
        child: Row(
          children: [
            _buildSourceIcon(),
            const SizedBox(
              width: 9.74,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    task?.title ?? '',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      height: 19.5 / 16,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    task?.summary ?? '',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black.withOpacity(
                        0.5,
                      ),
                      height: 17.07 / 14,
                    ),
                    maxLines: 2,
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Assets.images.search.image(
                      height: 20,
                      width: 20,
                    ),
                    const SizedBox(
                      width: 13,
                    ),
                    Assets.images.assign.image(
                      height: 20,
                      width: 20,
                    ),
                    const SizedBox(
                      width: 13,
                    ),
                    Assets.images.delete.image(
                      height: 20,
                      width: 20,
                    ),
                    // const SizedBox(
                    //   width: 13,
                    // ),
                    // Assets.images.tick.image(
                    //   height: 20,
                    //   width: 20,
                    // ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                _buildMarkAsDone(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSourceIcon() {
    switch (task?.sourceType) {
      case Source.Slack:
        return Assets.images.slack.image(
          height: 37,
          width: 37,
        );
      case Source.Gmail:
        return Assets.images.gmail.image(
          height: 37,
          width: 37,
        );
      case Source.Meet:
        return Assets.images.meet.image(
          height: 37,
          width: 37,
        );
      default:
        return Assets.images.slack.image(
          height: 37,
          width: 37,
        );
    }
  }

  Widget _buildMarkAsDone() {
    // Container(
    //   padding: const EdgeInsets.symmetric(
    //     horizontal: 10,
    //     vertical: 6,
    //   ),
    //   decoration: BoxDecoration(
    //     borderRadius: const BorderRadius.all(
    //       Radius.circular(7),
    //     ),
    //     border: Border.all(
    //       color: selectedIndex == index
    //           ? Colors.transparent
    //           : Colors.black.withOpacity(0.07),
    //     ),
    //     color: Colors.white,
    //   ),
    //   child: Text(
    //     buttonTitle ?? '',
    //     style: const TextStyle(
    //       fontSize: 14,
    //       fontWeight: FontWeight.w500,
    //       color: Color(0XFF181818),
    //     ),
    //   ),
    // ),
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 11,
        vertical: 8.5,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          6,
        ),
        border: Border.all(color: Colors.black.withOpacity(0.07)),
      ),
      child: const Text(
        "Mark as done",
        style: TextStyle(
          fontSize: 14,
          color: Colors.black,
          fontWeight: FontWeight.w500,
          height: 17.07 / 14,
        ),
      ),
    );
  }

  Widget _buildViewDetails() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 11,
        vertical: 8.5,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          6,
        ),
        border: Border.all(
          color: const Color(0xFF695DF0),
        ),
      ),
      child: const Text(
        "View Details",
        style: TextStyle(
          fontSize: 14,
          color: Color(0xFF695DF0),
          fontWeight: FontWeight.w500,
          height: 17.07 / 14,
        ),
      ),
    );
  }

  Widget _buildDialog(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 320,
        ),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            8,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                const Text(
                  "Tasks",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    height: 24.38 / 20,
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: const Row(
                      children: [
                        Text(
                          "Close",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            height: 17.07 / 14,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.close,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 14,
            ),
            Divider(
              color: Colors.black.withOpacity(
                0.2,
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSourceIcon(),
                const SizedBox(
                  width: 9.74,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        task?.title ?? '',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          height: 19.5 / 16,
                        ),
                      ),
                      Row(
                        children: [
                          Assets.images.calendarIconActionItemsDialog.image(
                            height: 11,
                            width: 10,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            DateFormat("dd MMM, yyyy").format(
                              task?.date ?? DateTime.now(),
                            ),
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              height: 14.63 / 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Row(
                  children: [
                    Assets.images.search.image(
                      height: 20,
                      width: 20,
                    ),
                    const SizedBox(
                      width: 13,
                    ),
                    Assets.images.assign.image(
                      height: 20,
                      width: 20,
                    ),
                    const SizedBox(
                      width: 13,
                    ),
                    Assets.images.delete.image(
                      height: 20,
                      width: 20,
                    ),
                    const SizedBox(
                      width: 13,
                    ),
                    Assets.images.tick.image(
                      height: 20,
                      width: 20,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Assets.images.ai.image(
                  height: 16,
                  width: 16,
                  color: const Color(
                    0xFF695DF0,
                  ),
                ),
                const SizedBox(
                  width: 6,
                ),
                const Text(
                  "Summary",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                    height: 17.07 / 14,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 6,
            ),
            Text(
              task?.summary ?? '',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black.withOpacity(0.5),
                height: 17.07 / 14,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Row(
              children: [
                _buildSourceIcon(),
                SizedBox(
                  width: 11,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "James 1:06 PM, sept 12 (IST)",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        height: 15.36 / 12,
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      "Have added a couple of columns to the existing pattern @shani, @dev, @vijay",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        height: 17.92 / 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              children: [
                _buildSourceIcon(),
                SizedBox(
                  width: 11,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Tom 1:11 PM, sept 12 (IST)",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        height: 15.36 / 12,
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      "Made edits to the profile column @shani, @dev, @vijay",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        height: 17.92 / 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(
                        0xFFFBFBFB,
                      ),
                    ),
                    child: TextFormField(
                      cursorHeight: 18,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        hintText: "Reply",
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 11,
                ),
                Assets.images.send.image(
                  width: 16,
                  height: 16,
                )
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                _buildViewDetails(),
                const SizedBox(
                  width: 16,
                ),
                _buildMarkAsDone(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
