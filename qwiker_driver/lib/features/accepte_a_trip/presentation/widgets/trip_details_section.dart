import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:qwiker_driver/core/global_functions.dart';
import 'package:qwiker_driver/core/theaming/app_colors.dart';
import 'package:qwiker_driver/core/theaming/app_fonts.dart';
import 'package:qwiker_driver/core/widgets/custom_bickup_icon.dart';
import 'package:qwiker_driver/core/widgets/custom_button.dart';
import 'package:qwiker_driver/core/widgets/custom_destination_icon.dart';
import 'package:qwiker_driver/core/widgets/custom_list_tile.dart';
import 'package:url_launcher/url_launcher.dart';

class TripDetailsSection extends StatelessWidget {
  const TripDetailsSection({
    super.key,
    required this.riderName,
    required this.startLocationName,
    required this.destinationName,
    required this.buttonTitle,
    required this.fullDistance,
    required this.buttonOnPressed,
  });
  final String riderName, startLocationName, destinationName, buttonTitle;
  final double fullDistance;
  final void Function()? buttonOnPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.whaite,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.r),
          topRight: Radius.circular(30.r),
        ),
      ),
      height: 201.h,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
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
                ),
                title: ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: 270.w,
                  ),
                  child: Text(
                    riderName,
                    style: AppFonts.poppinsSemiBold_16,
                    maxLines: 1,
                  ),
                ),
                subTitle: Row(
                  children: [
                    const Icon(
                      Icons.watch_later_outlined,
                      color: AppColors.mainBlue,
                    ),
                    Gap(5.w),
                    const Text('15 Min'),
                  ],
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(
                      backgroundColor: AppColors.mainBlue,
                      radius: 20.r,
                      child: IconButton(
                        onPressed: () async {
                          launchUrl(Uri(
                            scheme: 'tel',
                            path: getPhoneNumber(),
                          ));
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
                      radius: 20.r,
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
              Center(
                child: CustomButton(
                  onPressed: buttonOnPressed,
                  title: buttonTitle,
                  height: 50.h,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
