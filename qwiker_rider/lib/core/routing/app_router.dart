import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:qwiker_rider/core/global_functions.dart';
import 'package:qwiker_rider/core/routing/views_name.dart';
import 'package:qwiker_rider/features/home/presentation/view/home_view.dart';
import 'package:qwiker_rider/features/profile/presentation/view/complete_profile_data.dart';
import 'package:qwiker_rider/features/auth/presentation/view/login_view.dart';
import 'package:qwiker_rider/features/auth/presentation/view/pin_code_input_view.dart';
import 'package:qwiker_rider/features/onpoarding/view/onpoarding_view.dart';

class AppRouter {
  final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        // return const PinCodeInputView();
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
      path: ViewsName.logInView,
      builder: (context, state) => const LogInView(),
    ),
    GoRoute(
      path: ViewsName.completeProfileInfoView,
      builder: (context, state) => const CompleteProfileDataView(),
    ),
    GoRoute(
      path: ViewsName.pinCodeInputView,
      builder: (context, state) => const PinCodeInputView(),
    ),
    GoRoute(
      path: ViewsName.homeView,
      builder: (context, state) => const HomeView(),
    ),
  ]);
}
