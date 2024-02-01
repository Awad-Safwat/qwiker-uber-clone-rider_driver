import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:qwiker_driver/features/accepte_a_trip/data/models/driver_model.dart';

class AuthUsersData {
  final CollectionReference<Map<String, dynamic>> _firestoreUsersCollection =
      FirebaseFirestore.instance.collection('drivers');

  Future<DriverModel?> getUserProfileData({required String riderPhone}) async {
    final rider = await _firestoreUsersCollection.doc(riderPhone).get();
    if (rider.exists) {
      return DriverModel.fromJson(rider.data()!);
    } else {
      return null;
    }
  }
}
