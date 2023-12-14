import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:qwiker_driver/core/theaming/app_colors.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Gap(24.w),
        GestureDetector(
          onTap: () {
            GoRouter.of(context).pop();
          },
          child: Container(
            height: 41.h,
            width: 41.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: AppColors.gray),
            ),
            child: const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Icon(Icons.arrow_back_ios),
            ),
          ),
        ),
      ],
    );
  }
}
