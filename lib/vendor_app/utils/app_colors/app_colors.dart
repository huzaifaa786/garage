// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class AppColors {
  //* APP COLORS
  static Color primary_color = const Color(0xFF990002);
  static Color white_color = const Color(0xffFFFFFF);
  static Color input_bg_color = const Color(0xFFF5F5F5);
  static const lightblue = Color(0xFF148EFF);
  static const lightgrey = Color(0xFFF5F5F5);

  static Color black_color = const Color(0xFF000000);
  static Color hint_text_color = const Color(0xFF000000).withOpacity(0.6);
  static Color heading_text_color = const Color(0xFF2D0001);
  static Color green_color = const Color(0xFF44CC04);
  static Color light_red = const Color(0xFFFFF6F6);
  static Color appbar_title_color = const Color(0xFF5C0000);
  static Color divider_color = const Color(0xFFECECEC);


  //* APP GRADIENTS
  static Gradient LOGINSCREEN_GRADIENT = const LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [
      Color(0xff2412A9),
      Color(0XFFFFFFFF),
    ],
  );
}
