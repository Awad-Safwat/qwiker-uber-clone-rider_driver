import 'package:qwiker_driver/features/accepte_a_trip/data/models/geometry_model.dart';

class PlaceModel {
  final String shortName;
  String? longName;
  final String placeId;
  final Geometry geometry;

  PlaceModel({
    required this.geometry,
    required this.shortName,
    required this.placeId,
    this.longName,
  });

  factory PlaceModel.fromJson(Map<String, dynamic> place) {
    return PlaceModel(
      shortName: place["name"],
      placeId: place["place_id"],
      longName: place["formatted_address"],
      geometry: Geometry.fromJson(place["geometry"]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "geometry": geometry.toJson(),
      "name": shortName,
      "place_id": placeId,
      "formatted_address": longName,
    };
  }
}
