import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const primaryBgColor = Color(0xFFF8EEE2);
  static const secondaryColor = Color(0xFFD9614C);
  static const lightSecondaryColor = Color(0xFFE8BEB1);
  static const titleTextColor = Color(0xFF403B36);
  static const mainTextColor = Color(0xFF595550);
  static const whitebgColor = Color(0xFFFDFDFD);
}

class AppFonts {
  static TextStyle boldFontBlack(double fontSize) => GoogleFonts.nunito(
        fontSize: fontSize,
        fontWeight: FontWeight.w900,
        color: AppColors.titleTextColor,
      );

  static TextStyle whiteFontBlack(double fontSize) => GoogleFonts.nunito(
        fontSize: fontSize,
        fontWeight: FontWeight.w900,
        color: AppColors.whitebgColor,
      );

  static TextStyle smallFontBlack(double fontSize) => GoogleFonts.nunito(
        fontSize: fontSize,
        fontWeight: FontWeight.w700,
        color: AppColors.mainTextColor,
      );

  static TextStyle logoFontBlack(double fontSize) => GoogleFonts.titanOne(
        fontSize: fontSize,
        fontWeight: FontWeight.w400,
        color: AppColors.titleTextColor,
      );

  static TextStyle secFontPitch(double fontSize) => GoogleFonts.nunito(
        fontSize: fontSize,
        fontWeight: FontWeight.w700,
        color: AppColors.secondaryColor,
      );
}
