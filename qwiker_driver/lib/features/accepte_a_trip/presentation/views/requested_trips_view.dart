import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:qwiker_driver/core/routing/views_name.dart';
import 'package:qwiker_driver/core/theaming/app_fonts.dart';
import 'package:qwiker_driver/features/accepte_a_trip/presentation/manager/accepte_a_trip/accepte_a_trip_cubit.dart';
import 'package:qwiker_driver/features/accepte_a_trip/presentation/manager/find_trips_cubit/find_trips_cubit.dart';
import 'package:qwiker_driver/features/accepte_a_trip/presentation/widgets/requested_trips_view_body.dart';
import 'package:qwiker_driver/features/home/presentation/widgets/custom_app_bar.dart';

class RequestedTripsView extends StatelessWidget {
  const RequestedTripsView({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<AccepteATripCubit>(context).getCurrentDriverPosition();
    return BlocProvider(
      create: (BuildContext context) =>
          FindTripsCubit(FindTripsInitial())..listenForNewTrips(),
      child: Scaffold(
        body: Column(
          children: [
            const CustomAppBar(),
            BlocConsumer<FindTripsCubit, FindTripsState>(
                listener: (context, state) {
              if (state is TripAccepted) {
                GoRouter.of(context).push(ViewsName.currentTrip);
              }
            }, builder: (context, state) {
              var findTripsCubit = BlocProvider.of<FindTripsCubit>(context);
              if (state is FindTripsNewTripsAdded) {
                return Expanded(
                    child: RequestedTripsViewBody(
                  trips: state.trips,
                  findTripsCubit: findTripsCubit,
                ));
              } else if (state is FindTripsFalure) {
                return Center(child: Text('Error: ${state.message}'));
              } else {
                return Expanded(
                  child: Column(
                    children: [
                      Gap(100.h),
                      Text(
                        'Waite for a new requests',
                        style: AppFonts.poppinsMedium_18,
                      ),
                      Image.asset(
                        'assets/images/waiting_requests.png',
                      )
                    ],
                  ),
                );
              }
            }),
          ],
        ),
      ),
    );
  }
}
