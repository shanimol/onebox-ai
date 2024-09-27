import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget desktop;
  final Widget? global;
  final double breakpoint;

  const Responsive({
    Key? key,
    required this.mobile,
    required this.desktop,
    this.global,
    this.breakpoint = 600.0, // Default breakpoint for switching
  }) : super(key: key);

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 850;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 850;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (global != null) {
          return global!;
        } else if (constraints.maxWidth < breakpoint) {
          return mobile;
        } else {
          return desktop;
        }
      },
    );
  }
}
