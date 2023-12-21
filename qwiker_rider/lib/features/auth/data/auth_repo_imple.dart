import 'package:dartz/dartz.dart';
import 'package:qwiker_rider/core/exptions/error_handeler.dart';
import 'package:qwiker_rider/features/profile/data/data_sources/remote_data_source.dart';
import 'package:qwiker_rider/features/profile/data/user_model/user_model.dart';
import 'package:qwiker_rider/features/profile/domain/user_repo.dart';

class UserRepoImple extends UserRepo {
  final RemoteUsersData _remoteUsersData;

  UserRepoImple({required RemoteUsersData remoteUsersData})
      : _remoteUsersData = remoteUsersData;
  @override
  Future<Either<Falure, Future<void>>> addNewUser(UserModel user) async {
    try {
      return right(_remoteUsersData.addNewUser(user));
    } catch (error) {
      return left(
        Falure(
          errorMessage: error.toString(),
        ),
      );
    }
  }

  @override
  Future<UserModel> getUserData(String userId) {
    // TODO: implement getUserData
    throw UnimplementedError();
  }

  @override
  Either<Falure, Future<bool>> checkUserExistans(String userId) {
    try {
      return right(_remoteUsersData.checkUserExistans(userId: userId));
    } catch (error) {
      return left(Falure(errorMessage: error.toString()));
    }
  }
}
