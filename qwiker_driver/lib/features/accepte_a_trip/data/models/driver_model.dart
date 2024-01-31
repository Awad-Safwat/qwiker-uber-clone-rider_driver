import 'package:cloud_firestore/cloud_firestore.dart';

class DriverModel {
  final String driverPhoneNumber;
  double? driverLocationLat, driverLocationLong;
  final String driverName;
  String? email;

  DriverModel({
    this.driverLocationLat,
    this.driverLocationLong,
    required this.driverPhoneNumber,
    this.email,
    required this.driverName,
  });
  //TODO image url

  factory DriverModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final driver = snapshot.data()!['driverData'];
    return DriverModel(
      driverLocationLat: driver['driverLocationLat'] ?? '',
      driverLocationLong: driver['driverLocationLong'] ?? '',
      email: driver['email'] ?? '',
      driverPhoneNumber: driver['driverPhoneNumber'] ?? '',
      driverName: driver["driverName"] ?? '',
    );
  }
  factory DriverModel.fromJson(
    Map<String, dynamic> driver,
  ) {
    // final user = snapshot.data()!['driverData'];
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
