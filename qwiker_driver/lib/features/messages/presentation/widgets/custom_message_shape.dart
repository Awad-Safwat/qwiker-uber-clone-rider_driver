import 'package:flutter/material.dart';
import 'package:qwiker_driver/core/theaming/app_colors.dart';
import 'package:qwiker_driver/core/theaming/app_fonts.dart';
import 'package:qwiker_driver/features/messages/data/message_models.dart';

class SelfMessageShape extends StatelessWidget {
  const SelfMessageShape({
    super.key,
    required this.message,
  });

  final MessageModel message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.all(5),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          ),
          color: AppColors.mainBlue,
        ),
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Text(message.messageBody,
              style:
                  AppFonts.poppinsMedium_16.copyWith(color: AppColors.whaite)),
        ),
      ),
    );
  }
}

class PartnerMessageShape extends StatelessWidget {
  const PartnerMessageShape({
    super.key,
    required this.message,
  });

  final MessageModel? message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.all(5),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          color: AppColors.whaite,
        ),
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Text(message!.messageBody,
              style:
                  AppFonts.poppinsMedium_16.copyWith(color: AppColors.black)),
        ),
      ),
    );
  }
}
