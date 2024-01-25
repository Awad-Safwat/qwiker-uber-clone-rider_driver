import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qwiker_driver/core/theaming/app_colors.dart';

class CustomBickUpIcon extends StatelessWidget {
  const CustomBickUpIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      width: 28.w,
      decoration: BoxDecoration(
          color: AppColors.mainBlue, borderRadius: BorderRadius.circular(20.r)),
      child: Padding(
        padding: EdgeInsets.only(bottom: 9.h, top: 22.h, left: 2.w, right: 2.w),
        child: const CircleAvatar(
          backgroundColor: AppColors.whaite,
        ),
      ),
    );
  }
}
