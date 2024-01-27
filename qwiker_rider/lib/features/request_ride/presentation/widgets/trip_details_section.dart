import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:qwiker_rider/core/global_functions.dart';
import 'package:qwiker_rider/core/theaming/app_colors.dart';
import 'package:qwiker_rider/core/theaming/app_fonts.dart';
import 'package:qwiker_rider/core/widgets/cancel_button.dart';
import 'package:qwiker_rider/features/auth/presentation/view/widgets/custom_list_tile.dart';
import 'package:qwiker_rider/features/request_ride/presentation/widgets/custom_bickup_icon.dart';
import 'package:qwiker_rider/features/request_ride/presentation/widgets/custom_destination_icon.dart';
import 'package:url_launcher/url_launcher.dart';

class TripDetailsSection extends StatelessWidget {
  const TripDetailsSection({
    super.key,
    required this.driverName,
    required this.startLocationName,
    required this.destinationName,
    required this.fullDistance,
    required this.buttonOnPressed,
    required this.tripCoast,
  });
  final String driverName, startLocationName, destinationName;
  final double fullDistance;
  final int? tripCoast;
  final void Function()? buttonOnPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.whaite,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(35.r),
          topRight: Radius.circular(35.r),
        ),
      ),
      height: 201.h,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomListTile(
                tileColor: Colors.transparent,
                height: 80.h,
                leading: Container(
                  height: 60.h,
                  width: 60.w,
                  clipBehavior: Clip.hardEdge,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(
                          'assets/images/my_photo.jpg',
                        )),
                  ),
                  // child: Image.asset(
                  //   'assets/images/my_photo.jpg',
                  //   fit: BoxFit.cover,
                  // ),
                ),
                title: ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: 270.w,
                  ),
                  child: Text(
                    driverName,
                    style: AppFonts.poppinsSemiBold_16,
                    maxLines: 1,
                  ),
                ),
                subTitle: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: 'Volkswagen' '-',
                          style: AppFonts.poppinsRegularGray_14),
                      TextSpan(
                          text: 'HG5045',
                          style: AppFonts.poppinsRegularBlack_16),
                    ],
                  ),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CircleAvatar(
                      backgroundColor: AppColors.mainBlue,
                      radius: 24.r,
                      child: IconButton(
                        onPressed: () async {
                          getPhoneNumber().then(
                            (phone) {
                              launchUrl(Uri(
                                scheme: 'tel',
                                path: phone,
                              ));
                            },
                          );
                        },
                        icon: const Icon(
                          Icons.phone,
                        ),
                        color: AppColors.whaite,
                      ),
                    ),
                    Gap(8.w),
                    CircleAvatar(
                      backgroundColor: AppColors.mainBlue,
                      radius: 24.r,
                      child: const Icon(
                        Icons.message,
                        color: AppColors.whaite,
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                color: AppColors.gray,
                endIndent: 18,
                indent: 18,
              ),
              Gap(20.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Row(
                  children: [
                    const CustomBickUpIcon(),
                    Gap(20.w),
                    ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: 270.w),
                      child: Text(
                        startLocationName,
                        style: AppFonts.poppinsRegularBlack_12,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 29.w),
                child: Container(
                  height: 20,
                  width: 2,
                  color: AppColors.black,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Row(
                  children: [
                    const CustomDestinationIcon(),
                    Gap(20.w),
                    ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: 270.w),
                      child: Text(
                        destinationName,
                        style: AppFonts.poppinsRegularBlack_12,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              Gap(8.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    r'$' '$tripCoast',
                    style: AppFonts.poppinsMedium_26.copyWith(
                        color: AppColors.mainBlue, fontWeight: FontWeight.w700),
                  ),
                  Gap(20.w),
                  CancelButton(
                    onPressed: buttonOnPressed,
                    height: 50.h,
                    minwidth: 280.w,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
