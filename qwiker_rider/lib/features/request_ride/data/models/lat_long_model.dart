class LatLongModel {
  double? lat;
  double? long;

  LatLongModel(this.lat, this.long);

  factory LatLongModel.fromJson(Map<String, dynamic> latLong) {
    return LatLongModel(latLong["lat"], latLong["lng"]);
  }
}
