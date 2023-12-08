import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:qwiker_driver/core/theaming/app_colors.dart';
import 'package:qwiker_driver/features/onpoarding/widgets/onboarding_backgrounds.dart';
import 'package:qwiker_driver/features/onpoarding/widgets/onboarding_textsbody.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnBoardingSlider(
        addController: true,
        controllerColor: AppColors.gray,
        finishButtonText: 'Get Started',
        totalPage: 3,
        headerBackgroundColor: AppColors.mainBlue,
        finishButtonStyle: FinishButtonStyle(
          backgroundColor: AppColors.mainBlue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(50.r),
            ),
          ),
        ),
        onFinish: () => GoRouter.of(context).push('/LogInView'),
        background: const [
          BackGroundOnboarding1(),
          BackGroundOnboarding2(),
          BackGroundOnboarding3(),
        ],
        speed: 1.8,
        pageBodies: const [
          Onboarding1Text(),
          Onboarding2Text(),
          Onboarding3Text(),
        ],
      ),
    );
  }
}
