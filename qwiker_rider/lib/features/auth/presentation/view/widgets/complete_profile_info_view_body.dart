import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:qwiker_rider/core/routing/views_name.dart';

import '../../../../../core/theaming/app_fonts.dart';
import 'dont_or_have_account_secction.dart';
import 'login_field_with_button_secction.dart';
import 'user_data_input_fields.dart';

class CompleteProfileInforViewBody extends StatelessWidget {
  const CompleteProfileInforViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Gap(80.h),
          Center(
            // the app logo with name
            child: Image.asset(
              'assets/images/splash-screen-icon.png',
              height: 60.h,
              width: 220.w,
            ),
          ),
          Gap(50.h),
          const Text(
            'Wellcome',
            style: AppFonts.medel_36,
          ),
          Gap(20.h),
          Text(
            'Please Complete your profile data',
            style: AppFonts.poppinsRegularBlack_16,
          ),
          Gap(50.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 35.w),
            child: const UserDataInputFields(),
          ),
        ],
      ),
    );
  }
}
