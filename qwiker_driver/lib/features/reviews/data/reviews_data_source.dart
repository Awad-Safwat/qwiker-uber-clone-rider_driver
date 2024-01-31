import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:qwiker_driver/features/accepte_a_trip/data/models/review_model.dart';

class ReviewesDataSource {
  final CollectionReference<Map<String, dynamic>> _firestoreDriversCollection =
      FirebaseFirestore.instance.collection('drivers');

  Future<List<ReviewModel>> getReviewes(String phoneNumber) async {
    List<ReviewModel> trips = [];
    final docRef = _firestoreDriversCollection.doc(phoneNumber);
    await docRef.get().then((userData) {
      List<dynamic> reviewesList = userData.data()!['reviews'] ?? [];
      print(userData.data());
      for (int i = 0; i < reviewesList.length; i++) {
        trips.add(ReviewModel.fromJson(reviewesList[i]));
      }
    });
    return trips;
  }
}
