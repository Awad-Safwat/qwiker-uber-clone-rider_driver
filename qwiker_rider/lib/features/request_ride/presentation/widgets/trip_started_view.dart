import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:qwiker_rider/core/di/dependency_injection.dart';
import 'package:qwiker_rider/core/theaming/app_colors.dart';
import 'package:qwiker_rider/core/theaming/app_fonts.dart';
import 'package:qwiker_rider/features/request_ride/presentation/manager/request_a_ride_cubit/request_a_ride_cubit.dart';
import 'package:qwiker_rider/features/request_ride/presentation/widgets/custom_map.dart';
import 'package:qwiker_rider/features/request_ride/presentation/widgets/trip_on_going_bottom_section.dart';
import 'package:qwiker_rider/features/request_ride/presentation/widgets/trip_rating_widget.dart';

class TripIsStartedView extends StatelessWidget {
  const TripIsStartedView({super.key});

  @override
  Widget build(BuildContext context) {
    var requestARideCubit = getIt<RequestARideCubit>();
    return Stack(children: [
      CustomMap(
        provider: requestARideCubit,
        markers: {
          Marker(
            icon: requestARideCubit.startPointIcon!,
            markerId: const MarkerId('startPoint'),
            // TODO change position to be driver real time changes
            position: LatLng(
              requestARideCubit.startPoint!.geometry.location.lat!,
              requestARideCubit.startPoint!.geometry.location.long!,
            ),
          ),
          Marker(
            markerId: const MarkerId('destnaitionPoint'),
            position: LatLng(
              requestARideCubit.destinationPoint!.geometry.location.lat!,
              requestARideCubit.destinationPoint!.geometry.location.long!,
            ),
          ),
        },
        cameraPositionLat: requestARideCubit.startPoint!.geometry.location.lat,
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
            'Trip is Started',
            style: AppFonts.medel_28,
          ),
        ),
      ),
      BlocConsumer<RequestARideCubit, RequestARideState>(
        listener: (context, state) {
          if (state is OnDestination) {
            showDialog(
                context: context,
                builder: (context) => const TripRatingWidget());
          }
        },
        builder: (context, state) {
          return Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              top: 700.h,
              child: const TripOnGoingBottomSection());
        },
      ),
    ]);
  }
}
