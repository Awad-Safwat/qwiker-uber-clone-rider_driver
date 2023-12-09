import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:qwiker_driver/core/theaming/app_fonts.dart';

class Onboarding3Text extends StatelessWidget {
  const Onboarding3Text({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Gap(500.h),
        Text(
          'Don\'t worry your data is private',
          style: AppFonts.poppinsMedium_20,
        ),
      ],
    );
  }
}

class Onboarding2Text extends StatelessWidget {
  const Onboarding2Text({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Earn Money',
          style: AppFonts.medel_36,
        ),
        Gap(20.h),
        Text(
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
          style: AppFonts.poppinsMediumGray_16,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class Onboarding1Text extends StatelessWidget {
  const Onboarding1Text({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Accept a job',
          style: AppFonts.medel_36,
        ),
        Gap(20.h),
        Text(
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
          style: AppFonts.poppinsMediumGray_16,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
