import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:qwiker_rider/features/request_ride/data/models/trip_model.dart';

class HistoryDataSource {
  final CollectionReference<Map<String, dynamic>> _firestoreRidersCollection =
      FirebaseFirestore.instance.collection('riders');

  Future<List<TripModel>> getHistory(String phoneNumber) async {
    List<TripModel> trips = [];
    final docRef = _firestoreRidersCollection.doc(phoneNumber);
    await docRef.get().then((userData) {
      List<dynamic> historyList = userData.data()!['history'] ?? [];
      print(userData.data());
      for (int i = 0; i < historyList.length; i++) {
        trips.add(TripModel.fromJson(historyList[i]));
      }
    });
    return trips;
  }
}
