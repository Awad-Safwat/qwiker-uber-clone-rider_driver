import 'package:dartz/dartz.dart';
import 'package:qwiker_rider/core/exptions/error_handeler.dart';
import 'package:qwiker_rider/features/profile/data/data_sources/remote_data_source.dart';
import 'package:qwiker_rider/features/profile/data/user_model/rider_model.dart';
import 'package:qwiker_rider/features/profile/domain/user_repo.dart';

class UserRepoImple extends UserRepo {
  final RemoteUsersData _remoteUsersData;

  UserRepoImple({required RemoteUsersData remoteUsersData})
      : _remoteUsersData = remoteUsersData;
  @override
  Either<Falure, Future<void>> addNewUser(RiderModel user) {
    try {
      return right(_remoteUsersData.addNewRider(user));
    } catch (error) {
      return left(
        Falure(
          errorMessage: error.toString(),
        ),
      );
    }
  }

  @override
  Either<Falure, Future<RiderModel>> getUserProfileData(String userId) {
    try {
      return right(_remoteUsersData.getRiderProfileData(userId));
    } catch (error) {
      return left(
        Falure(
          errorMessage: error.toString(),
        ),
      );
    }
  }

  @override
  Either<Falure, Future<void>> updateUserProfileData(RiderModel user) {
    try {
      return right(_remoteUsersData.updateRiderProfileData(user));
    } catch (error) {
      return left(
        Falure(
          errorMessage: error.toString(),
        ),
      );
    }
  }
}
