import 'package:delightful_toast/delight_toast.dart';
import 'package:delightful_toast/toast/components/toast_card.dart';
import 'package:flutter/material.dart';
import 'package:qwiker_driver/core/theaming/app_fonts.dart';

DelightToastBar showCustomToast({
  required String message,
}) {
  return DelightToastBar(
    snackbarDuration: const Duration(milliseconds: 3000),
    autoDismiss: true,
    builder: (context) => ToastCard(
      leading: const Icon(
        Icons.flutter_dash,
        size: 28,
      ),
      title: Text(
        message,
        style: AppFonts.poppinsRegularGray_14,
      ),
    ),
  );
}
