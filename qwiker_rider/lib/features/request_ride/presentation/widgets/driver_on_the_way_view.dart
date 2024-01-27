import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:qwiker_rider/core/di/dependency_injection.dart';
import 'package:qwiker_rider/core/routing/views_name.dart';
import 'package:qwiker_rider/core/theaming/app_colors.dart';
import 'package:qwiker_rider/core/theaming/app_fonts.dart';
import 'package:qwiker_rider/features/request_ride/presentation/manager/request_a_ride_cubit/request_a_ride_cubit.dart';
import 'package:qwiker_rider/features/request_ride/presentation/widgets/custom_map.dart';
import 'package:qwiker_rider/features/request_ride/presentation/widgets/trip_details_section.dart';

class DriverOnTheWayView extends StatelessWidget {
  const DriverOnTheWayView({super.key});

  @override
  Widget build(BuildContext context) {
    var requestARideCubit = getIt<RequestARideCubit>();
    return Stack(
      children: [
        CustomMap(
          provider: requestARideCubit,
          markers: {
            Marker(
              icon: requestARideCubit.startPointIcon!,
              markerId: const MarkerId('startPoint'),
              position: LatLng(
                requestARideCubit.currentTrip!.driverData!.driverLocationLat,
                requestARideCubit.currentTrip!.driverData!.driverLocationLong,
              ),
            ),
            Marker(
              markerId: const MarkerId('destnaitionPoint'),
              position: LatLng(
                requestARideCubit.startPoint!.geometry.location.lat!,
                requestARideCubit.startPoint!.geometry.location.long!,
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
          top: 0,
          left: 0,
          right: 0,
          bottom: 800.h,
          child: AppBar(
            centerTitle: true,
            title: const Text(
              'Driver On The Way',
              style: AppFonts.medel_28,
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          top: 590.h,
          child: TripDetailsSection(
            driverName: requestARideCubit.currentTrip!.driverData!.driverName,
            buttonOnPressed: () {
              requestARideCubit
                  .cancelTrip(
                      requestARideCubit.currentTrip!.riderData!.riderPhone)
                  .then((_) {
                getIt.resetLazySingleton<RequestARideCubit>();

                GoRouter.of(context).pushReplacement(ViewsName.homeView);
              });
            },
            destinationName: requestARideCubit.destinationPoint!.shortName,
            fullDistance: requestARideCubit.totalDistance,
            startLocationName: requestARideCubit.startPoint!.shortName,
            tripCoast: 30,
          ),
        ),
      ],
    );
  }
}
