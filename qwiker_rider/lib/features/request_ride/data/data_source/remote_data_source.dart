import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:qwiker_rider/core/networking/api_service.dart';
import 'package:qwiker_rider/core/theaming/app_strings.dart';
import 'package:qwiker_rider/features/request_ride/data/models/place_model.dart';
import 'package:qwiker_rider/features/request_ride/data/models/review_model.dart';
import 'package:qwiker_rider/features/request_ride/data/models/trip_model.dart';
import 'package:qwiker_rider/features/request_ride/presentation/utiles.dart';

class RequestRideRemoteDataSource {
  final ApiService _apiService;

  RequestRideRemoteDataSource({required apiService}) : _apiService = apiService;

  final CollectionReference<Map<String, dynamic>>
      _firestoreRequestedTripsCollection =
      FirebaseFirestore.instance.collection('requestedTrips');
  final CollectionReference<Map<String, dynamic>> _firestoreRidersCollection =
      FirebaseFirestore.instance.collection('riders');
  final CollectionReference<Map<String, dynamic>> _firestoreonGoingCollection =
      FirebaseFirestore.instance.collection('onGoingTrips');
  final CollectionReference<Map<String, dynamic>> _firestoreDriversCollection =
      FirebaseFirestore.instance.collection('drivers');

  Future<List<PlaceModel>> searchForPlace(String? searchText) async {
    String apiKey = AppStrings.apiKey;
    String urlEndPoint =
        'place/textsearch/json?query=$searchText&radius=50000&key=$apiKey';
    Map<String, dynamic> result = await _apiService.get(endPoint: urlEndPoint);
    print(result);
    List<PlaceModel> placesFounded = extractingPlacesToList(result["results"]);

    return placesFounded;
  }

  Future<void> bookATrip(TripModel trip) async {
    final docRef = _firestoreRequestedTripsCollection
        .withConverter(
          fromFirestore: TripModel.fromFirestore,
          toFirestore: (TripModel user, options) => user.toFirestore(),
        )
        .doc(
          trip.riderData!.riderPhone,
        );
    await docRef.set(trip);
  }

  Future<void> cancelTrip(String riderPhone) async {
    final docRef = _firestoreonGoingCollection.doc(riderPhone);
    await docRef.update({'tripStates': 'canceld'}).then((_) => docRef.delete());
  }

  Future<void> addTripToHistory(TripModel trip) async {
    final docRef = _firestoreRidersCollection
        .withConverter(
          fromFirestore: TripModel.fromFirestore,
          toFirestore: (TripModel trip, options) => trip.toFirestore(),
        )
        .doc(
          trip.riderData!.riderPhone,
        );
    await rateDriver(trip.tripReview!, trip.driverData!.driverPhoneNumber);
    await docRef.update({
      'history': FieldValue.arrayUnion([trip.toFirestore()])
    });
  }

  Future<void> rateDriver(ReviewModel tripReview, String driverPhone) async {
    final docRef = _firestoreDriversCollection.doc(driverPhone);
    await docRef.update({
      'reviews': FieldValue.arrayUnion([tripReview.toJson()])
    });
  }
}
