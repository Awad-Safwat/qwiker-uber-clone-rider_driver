import 'package:cloud_firestore/cloud_firestore.dart';

class RiderModel {
  // userId is the user phoneNumber which he signed in with

  final String riderPhone;

  final String riderName;
  final String email;

  String? extraPhoneNumber;

  RiderModel({
    required this.riderPhone,
    required this.email,
    required this.riderName,
    this.extraPhoneNumber,
  });
  //todo image url

  factory RiderModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final rider = snapshot.data()!;
    return RiderModel(
      email: rider['email'],
      riderPhone: rider['riderPhone'],
      riderName: rider["riderName"],
      extraPhoneNumber: rider['extraPhoneNumber'],
    );
  }

  factory RiderModel.fromJson(Map<String, dynamic> rider) {
    return RiderModel(
      email: rider['email'],
      riderPhone: rider['riderPhone'],
      riderName: rider["riderName"],
      extraPhoneNumber: rider['extraPhoneNumber'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'email': email,
      'riderPhone': riderPhone,
      'riderName': riderName,
      'extraPhoneNumber': extraPhoneNumber,
    };
  }
}
