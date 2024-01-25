import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:qwiker_rider/core/global_functions.dart';
import 'package:qwiker_rider/core/routing/views_name.dart';
import 'package:qwiker_rider/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:qwiker_rider/core/di/dependency_injection.dart';
import 'package:qwiker_rider/features/auth/presentation/view/widgets/pin_code_input_view_body.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/widgets/custom_toast.dart';

class PinCodeInputView extends StatelessWidget {
  const PinCodeInputView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<AuthCubit>(),
      child: SafeArea(
        child: Scaffold(
          body: BlocListener<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is AuthSendingCode) {
                showProgressIndicator(context);
              } else if (state is AuthSuccess) {
                savePhoneLocal(
                    BlocProvider.of<AuthCubit>(context).phoneNumber!);

                BlocProvider.of<AuthCubit>(context).checkUserExistans(
                    BlocProvider.of<AuthCubit>(context).phoneNumber!);
              } else if (state is AuthFailer) {
                GoRouter.of(context).pop();
                showCustomToast(message: state.message).show(context);
              } else if (state is AuthUserNotExiste) {
                GoRouter.of(context)
                    .pushReplacement(ViewsName.completeProfileInfoView);
              } else if (state is AuthUserExiste) {
                GoRouter.of(context).pushReplacement(ViewsName.homeView);
              }
            },
            child: const PinCodeInputViewBody(),
          ),
        ),
      ),
    );
  }
}
