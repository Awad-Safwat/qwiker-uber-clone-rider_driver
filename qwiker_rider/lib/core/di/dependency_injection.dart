import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:qwiker_rider/core/networking/api_service.dart';
import 'package:qwiker_rider/features/auth/data/auth_repo_imple.dart';
import 'package:qwiker_rider/features/auth/data/data_sources/remote_data_source.dart';
import 'package:qwiker_rider/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:qwiker_rider/features/profile/data/data_sources/remote_data_source.dart';
import 'package:qwiker_rider/features/profile/data/user_repo_imple.dart';
import 'package:qwiker_rider/features/request_ride/data/data_source/remote_data_source.dart';
import 'package:qwiker_rider/features/request_ride/data/request_ride_repo_imple/request_ride_repo_imple.dart';
import 'package:qwiker_rider/features/request_ride/presentation/manager/request_a_ride_cubit/request_a_ride_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // profile data
  getIt.registerLazySingleton<UserRepoImple>(
      () => UserRepoImple(remoteUsersData: RemoteUsersData()));

  getIt.registerLazySingleton<AuthRepoImple>(
      () => AuthRepoImple(authUsersData: AuthUsersData()));

  getIt.registerLazySingleton(
      () => AuthCubit(authRepoImple: getIt<AuthRepoImple>()));

  // request a ride
  getIt.registerLazySingleton(() => ApiService(dio: Dio()));
  getIt.registerLazySingleton(
    () => RequestRideRepoImple(
        requestRideRemoteDataSource:
            RequestRideRemoteDataSource(apiService: getIt<ApiService>())),
  );

  getIt.registerLazySingleton(
    () =>
        RequestARideCubit(requestRideRepoImple: getIt<RequestRideRepoImple>()),
  );
  // getIt.registerLazySingleton(
  //   () => OnGoingTripCubit(requestRideRepoImple: getIt<RequestRideRepoImple>()),
  // );
}
