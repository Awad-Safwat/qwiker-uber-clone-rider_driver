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
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final user = snapshot.data()!['driverData'];
    return DriverModel(
      driverLocationLat: user['driverLocationLat'],
      driverLocationLong: user['driverLocationLong'],
      email: user['email'],
      driverPhoneNumber: user['driverPhoneNumber'],
      driverName: user["driverName"],
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
