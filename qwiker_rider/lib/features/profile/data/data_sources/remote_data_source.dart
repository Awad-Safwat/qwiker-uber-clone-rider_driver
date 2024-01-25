import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:qwiker_rider/features/profile/data/user_model/rider_model.dart';

class RemoteUsersData {
  final CollectionReference<Map<String, dynamic>> _firestoreRidersCollection =
      FirebaseFirestore.instance.collection('riders');

  Future<void> addNewRider(RiderModel rider) async {
    final docRef = _firestoreRidersCollection
        .withConverter(
          fromFirestore: RiderModel.fromFirestore,
          toFirestore: (RiderModel rider, options) => rider.toFirestore(),
        )
        .doc(
          rider.riderPhone,
        );
    await docRef.set(rider);
  }

  Future<RiderModel> getRiderProfileData(String riderPhone) async {
    final docRef = _firestoreRidersCollection
        .withConverter(
          fromFirestore: RiderModel.fromFirestore,
          toFirestore: (RiderModel rider, options) => rider.toFirestore(),
        )
        .doc(
          riderPhone,
        );

    final docSnap = await docRef.get();
    final riderData = docSnap.data();
    return riderData!;
  }

  Future<void> updateRiderProfileData(RiderModel rider) async {
    final docRef = _firestoreRidersCollection
        .withConverter(
          fromFirestore: RiderModel.fromFirestore,
          toFirestore: (RiderModel rider, options) => rider.toFirestore(),
        )
        .doc(
          rider.riderPhone,
        );
    final updates = rider.toFirestore();
    await docRef.update(updates);
  }
}
