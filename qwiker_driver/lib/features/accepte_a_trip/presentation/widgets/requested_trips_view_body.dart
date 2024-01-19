import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:qwiker_driver/core/di/dependency_injection.dart';

import 'package:qwiker_driver/features/accepte_a_trip/data/models/trip_model.dart';
import 'package:qwiker_driver/features/accepte_a_trip/data/repos_imple/accepte_a_trip_repos_imple.dart';
import 'package:qwiker_driver/features/accepte_a_trip/presentation/manager/accepte_a_trip/accepte_a_trip_cubit.dart';
import 'package:qwiker_driver/features/accepte_a_trip/presentation/widgets/trip_item.dart';
import 'package:qwiker_driver/features/home/presentation/widgets/custom_app_bar.dart';

class RequestedTripsViewBody extends StatelessWidget {
  const RequestedTripsViewBody({
    required this.trips,
    super.key,
  });
  final List<QueryDocumentSnapshot<Object?>> trips;

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<AccepteATripCubit>(context).getCurrentDriverPosition();
    return Column(
      children: [
        const CustomAppBar(),
        const Gap(30),
        Expanded(
          child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: trips.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: TripItem(
                    trip: TripModel.fromFirestore(trips[index], null),
                  ),
                );
              }),
        ),
      ],
    );
  }
}
