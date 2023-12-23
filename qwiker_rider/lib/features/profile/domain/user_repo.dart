import 'package:dartz/dartz.dart';
import 'package:qwiker_rider/core/exptions/error_handeler.dart';
import 'package:qwiker_rider/features/profile/data/user_model/user_model.dart';

abstract class UserRepo {
  Either<Falure, Future<void>> addNewUser(UserModel user);
  Either<Falure, Future<UserModel>> getUserProfileData(String userId);
  Either<Falure, Future<void>> updateUserProfileData(UserModel user);
}
