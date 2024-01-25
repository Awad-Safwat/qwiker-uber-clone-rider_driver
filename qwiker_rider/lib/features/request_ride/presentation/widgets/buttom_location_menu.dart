import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:qwiker_rider/core/routing/views_name.dart';
import 'package:qwiker_rider/core/theaming/app_colors.dart';
import 'package:qwiker_rider/core/theaming/app_fonts.dart';
import 'package:qwiker_rider/features/request_ride/presentation/widgets/custom_bickup_icon.dart';
import 'package:qwiker_rider/features/request_ride/presentation/widgets/custom_destination_icon.dart';

class ButtomLocationMenu extends StatelessWidget {
  const ButtomLocationMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      top: 650.h,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.whaite,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.r),
            topRight: Radius.circular(30.r),
          ),
        ),
        height: 201.h,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Where do you want to go ?',
                  style: AppFonts.poppinsMedium_20,
                ),
                Gap(20.h),
                ListTile(
                  leading: const CustomBickUpIcon(),
                  title: Text(
                    'start from your current location',
                    style: AppFonts.poppinsRegularBlack_12,
                  ),
                  onTap: () {
                    GoRouter.of(context).push(ViewsName.searchView);
                  },
                ),
                Gap(13.h),
                Divider(
                  height: 1.h,
                  color: AppColors.liteGray,
                  indent: 68.w,
                  endIndent: 24.w,
                ),
                Gap(10.h),
                ListTile(
                  leading: const CustomDestinationIcon(),
                  title: Text(
                    'Search Destination',
                    style: AppFonts.poppinsRegularGray_12,
                  ),
                  onTap: () {
                    GoRouter.of(context).push(ViewsName.searchView);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
