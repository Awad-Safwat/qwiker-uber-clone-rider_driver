import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:qwiker_driver/core/di/dependency_injection.dart';
import 'package:qwiker_driver/core/global_functions.dart';
import 'package:qwiker_driver/core/routing/views_name.dart';
import 'package:qwiker_driver/features/accepte_a_trip/presentation/manager/accepte_a_trip/accepte_a_trip_cubit.dart';
import 'package:qwiker_driver/features/accepte_a_trip/presentation/views/current_trip_view.dart';
import 'package:qwiker_driver/features/auth/presentation/view/login_view.dart';
import 'package:qwiker_driver/features/auth/presentation/view/pin_code_input_view.dart';
import 'package:qwiker_driver/features/home/presentation/view/home_view.dart';
import 'package:qwiker_driver/features/onpoarding/view/onpoarding_view.dart';
import 'package:qwiker_driver/features/profile/presentation/view/complete_profile_data.dart';

class AppRouter {
  final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        if (isFirstTime ?? false) {
          return const OnBoardingView();
        } else if (FirebaseAuth.instance.currentUser == null) {
          return const LogInView();
        } else if (hasProfile ?? false) {
          return const HomeView();
        } else {
          return const CompleteProfileDataView();
        }
      },
    ),
    GoRoute(
      name: ViewsName.logInView,
      path: ViewsName.logInView,
      builder: (context, state) => const LogInView(),
    ),
    GoRoute(
      path: ViewsName.pinCodeInputView,
      builder: (context, state) => const PinCodeInputView(),
    ),
    GoRoute(
      name: ViewsName.homeView,
      path: ViewsName.homeView,
      builder: (context, state) => const HomeView(),
    ),
    GoRoute(
      name: ViewsName.completeProfileDataView,
      path: ViewsName.completeProfileDataView,
      builder: (context, state) => const CompleteProfileDataView(),
    ),
    GoRoute(
      path: ViewsName.currentTrip,
      builder: (context, state) => BlocProvider.value(
        value: getIt<AccepteATripCubit>(),
        child: const CurrentTripView(),
      ),
    ),
  ]);
}
