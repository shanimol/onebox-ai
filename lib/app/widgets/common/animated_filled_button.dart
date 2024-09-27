import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../gen/fonts.gen.dart';
import '../../common/values/app_colors.dart';
import '../../common/values/app_images.dart';
import '../../common/values/styles/app_text_style.dart';
import 'animated_tap.dart';

class AnimatedFilledButton extends StatelessWidget {
  final String buttonLabel;
  final VoidCallback? onClick;
  final bool isFilledWithPrimary;
  final double? height;
  final Color? borderColor;
  final double? width;
  final Color? color;
  final double? fontSize;
  final bool isRightArrowPresent;
  final double? horizontalPadding;
  final double? verticalPadding;
  final TextStyle? textStyle;
  final String? icon;
  final bool isLoading;
  final MainAxisAlignment? mainAxisAlignment;
  final Color? textColor;
  final String? subLabel;
  final TextStyle? subLabelStyle;
  final Color? subLabelColor;
  final Color? iconColor;
  final Color? loadingIconColor;

  AnimatedFilledButton({
    super.key,
    required this.buttonLabel,
    required this.onClick,
    this.isFilledWithPrimary = true,
    this.height,
    this.fontSize,
    this.isRightArrowPresent = true,
    this.width,
    this.color,
    this.textStyle,
    this.icon,
    this.borderColor,
    this.horizontalPadding,
    this.isLoading = false,
    this.mainAxisAlignment,
    this.textColor,
    this.subLabel,
    this.subLabelStyle,
    this.subLabelColor,
    this.iconColor,
    this.verticalPadding,
    this.loadingIconColor,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedTap(
      onTap: !isLoading ? onClick : null,
      child: SizedBox(
        height: height ?? (subLabel == null ? 50.h : 56.h),
        width: width,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding ?? 16.w,
            vertical: verticalPadding ?? 10.h,
          ),
          decoration: BoxDecoration(
              color: color ??
                  (isFilledWithPrimary
                      ? onClick == null || isLoading
                          ? AppColors.primaryNeon400
                          : AppColors.primaryNeon
                      : AppColors.black80),
              border: Border.all(
                color: borderColor ?? Colors.transparent,
                width: borderColor != null ? 1 : 0,
              ),
              borderRadius: BorderRadius.circular(2.r)),
          child: isLoading
              ? CupertinoActivityIndicator(
                  radius: 12.r,
                  color: loadingIconColor ?? AppColors.black,
                )
              : Row(
                  mainAxisAlignment: (isRightArrowPresent || icon != null)
                      ? MainAxisAlignment.spaceBetween
                      : (mainAxisAlignment == null
                          ? MainAxisAlignment.center
                          : mainAxisAlignment ?? MainAxisAlignment.start),
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment:
                            (isRightArrowPresent || icon != null)
                                ? CrossAxisAlignment.start
                                : CrossAxisAlignment.center,
                        children: [
                          Text(
                            buttonLabel,
                            style: textStyle?.copyWith(color: _textColor) ??
                                AppTextStyle.normal14.copyWith(
                                  fontFamily: FontFamily.iBMPlexSans,
                                  color: _textColor,
                                  fontSize: fontSize,
                                  height: 1.2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                            maxLines: 1,
                          ),
                          if (buttonLabel.isNotEmpty &&
                              (subLabel?.isNotEmpty ?? false)) ...[
                            SizedBox(height: 4.h),
                            Text(
                              subLabel ?? '',
                              style: subLabelStyle?.copyWith(
                                      color: _subTextColor) ??
                                  AppTextStyle.normal10.copyWith(
                                    color: _subTextColor,
                                    height: 1.2,
                                    letterSpacing: 0.4.sp,
                                  ),
                            ),
                          ]
                        ],
                      ),
                    ),
                    if (isRightArrowPresent || icon != null)
                      Padding(
                        padding: EdgeInsets.only(
                            left: (buttonLabel.isNotEmpty ||
                                    (subLabel?.isNotEmpty ?? false))
                                ? 4.w
                                : 0),
                        child: SvgPicture.asset(
                          icon ?? AppImages.arrowRight,
                          width: 20.w,
                          height: 20.w,
                          colorFilter: ColorFilter.mode(
                            iconColor ??
                                textColor ??
                                (isFilledWithPrimary
                                    ? AppColors.black
                                    : AppColors.primaryNeon),
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                  ],
                ),
        ),
      ),
    );
  }

  Color get _textColor =>
      textColor ??
      (isFilledWithPrimary ? AppColors.primaryBlack : AppColors.primaryNeon);

  Color get _subTextColor =>
      subLabelColor ??
      (isFilledWithPrimary
          ? AppColors.black.withOpacity(0.7)
          : AppColors.white.withOpacity(0.7));
}
