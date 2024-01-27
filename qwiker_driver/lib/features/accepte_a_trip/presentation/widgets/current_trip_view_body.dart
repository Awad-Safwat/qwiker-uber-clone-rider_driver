import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:qwiker_driver/core/di/dependency_injection.dart';
import 'package:qwiker_driver/core/routing/views_name.dart';
import 'package:qwiker_driver/features/accepte_a_trip/presentation/manager/accepte_a_trip/accepte_a_trip_cubit.dart';
import 'package:qwiker_driver/features/accepte_a_trip/presentation/widgets/custom_map.dart';
import 'package:qwiker_driver/features/accepte_a_trip/presentation/widgets/driver_on_start_point_view.dart';
import 'package:qwiker_driver/features/accepte_a_trip/presentation/widgets/goingto_rider_location_view.dart';
import 'package:qwiker_driver/features/accepte_a_trip/presentation/widgets/trip_details_section.dart';
import 'package:qwiker_driver/features/accepte_a_trip/presentation/widgets/trip_on_going_view.dart';

class CurrentTripViewBody extends StatelessWidget {
  const CurrentTripViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var accepteATripCubit = BlocProvider.of<AccepteATripCubit>(context);
    return BlocConsumer<AccepteATripCubit, AccepteATripState>(
        listener: (context, state) {
      if (state is TripIsCanceld) {
        getIt.resetLazySingleton<AccepteATripCubit>();
        GoRouter.of(context).pushReplacement(ViewsName.homeView);
      }
    }, builder: (context, state) {
      if (state is AcceptATripFailure) {
        return const Center(
          child: Text('error'),
        );
      } else if (state is DriverOnStartPoint) {
        return const DriverOnStartPointView();
      } else if (state is GoingToRiderLocation) {
        return const GoingToRiderLocationView();
      } else if (state is TripIsStarted) {
        return const TripOnGoingView();
      } else {
        return Stack(
          children: [
            CustomMap(
              accepteATripCubit: accepteATripCubit,
              cameraPositionLat: accepteATripCubit.driverLocationLat,
              cameraPositionLong: accepteATripCubit.driverLocationLong,
            ),
            Positioned(
              top: 25.h,
              left: 20.w,
              right: 365.w,
              bottom: 800.h,
              child: IconButton(
                onPressed: () {
                  GoRouter.of(context).pop();
                },
                icon: const Icon(Icons.arrow_back),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: 590.h,
              child: TripDetailsSection(
                buttonOnPressed: () {},
                buttonTitle: 'On Start Location',
                riderName:
                    accepteATripCubit.acceptedTripe!.riderData!.riderName,
                startLocationName:
                    accepteATripCubit.acceptedTripe!.startPointdata.shortName,
                destinationName:
                    accepteATripCubit.acceptedTripe!.endPointdata.shortName,
                fullDistance:
                    accepteATripCubit.acceptedTripe!.tripTotalDestance!,
              ),
            ),
          ],
        );
      }
    });
  }
}
