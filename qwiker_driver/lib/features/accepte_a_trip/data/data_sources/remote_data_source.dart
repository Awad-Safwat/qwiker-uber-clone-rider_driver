import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:qwiker_driver/features/accepte_a_trip/data/models/trip_model.dart';

class AccepteAtripRemoteDataSource {
  final CollectionReference<Map<String, dynamic>>
      _firestoreRequestedTripsCollection =
      FirebaseFirestore.instance.collection('requestedTrips');
  final CollectionReference<Map<String, dynamic>>
      _firestoreOnGoingTripsCollection =
      FirebaseFirestore.instance.collection('onGoingTrips');
  final CollectionReference<Map<String, dynamic>> _firestoreridersCollection =
      FirebaseFirestore.instance.collection('riders');
  final CollectionReference<Map<String, dynamic>> _firestoreDriversCollection =
      FirebaseFirestore.instance.collection('drivers');

  // after accepting the trip will delet it from the requested collection
  Future<void> deleteTripFromRequested(String riderPhone) async {
    final docRef = _firestoreRequestedTripsCollection.doc(riderPhone);
    await docRef.delete();
  }

// after accepting the trip will add it to the OnGoingTrips collection
  Future<void> addTripToOnGoing(TripModel trip) async {
    final docRef = _firestoreOnGoingTripsCollection
        .withConverter(
          fromFirestore: TripModel.fromFirestore,
          toFirestore: (TripModel trip, options) => trip.toFirestore(),
        )
        .doc(
          trip.riderData!.riderPhone,
        );
    await docRef.set(trip);
  }

  // send Notification to the rider of the Trip

  Future<void> notifyTheRider(String riderPhone) async {
    await _firestoreridersCollection
        .doc(riderPhone)
        .collection('onGoingTrip')
        .doc('status')
        .set({'accepted': true});
  }
}
