import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:qwiker_rider/core/theaming/app_colors.dart';
import 'package:qwiker_rider/core/theaming/app_fonts.dart';
import 'package:qwiker_rider/features/home/presentation/manager/drawer_cubit/drawer_cubit.dart';

class DrawerItems extends StatelessWidget {
  const DrawerItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    DrawerCubit provider = BlocProvider.of<DrawerCubit>(context);
    return SafeArea(
      child: Container(
        child: ListTileTheme(
          textColor: Colors.white,
          iconColor: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Gap(73.h),
              SizedBox(
                height: 110.h,
                width: 110.w,
                child: CircleAvatar(
                  radius: 80.r,
                  backgroundColor: AppColors.whaite,
                  child: CircleAvatar(
                    radius: 53.r,
                    foregroundImage: const AssetImage(
                      'assets/images/my_photo.jpg',
                    ),
                  ),
                ),
              ),
              Gap(12.h),
              Text(
                'Awad Safwat',
                style: AppFonts.poppinsBold_20.copyWith(color: Colors.white),
              ),
              Gap(50.h),
              ListTile(
                onTap: () {
                  provider.changSelectedScreen(0);
                },
                leading: const Icon(Icons.home),
                title: Text(
                  'Request a ride',
                  style: AppFonts.poppinsMedium_16,
                ),
              ),
              ListTile(
                onTap: () {
                  provider.changSelectedScreen(1);
                },
                leading: const Icon(Icons.account_circle_rounded),
                title: Text(
                  'Profile',
                  style: AppFonts.poppinsMedium_16,
                ),
              ),
              ListTile(
                onTap: () {
                  provider.changSelectedScreen(2);
                },
                leading: const Icon(Icons.history),
                title: Text(
                  'Trips',
                  style: AppFonts.poppinsMedium_16,
                ),
              ),
              ListTile(
                onTap: () {
                  // BlocProvider.of<DrawerCubit>(context).selectedView = 3;
                },
                leading: const Icon(Icons.settings),
                title: Text(
                  'Settings',
                  style: AppFonts.poppinsMedium_16,
                ),
              ),
              const Spacer(
                flex: 5,
              ),
              ListTile(
                onTap: () {},
                leading: const Icon(Icons.logout),
                title: Text(
                  'Logout',
                  style: AppFonts.poppinsMedium_16,
                ),
              ),
              const Spacer(),
              DefaultTextStyle(
                style: const TextStyle(
                  fontSize: 12,
                  color: AppColors.liteGray,
                ),
                child: Container(
                  margin: EdgeInsets.symmetric(
                    vertical: 16.0.w,
                  ),
                  child: const Text('Terms of Service | Privacy Policy'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
