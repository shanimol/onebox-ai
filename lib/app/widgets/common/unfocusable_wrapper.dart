import 'package:flutter/material.dart';

class UnfocusableWrapper extends StatelessWidget {
  final Widget child;
  final VoidCallback? onUnfocus;
  final bool unfocusOnTap;

  UnfocusableWrapper({
    super.key,
    required this.child,
    this.onUnfocus,
    this.unfocusOnTap = true,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        color: Colors.transparent, // Using to capture tap
        child: child,
      ),
    );
  }

  // Handle tap event
  void _handleTap() {
    if (unfocusOnTap && _hasFocus()) {
      _unfocus();
      onUnfocus?.call();
    }
  }

  // Check if any field has focus
  bool _hasFocus() {
    return FocusManager.instance.primaryFocus?.hasFocus ?? false;
  }

  // Unfocus all fields
  void _unfocus() {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}
