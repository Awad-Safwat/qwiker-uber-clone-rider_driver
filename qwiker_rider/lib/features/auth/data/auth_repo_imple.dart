import 'package:dartz/dartz.dart';
import 'package:qwiker_rider/core/exptions/error_handeler.dart';
import 'package:qwiker_rider/features/auth/domain/auth_repo.dart';
import 'package:qwiker_rider/features/profile/data/data_sources/remote_data_source.dart';

class AuthRepoImple extends AuthRepo {
  final RemoteUsersData _remoteUsersData;

  AuthRepoImple({required RemoteUsersData remoteUsersData})
      : _remoteUsersData = remoteUsersData;

  @override
  Either<Falure, Future<bool>> checkUserExistans(String userId) {
    try {
      return right(_remoteUsersData.checkUserExistans(userId: userId));
    } catch (error) {
      return left(Falure(errorMessage: error.toString()));
    }
  }
}
