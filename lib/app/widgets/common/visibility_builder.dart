import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ClubVisibilityBuilder extends StatefulWidget {
  final String uniqueKey;

  // builder function used to build th child based on the isVisible boolean value
  final Function(bool isVisible) builder;

  // The visibleFractionThreshold is used to determine if the visibility of the widget is greater than this value.
  final double visibleFractionThreshold;

  // preserveState flag indicating whether the widget's state should remain alive or not
  final bool preserveState;

  // Delay specifies the amount of time to wait before changing isVisible to true.
  final Duration delay;

  ClubVisibilityBuilder({
    super.key,
    required this.uniqueKey,
    required this.builder,
    this.visibleFractionThreshold = 0.5,
    this.preserveState = true,
    this.delay = Duration.zero,
  });

  @override
  State<StatefulWidget> createState() {
    return ClubVisibilityBuilderState();
  }
}

class ClubVisibilityBuilderState extends State<ClubVisibilityBuilder>
    with AutomaticKeepAliveClientMixin {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return VisibilityDetector(
      key: Key(widget.uniqueKey),
      onVisibilityChanged: handleVisibilityChange,
      child: widget.builder(isVisible),
    );
  }

  void handleVisibilityChange(VisibilityInfo info) {
    if (info.visibleFraction >= widget.visibleFractionThreshold) {
      setToVisible();
    }
  }

  void setToVisible() {
    Future.delayed(widget.delay, () {
      setState(() {
        isVisible = true;
      });
    });
  }

  @override
  bool get wantKeepAlive => widget.preserveState;
}
