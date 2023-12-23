import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:qwiker_rider/features/profile/domain/user_profile_data_entity.dart';

class UserModel extends UserProfileDataEntity {
  // userId is the user phoneNumber which he signed in with
  @override
  final String userId;
  @override
  final String userName;
  final String email;
  @override
  String? extraPhoneNumber;

  UserModel({
    required this.userId,
    required this.email,
    required this.userName,
    this.extraPhoneNumber,
  }) : super(
          userId: userId,
          userName: userName,
          extraPhoneNumber: extraPhoneNumber,
        );
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
    );
  }

  Map<String, dynamic> toFirestore(UserModel user) {
    return {
      'email': user.email,
      'userId': user.userId,
      'userName': user.userName,
      'extraPhoneNumber': user.extraPhoneNumber,
    };
  }
}
