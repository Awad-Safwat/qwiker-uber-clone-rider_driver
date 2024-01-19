import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:qwiker_rider/features/profile/data/user_model/rider_model.dart';
import 'package:qwiker_rider/features/request_ride/data/models/driver_model.dart';
import 'package:qwiker_rider/features/request_ride/data/models/place_model.dart';

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
      startPointdata: trip['startPointdata'],
      endPointdata: trip['endPointdata'],
      riderData: trip['riderData'],
      driverData: trip['driverData'],
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
