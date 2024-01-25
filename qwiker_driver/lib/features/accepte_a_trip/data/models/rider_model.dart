import 'package:cloud_firestore/cloud_firestore.dart';

class RiderModel {
  // userId is the user phoneNumber which he signed in with

  final String riderPhone;

  final String riderName;
  final String? email;

  String? extraPhoneNumber;

  RiderModel({
    required this.riderPhone,
    required this.email,
    required this.riderName,
    this.extraPhoneNumber,
  });
  //todo image url

  factory RiderModel.fromFirestore(
    Map<String, dynamic> user,
    SnapshotOptions? options,
  ) {
    // final user = snapshot.data();
    return RiderModel(
      email: user['email'],
      riderPhone: user['riderPhone'],
      riderName: user["riderName"],
      extraPhoneNumber: user['extraPhoneNumber'],
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
