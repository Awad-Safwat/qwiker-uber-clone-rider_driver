import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:qwiker_rider/core/networking/api_service.dart';
import 'package:qwiker_rider/core/theaming/app_strings.dart';
import 'package:qwiker_rider/features/request_ride/data/models/place_model.dart';
import 'package:qwiker_rider/features/request_ride/data/models/trip_model.dart';
import 'package:qwiker_rider/features/request_ride/presentation/utiles.dart';

class RequestRideRemoteDataSource {
  final ApiService _apiService;

  RequestRideRemoteDataSource({required apiService}) : _apiService = apiService;

  final CollectionReference<Map<String, dynamic>> _firestoreUsersCollection =
      FirebaseFirestore.instance.collection('requestedTrips');

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
    final docRef = _firestoreUsersCollection
        .withConverter(
          fromFirestore: TripModel.fromFirestore,
          toFirestore: (TripModel user, options) => user.toFirestore(),
        )
        .doc(
          trip.riderData!.riderPhone,
        );
    await docRef.set(trip);
  }
}
