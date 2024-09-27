import 'package:flutter/material.dart';
import 'package:nexus/app/data/models/task.dart';
import 'package:nexus/gen/assets.gen.dart';

class DraggingActionItem extends StatelessWidget {
  final String? title;
  final String? summary;
  final String? actionId;
  final Source? source;
  const DraggingActionItem({
    super.key,
    this.title,
    this.summary,
    this.actionId,
    this.source,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 425,
      height: 77,
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
                  title ?? '',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    height: 19.5 / 16,
                  ),
                ),
                Text(
                  summary ?? '',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                    height: 17.07 / 14,
                  ),
                  maxLines: 2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSourceIcon() {
    switch (source) {
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
}
