import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

const Color mainClr = Color(0xFF182B4C);
const Color orangeClr = Color(0xCFFFB12A);
const Color rejectClr = Color(0xFFFF4D40);
const Color white = Colors.white;
const primaryClr = mainClr;

TextStyle get headingStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
    fontSize: 24,
    color: Get.isDarkMode ? Colors.white : Colors.black,
    fontWeight: FontWeight.bold,
  ));
}

TextStyle get subHeadingStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
    fontSize: 20,
    color: Get.isDarkMode ? Colors.white : Colors.black,
    fontWeight: FontWeight.bold,
  ));
}

TextStyle get titleStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
    fontSize: 18,
    color: Get.isDarkMode ? Colors.white : Colors.black,
    fontWeight: FontWeight.bold,
  ));
}

TextStyle get subTitleStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
    fontSize: 16,
    color: Get.isDarkMode ? Colors.white : Colors.black,
    fontWeight: FontWeight.bold,
  ));
}

TextStyle get bodyStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
    fontSize: 14,
    color: Get.isDarkMode ? Colors.white : Colors.black,
    fontWeight: FontWeight.w400,
  ));
}

TextStyle get body2Style {
  return GoogleFonts.lato(
      textStyle: TextStyle(
    fontSize: 14,
    color: Get.isDarkMode ? Colors.grey[200] : Colors.black,
    fontWeight: FontWeight.w400,
  ));
}
