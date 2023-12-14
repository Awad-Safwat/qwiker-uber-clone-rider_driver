import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:qwiker_driver/core/routing/views_name.dart';
import 'package:qwiker_driver/core/widgets/custom_toast.dart';
import 'package:qwiker_driver/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:qwiker_driver/features/auth/presentation/view/login_view.dart';

import 'package:qwiker_driver/features/auth/presentation/view/widgets/pin_code_input_view_body.dart';

class PinCodeInputView extends StatelessWidget {
  const PinCodeInputView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocListener<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthSendingCode) {
              showProgressIndicator(context);
            } else if (state is AuthSuccess) {
              GoRouter.of(context).pushReplacement(ViewsName.signUpView);
            } else if (state is AuthFailer) {
              GoRouter.of(context).pop();
              CustomToast(message: 'Pin Code not correct !!').show(context);
            }
          },
          child: const PinCodeInputViewBody(),
        ),
      ),
    );
  }
}
