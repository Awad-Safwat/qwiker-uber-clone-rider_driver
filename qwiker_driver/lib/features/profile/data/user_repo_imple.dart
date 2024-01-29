import 'package:dartz/dartz.dart';
import 'package:qwiker_driver/core/exptions/error_handeler.dart';
import 'package:qwiker_driver/features/accepte_a_trip/data/models/driver_model.dart';
import 'package:qwiker_driver/features/profile/data/data_sources/remote_data_source.dart';
import 'package:qwiker_driver/features/profile/domain/user_repo.dart';

class UserRepoImple extends UserRepo {
  final RemoteUsersData _remoteUsersData;

  UserRepoImple({required RemoteUsersData remoteUsersData})
      : _remoteUsersData = remoteUsersData;
  @override
  Either<Falure, Future<void>> addNewUser(DriverModel user) {
    try {
      return right(_remoteUsersData.addNewDriver(user));
    } catch (error) {
      return left(
        Falure(
          errorMessage: error.toString(),
        ),
      );
    }
  }

  @override
  Either<Falure, Future<DriverModel>> getUserProfileData(String userId) {
    try {
      return right(_remoteUsersData.getDriverProfileData(userId));
    } catch (error) {
      return left(
        Falure(
          errorMessage: error.toString(),
        ),
      );
    }
  }

  @override
  Either<Falure, Future<void>> updateUserProfileData(DriverModel user) {
    try {
      return right(_remoteUsersData.updateDriverProfileData(user));
    } catch (error) {
      return left(
        Falure(
          errorMessage: error.toString(),
        ),
      );
    }
  }
}
