import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theaming/app_colors.dart';
import '../theaming/app_fonts.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.backgroundColor,
    this.minwidth,
    this.height,
    this.borderRadius,
    required this.onPressed,
    required this.title,
    this.titleStyle,
  });

  final Color? backgroundColor;
  final double? minwidth, height, borderRadius;
  final void Function()? onPressed;
  final String title;
  final TextStyle? titleStyle;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: backgroundColor ?? AppColors.mainBlue,
      minWidth: minwidth ?? 355.w,
      height: height ?? 60.h,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 50.r)),
      onPressed: onPressed,
      child: Text(
        title,
        style: titleStyle ??
            AppFonts.poppinsMedium_18.copyWith(color: AppColors.whaite),
      ),
    );
  }
}
