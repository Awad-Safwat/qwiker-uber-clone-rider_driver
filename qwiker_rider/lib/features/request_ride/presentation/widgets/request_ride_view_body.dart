import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:qwiker_rider/core/di/dependency_injection.dart';
import 'package:qwiker_rider/core/theaming/app_colors.dart';
import 'package:qwiker_rider/core/widgets/custom_progress_indicator.dart';
import 'package:qwiker_rider/core/widgets/custom_toast.dart';
import 'package:qwiker_rider/features/home/presentation/widgets/custom_app_bar.dart';
import 'package:qwiker_rider/features/request_ride/presentation/manager/request_a_ride_cubit/request_a_ride_cubit.dart';
import 'package:qwiker_rider/features/request_ride/presentation/widgets/buttom_location_menu.dart';
import 'package:qwiker_rider/features/request_ride/presentation/widgets/custom_map.dart';

class RequestARideViewBody extends StatelessWidget {
  const RequestARideViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = getIt<RequestARideCubit>();
    return Stack(
      children: [
        BlocConsumer<RequestARideCubit, RequestARideState>(
          listener: (context, state) {
            if (state is GetCurrentPositionFaluer) {
              print(state.message);
              showCustomToast(message: state.message).show(context);
            }
            if (state is GetCurrentPositionLoaded) {
              GoRouter.of(context).refresh();
            }
          },
          builder: (context, state) {
            if (state is GetCurrentPositionLoaded) {
              return CustomMap(
                provider: provider,
                cameraPositionLat: provider.riderCurrentPossitionLat,
                cameraPositionLong: provider.riderCurrentPossitionLong,
              );
            } else {
              return CustomMap(
                provider: provider,
                cameraPositionLat: provider.riderCurrentPossitionLat,
                cameraPositionLong: provider.riderCurrentPossitionLong,
              );
            }
          },
        ),
        // Container(
        //   child: Image.asset(
        //     "assets/images/map.png",
        //     fit: BoxFit.fill,
        //   ),
        // ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          bottom: 800.h,
          child: const CustomAppBar(),
        ),
        Positioned(
          top: 585.h,
          left: 355.w,
          right: 15.w,
          bottom: 250.h,
          child: FloatingActionButton(
            onPressed: () {
              provider.goToRiderCurrentLocation();
            },
            backgroundColor: AppColors.whaiteBlue,
            child: const Icon(
              Icons.my_location,
              size: 30,
              color: AppColors.mainBlue,
            ),
          ),
        ),
        const ButtomLocationMenu(),
      ],
    );
  }
}
