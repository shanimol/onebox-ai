import 'package:flutter/material.dart';
import 'package:nexus/gen/assets.gen.dart';

class ActionItem extends StatefulWidget {
  final String title;
  final NexusAction action;
  final String summary;
  final String actionId;
  final NexusActionSource source;

  const ActionItem(
      {super.key,
      required this.title,
      required this.action,
      required this.summary,
      required this.actionId,
      required this.source});

  @override
  State<ActionItem> createState() => _ActionItemState();
}

class _ActionItemState extends State<ActionItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 12,
      ),
      decoration: BoxDecoration(
        color: Color(0xFFF8F8F8),
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSourceIcon(),
          SizedBox(
            width: 9.74,
          ),
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        widget.title,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          height: 17.07 / 14,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xFFA8E2EA),
                        borderRadius: BorderRadius.circular(
                          17,
                        ),
                      ),
                      child: Text(
                        widget.action.name,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          height: 14.63 / 12,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 35.89,
                    ),
                    Assets.images.search.image(
                      height: 20,
                      width: 20,
                    ),
                    SizedBox(
                      width: 13,
                    ),
                    Assets.images.assign.image(
                      height: 20,
                      width: 20,
                    ),
                    SizedBox(
                      width: 13,
                    ),
                    Assets.images.delete.image(
                      height: 20,
                      width: 20,
                    ),
                  ],
                ),
                SizedBox(
                  height: 9.29,
                ),
                Row(
                  children: [
                    Text(
                      "Summary",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        height: 17.07 / 14,
                      ),
                    ),
                    SizedBox(
                      width: 9.18,
                    ),
                    Assets.images.ai.image(
                      height: 14,
                      width: 11.64,
                    ),
                  ],
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  widget.summary,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    height: 17.07 / 14,
                  ),
                ),
                SizedBox(
                  height: 9.79,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        color: Colors.white,
                        child: TextFormField(
                          cursorHeight: 18,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 9.5,
                            ),
                            hintText: "Reply",
                            hintStyle: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              height: 17.92 / 14,
                            ),
                            fillColor: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Assets.images.send.image(
                      height: 22.92,
                      width: 22.92,
                    ),
                    SizedBox(
                      width: 34,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 11,
                        vertical: 8.5,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xFF205ACC),
                        borderRadius: BorderRadius.circular(
                          6,
                        ),
                      ),
                      child: Text(
                        "Mark as done",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          height: 14.63 / 12,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSourceIcon() {
    switch (widget.source) {
      case NexusActionSource.excel:
        return Assets.images.excel.image(
          height: 20,
          width: 20,
        );
      case NexusActionSource.gmail:
        return Assets.images.gmail.image(
          height: 20,
          width: 20,
        );
    }
  }
}

enum NexusAction { hackathon }

enum NexusActionSource {
  excel,
  gmail,
}
