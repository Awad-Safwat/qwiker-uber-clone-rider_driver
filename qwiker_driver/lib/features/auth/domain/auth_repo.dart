import 'package:dartz/dartz.dart';
import 'package:qwiker_driver/core/exptions/error_handeler.dart';

abstract class AuthRepo {
  Either<Falure, Future<bool>> checkUserExistans(String userId);
}
