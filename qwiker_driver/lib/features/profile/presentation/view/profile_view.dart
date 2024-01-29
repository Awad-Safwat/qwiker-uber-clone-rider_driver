import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qwiker_driver/core/di/dependency_injection.dart';
import 'package:qwiker_driver/core/global_functions.dart';
import 'package:qwiker_driver/core/widgets/custom_toast.dart';
import 'package:qwiker_driver/features/profile/data/user_repo_imple.dart';
import 'package:qwiker_driver/features/profile/presentation/manager/user_data/user_data_cubit.dart';
import 'package:qwiker_driver/features/profile/presentation/widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserDataCubit(getIt<UserRepoImple>()),
      child: Scaffold(
        body: BlocListener<UserDataCubit, UserDataState>(
          listener: (context, state) {
            if (state is UserDataLoading) {
              showProgressIndicator(context);
            }
            if (state is UserDataAddedSuccess) {
              Navigator.pop(context);
              showCustomToast(message: 'Task Done successfully').show(context);
            }
            if (state is UserDataFalure) {
              Navigator.pop(context);
              print(state.errorMessage);
              showCustomToast(message: state.errorMessage).show(context);
            }
          },
          child: const ProfileViewBody(),
        ),
      ),
    );
  }
}
