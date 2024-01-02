import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:qwiker_rider/core/routing/views_name.dart';
import 'package:qwiker_rider/core/theaming/app_colors.dart';
import 'package:qwiker_rider/core/theaming/app_fonts.dart';
import 'package:qwiker_rider/core/widgets/custom_button.dart';

class WaitingForDriverWidget extends StatelessWidget {
  const WaitingForDriverWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.whaite,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40.r), topRight: Radius.circular(40.r))),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 222.w,
              height: 166.h,
              child: Image.asset('assets/images/search_for_driver_image.png'),
            ),
            Gap(20.h),
            const LinearProgressIndicator(
              minHeight: 6,
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.mainBlue),
            ),
            Gap(20.h),
            Text(
              'Please hold! we are searching for nearby driver for you',
              textAlign: TextAlign.center,
              style: AppFonts.poppinsMedium_16,
            ),
            const Spacer(),
            CustomButton(
              height: 52.h,
              onPressed: () {
                GoRouter.of(context).pushReplacement(ViewsName.homeView);
              },
              title: "Cancel Ride",
            ),
            Gap(20.h),
          ],
        ),
      ),
    );
  }
}
