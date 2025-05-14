import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:boilerplate_flutter/view/theme/app_colors.dart';

ThemeData themeData() {
  return ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      scaffoldBackgroundColor: AppColors.kSecondaryColor,
      fontFamily: 'SFPro',
      textTheme: textTheme(),
      inputDecorationTheme: inputDecorationTheme());
}

InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder focusInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: const BorderSide(color: AppColors.kSecondaryColor, width: 1),
  );
  OutlineInputBorder defaultInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: const BorderSide(color: Colors.transparent, width: 1),
  );
  OutlineInputBorder errorInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: const BorderSide(color: AppColors.kSecondaryColor, width: 1),
  );
  return InputDecorationTheme(
    contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 14),
    enabledBorder: defaultInputBorder,
    focusedBorder: focusInputBorder,
    errorBorder: errorInputBorder,
    border: defaultInputBorder,
    fillColor: AppColors.kSecondaryColor,
    filled: true,
    suffixIconColor: AppColors.kSecondaryColor,
  );
}

PinTheme defaultPinInputTheme = PinTheme(
  width: 50.w,
  height: 55.h,
  textStyle: textTheme.call().displayMedium,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(12.r),
    color: AppColors.kSecondaryColor,
    border: Border.all(color: AppColors.kSecondaryColor),
  ),
);

PinTheme focusedPinInputTheme = PinTheme(
  width: 50.w,
  height: 55.h,
  textStyle: textTheme.call().displayMedium,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(12.r),
    color: AppColors.kSecondaryColor,
    border: Border.all(color: AppColors.kPrimaryColor),
  ),
);

TextTheme textTheme() {
  return TextTheme(
    displayLarge: TextStyle(
      fontSize: 24.sp,
      fontWeight: FontWeight.w600,
      letterSpacing: -0.2,
      color: AppColors.kSecondaryColor,
    ),
    displayMedium: TextStyle(
      fontSize: 22.sp,
      fontWeight: FontWeight.w600,
      letterSpacing: -0.4,
      color: AppColors.kSecondaryColor,
    ),
    displaySmall: TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w600,
      letterSpacing: 0,
      color: AppColors.kSecondaryColor,
    ),
    bodyLarge: TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.3,
      color: AppColors.kSecondaryColor,
    ),
    bodyMedium: TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.3,
      color: AppColors.kSecondaryColor,
    ),
    bodySmall: TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.3,
      color: AppColors.kSecondaryColor,
    ),
  );
}

// AppBarTheme appBarTheme() {
//   return const AppBarTheme(
//     centerTitle: true,
//     elevation: 0,
//     color: Colors.transparent,
//     iconTheme: IconThemeData(
//       color: kWhiteColor,
//     ),
//   );
