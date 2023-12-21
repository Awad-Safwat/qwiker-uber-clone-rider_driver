import 'package:dartz/dartz.dart';
import 'package:qwiker_rider/core/exptions/error_handeler.dart';
import 'package:qwiker_rider/features/profile/data/user_model/user_model.dart';

abstract class UserRepo {
  void addNewUser(UserModel user);
  Future<UserModel> getUserData(String userId);
  Either<Falure, Future<bool>> checkUserExistans(String userId);
}
