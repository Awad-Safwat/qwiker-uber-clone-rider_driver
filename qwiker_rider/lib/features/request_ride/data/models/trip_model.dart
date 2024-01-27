import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:qwiker_rider/features/profile/data/user_model/rider_model.dart';
import 'package:qwiker_rider/features/request_ride/data/models/driver_model.dart';
import 'package:qwiker_rider/features/request_ride/data/models/place_model.dart';
import 'package:qwiker_rider/features/request_ride/data/models/review_model.dart';

class TripModel {
  PlaceModel startPointdata;
  PlaceModel endPointdata;
  RiderModel? riderData;
  //will need driverData
  DriverModel? driverData;
  final double? tripTotalDestance;
  String? tripStates;
  int? tripCoast;
  ReviewModel? tripReview;

  TripModel({
    required this.startPointdata,
    required this.endPointdata,
    required this.riderData,
    this.driverData,
    required this.tripTotalDestance,
    this.tripStates,
    this.tripCoast,
    this.tripReview,
  });

  factory TripModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final trip = snapshot.data()!;
    return TripModel(
      startPointdata: PlaceModel.fromJson(trip['startPointdata']),
      endPointdata: PlaceModel.fromJson(trip['endPointdata']),
      riderData: RiderModel.fromJson(snapshot, null),
      driverData: DriverModel.fromFirestore(snapshot, options),
      tripTotalDestance: trip['tripTotalDestance'],
      tripStates: trip['tripStates'],
      tripCoast: trip['tripCoast'],
      tripReview: ReviewModel.fromJson(trip['tripReview']),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'driverData': driverData?.toFirestore(),
      'riderData': riderData?.toFirestore(),
      'startPointdata': startPointdata.toJson(),
      'endPointdata': endPointdata.toJson(),
      'tripTotalDestance': tripTotalDestance,
      'tripStates': tripStates,
      'tripCoast': tripCoast,
      'tripReview': tripReview?.toJson(),
    };
  }
}
