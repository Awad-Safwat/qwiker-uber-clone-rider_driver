import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppFonts {
  static const TextStyle medel_36 = TextStyle(
    fontSize: 36,
    fontFamily: 'Medel',
    fontWeight: FontWeight.normal,
  );
  static const TextStyle medel_28 = TextStyle(
    fontSize: 28,
    fontFamily: 'Medel',
    fontWeight: FontWeight.normal,
  );

  static TextStyle poppinsMedium_20 = GoogleFonts.poppins(
    fontSize: 20,
    fontWeight: FontWeight.w500,
  );
  static TextStyle poppinsMedium_26 = GoogleFonts.poppins(
    fontSize: 26,
    fontWeight: FontWeight.w500,
  );
  static TextStyle poppinsMedium_16 = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );
  static TextStyle poppinsSemiBold_16 = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.black,
  );

  static TextStyle poppinsMediumGray_16 = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.moreGray,
  );
  static TextStyle poppinsBoldBlue_16 = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: AppColors.mainBlue,
  );

  static TextStyle poppinsRegularBlack_16 = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: const Color(0xff000000),
  );
  static TextStyle poppinsRegularBlack_12 = GoogleFonts.poppins(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: const Color(0xff000000),
  );
  static TextStyle poppinsRegularGray_12 = GoogleFonts.poppins(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: const Color(0xffA5A5A5),
  );
  static TextStyle poppinsMedium_18 = GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );
  static TextStyle poppinsRegularGray_14 = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: const Color(0xffA5A5A5),
  );
  static TextStyle poppinsBoldGray_14 = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: const Color(0xffA5A5A5),
  );
  static TextStyle poppinsBold_20 = GoogleFonts.poppins(
    fontSize: 20,
    fontWeight: FontWeight.w700,
  );
  static TextStyle poppinsBoldBlue_30 = GoogleFonts.poppins(
    fontSize: 30,
    fontWeight: FontWeight.w700,
    color: AppColors.mainBlue,
  );
}
