// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomUpTransition extends CustomTransition {
  bool shouldReverseTransition;
  BottomUpTransition({
    this.shouldReverseTransition = false,
  });
  @override
  Widget buildTransition(
    BuildContext context,
    Curve? curve,
    Alignment? alignment,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    bool isSecondaryAnimation = secondaryAnimation.value > 0;

    Animation<double> finalAnimation = CurvedAnimation(
      parent: isSecondaryAnimation ? secondaryAnimation : animation,
      curve: Curves.easeOutQuint,
    );

    if (shouldReverseTransition) {
      if (isSecondaryAnimation) {
        return sideSlideAnimation(finalAnimation, child);
      } else {
        return bottomUpAnimation(
          finalAnimation,
          child,
          Offset(0, 1),
          Offset.zero,
        );
      }
    } else {
      if (isSecondaryAnimation) {
        return bottomUpAnimation(
          finalAnimation,
          child,
          Offset.zero,
          Offset(0, -1),
        );
      } else {
        return sideSlideAnimation(finalAnimation, child);
      }
    }
  }

  Widget bottomUpAnimation(
      Animation<double> animation, Widget child, Offset begin, Offset end) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, _) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: begin,
            end: end,
          ).animate(animation),
          child: child,
        );
      },
    );
  }

  Widget sideSlideAnimation(Animation<double> animation, Widget child) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, _) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: Offset(1, 0),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        );
      },
    );
  }
}
