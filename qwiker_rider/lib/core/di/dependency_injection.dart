import 'package:get_it/get_it.dart';
import 'package:qwiker_rider/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:qwiker_rider/features/profile/data/data_sources/remote_data_source.dart';
import 'package:qwiker_rider/features/profile/data/user_repo_imple.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Login

  // profile data
  getIt.registerLazySingleton<UserRepoImple>(
      () => UserRepoImple(remoteUsersData: RemoteUsersData()));

  getIt.registerLazySingleton(() => AuthCubit());
}
