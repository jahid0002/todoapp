import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todoapp/app/utils/color.dart';

class AppTextTheme {
  static TextTheme lightTextTheme = TextTheme(
    displayLarge: GoogleFonts.poppins(
        fontSize: 26, fontWeight: FontWeight.w900, color: AppColor.blackColor),
    displayMedium: GoogleFonts.poppins(
        fontSize: 22, fontWeight: FontWeight.w700, color: AppColor.blackColor),
    displaySmall: GoogleFonts.poppins(
        fontSize: 20, fontWeight: FontWeight.w500, color: AppColor.blackColor),
    headlineLarge: GoogleFonts.poppins(
        fontSize: 18, fontWeight: FontWeight.w400, color: AppColor.blackColor),
    headlineMedium: GoogleFonts.poppins(
        fontSize: 16, fontWeight: FontWeight.w400, color: AppColor.blackColor),
    headlineSmall: GoogleFonts.poppins(
        fontSize: 14, fontWeight: FontWeight.w400, color: AppColor.blackColor),
    titleLarge: GoogleFonts.poppins(
        fontSize: 26, fontWeight: FontWeight.w900, color: AppColor.whiteColor),
    titleMedium: GoogleFonts.poppins(
        fontSize: 22, fontWeight: FontWeight.w700, color: AppColor.whiteColor),
    titleSmall: GoogleFonts.poppins(
        fontSize: 20, fontWeight: FontWeight.w500, color: AppColor.whiteColor),
    bodyLarge: GoogleFonts.poppins(
        fontSize: 18, fontWeight: FontWeight.w400, color: AppColor.whiteColor),
    bodyMedium: GoogleFonts.poppins(
        fontSize: 16, fontWeight: FontWeight.w400, color: AppColor.whiteColor),
    bodySmall: GoogleFonts.poppins(
        fontSize: 14, fontWeight: FontWeight.w400, color: AppColor.whiteColor),
  );

  static TextTheme darkTextTheme = TextTheme(
      displayLarge: GoogleFonts.poppins(
          fontSize: 26,
          fontWeight: FontWeight.w900,
          color: AppColor.whiteColor),
      displayMedium: GoogleFonts.poppins(
          fontSize: 22,
          fontWeight: FontWeight.w700,
          color: AppColor.whiteColor),
      displaySmall: GoogleFonts.poppins(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: AppColor.whiteColor),
      headlineLarge: GoogleFonts.poppins(
          fontSize: 18,
          fontWeight: FontWeight.w400,
          color: AppColor.whiteColor),
      headlineMedium: GoogleFonts.poppins(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: AppColor.whiteColor),
      headlineSmall: GoogleFonts.poppins(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: AppColor.whiteColor),
      titleLarge: GoogleFonts.poppins(
          fontSize: 26,
          fontWeight: FontWeight.w900,
          color: AppColor.blackColor),
      titleMedium: GoogleFonts.poppins(
          fontSize: 22,
          fontWeight: FontWeight.w700,
          color: AppColor.blackColor),
      titleSmall: GoogleFonts.poppins(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: AppColor.blackColor),
      bodyLarge: GoogleFonts.poppins(
          fontSize: 18,
          fontWeight: FontWeight.w400,
          color: AppColor.blackColor),
      bodyMedium: GoogleFonts.poppins(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: AppColor.blackColor),
      bodySmall: GoogleFonts.poppins(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: AppColor.blackColor));
}
