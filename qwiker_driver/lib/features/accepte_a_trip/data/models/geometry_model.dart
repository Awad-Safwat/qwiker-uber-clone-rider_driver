import 'package:qwiker_driver/features/accepte_a_trip/data/models/lat_long_model.dart';

class Geometry {
  LatLongModel location;

  Geometry(
    this.location,
  );

  factory Geometry.fromJson(Map<String, dynamic> geometry) {
    return Geometry(
      LatLongModel.fromJson(
        geometry["location"],
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "location": location.toJson(),
    };
  }
}
