import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:qwiker_driver/core/networking/api_service.dart';
import 'package:qwiker_driver/features/accepte_a_trip/data/data_sources/remote_data_source.dart';
import 'package:qwiker_driver/features/accepte_a_trip/data/repos_imple/accepte_a_trip_repos_imple.dart';
import 'package:qwiker_driver/features/accepte_a_trip/presentation/manager/accepte_a_trip/accepte_a_trip_cubit.dart';
import 'package:qwiker_driver/features/auth/data/auth_repo_imple.dart';
import 'package:qwiker_driver/features/auth/data/data_sources/remote_data_source.dart';
import 'package:qwiker_driver/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:qwiker_driver/features/profile/data/data_sources/remote_data_source.dart';
import 'package:qwiker_driver/features/profile/data/user_repo_imple.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Login

  // profile data
  getIt.registerLazySingleton<UserRepoImple>(
      () => UserRepoImple(remoteUsersData: RemoteUsersData()));

  getIt.registerLazySingleton<AuthRepoImple>(
      () => AuthRepoImple(authUsersData: AuthUsersData()));

  getIt.registerLazySingleton(
      () => AuthCubit(authRepoImple: getIt<AuthRepoImple>()));

  getIt.registerLazySingleton(() => ApiService(dio: Dio()));
  // accept a ride
  getIt.registerLazySingleton(() => AccepteAtripReposImple(
      accepteAtripRemoteDataSource: AccepteAtripRemoteDataSource()));

  getIt.registerLazySingleton(() => AccepteATripCubit(
      accepteAtripReposImple: getIt<AccepteAtripReposImple>()));
}
