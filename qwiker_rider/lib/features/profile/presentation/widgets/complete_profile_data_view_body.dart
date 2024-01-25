import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:qwiker_rider/core/global_functions.dart';
import 'package:qwiker_rider/features/profile/data/user_model/rider_model.dart';
import 'package:qwiker_rider/features/profile/presentation/manager/user_data/user_data_cubit.dart';
import 'package:qwiker_rider/features/profile/presentation/widgets/user_data_input_fields_complete.dart';

import '../../../../../core/theaming/app_fonts.dart';

class CompleteProfileDataViewBody extends StatelessWidget {
  const CompleteProfileDataViewBody({super.key});

  @override
  build(BuildContext context) {
    var provider = BlocProvider.of<UserDataCubit>(context);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Gap(80.h),
          Center(
            // the app logo with name
            child: Image.asset(
              'assets/images/splash-screen-icon.png',
              height: 60.h,
              width: 220.w,
            ),
          ),
          Gap(50.h),
          const Text(
            'Wellcome',
            style: AppFonts.medel_36,
          ),
          Gap(20.h),
          Text(
            'Please Complete your profile data',
            style: AppFonts.poppinsRegularBlack_16,
          ),
          Gap(50.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 35.w),
            child: UserDataInputFieldsCompleate(
              emailHint: 'Email (optional)',
              nameHint: 'Full Name (required)',
              phoneHint: '***********',
              extraPhoneHint: 'extra phone Number (optional)',
              buttonText: 'Save Data',
              buttonOnPressd: () async {
                provider.addNewUser(RiderModel(
                  riderPhone: await getPhoneNumber(),
                  riderName: provider.nameController.text,
                  extraPhoneNumber: provider.extraPhoneController.text,
                  email: provider.emailController.text,
                ));
              },
            ),
          ),
        ],
      ),
    );
  }
}
