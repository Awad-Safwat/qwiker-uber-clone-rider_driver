import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:qwiker_rider/features/request_ride/data/models/trip_model.dart';
import 'package:qwiker_rider/features/request_ride/data/request_ride_repo_imple/request_ride_repo_imple.dart';

part 'confirm_ride_state.dart';

class ConfirmRideCubit extends Cubit<ConfirmRideState> {
  ConfirmRideCubit({required requestRideRepoImple})
      : _requestRideRepoImple = requestRideRepoImple,
        super(ConfirmRideInitial());

  final RequestRideRepoImple _requestRideRepoImple;

  void bookRide(TripModel trip) {
    var result = _requestRideRepoImple.bookATrip(trip);

    result.fold(
        (error) => print(error.errorMessage),
        (success) => {
              print('Booked A Trip Wait for Driver'),
              emit(ConfirmRideWaitingDriver()),
            });
  }

  void listnToDriver(String riderPhone) {
    CollectionReference<Map<String, dynamic>> firestoreUsersCollection =
        FirebaseFirestore.instance.collection('riders');
    firestoreUsersCollection
        .doc(riderPhone)
        .collection('onGoingTrip')
        .doc('status')
        .snapshots()
        .listen((event) {
      if (event.data() == null ||
          event.data()!.isEmpty ||
          event.data()!['accepted'] != true) {
      } else {
        emit(DriverAccebted());
      }
    });
  }
}
