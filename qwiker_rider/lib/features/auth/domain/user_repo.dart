import 'package:dartz/dartz.dart';
import 'package:qwiker_rider/core/exptions/error_handeler.dart';
import 'package:qwiker_rider/features/profile/data/user_model/user_model.dart';

abstract class AuthRepo {
  Either<Falure, Future<bool>> checkUserExistans(String userId);
}
