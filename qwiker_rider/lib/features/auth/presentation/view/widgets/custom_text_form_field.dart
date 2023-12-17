import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qwiker_rider/core/theaming/app_colors.dart';

import '../../../../../core/theaming/app_fonts.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.textController,
    required this.hintText,
    this.hintStyle,
    this.fillColor,
    this.validator,
    this.keyboardType,
    this.onChanged,
    this.onSave,
    this.borderRadius,
    this.enabledBorderColor,
    this.focusBorderColor,
  });

  final TextEditingController textController;
  final String hintText;
  final TextStyle? hintStyle;
  final Color? fillColor;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final void Function(String)? onChanged;
  final void Function(String?)? onSave;
  final double? borderRadius;
  final Color? enabledBorderColor;
  final Color? focusBorderColor;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      onChanged: onChanged,
      onSaved: onSave,
      controller: textController,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        fillColor: fillColor,
        filled: true,
        hintText: hintText,
        hintStyle: hintStyle,
        contentPadding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.r),
          borderSide:
              BorderSide(color: enabledBorderColor ?? AppColors.liteGray),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.r),
          borderSide: BorderSide(color: focusBorderColor ?? AppColors.mainBlue),
        ),
        focusColor: AppColors.gray,
        isDense: true,
      ),
    );
  }
}
