import 'package:dartz/dartz.dart';
import 'package:qwiker_driver/core/exptions/error_handeler.dart';
import 'package:qwiker_driver/features/accepte_a_trip/data/models/driver_model.dart';

abstract class AuthRepo {
  Either<Falure, Future<DriverModel?>> getUserProfileData(String userId);
}
