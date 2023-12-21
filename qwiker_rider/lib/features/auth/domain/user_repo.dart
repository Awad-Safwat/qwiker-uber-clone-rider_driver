import 'package:qwiker_rider/features/profile/data/user_model/user_model.dart';

abstract class UserRepo {
  void addNewUser(UserModel user);
  Future<UserModel> getUserData(String userId);
  Future<bool> checkUserExistans(String userId);
}
