import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class BackGroundOnboarding3 extends StatelessWidget {
  const BackGroundOnboarding3({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/images/onboarding3.gif',
          width: 450.w,
          fit: BoxFit.fill,
        ),
      ],
    );
  }
}

class BackGroundOnboarding2 extends StatelessWidget {
  const BackGroundOnboarding2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Gap(180.h),
        Image.asset(
          'assets/images/onboarding2.png',
          width: 450.w,
          fit: BoxFit.fill,
        ),
      ],
    );
  }
}

class BackGroundOnboarding1 extends StatelessWidget {
  const BackGroundOnboarding1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Gap(180.h),
        Image.asset(
          'assets/images/onboarding1.png',
          width: 450.w,
          fit: BoxFit.fill,
        ),
      ],
    );
  }
}
