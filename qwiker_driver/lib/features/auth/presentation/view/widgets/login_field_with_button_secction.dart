import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:qwiker_driver/core/theaming/app_colors.dart';
import 'package:qwiker_driver/core/widgets/custom_button.dart';
import 'package:qwiker_driver/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import '../../../../../core/theaming/app_fonts.dart';

class LoginTFieldWithButtonSecction extends StatelessWidget {
  const LoginTFieldWithButtonSecction({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var authCubit = BlocProvider.of<AuthCubit>(context);
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: authCubit.formKey,
      child: Column(
        children: [
          InternationalPhoneNumberInput(
            onInputChanged: (PhoneNumber number) {
              // print(number.phoneNumber);
              authCubit.number = number;
            },
            onInputValidated: (bool value) {
              authCubit.phoneNumber = authCubit.number.phoneNumber;
            },
            selectorConfig: const SelectorConfig(
              selectorType: PhoneInputSelectorType.DROPDOWN,
              useEmoji: true,
            ),
            ignoreBlank: false,
            spaceBetweenSelectorAndTextField: 5,
            autoValidateMode: AutovalidateMode.onUserInteraction,
            selectorTextStyle: const TextStyle(color: Colors.black),
            initialValue: authCubit.number,
            textFieldController: authCubit.controller,
            formatInput: true,
            keyboardType: const TextInputType.numberWithOptions(
                signed: true, decimal: true),
            inputBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(40.r))),
            onSaved: (PhoneNumber number) {
              authCubit.phoneNumber = number.phoneNumber;
            },
          ),
          Gap(30.h),
          CustomButton(
            onPressed: () {
              if (authCubit.formKey.currentState!.validate()) {
                authCubit.submitPhoneNumber(authCubit.phoneNumber!);
              }
            },
            title: 'Send Code',
            backgroundColor: AppColors.mainBlue,
            titleStyle:
                AppFonts.poppinsMedium_18.copyWith(color: AppColors.whaite),
          ),
        ],
      ),
    );
  }
}
