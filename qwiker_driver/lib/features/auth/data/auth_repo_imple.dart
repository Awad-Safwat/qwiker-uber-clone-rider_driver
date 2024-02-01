import 'package:dartz/dartz.dart';
import 'package:qwiker_driver/core/exptions/error_handeler.dart';
import 'package:qwiker_driver/features/accepte_a_trip/data/models/driver_model.dart';
import 'package:qwiker_driver/features/auth/data/data_sources/remote_data_source.dart';
import 'package:qwiker_driver/features/auth/domain/auth_repo.dart';

class AuthRepoImple extends AuthRepo {
  final AuthUsersData _authUsersData;

  AuthRepoImple({required AuthUsersData authUsersData})
      : _authUsersData = authUsersData;

  @override
  Either<Falure, Future<DriverModel?>> getUserProfileData(String userId) {
    try {
      return right(_authUsersData.getUserProfileData(riderPhone: userId));
    } catch (error) {
      return left(Falure(errorMessage: error.toString()));
    }
  }
}
