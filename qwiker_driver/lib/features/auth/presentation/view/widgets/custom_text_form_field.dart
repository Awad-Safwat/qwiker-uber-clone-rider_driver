import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qwiker_driver/core/theaming/app_colors.dart';

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
    this.prefixIcon,
    this.autoFoucus,
  });

  final TextEditingController textController;
  final Icon? prefixIcon;
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
  final bool? autoFoucus;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      onChanged: onChanged,
      onFieldSubmitted: onSave,
      controller: textController,
      keyboardType: keyboardType,
      autofocus: autoFoucus ?? false,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        fillColor: fillColor ?? AppColors.whaite,
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
