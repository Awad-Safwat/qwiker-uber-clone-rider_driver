import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:qwiker_driver/core/theaming/app_colors.dart';
import 'package:qwiker_driver/core/theaming/app_fonts.dart';
import 'package:qwiker_driver/core/widgets/custom_bickup_icon.dart';
import 'package:qwiker_driver/core/widgets/custom_button.dart';
import 'package:qwiker_driver/core/widgets/custom_destination_icon.dart';
import 'package:qwiker_driver/features/accepte_a_trip/presentation/manager/accepte_a_trip/accepte_a_trip_cubit.dart';
import 'package:qwiker_driver/features/accepte_a_trip/presentation/widgets/trip_cost_widget.dart';

class TripOnGoingBottomSection extends StatelessWidget {
  const TripOnGoingBottomSection({super.key});

  @override
  Widget build(BuildContext context) {
    var accepteATripCubit = BlocProvider.of<AccepteATripCubit>(context);
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
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Row(
                  children: [
                    const CustomBickUpIcon(),
                    Gap(20.w),
                    ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: 270.w),
                      child: Text(
                        "startLocationName",
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
                        "destinationName",
                        style: AppFonts.poppinsRegularBlack_12,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              Gap(12.h),
              Center(
                child: CustomButton(
                  onPressed: () {
                    accepteATripCubit
                        .notifyOnDestinaionPoint(accepteATripCubit
                            .acceptedTripe!.riderData!.riderPhone)
                        .then(
                      (_) {
                        showDialog(
                          context: context,
                          builder: (context) => const TripCostWidget(),
                        );
                      },
                    );
                  },
                  title: 'End Trip',
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
