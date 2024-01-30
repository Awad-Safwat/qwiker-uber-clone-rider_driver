import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:qwiker_driver/core/routing/views_name.dart';
import '../../../../../core/theaming/app_fonts.dart';
import 'dont_or_have_account_secction.dart';
import 'login_field_with_button_secction.dart';

class LogInViewBody extends StatelessWidget {
  const LogInViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Gap(180.h),
          Center(
            // the app logo with name
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
            style: AppFonts.poppinsRegularBlack_16,
          ),
          Gap(20.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 35.w),
            child: const LoginTFieldWithButtonSecction(),
          ),
          Gap(160.h),
          DontORHaveAccountSecction(
            onPressed: () {
              GoRouter.of(context)
                  .pushReplacement(ViewsName.completeProfileInfoView);
            },
            text: 'Don\'t have an account?',
            textStyle: AppFonts.poppinsRegularBlack_16,
            textButtonTitle: 'Sign Up',
            textButtonTitleStyle: AppFonts.poppinsBoldBlue_16,
          ),
        ],
      ),
    );
  }
}
