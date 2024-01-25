import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:qwiker_rider/core/di/dependency_injection.dart';
import 'package:qwiker_rider/core/theaming/app_colors.dart';
import 'package:qwiker_rider/core/theaming/app_fonts.dart';
import 'package:qwiker_rider/features/request_ride/presentation/manager/request_a_ride_cubit/request_a_ride_cubit.dart';
import 'package:qwiker_rider/features/request_ride/presentation/widgets/custom_bickup_icon.dart';
import 'package:qwiker_rider/features/request_ride/presentation/widgets/custom_destination_icon.dart';

class TripOnGoingBottomSection extends StatelessWidget {
  const TripOnGoingBottomSection({super.key});

  @override
  Widget build(BuildContext context) {
    var requestARideCubit = getIt<RequestARideCubit>();
    return Container(
      decoration: BoxDecoration(
        color: AppColors.whaite,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.r),
          topRight: Radius.circular(30.r),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Row(
                  children: [
                    const CustomBickUpIcon(),
                    Gap(20.w),
                    ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: 270.w),
                      child: Text(
                        requestARideCubit.currentTrip!.startPointdata.shortName,
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
                        requestARideCubit.currentTrip!.endPointdata.shortName,
                        style: AppFonts.poppinsRegularBlack_12,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
