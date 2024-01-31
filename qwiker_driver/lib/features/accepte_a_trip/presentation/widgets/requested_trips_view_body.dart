import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:qwiker_driver/features/accepte_a_trip/data/models/trip_model.dart';
import 'package:qwiker_driver/features/accepte_a_trip/presentation/manager/find_trips_cubit/find_trips_cubit.dart';
import 'package:qwiker_driver/features/accepte_a_trip/presentation/widgets/trip_item.dart';

class RequestedTripsViewBody extends StatelessWidget {
  const RequestedTripsViewBody({
    required this.trips,
    super.key,
    required this.findTripsCubit,
  });
  final List<DocumentSnapshot<Map<String, dynamic>>?> trips;
  final FindTripsCubit findTripsCubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Gap(30),
        Expanded(
          child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: trips.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: TripItem(
                    findTripCubit: findTripsCubit,
                    trip: TripModel.fromFirestore(trips[index]!, null),
                  ),
                );
              }),
        ),
      ],
    );
  }
}
