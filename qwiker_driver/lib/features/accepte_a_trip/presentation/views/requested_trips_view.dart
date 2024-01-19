import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:qwiker_driver/core/di/dependency_injection.dart';
import 'package:qwiker_driver/features/accepte_a_trip/presentation/manager/accepte_a_trip/accepte_a_trip_cubit.dart';
import 'package:qwiker_driver/features/accepte_a_trip/presentation/widgets/requested_trips_view_body.dart';

class RequestedTripsView extends StatelessWidget {
  const RequestedTripsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AccepteATripCubit>(),
      child: Scaffold(
        body: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection("requestedTrips")
                .snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting ||
                  snapshot.data!.docs.isEmpty) {
                return Center(
                  child: Column(
                    children: [
                      const Text('Waite for a new requests'),
                      const Gap(20),
                      Image.asset(
                        'assets/images/waiting_requests.png',
                      )
                    ],
                  ),
                );
              }
              if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else {
                return RequestedTripsViewBody(trips: snapshot.data!.docs);
              }
            }),
      ),
    );
  }
}
