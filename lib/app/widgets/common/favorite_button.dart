import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FavoriteButton extends StatefulWidget {
  final Color? color;
  final double? size;
  final Function() onClick;
  final bool? isClicked;

  FavoriteButton(
      {required this.onClick, this.color, this.size = 32, this.isClicked});

  @override
  State<StatefulWidget> createState() => FavoriteButtonState();
}

class FavoriteButtonState extends State<FavoriteButton>
    with SingleTickerProviderStateMixin {
  static const clickAnimationDurationMillis = 250;
  double _scaleTransformValue = 1;
  bool _isClicked = false;

  late final AnimationController animationController;

  @override
  void initState() {
    super.initState();
    _isClicked = widget.isClicked ?? false;

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: clickAnimationDurationMillis),
      lowerBound: 0.0,
      reverseDuration: Duration.zero,
      upperBound: 0.60,
    )..addListener(() {
        setState(() => _scaleTransformValue = 1 + animationController.value);
      });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void handleClick() {
    HapticFeedback.mediumImpact();
    animationController
        .fling()
        .then((value) => animationController.reverse())
        .then((value) => toggleClickState());
    widget.onClick();
  }

  @override
  void didUpdateWidget(oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isClicked != widget.isClicked) {
      setState(() {
        _isClicked = widget.isClicked ?? false;
      });
    }
  }

  void toggleClickState() {
    setState(() => _isClicked = true);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: handleClick,
      child: Transform.scale(
          scale: _scaleTransformValue,
          child: Icon(
            _isClicked ? Icons.favorite : Icons.favorite_border,
            color: widget.color,
            size: widget.size,
          )),
    );
  }
}
