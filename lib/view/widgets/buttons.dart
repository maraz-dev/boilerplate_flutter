import 'package:boilerplate_flutter/view/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class MainButton extends StatelessWidget {
  final String text;
  final Color color;
  final Color? textColor;
  final Color? loadingColor;
  final Color? borderColor;
  final bool? isLoading;
  final double? fontSize, padding, borderRadius;
  final Function()? onPressed;
  const MainButton({
    super.key,
    required this.text,
    this.color = AppColors.kPrimaryColor,
    this.loadingColor,
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: GestureDetector(
        onTap: onPressed == null
            ? null
            : () {
                FocusScope.of(context).unfocus();
                onPressed!();
              },
        child: Container(
          padding: padding == null
              ? const EdgeInsets.symmetric(vertical: 16)
              : EdgeInsets.symmetric(vertical: 4, horizontal: padding!),
          decoration: BoxDecoration(
            color: onPressed == null ? color.withValues(alpha: 0.3) : color,
            borderRadius: BorderRadius.circular(borderRadius ?? 16.r),
            border: Border.all(color: borderColor ?? Colors.transparent),
            boxShadow: onPressed == null
                ? null
                : [
                    BoxShadow(
                      color: color.withValues(alpha: 0.3),
                      spreadRadius: 2,
                      blurRadius: 6,
                      offset: const Offset(0, 0),
                    ),
                  ],
          ),
          child: isLoading ?? false
              ? LoadingAnimationWidget.hexagonDots(
                  color: loadingColor ?? Colors.white,
                  size: 20,
                )
              : Center(
                  child: Text(
                    text,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: fontSize ?? 14,
                          fontWeight: FontWeight.w600,
                          //fontFamily: FontFamily.sora,
                          color: textColor ?? Colors.white,
                        ),
                  ),
                ),
        ),
      ),
    );
  }
}
