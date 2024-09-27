import 'package:flutter/material.dart';

class _JumpingDot extends AnimatedWidget {
  final Color color;
  final double radius;
  final Animation<double> animation;
  _JumpingDot(
      {required this.animation, required this.color, required this.radius})
      : super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: animation.value,
          ),
          child: CircleAvatar(
            radius: radius,
            backgroundColor: color,
          ),
        );
      },
    );
  }
}

class JumpingDotsProgressIndicator extends StatefulWidget {
  final int numberOfDots;
  final double radius;
  final double dotSpacing;
  final Color color;
  final int milliseconds;
  final double beginTweenValue = 0.0;
  final double endTweenValue = 8.0;

  JumpingDotsProgressIndicator({
    this.numberOfDots = 3,
    this.radius = 10.0,
    this.color = Colors.black,
    this.dotSpacing = 0.0,
    this.milliseconds = 250,
  });

  @override
  JumpingDotsProgressIndicatorState createState() =>
      JumpingDotsProgressIndicatorState(
        numberOfDots: numberOfDots,
        radius: radius,
        color: color,
        dotSpacing: dotSpacing,
        milliseconds: milliseconds,
      );
}

class JumpingDotsProgressIndicatorState
    extends State<JumpingDotsProgressIndicator> with TickerProviderStateMixin {
  int numberOfDots;
  int milliseconds;
  double radius;
  double dotSpacing;
  Color color;
  List<AnimationController> controllers = [];
  List<Animation<double>> animations = [];
  final List<Widget> _widgets = [];

  JumpingDotsProgressIndicatorState({
    required this.numberOfDots,
    required this.radius,
    required this.color,
    required this.dotSpacing,
    required this.milliseconds,
  });

  @override
  initState() {
    super.initState();
    for (int i = 0; i < numberOfDots; i++) {
      _addAnimationControllers();
      _buildAnimations(i);
      _addListOfDots(i);
    }

    controllers[0].forward();
  }

  void _addAnimationControllers() {
    controllers.add(AnimationController(
        duration: Duration(milliseconds: milliseconds), vsync: this));
  }

  void _addListOfDots(int index) {
    _widgets.add(Padding(
      padding: EdgeInsets.only(right: dotSpacing),
      child: _JumpingDot(
        animation: animations[index],
        radius: radius,
        color: color,
      ),
    ));
  }

  void _buildAnimations(int index) {
    animations.add(Tween(
            begin: widget.beginTweenValue, end: widget.endTweenValue)
        .animate(controllers[index])
      ..addStatusListener((AnimationStatus status) {
        if (status == AnimationStatus.completed) {
          controllers[index].reverse();
        }
        if (index == numberOfDots - 1 && status == AnimationStatus.dismissed) {
          controllers[0].forward();
        }
        if (animations[index].value > widget.endTweenValue / 2 &&
            index < numberOfDots - 1) {
          controllers[index + 1].forward();
        }
      }));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _widgets,
      ),
    );
  }

  @override
  dispose() {
    for (int i = 0; i < numberOfDots; i++) {
      controllers[i].dispose();
    }
    super.dispose();
  }
}
