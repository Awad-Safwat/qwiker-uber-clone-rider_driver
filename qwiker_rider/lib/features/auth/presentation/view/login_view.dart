import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:qwiker_rider/core/di/dependency_injection.dart';
import 'package:qwiker_rider/core/routing/views_name.dart';
import 'package:qwiker_rider/core/widgets/custom_toast.dart';
import 'package:qwiker_rider/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';

import 'package:qwiker_rider/features/auth/presentation/view/widgets/login_view_body.dart';

import '../../../../core/global_functions.dart';

class LogInView extends StatelessWidget {
  const LogInView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthCubit>(
      create: (context) => getIt<AuthCubit>(),
      child: Scaffold(
        body: BlocListener<AuthCubit, AuthState>(
          listener: (BuildContext context, AuthState state) {
            if (state is AuthLoading) {
              showProgressIndicator(context);
            } else if (state is AuthCodeSent) {
              GoRouter.of(context).pop();
              GoRouter.of(context).push(ViewsName.pinCodeInputView);
            } else if (state is AuthSendingCodeFalier) {
              GoRouter.of(context).pop();
              showCustomToast(message: state.message);
            }
          },
          child: const LogInViewBody(),
        ),
      ),
    );
  }
}
