import 'package:dartz/dartz.dart';
import 'package:qwiker_rider/core/exptions/error_handeler.dart';
import 'package:qwiker_rider/features/profile/data/user_model/rider_model.dart';

abstract class UserRepo {
  Either<Falure, Future<void>> addNewUser(RiderModel user);
  Either<Falure, Future<RiderModel>> getUserProfileData(String userId);
  Either<Falure, Future<void>> updateUserProfileData(RiderModel user);
}
