//create new camera position
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:qwiker_driver/features/accepte_a_trip/data/models/place_model.dart';

CameraPosition createCameraPosition({double? late, double? longe}) {
  return CameraPosition(
    target: LatLng(
      late ?? 35.3455,
      longe ?? -45.5,
    ),
    zoom: 18,
  );
}

// func to extract places from json response to a list
List<PlaceModel> extractingPlacesToList(List<dynamic> response) {
  List<PlaceModel> extractedPlacesList = [];
  for (Map<String, dynamic> element in response) {
    extractedPlacesList.add(PlaceModel.fromJson(element));
  }

  return extractedPlacesList;
}
