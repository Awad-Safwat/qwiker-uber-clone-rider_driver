import 'package:flutter/material.dart';

import '../../../../../core/theaming/app_fonts.dart';

class DontORHaveAccountSecction extends StatelessWidget {
  const DontORHaveAccountSecction({
    super.key,
    required this.text,
    required this.textStyle,
    this.onPressed,
    required this.textButtonTitle,
    required this.textButtonTitleStyle,
  });
  final String text;
  final TextStyle textStyle;
  final void Function()? onPressed;
  final String textButtonTitle;
  final TextStyle textButtonTitleStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: textStyle,
        ),
        TextButton(
            onPressed: onPressed,
            child: Text(
              textButtonTitle,
              style: textButtonTitleStyle,
            ))
      ],
    );
  }
}
