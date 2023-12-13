import 'package:delightful_toast/delight_toast.dart';
import 'package:delightful_toast/toast/components/toast_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:qwiker_rider/core/routing/views_name.dart';
import 'package:qwiker_rider/core/theaming/app_colors.dart';
import 'package:qwiker_rider/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';

import 'package:qwiker_rider/features/auth/presentation/view/widgets/login_view_body.dart';

class LogInView extends StatelessWidget {
  const LogInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthCubit, AuthState>(
        listener: (BuildContext context, AuthState state) {
          if (state is AuthLoading) {
            showProgressIndicator(context);
          } else if (state is AuthCodeSent) {
            GoRouter.of(context).pop();
            GoRouter.of(context).push(ViewsName.pinCodeInputView);
          } else if (state is AuthSendingCodeFalier) {
            GoRouter.of(context).pop();
            DelightToastBar(
              snackbarDuration: const Duration(milliseconds: 3000),
              autoDismiss: true,
              builder: (context) => ToastCard(
                leading: const Icon(
                  Icons.flutter_dash,
                  size: 28,
                ),
                title: Text(
                  state.message,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
                ),
              ),
            ).show(context);
          }
        },
        child: const LogInViewBody(),
      ),
    );
  }
}

showProgressIndicator(BuildContext context) {
  AlertDialog alertDialog = const AlertDialog(
    backgroundColor: Colors.transparent,
    elevation: 0,
    content: Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(AppColors.mainBlue),
      ),
    ),
  );

  showDialog(
    barrierColor: Colors.white.withOpacity(0),
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return alertDialog;
    },
  );
}
