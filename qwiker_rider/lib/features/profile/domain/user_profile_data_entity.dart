import 'package:qwiker_rider/features/profile/data/user_model/user_model.dart';

class UserProfileDataEntity {
  final String userId;
  final String userName;
  String? extraPhoneNumber;

  UserProfileDataEntity({
    required this.userId,
    required this.userName,
    this.extraPhoneNumber,
  });
  //todo image url
}
