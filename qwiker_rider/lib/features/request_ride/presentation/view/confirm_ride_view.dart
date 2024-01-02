import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qwiker_rider/core/di/dependency_injection.dart';
import 'package:qwiker_rider/features/request_ride/presentation/manager/confirm_a_ride_cubit/confirm_ride_cubit.dart';
import 'package:qwiker_rider/features/request_ride/presentation/manager/request_a_ride_cubit/request_a_ride_cubit.dart';
import 'package:qwiker_rider/features/request_ride/presentation/widgets/confirm_ride_view_body.dart';

class ConfirmRideView extends StatelessWidget {
  const ConfirmRideView({super.key});

  @override
  Widget build(BuildContext context) {
    late var provider = BlocProvider.of<RequestARideCubit>(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ConfirmRideCubit()),
        BlocProvider.value(
          value: getIt<RequestARideCubit>()
            ..getPolyPoints(
              startLat: provider.startPoint!.geometry.location.lat!,
              startLong: provider.startPoint!.geometry.location.long!,
              destinationLat: provider.destinationPoint!.geometry.location.lat!,
              destinationLong:
                  provider.destinationPoint!.geometry.location.long!,
            ),
        ),
      ],
      child: const Scaffold(
        body: ConfirmRideViewBody(),
      ),
    );
  }
}
