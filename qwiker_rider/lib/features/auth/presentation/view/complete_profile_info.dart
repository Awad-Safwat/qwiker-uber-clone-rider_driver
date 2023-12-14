import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qwiker_rider/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';

import 'widgets/complete_profile_info_view_body.dart';

class CompleteProfileInfoView extends StatelessWidget {
  const CompleteProfileInfoView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CompleteProfileInforViewBody(),
    );
  }
}
