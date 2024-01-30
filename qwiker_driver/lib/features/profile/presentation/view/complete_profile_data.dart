import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:qwiker_driver/core/global_functions.dart';
import 'package:qwiker_driver/core/routing/views_name.dart';
import 'package:qwiker_driver/core/widgets/custom_toast.dart';
import 'package:qwiker_driver/features/profile/presentation/manager/user_data/user_data_cubit.dart';

import '../../../../core/di/dependency_injection.dart';
import '../../data/user_repo_imple.dart';
import '../widgets/complete_profile_data_view_body.dart';

class CompleteProfileDataView extends StatelessWidget {
  const CompleteProfileDataView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserDataCubit(getIt<UserRepoImple>()),
      child: Scaffold(
        body: BlocListener<UserDataCubit, UserDataState>(
            listener: (context, UserDataState state) {
              if (state is UserDataLoading) {
                showProgressIndicator(context);
              }
              if (state is UserDataAddedSuccess) {
                Navigator.pop(context);
                showCustomToast(message: 'User added successfully')
                    .show(context);
                GoRouter.of(context).pushReplacement(ViewsName.homeView);
              }
              if (state is UserDataFalure) {
                Navigator.pop(context);
                print(state.errorMessage);
                showCustomToast(message: state.errorMessage).show(context);
              }
            },
            child: const CompleteProfileDataViewBody()),
      ),
    );
  }
}
