import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:qwiker_driver/core/routing/views_name.dart';
import 'package:qwiker_driver/features/auth/presentation/view/login_view.dart';
import 'package:qwiker_driver/features/auth/presentation/view/pin_code_input_view.dart';
import 'package:qwiker_driver/features/auth/presentation/view/signup_view.dart';
import 'package:qwiker_driver/features/onpoarding/view/onpoarding_view.dart';

import '../global_functions.dart';

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
        } else {
          return const SignUpView();
        }
      },
    ),
    GoRoute(
      path: ViewsName.logInView,
      builder: (context, state) => const LogInView(),
    ),
    GoRoute(
      path: ViewsName.signUpView,
      builder: (context, state) => const SignUpView(),
    ),
    GoRoute(
      path: ViewsName.pinCodeInputView,
      builder: (context, state) => const PinCodeInputView(),
    ),
  ]);
}
