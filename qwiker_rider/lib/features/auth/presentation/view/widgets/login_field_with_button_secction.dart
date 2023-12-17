import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:qwiker_rider/core/theaming/app_colors.dart';
import 'package:qwiker_rider/core/widgets/custom_button.dart';
import 'package:qwiker_rider/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import '../../../../../core/theaming/app_fonts.dart';
import 'custom_text_form_field.dart';

class LoginTFieldWithButtonSecction extends StatefulWidget {
  const LoginTFieldWithButtonSecction({
    super.key,
  });

  @override
  State<LoginTFieldWithButtonSecction> createState() =>
      _LoginTFieldWithButtonSecctionState();
}

class _LoginTFieldWithButtonSecctionState
    extends State<LoginTFieldWithButtonSecction> {
  final TextEditingController _controller = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(
            textController: _controller,
            validator: (val) {
              if (val == null || val.isEmpty) {
                return 'Please enter A phone Number';
              } else if (val.length != 11) {
                return 'Phone Number need to be 11 numbers';
              } else {
                return null;
              }
            },
            onChanged: (val) {},
            onSave: (val) {},
            keyboardType: TextInputType.phone,
            fillColor: AppColors.whaite,
            hintText: 'phone Number',
            hintStyle: AppFonts.poppinsRegularGray_14,
            borderRadius: 50.r,
            enabledBorderColor: AppColors.liteGray,
            focusBorderColor: AppColors.mainBlue,
          ),
          Gap(30.h),
          CustomButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                BlocProvider.of<AuthCubit>(context).phoneNumber =
                    _controller.value.text;
                BlocProvider.of<AuthCubit>(context)
                    .submitPhoneNumber(_controller.value.text);
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
