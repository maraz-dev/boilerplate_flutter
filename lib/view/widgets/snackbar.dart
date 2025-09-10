// ignore_for_file: use_build_context_synchronously

import 'package:boilerplate_flutter/view/theme/app_colors.dart';
import 'package:boilerplate_flutter/view/theme/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

class ToastDialog {
  /// Function to display error message of value [message] in a [context] and
  /// an optional function [where] to do after displaying message
  static showError(
    String message,
    BuildContext context,
  ) {
    showToastWidget(
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        margin: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: AppColors.kErrorColor,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Text(
          message,
          style: context.textTheme.bodyMedium?.copyWith(color: Colors.white),
        ),
      ),
      context: context,
      animDuration: const Duration(milliseconds: 200),
      duration: const Duration(seconds: 3),
      position: StyledToastPosition.top,
      animation: StyledToastAnimation.slideToTopFade,
      reverseAnimation: StyledToastAnimation.fade,
    );
  }

  /// Function to display error message of value [message] in a [context] and
  /// an optional function [where] to do after displaying message
  static showSuccess(
    String message,
    BuildContext context,
  ) {
    showToastWidget(
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: AppColors.kSuccessColor,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Text(
          message,
          style: context.textTheme.bodyMedium?.copyWith(color: Colors.white),
        ),
      ),
      context: context,
      animDuration: const Duration(milliseconds: 200),
      position: StyledToastPosition.top,
      animation: StyledToastAnimation.slideToTopFade,
      reverseAnimation: StyledToastAnimation.fade,
    );
  }
}
