import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:boilerplate_flutter/view/theme/app_colors.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class MainButton extends StatelessWidget {
  final String text;
  final Color color;
  final Color? textColor;
  final Color? borderColor;
  final bool? isLoading;
  final double? fontSize, padding, borderRadius;
  final Function()? onPressed;
  const MainButton({
    super.key,
    required this.text,
    this.color = AppColors.kPrimaryColor,
    this.textColor,
    required this.onPressed,
    this.isLoading,
    this.borderColor,
    this.borderRadius,
    this.padding,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed == null
          ? null
          : () {
              FocusScope.of(context).unfocus();
              onPressed!();
            },
      child: Container(
        //width: double.infinity,
        padding: padding == null
            ? const EdgeInsets.symmetric(vertical: 12)
            : EdgeInsets.symmetric(vertical: 4, horizontal: padding!),
        decoration: BoxDecoration(
          color: onPressed == null ? color.withValues(alpha: 0.3) : color,
          borderRadius: BorderRadius.circular(borderRadius ?? 8.r),
          border: Border.all(color: borderColor ?? Colors.transparent),
        ),
        child: isLoading ?? false
            ? const SpinKitDualRing(
                color: Colors.white,
                size: 25,
              )
            : Center(
                child: Text(
                  text,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: fontSize ?? 14,
                      color: textColor ?? Colors.white),
                ),
              ),
      ),
    );
  }
}

class SpinKitThreeBounce {
  const SpinKitThreeBounce();
}
