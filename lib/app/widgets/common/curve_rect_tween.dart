import 'package:flutter/material.dart';

class CurveRectTween extends RectTween {
  final Rect? a;
  final Rect? b;
  final Curve curve;

  CurveRectTween({
    this.a,
    this.b,
    required this.curve,
  }) : super(
          begin: a,
          end: b,
        );

  @override
  Rect lerp(double t) {
    t = curve.transform(t);

    return Rect.fromLTRB(
      lerpDouble(a?.left, b?.left, t),
      lerpDouble(a?.top, b?.top, t),
      lerpDouble(a?.right, b?.right, t),
      lerpDouble(a?.bottom, b?.bottom, t),
    );
  }

  double lerpDouble(num? a, num? b, double t) {
    if (a == null && b == null) return 0;
    a ??= 0.0;
    b ??= 0.0;
    return a + (b - a) * t;
  }
}
