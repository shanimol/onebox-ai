import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AnimatedTap extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;
  final Duration? duration;

  AnimatedTap({
    super.key,
    required this.child,
    this.onTap,
    this.duration,
  });

  @override
  State<StatefulWidget> createState() {
    return AnimatedTapState();
  }
}

class AnimatedTapState extends State<AnimatedTap>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController;

  double _scaleTransformValue = 1;
  bool isClicked = false;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: duration,
      lowerBound: 0.0,
      upperBound: 0.05,
    )..addListener(() {
        setState(() => _scaleTransformValue = 1 - animationController.value);
      });
  }

  Future<void> _shrinkSize() async {
    // play the click animation forward only onClick function available
    if (widget.onTap != null) {
      await animationController.forward();
    }
  }

  Future<void> _restoreSize() async {
    // play the click animation reverse only onClick function available
    if (widget.onTap != null) {
      await Future.delayed(
        duration,
        () => animationController.reverse(),
      );
    }
  }

  void _didTap() async {
    // play the click animation and call the onClick function only onClick function available
    if (widget.onTap != null) {
      setState(() {
        isClicked = true;
      });
      HapticFeedback.mediumImpact();
      await _shrinkSize();
      await _restoreSize();

      widget.onTap?.call();
    }
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _didTap,
      child: Transform.scale(
        scale: _scaleTransformValue,
        child: widget.child,
      ),
    );
  }

  Duration get duration => widget.duration ?? Duration(milliseconds: 100);
}
