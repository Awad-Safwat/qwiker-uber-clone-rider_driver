import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:qwiker_driver/features/accepte_a_trip/data/models/trip_model.dart';

class AccepteAtripRemoteDataSource {
  final CollectionReference<Map<String, dynamic>>
      _firestoreRequestedTripsCollection =
      FirebaseFirestore.instance.collection('requestedTrips');
  final CollectionReference<Map<String, dynamic>>
      _firestoreOnGoingTripsCollection =
      FirebaseFirestore.instance.collection('onGoingTrips');
  final CollectionReference<Map<String, dynamic>> _firestoreDriversCollection =
      FirebaseFirestore.instance.collection('drivers');

  // after accepting the trip will delet it from the requested collection
  Future<void> deleteTripFromRequested(String riderPhone) async {
    final docRef = _firestoreRequestedTripsCollection.doc(riderPhone);
    await docRef.delete();
  }

  // after accepting the trip will delet it from the OnGoing collection
  Future<void> deleteTripFromOnGoing(String riderPhone) async {
    final docRef = _firestoreOnGoingTripsCollection.doc(riderPhone);
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

  Future<void> addTripToOnDriverHistory(TripModel trip) async {
    final docRef = _firestoreDriversCollection
        .withConverter(
          fromFirestore: TripModel.fromFirestore,
          toFirestore: (TripModel trip, options) => trip.toFirestore(),
        )
        .doc(
          trip.driverData!.driverPhoneNumber,
        );
    await docRef.update({
      'history': FieldValue.arrayUnion([trip.toFirestore()])
    });
  }
}
