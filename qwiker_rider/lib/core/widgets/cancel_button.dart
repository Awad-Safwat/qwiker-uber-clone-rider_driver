import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theaming/app_colors.dart';
import '../theaming/app_fonts.dart';

class CancelButton extends StatelessWidget {
  const CancelButton({
    super.key,
    this.backgroundColor,
    this.minwidth,
    this.height,
    this.borderRadius,
    required this.onPressed,
    this.titleStyle,
  });

  final Color? backgroundColor;
  final double? minwidth, height, borderRadius;
  final void Function()? onPressed;

  final TextStyle? titleStyle;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      // color: backgroundColor ?? AppColors.mainBlue,
      minWidth: minwidth ?? 355.w,
      height: height ?? 60.h,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 50.r),
          side: const BorderSide(color: AppColors.red)),
      onPressed: onPressed,
      child: Text(
        'Cancel Ride',
        style: titleStyle ??
            AppFonts.poppinsMedium_18.copyWith(color: AppColors.red),
      ),
    );
  }
}
