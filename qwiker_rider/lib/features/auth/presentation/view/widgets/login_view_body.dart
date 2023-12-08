import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:qwiker_rider/core/theaming/app_fonts.dart';

class LogInViewBody extends StatelessWidget {
  const LogInViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Gap(180.h),
          Center(
            child: Image.asset(
              'assets/images/splash-screen-icon.png',
              height: 60.h,
              width: 220.w,
            ),
          ),
          Gap(99.h),
          const Text(
            'Login',
            style: AppFonts.medel_36,
          ),
          Gap(50.h),
          Text(
            'Login with your phone number',
            style: AppFonts.poppinsMediumBlack_16,
          ),
          Gap(20.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 35.w),
            child: TextFormField(
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50.r),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
