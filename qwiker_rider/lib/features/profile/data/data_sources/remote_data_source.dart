import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:qwiker_rider/features/profile/data/user_model/rider_model.dart';

class RemoteUsersData {
  final CollectionReference<Map<String, dynamic>> _firestoreUsersCollection =
      FirebaseFirestore.instance.collection('riders');

  Future<void> addNewUser(RiderModel user) async {
    final docRef = _firestoreUsersCollection
        .withConverter(
          fromFirestore: RiderModel.fromFirestore,
          toFirestore: (RiderModel user, options) => user.toFirestore(),
        )
        .doc(
          user.riderPhone,
        );
    await docRef.set(user);
  }

  Future<RiderModel> getUserProfileData(String userId) async {
    final docRef = _firestoreUsersCollection
        .withConverter(
          fromFirestore: RiderModel.fromFirestore,
          toFirestore: (RiderModel user, options) => user.toFirestore(),
        )
        .doc(
          userId,
        );

    final docSnap = await docRef.get();
    final userData = docSnap.data();
    return userData!;
  }

  Future<void> updateUserProfileData(RiderModel user) async {
    final docRef = _firestoreUsersCollection
        .withConverter(
          fromFirestore: RiderModel.fromFirestore,
          toFirestore: (RiderModel user, options) => user.toFirestore(),
        )
        .doc(
          user.riderPhone,
        );
    final updates = user.toFirestore();
    await docRef.update(updates);
  }
}
