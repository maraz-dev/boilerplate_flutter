import 'package:boilerplate_flutter/view/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

ThemeData themeData() {
  return ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    scaffoldBackgroundColor: AppColors.kScaffoldColor,
    fontFamily: FontFamily.inter,
    appBarTheme: appBarTheme(),
    textTheme: textTheme(),
    inputDecorationTheme: inputDecorationTheme(),
    checkboxTheme: CheckboxThemeData(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      visualDensity: VisualDensity.compact,
      side: const BorderSide(color: AppColors.kHintColor),
      fillColor: WidgetStateProperty.all(Colors.white),
    ),
  );
}

InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder focusInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: const BorderSide(color: AppColors.kPrimaryColor, width: 1.5),
  );
  OutlineInputBorder defaultInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: const BorderSide(color: AppColors.kPrimaryColor, width: 0.0),
  );
  OutlineInputBorder errorInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: const BorderSide(color: AppColors.kSecondaryColor, width: 0.5),
  );
  return InputDecorationTheme(
    contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 14),
    enabledBorder: defaultInputBorder,
    focusedBorder: focusInputBorder,
    errorBorder: errorInputBorder,
    border: defaultInputBorder,
    fillColor: Colors.white,
    filled: true,
    suffixIconColor: AppColors.kSecondaryColor,
  );
}

PinTheme defaultPinInputTheme = PinTheme(
  width: 50.w,
  height: 55.h,
  textStyle: textTheme.call().displayMedium,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(16.r),
    color: AppColors.kSecondaryColor,
    border: Border.all(color: AppColors.kHintColor),
  ),
);

PinTheme focusedPinInputTheme = PinTheme(
  width: 50.w,
  height: 55.h,
  textStyle: textTheme.call().displayMedium,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(16.r),
    color: AppColors.kSecondaryColor,
    border: Border.all(color: AppColors.kPrimaryColor),
  ),
);

TextTheme textTheme() {
  return TextTheme(
    displayLarge: TextStyle(
      fontSize: 24.sp,
      fontWeight: FontWeight.w600,
      fontFamily: FontFamily.sora,
      letterSpacing: -0.2,
      color: AppColors.kPrimaryColor,
    ),
    displayMedium: TextStyle(
      fontSize: 22.sp,
      fontWeight: FontWeight.w600,
      fontFamily: FontFamily.sora,
      letterSpacing: -0.4,
      color: AppColors.kPrimaryColor,
    ),
    displaySmall: TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w600,
      fontFamily: FontFamily.sora,
      letterSpacing: 0,
      color: AppColors.kPrimaryColor,
    ),
    bodyLarge: TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.3,
      color: AppColors.kTextColor,
    ),
    bodyMedium: TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.3,
      color: AppColors.kTextColor,
    ),
    bodySmall: TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.3,
      color: AppColors.kTextColor,
    ),
  );
}

AppBarTheme appBarTheme() {
  return const AppBarTheme(
    centerTitle: true,
    elevation: 0,
    scrolledUnderElevation: 0,
    backgroundColor: AppColors.kScaffoldColor,
  );
}

class FontFamily {
  FontFamily._();

  /// Font family: RedHatText
  static const String inter = 'Inter';

  /// Font family: SpaceGrotesk
  static const String sora = 'Sora';
}
