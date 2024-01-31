import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:qwiker_driver/core/theaming/app_colors.dart';
import 'package:qwiker_driver/core/theaming/app_fonts.dart';
import 'package:qwiker_driver/core/widgets/custom_bickup_icon.dart';
import 'package:qwiker_driver/core/widgets/custom_destination_icon.dart';
import 'package:qwiker_driver/core/widgets/custom_list_tile.dart';
import 'package:qwiker_driver/features/accepte_a_trip/data/models/trip_model.dart';

class HistoryTripItem extends StatelessWidget {
  const HistoryTripItem({
    super.key,
    required this.trip,
  });

  final TripModel trip;

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
                    trip.riderData!.riderName,
                    style: AppFonts.poppinsSemiBold_16,
                    maxLines: 1,
                  ),
                ),
                trailing: Text(
                  // '${trip.tripTotalDestance!.toStringAsFixed(2)} KM',
                  '${trip.tripTotalDestance!.toStringAsFixed(2)} KM',
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
                      constraints: BoxConstraints(maxWidth: 230.w),
                      child: Text(
                        trip.startPointdata.shortName,
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
                      constraints: BoxConstraints(maxWidth: 230.w),
                      child: Text(
                        trip.startPointdata.shortName,
                        style: AppFonts.poppinsRegularBlack_12,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              Gap(10.h),
              Center(
                child: Text(
                  r'$' '${trip.tripCoast}',
                  style: AppFonts.poppinsMedium_26.copyWith(
                      color: AppColors.mainBlue, fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
