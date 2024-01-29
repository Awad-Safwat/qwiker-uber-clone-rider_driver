import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:qwiker_driver/features/accepte_a_trip/data/models/trip_model.dart';
import 'package:qwiker_driver/features/accepte_a_trip/presentation/widgets/trip_item.dart';

class RequestedTripsViewBody extends StatelessWidget {
  const RequestedTripsViewBody({
    required this.trips,
    super.key,
    required this.findTripCubit,
  });
  final List<QueryDocumentSnapshot<Object?>> trips;
  final findTripCubit;

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
                    findTripCubit: findTripCubit,
                    trip: TripModel.fromFirestore(trips[index], null),
                  ),
                );
              }),
        ),
      ],
    );
  }
}
