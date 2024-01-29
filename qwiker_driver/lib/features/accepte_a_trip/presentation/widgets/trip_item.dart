import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:qwiker_driver/core/global_functions.dart';
import 'package:qwiker_driver/core/theaming/app_colors.dart';
import 'package:qwiker_driver/core/theaming/app_fonts.dart';
import 'package:qwiker_driver/core/widgets/custom_bickup_icon.dart';
import 'package:qwiker_driver/core/widgets/custom_button.dart';
import 'package:qwiker_driver/core/widgets/custom_destination_icon.dart';
import 'package:qwiker_driver/features/accepte_a_trip/data/models/trip_model.dart';
import 'package:qwiker_driver/features/accepte_a_trip/presentation/manager/accepte_a_trip/accepte_a_trip_cubit.dart';

class TripItem extends StatelessWidget {
  const TripItem({
    super.key,
    required this.trip,
    required this.findTripCubit,
  });

  final TripModel trip;
  final findTripCubit;

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
              Text(
                '${trip.tripTotalDestance!.toStringAsFixed(2)} KM',
                style: AppFonts.poppinsBold_20,
              ),
              Row(children: [
                const CustomBickUpIcon(),
                Gap(14.w),
                Container(
                  constraints: BoxConstraints(
                    maxWidth: 230.w,
                  ),
                  child: Text(
                    trip.startPointdata.shortName,
                    style: AppFonts.poppinsRegularBlack_12,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              ]),
              Padding(
                padding: EdgeInsets.only(
                  left: 12.w,
                ),
                child: const Text(
                  "|",
                  textAlign: TextAlign.start,
                ),
              ),
              Row(children: [
                const CustomDestinationIcon(),
                Gap(14.w),
                Container(
                  constraints: BoxConstraints(
                    maxWidth: 230.w,
                  ),
                  child: Text(
                    trip.endPointdata.shortName,
                    style: AppFonts.poppinsRegularBlack_12,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ]),
              Gap(2.h),
              Center(
                child: CustomButton(
                  onPressed: () {
                    showProgressIndicator(context);
                    BlocProvider.of<AccepteATripCubit>(context)
                        .acceptATrip(trip)
                        .then((_) => findTripCubit.emitTripAccipted())
                        .onError((error, stackTrace) => {});
                  },
                  title: 'Accepte',
                  height: 40.h,
                  minwidth: 200.w,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
