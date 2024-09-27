import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomGradientText extends StatelessWidget {
  final String text;
  final List<Color> gradientColors;
  final TextStyle? textStyle;

  CustomGradientText(
      {required this.text, required this.gradientColors, this.textStyle});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) {
        return createGradientShader(gradientColors, bounds);
      },
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: textStyle ??
            TextStyle(
              fontSize: 36.sp,
              fontWeight: FontWeight.w700,
              color: Colors
                  .white, // Base color of the text (fallback if gradient isn't supported)
            ),
      ),
    );
  }

  Shader createGradientShader(List<Color> colors, Rect bounds) {
    return LinearGradient(
      colors: colors,
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    ).createShader(bounds);
  }
}
