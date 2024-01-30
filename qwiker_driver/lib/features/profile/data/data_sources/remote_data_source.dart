import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:qwiker_driver/core/global_functions.dart';
import 'package:qwiker_driver/features/accepte_a_trip/data/models/driver_model.dart';

class RemoteUsersData {
  final CollectionReference<Map<String, dynamic>> _firestoreDriversCollection =
      FirebaseFirestore.instance.collection('drivers');

  Future<void> addNewDriver(DriverModel driver) async {
    saveUserDataLocal(driver);
    final docRef = _firestoreDriversCollection.doc(
      driver.driverPhoneNumber,
    );
    await docRef.set(driver.toFirestore());
  }

  Future<DriverModel> getDriverProfileData(String driverPhone) async {
    final docRef = _firestoreDriversCollection.doc(
      driverPhone,
    );

    final docSnap = await docRef.get();
    final driverData = docSnap.data();
    return DriverModel.fromFirestore(driverData!, null);
  }

  Future<void> updateDriverProfileData(DriverModel driver) async {
    saveUserDataLocal(driver);
    final docRef = _firestoreDriversCollection.doc(
      getPhoneNumber(),
    );
    final updates = driver.toFirestore();
    await docRef.update(updates);
  }
}
