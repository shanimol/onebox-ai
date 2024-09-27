import 'package:flutter/material.dart';
import 'package:nexus/app/common/util/exports.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData get theme {
    final inputBorder = 16.outlineInputBorder(
      borderSide: 3.borderSide(),
    );

    final hintStyle = AppTextStyle.smallRegular12.copyWith(
      color: AppColors.doveGray,
      fontSize: Dimens.fontSize14,
    );

    return ThemeData(
      useMaterial3: false,
      brightness: Brightness.dark,
      primaryColor: AppColors.primaryBlack,
      tabBarTheme: const TabBarTheme(
        indicator: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: AppColors.primaryNeon,
              width: 2,
            ),
          ),
        ),
      ),
      scaffoldBackgroundColor: AppColors.transactionBg,
      fontFamily: 'CabinetGrotesk',
      visualDensity: VisualDensity.adaptivePlatformDensity,
      appBarTheme: const AppBarTheme(
        color: AppColors.baseBlack,
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: AppColors.primaryNeon,
        disabledColor: AppColors.primaryNeon.withOpacity(0.35),
        height: 40.h,
        textTheme: ButtonTextTheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: 5.borderRadius,
        ),
      ),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: Colors.white, // Set the cursor color
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          padding: MaterialStateProperty.resolveWith(
            (_) => EdgeInsets.zero,
          ),
          shape: MaterialStateProperty.resolveWith<RoundedRectangleBorder>(
            (states) => RoundedRectangleBorder(),
          ),
          backgroundColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) {
                return AppColors.primaryNeon.withOpacity(0.35);
              }
              return null;
            },
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          padding: WidgetStateProperty.resolveWith(
            (_) => EdgeInsets.zero,
          ),
          overlayColor: WidgetStateProperty.resolveWith<Color?>(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.pressed)) {
                return Colors.white.withOpacity(.14);
              }

              return null;
            },
          ),
          shape: WidgetStateProperty.resolveWith<RoundedRectangleBorder>(
            (states) => RoundedRectangleBorder(
              borderRadius: 10.borderRadius,
            ),
          ),
        ),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        elevation: 4,
        backgroundColor: AppColors.primaryNeon,
      ),
      textTheme: TextTheme(
        bodyMedium: AppTextStyle.regularStyle.copyWith(
          color: AppColors.white,
          fontSize: Dimens.fontSize14,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 3,
        ),
        prefixStyle: AppTextStyle.regularStyle.copyWith(
          fontSize: Dimens.fontSize14,
          color: AppColors.black,
        ),
        hintStyle: hintStyle,
        labelStyle: hintStyle,
        enabledBorder: inputBorder,
        disabledBorder: inputBorder,
        focusedBorder: inputBorder,
        border: inputBorder,
      ),
      cardTheme: CardTheme(
        color: Colors.white.withOpacity(0.85),
        shape: RoundedRectangleBorder(
          borderRadius: 10.borderRadius,
        ),
      ),
      dialogTheme: DialogTheme(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: 20.borderRadius,
        ),
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(23.r),
            topRight: Radius.circular(23.r),
          ),
        ),
      ),
    );
  }
}
