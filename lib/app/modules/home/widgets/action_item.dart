import 'package:flutter/material.dart';
import 'package:nexus/gen/assets.gen.dart';

class ActionItem extends StatefulWidget {
  final String title;
  final String summary;
  final String actionId;
  final NexusActionSource source;

  const ActionItem({
    super.key,
    required this.title,
    required this.summary,
    required this.actionId,
    required this.source,
  });

  @override
  State<ActionItem> createState() => _ActionItemState();
}

class _ActionItemState extends State<ActionItem> {
  bool isExpanded = false;
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isExpanded = !isExpanded;
        });
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
                    widget.title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      height: 19.5 / 16,
                    ),
                  ),
                  Text(
                    widget.summary,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                      height: 17.07 / 14,
                    ),
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
                    const SizedBox(
                      width: 13,
                    ),
                    Assets.images.tick.image(
                      height: 20,
                      width: 20,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                _buildMarkAsDone()
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSourceIcon() {
    switch (widget.source) {
      case NexusActionSource.slack:
        return Assets.images.slack.image(
          height: 37,
          width: 37,
        );
      case NexusActionSource.gmail:
        return Assets.images.gmail.image(
          height: 37,
          width: 37,
        );
      case NexusActionSource.figma:
        return Assets.images.figma.image(
          height: 37,
          width: 37,
        );
      case NexusActionSource.confluence:
        return Assets.images.confluence.image(
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
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 11,
        vertical: 8.5,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFD72F59),
        borderRadius: BorderRadius.circular(
          6,
        ),
      ),
      child: const Text(
        "Mark as done",
        style: TextStyle(
          fontSize: 14,
          color: Colors.white,
          fontWeight: FontWeight.w500,
          height: 17.07 / 14,
        ),
      ),
    );
  }
}

enum NexusActionSource {
  slack,
  gmail,
  figma,
  confluence,
}
