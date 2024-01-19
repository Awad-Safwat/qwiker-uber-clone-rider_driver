import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:qwiker_driver/features/accepte_a_trip/data/models/driver_model.dart';
import 'package:qwiker_driver/features/accepte_a_trip/data/models/place_model.dart';
import 'package:qwiker_driver/features/accepte_a_trip/data/models/rider_model.dart';

class TripModel {
  PlaceModel startPointdata;
  PlaceModel endPointdata;
  RiderModel? riderData;
  //will need driverData
  DriverModel? driverData;
  final double? tripTotalDestance;

  TripModel({
    required this.startPointdata,
    required this.endPointdata,
    required this.riderData,
    this.driverData,
    required this.tripTotalDestance,
  });

  factory TripModel.fromFirestore(
    DocumentSnapshot<dynamic> snapshot,
    SnapshotOptions? options,
  ) {
    final trip = snapshot.data();
    return TripModel(
      startPointdata: PlaceModel.fromJson(trip['startPointdata']),
      endPointdata: PlaceModel.fromJson(trip['endPointdata']),
      riderData: RiderModel.fromFirestore(trip['riderData'], null),
      driverData: null,
      tripTotalDestance: trip['tripTotalDestance'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'driverData': driverData?.toFirestore(),
      'riderData': riderData?.toFirestore(),
      'startPointdata': startPointdata.toJson(),
      'endPointdata': endPointdata.toJson(),
      'tripTotalDestance': tripTotalDestance,
    };
  }
}
