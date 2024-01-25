import 'package:cloud_firestore/cloud_firestore.dart';

class DriverModel {
  final String driverPhoneNumber;
  final double driverLocationLat, driverLocationLong;
  final String driverName;
  String? email;

  DriverModel({
    required this.driverLocationLat,
    required this.driverLocationLong,
    required this.driverPhoneNumber,
    this.email,
    required this.driverName,
  });
  //TODO image url

  factory DriverModel.fromFirestore(
    Map<String, dynamic> driver,
    SnapshotOptions? options,
  ) {
    // final user = snapshot.data();
    return DriverModel(
      driverLocationLat: driver['driverLocationLat'],
      driverLocationLong: driver['driverLocationLong'],
      email: driver['email'],
      driverPhoneNumber: driver['driverPhoneNumber'],
      driverName: driver["driverName"],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'email': email,
      'driverPhoneNumber': driverPhoneNumber,
      'driverName': driverName,
      'driverLocationLat': driverLocationLat,
      'driverLocationLong': driverLocationLong,
    };
  }
}
