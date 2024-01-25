import 'package:dartz/dartz.dart';
import 'package:qwiker_driver/core/exptions/error_handeler.dart';
import 'package:qwiker_driver/features/auth/data/data_sources/remote_data_source.dart';
import 'package:qwiker_driver/features/auth/domain/auth_repo.dart';

class AuthRepoImple extends AuthRepo {
  final AuthUsersData _authUsersData;

  AuthRepoImple({required AuthUsersData authUsersData})
      : _authUsersData = authUsersData;

  @override
  Either<Falure, Future<bool>> checkUserExistans(String userId) {
    try {
      return right(_authUsersData.checkUserExistans(userId: userId));
    } catch (error) {
      return left(Falure(errorMessage: error.toString()));
    }
  }
}
