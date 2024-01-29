import 'package:dartz/dartz.dart';
import 'package:qwiker_rider/core/exptions/error_handeler.dart';
import 'package:qwiker_rider/features/auth/data/data_sources/remote_data_source.dart';
import 'package:qwiker_rider/features/auth/domain/auth_repo.dart';
import 'package:qwiker_rider/features/profile/data/user_model/rider_model.dart';

class AuthRepoImple extends AuthRepo {
  final AuthUsersData _authUsersData;

  AuthRepoImple({required AuthUsersData authUsersData})
      : _authUsersData = authUsersData;

  @override
  Either<Falure, Future<RiderModel?>> getUserProfileData(String userId) {
    try {
      return right(_authUsersData.getUserProfileData(riderPhone: userId));
    } catch (error) {
      return left(Falure(errorMessage: error.toString()));
    }
  }
}
