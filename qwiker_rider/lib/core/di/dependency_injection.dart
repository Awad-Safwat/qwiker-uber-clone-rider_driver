import 'package:get_it/get_it.dart';
import 'package:qwiker_rider/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Login
  getIt.registerLazySingleton<AuthCubit>(() => AuthCubit(getIt()));
}
