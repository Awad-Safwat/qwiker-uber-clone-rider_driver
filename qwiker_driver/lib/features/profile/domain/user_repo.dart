import 'package:dartz/dartz.dart';
import 'package:qwiker_driver/core/exptions/error_handeler.dart';
import 'package:qwiker_driver/features/accepte_a_trip/data/models/driver_model.dart';

abstract class UserRepo {
  Either<Falure, Future<void>> addNewUser(DriverModel user);
  Either<Falure, Future<DriverModel>> getUserProfileData(String userId);
  Either<Falure, Future<void>> updateUserProfileData(DriverModel user);
}
