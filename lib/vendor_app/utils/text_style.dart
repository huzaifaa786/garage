import 'package:flutter/material.dart';

class TextStyles {
  static TextStyle customgreyTextStyle(
      {double fontSize = 14.0,
      FontWeight fontWeight = FontWeight.normal,
      Color color = Colors.grey}) {
    return TextStyle(fontSize: fontSize, fontWeight: fontWeight, color: color);
  }

  static TextStyle normalTextStyle({double fontSize = 14.0}) {
    return TextStyle(fontSize: fontSize, fontWeight: FontWeight.normal);
  }

  static TextStyle w100TextStyle({double fontSize = 14.0}) {
    return TextStyle(fontSize: fontSize, fontWeight: FontWeight.w100);
  }

  static TextStyle w200TextStyle({double fontSize = 14.0}) {
    return TextStyle(fontSize: fontSize, fontWeight: FontWeight.w200);
  }

  static TextStyle w300TextStyle({double fontSize = 14.0}) {
    return TextStyle(fontSize: fontSize, fontWeight: FontWeight.w300);
  }


  static TextStyle w400TextStyle({double fontSize = 14.0}) {
    return TextStyle(fontSize: fontSize, fontWeight: FontWeight.w400);
  }

  static TextStyle w500TextStyle({double fontSize = 14.0}) {
    return TextStyle(fontSize: fontSize, fontWeight: FontWeight.w500);
  }

  //?
  //! Semi-bold text style with parameters
  static TextStyle w600BoldTextStyle({double fontSize = 14.0}) {
    return TextStyle(fontSize: fontSize, fontWeight: FontWeight.w600);
  }

  //?
  //! BOLD text style with parameters
  static TextStyle w700TextStyle({double fontSize = 14.0}) {
    return TextStyle(fontSize: fontSize, fontWeight: FontWeight.w700);
  }

  //?
  //! Extra-bold text style with parameters
  static TextStyle w800TextStyle({double fontSize = 14.0}) {
    return TextStyle(fontSize: fontSize, fontWeight: FontWeight.w800);
  }

  //?
  //! Black, the most thick text style with parameters
  static TextStyle w900TextStyle({double fontSize = 14.0}) {
    return TextStyle(fontSize: fontSize, fontWeight: FontWeight.w900);
  }

  //?
  //! BOLD text style with parameters
  static TextStyle boldTextStyle({double fontSize = 14.0}) {
    return TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold);
  }

  //?
  //! Custom text style with parameters
  static TextStyle customTextStyle(
      {double fontSize = 14.0,
      FontWeight fontWeight = FontWeight.normal,
      Color color = Colors.black}) {
    return TextStyle(fontSize: fontSize, fontWeight: fontWeight, color: color);
  }
}
