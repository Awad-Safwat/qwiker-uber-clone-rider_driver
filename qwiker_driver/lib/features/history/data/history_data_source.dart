import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:qwiker_driver/features/accepte_a_trip/data/models/trip_model.dart';

class HistoryDataSource {
  final CollectionReference<Map<String, dynamic>> _firestoreDriversCollection =
      FirebaseFirestore.instance.collection('drivers');

  Future<List<TripModel>> getHistory(String phoneNumber) async {
    List<TripModel> trips = [];
    final docRef = _firestoreDriversCollection.doc(phoneNumber);
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
