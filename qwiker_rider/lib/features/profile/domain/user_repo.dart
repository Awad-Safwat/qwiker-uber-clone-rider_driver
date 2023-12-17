import 'package:qwiker_rider/features/profile/data/user_model/user_model.dart';
import 'package:qwiker_rider/features/profile/domain/user_entity.dart';

abstract class UserRepo {
  void addNewUser(UserModel user);
  Future<UserModel> getUserData(int userId);
}
