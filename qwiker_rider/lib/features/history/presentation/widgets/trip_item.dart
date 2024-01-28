import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:qwiker_rider/core/theaming/app_colors.dart';
import 'package:qwiker_rider/core/theaming/app_fonts.dart';
import 'package:qwiker_rider/features/auth/presentation/view/widgets/custom_list_tile.dart';
import 'package:qwiker_rider/features/request_ride/data/models/trip_model.dart';
import 'package:qwiker_rider/features/request_ride/presentation/widgets/custom_bickup_icon.dart';
import 'package:qwiker_rider/features/request_ride/presentation/widgets/custom_destination_icon.dart';

class TripItem extends StatelessWidget {
  const TripItem({
    super.key,
    //  required this.trip,
  });

  // final TripModel trip;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 380.w,
        decoration: BoxDecoration(
          color: AppColors.whaite,
          borderRadius: BorderRadius.circular(18),
          boxShadow: const [
            BoxShadow(color: AppColors.gray),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomListTile(
                height: 70.h,
                tileColor: Colors.transparent,
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
                    'Awad Safwat',
                    style: AppFonts.poppinsSemiBold_16,
                    maxLines: 1,
                  ),
                ),
                subTitle: RichText(
                  overflow: TextOverflow.ellipsis,
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
                trailing: Text(
                  // '${trip.tripTotalDestance!.toStringAsFixed(2)} KM',
                  '24.5 KM',
                  style: AppFonts.poppinsSemiBold_16,
                ),
              ),
              Gap(18.w),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Row(
                  children: [
                    const CustomBickUpIcon(),
                    Gap(20.w),
                    ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: 270.w),
                      child: Text(
                        'Cairo',
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
                        'Al Minia',
                        style: AppFonts.poppinsRegularBlack_12,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              Gap(2.h),
              Center(
                child: RatingBarIndicator(
                  rating: 2.75,
                  itemBuilder: (context, index) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  itemCount: 5,
                  itemSize: 30.0,
                  direction: Axis.horizontal,
                ),
              ),
              Gap(18.h),
              RichText(
                  text: TextSpan(
                      text: 'Review: ',
                      style: AppFonts.poppinsMediumBlue_20,
                      children: [
                    TextSpan(
                        text: 'Grate Trip With Grate person ',
                        style: AppFonts.poppinsMediumGray_16),
                  ])),
            ],
          ),
        ),
      ),
    );
  }
}
