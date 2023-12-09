import 'package:go_router/go_router.dart';
import 'package:qwiker_rider/core/global_functions.dart';
import 'package:qwiker_rider/core/routing/views_name.dart';
import 'package:qwiker_rider/features/auth/presentation/view/login_view.dart';
import 'package:qwiker_rider/features/auth/presentation/view/signup_view.dart';
import 'package:qwiker_rider/features/onpoarding/view/onpoarding_view.dart';

class AppRouter {
  final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        if (isFirstTime ?? false) {
          return const OnBoardingView();
        } else {
          return const LogInView();
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
  ]);
}
