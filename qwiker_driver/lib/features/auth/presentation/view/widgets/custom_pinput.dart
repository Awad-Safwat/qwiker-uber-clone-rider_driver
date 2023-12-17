import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:pinput/pinput.dart';
import 'package:qwiker_driver/core/theaming/app_colors.dart';
import 'package:qwiker_driver/core/theaming/app_fonts.dart';
import 'package:qwiker_driver/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';

class CustomPinput extends StatefulWidget {
  const CustomPinput({super.key});

  @override
  State<CustomPinput> createState() => _CustomPinputState();
}

class _CustomPinputState extends State<CustomPinput> {
  final controller = TextEditingController();
  final focusNode = FocusNode();

  @override
  void dispose() {
    controller.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 50.w,
      height: 50.h,
      textStyle: AppFonts.poppinsMedium_26,
      decoration: BoxDecoration(
        color: AppColors.whaite,
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(color: AppColors.liteGray),
      ),
    );

    final cursor = Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: 21,
        height: 1,
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(137, 146, 160, 1),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );

    return Pinput(
      length: 6,
      controller: controller,
      focusNode: focusNode,
      autofocus: true,
      defaultPinTheme: defaultPinTheme,
      separatorBuilder: (index) => Gap(8.w),
      focusedPinTheme: defaultPinTheme.copyWith(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.r),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.05999999865889549),
              offset: Offset(0, 3),
              blurRadius: 16,
            ),
          ],
          border: Border.all(color: AppColors.mainBlue),
        ),
      ),
      // onClipboardFound: (value) {
      //   debugPrint('onClipboardFound: $value');
      //   controller.setText(value);
      // },
      showCursor: true,
      cursor: cursor,
      onCompleted: (pinCode) {
        print(pinCode);
        BlocProvider.of<AuthCubit>(context).userPinCode = pinCode;
      },
    );
  }
}
