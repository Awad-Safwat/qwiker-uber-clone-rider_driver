import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:qwiker_driver/core/theaming/app_colors.dart';
import 'package:qwiker_driver/core/theaming/app_fonts.dart';
import 'package:qwiker_driver/features/accepte_a_trip/presentation/manager/accepte_a_trip/accepte_a_trip_cubit.dart';
import 'package:qwiker_driver/features/accepte_a_trip/presentation/widgets/custom_map.dart';
import 'package:qwiker_driver/features/accepte_a_trip/presentation/widgets/trip_on_going_bottom_section.dart';

class TripOnGoingView extends StatelessWidget {
  const TripOnGoingView({super.key});

  @override
  Widget build(BuildContext context) {
    var accepteATripCubit = BlocProvider.of<AccepteATripCubit>(context);
    return Stack(
      children: [
        CustomMap(
          accepteATripCubit: accepteATripCubit,
          markers: {
            Marker(
              icon: accepteATripCubit.startPointIcon!,
              markerId: const MarkerId('startPoint'),
              position: LatLng(
                accepteATripCubit
                    .acceptedTripe!.startPointdata.geometry.location.lat!,
                accepteATripCubit
                    .acceptedTripe!.startPointdata.geometry.location.long!,
              ),
            ),
            Marker(
              markerId: const MarkerId('destnaitionPoint'),
              position: LatLng(
                accepteATripCubit
                    .acceptedTripe!.endPointdata.geometry.location.lat!,
                accepteATripCubit
                    .acceptedTripe!.endPointdata.geometry.location.long!,
              ),
            ),
          },
          cameraPositionLat: accepteATripCubit
              .acceptedTripe!.startPointdata.geometry.location.lat!,
          cameraPositionLong: accepteATripCubit
              .acceptedTripe!.startPointdata.geometry.location.long!,
          polylines: {
            Polyline(
                polylineId: const PolylineId("route"),
                points: accepteATripCubit.polylineCoordinates,
                color: AppColors.mainBlue,
                width: 4),
          },
        ),
        Positioned(
          left: 0,
          right: 0,
          top: 0,
          bottom: 800.h,
          child: AppBar(
            centerTitle: true,
            title: const Text(
              'Trip is ongoing',
              style: AppFonts.medel_28,
            ),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          top: 680.h,
          child: const TripOnGoingBottomSection(),
        ),
      ],
    );
  }
}
