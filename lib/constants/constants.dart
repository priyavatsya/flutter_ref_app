import 'package:flutter/material.dart';

class AppColors {
  static const Color PRIMARY_COLOR = Color(0xFFFFFFFF);
  static const Color PRIMARY_COLOR2 = Color(0xFF4DB6AC);
  static const Color PRIMARY_COLOR_4 = Color(0xFF009688);
  static const Color PRIMARY_COLOR1 = Color(0xFFE0F2F1);
  static const Color PRIMARY_COLOR_B = Color(0xFF2196F3);
  static const Color PRIMARY_COLOR_BDark = Color(0xFF0D47A1);
  static const Color PRIMARY_COLOR_LIGHT = Color(0xFFA5CFF1);
  static const Color ACCENT_LIGHT = Color(0XFF64B5F6);
  static const Color PRIMARY_COLOR_DARK = Color(0xFF0D3656);
  static const Color PRIMARY_COLOR_DARK1 = Color(0xFF607D8B);
  static const Color BRIGHT_COLOR = Color(0xFFf44336);
  static const Color K_COLOR_DARK = Color(0xFF374747);
  static const Color PRIMARY_COLOR_lIGHT2 = Color(0xFFCE93DA);
  static const Color PRIMARY_DARK = Color(0xFF000000);
  static const Color ACCENT_COLOR = Color(0xFF2979FF);
  static const Color kGREEN = Color(0xFF4CAF50);
  static const Color PRIMARY_DARK_LIGHT = Color(0x61000000);
  static const Color PRIMARY_GREY = Color(0xFFEEEEEE);
  static const Color PRIMARY_DARK_LIGHT1 = Color(0xFF212121);
  static const Color DARK_LIGHT = Color(0xFFCFD8DC);
  static const Color ORANGE = Color(0xFFFF8a65);
  static const Color GREY = Color(0xFFBDBDBD);
}
//
// class ApiConstants {
//   static String baseUrl = 'https://blog.codemagic.io/rest-api-in-flutter/';
//   static String usersEndpoint = '/users';
// }

const kLabelStyle = TextStyle(
  fontSize: 20, fontWeight: FontWeight.bold,
//color: AppColors.PRIMARY_COLOR
);

const kDecoration = BoxDecoration(
    color: AppColors.PRIMARY_COLOR,
    borderRadius: BorderRadius.all(
      Radius.circular(20),
    ),
    boxShadow: [
      BoxShadow(
          color: AppColors.PRIMARY_DARK, blurRadius: 6, offset: Offset(0, 2))
    ]);

const kRectangle = RoundedRectangleBorder(
  borderRadius: BorderRadius.all(
    Radius.circular(20),
  ),
);

const kListDecoration = BoxDecoration(
    color: AppColors.PRIMARY_COLOR,
    borderRadius: BorderRadius.all(
      Radius.circular(10),
    ));

final emailValue = (value) {
  if (value!.length == 0) {
    return "Email cannot be empty";
  }
  if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
    return ("Please enter a valid input");
  } else {
    return null;
  }
};

final passwordValue = (value) {
  RegExp regex = new RegExp(r'^.{6,}$');
  if (value!.isEmpty) {
    return "Password cannot be empty";
  }
  if (!regex.hasMatch(value)) {
    return ("please enter valid password min. 6 character");
  } else {
    return null;
  }
};

const Height1 = 20.0;
const Height2 = 50.0;
const Height3 = 35.0;
const Height4 = 100.0;
const Height5 = 12.0;

const Width1 = 100.0;

const FontSize1 = 20.0;
const FontSize2 = 15.0;
const FontSize3 = 40.0;
const FontSize4 = 25.0;

const Padding_1 = EdgeInsets.all(10.0);
const Padding_2 = EdgeInsets.all(5.0);
