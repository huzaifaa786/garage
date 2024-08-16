import 'package:flutter/material.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';
//! BUTTON SHADOW

var buttonShadow = [
  const BoxShadow(color: AppColors.primary),
  BoxShadow(
      color: Colors.black.withOpacity(0.25),
      blurRadius: 8.6,
      spreadRadius: -8.6,
      offset: const Offset(-3.0, -2.0)),
  BoxShadow(
      color: Colors.black.withOpacity(0.25),
      blurRadius: 4.0,
      offset: const Offset(0.0, 2.0)),
];
