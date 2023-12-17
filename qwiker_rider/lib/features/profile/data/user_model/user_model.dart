import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:qwiker_rider/features/profile/domain/user_entity.dart';

class UserModel {
  // userId is the user phoneNumber which he signed in with
  final String userId;
  final String userName;
  final String email;
  String? extraPhoneNumber;
  List<Map<String, dynamic>>? trips;

  UserModel(
      {required this.userId,
      required this.email,
      required this.userName,
      this.extraPhoneNumber,
      this.trips});
  //todo image url

  factory UserModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final user = snapshot.data();
    return UserModel(
      email: user!['email'],
      userId: user['userId'],
      userName: user["userName"],
      extraPhoneNumber: user['extraPhoneNumber'],
      trips: user['trips'],
    );
  }

  Map<String, dynamic> toFirestore(UserModel user) {
    return {
      'email': user.email,
      'userId': user.userId,
      'userName': user.userName,
      'extraPhoneNumber': user.extraPhoneNumber,
      'trips': user.trips,
    };
  }
}
