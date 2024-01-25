import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:qwiker_rider/core/di/dependency_injection.dart';
import 'package:qwiker_rider/core/theaming/app_colors.dart';
import 'package:qwiker_rider/features/request_ride/presentation/manager/request_a_ride_cubit/request_a_ride_cubit.dart';

import 'package:qwiker_rider/features/request_ride/presentation/widgets/driver_on_start_view.dart';
import 'package:qwiker_rider/features/request_ride/presentation/widgets/driver_on_the_way_view.dart';

import 'package:qwiker_rider/features/request_ride/presentation/widgets/trip_started_view.dart';

class OnGoingTripView extends StatelessWidget {
  const OnGoingTripView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider.value(
        value: getIt<RequestARideCubit>(),
        child: BlocBuilder<RequestARideCubit, RequestARideState>(
          builder: (context, state) {
            if (state is DriverAccebted) {
              return const DriverOnTheWayView();
            } else if (state is DriverOnStart) {
              return const DriverOnStartView();
            } else if (state is TripStarted) {
              return const TripIsStartedView();
            } else {
              return const AlertDialog(
                backgroundColor: Colors.transparent,
                elevation: 0,
                content: Center(
                  child: CircularProgressIndicator(
                    valueColor:
                        AlwaysStoppedAnimation<Color>(AppColors.mainBlue),
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
