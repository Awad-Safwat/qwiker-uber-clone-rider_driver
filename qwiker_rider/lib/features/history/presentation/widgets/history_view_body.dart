import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:qwiker_rider/core/theaming/app_fonts.dart';
import 'package:qwiker_rider/features/history/presentation/widgets/trip_item.dart';
import 'package:qwiker_rider/features/home/presentation/widgets/custom_app_bar.dart';
import 'package:qwiker_rider/features/request_ride/data/models/trip_model.dart';

class HistoryViewBody extends StatelessWidget {
  const HistoryViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomAppBar(),
        Expanded(
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return const Padding(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: TripItem(
                            //findTripCubit: findTripCubit,
                            // trip: TripModel.fromFirestore(trips[index], null),
                            ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
