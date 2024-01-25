import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:qwiker_rider/core/di/dependency_injection.dart';
import 'package:qwiker_rider/core/routing/views_name.dart';
import 'package:qwiker_rider/core/theaming/app_colors.dart';

import 'package:qwiker_rider/features/request_ride/presentation/manager/request_a_ride_cubit/request_a_ride_cubit.dart';
import 'package:qwiker_rider/features/request_ride/presentation/widgets/available_rides_widget.dart';

import 'package:qwiker_rider/features/request_ride/presentation/widgets/custom_map.dart';
import 'package:qwiker_rider/features/request_ride/presentation/widgets/waiting_for_driver_widget.dart';

class ConfirmRideViewBody extends StatelessWidget {
  const ConfirmRideViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var requestARideCubit = getIt<RequestARideCubit>();
    return BlocConsumer<RequestARideCubit, RequestARideState>(
      listener: (context, state) {
        if (state is DriverAccebted) {
          GoRouter.of(context).push(ViewsName.onGoingTrip);
        }
      },
      builder: (context, state) {
        if (state is RequestARideLoaded || state is TripRequested) {
          return Stack(
            children: [
              CustomMap(
                provider: requestARideCubit,
                markers: {
                  Marker(
                    icon: requestARideCubit.startPointIcon!,
                    markerId: const MarkerId('startPoint'),
                    position: LatLng(
                      requestARideCubit.startPoint!.geometry.location.lat!,
                      requestARideCubit.startPoint!.geometry.location.long!,
                    ),
                  ),
                  Marker(
                    markerId: const MarkerId('destnaitionPoint'),
                    position: LatLng(
                      requestARideCubit
                          .destinationPoint!.geometry.location.lat!,
                      requestARideCubit
                          .destinationPoint!.geometry.location.long!,
                    ),
                  ),
                },
                cameraPositionLat:
                    requestARideCubit.startPoint!.geometry.location.lat,
                cameraPositionLong:
                    requestARideCubit.startPoint!.geometry.location.long,
                polylines: {
                  Polyline(
                      polylineId: const PolylineId("route"),
                      points: requestARideCubit.polylineCoordinates,
                      color: AppColors.mainBlue,
                      width: 4),
                },
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
              BlocBuilder<RequestARideCubit, RequestARideState>(
                builder: (context, state) {
                  if (state is TripRequested) {
                    return Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        top: 500.h,
                        child: const WaitingForDriverWidget());
                  } else {
                    return Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        top: 650.h,
                        child: const AvailableRidesWidget());
                  }
                },
              ),
            ],
          );
        } else {
          return CustomMap(
            provider: requestARideCubit,
            cameraPositionLat:
                requestARideCubit.startPoint!.geometry.location.lat,
            cameraPositionLong:
                requestARideCubit.startPoint!.geometry.location.long,
          );
        }
      },
    );
  }
}
