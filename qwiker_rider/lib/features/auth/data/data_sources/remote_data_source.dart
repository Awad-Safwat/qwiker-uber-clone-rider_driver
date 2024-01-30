import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:qwiker_rider/features/profile/data/user_model/rider_model.dart';

class AuthUsersData {
  final CollectionReference<Map<String, dynamic>> _firestoreUsersCollection =
      FirebaseFirestore.instance.collection('riders');

  Future<RiderModel?> getUserProfileData({required String riderPhone}) async {
    final rider = await _firestoreUsersCollection.doc(riderPhone).get();
    if (rider.exists) {
      return RiderModel.fromFirestore(rider, null);
    } else {
      return null;
    }
  }
}
