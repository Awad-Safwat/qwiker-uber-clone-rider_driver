import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:qwiker_rider/features/auth/presentation/view/widgets/custom_pinput.dart';

import '../../../../../core/theaming/app_colors.dart';
import '../../../../../core/theaming/app_fonts.dart';
import '../../../../../core/widgets/custom_back_button.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../manager/auth_cubit/auth_cubit.dart';
import 'dont_or_have_account_secction.dart';

class PinCodeInputViewBody extends StatelessWidget {
  const PinCodeInputViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      child: Column(
        children: [
          Gap(20.h),
          const CustomBackButton(),
          Gap(110.h),
          Text(
            'Enter verification code',
            style: AppFonts.poppinsMedium_20,
          ),
          Gap(10.h),
          RichText(
            text: TextSpan(
              text: 'A code has been sent to',
              style: AppFonts.poppinsRegularGray_14
                  .copyWith(color: AppColors.mediumGray),
              children: ([
                TextSpan(
                    text:
                        '+2 ${BlocProvider.of<AuthCubit>(context).phoneNumber}',
                    style: AppFonts.poppinsBoldGray_14
                        .copyWith(color: AppColors.mediumGray)),
              ]),
            ),
          ),
          Gap(50.h),
          const CustomPinput(),
          Gap(30.h),
          DontORHaveAccountSecction(
            text: 'Don\'t receive a code?',
            textStyle: AppFonts.poppinsRegularBlack_16,
            textButtonTitle: 'Resend',
            textButtonTitleStyle: AppFonts.poppinsBoldBlue_16,
          ),
          Gap(150.h),
          CustomButton(
            onPressed: () {
              BlocProvider.of<AuthCubit>(context)
                  .submitOTP(BlocProvider.of<AuthCubit>(context).userPinCode!);
            },
            title: 'Verify Now',
          ),
        ],
      ),
    );
  }
}
