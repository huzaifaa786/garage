//! BUTTON SHADOW
import 'package:flutter/material.dart';
import 'package:mobilegarage/utils/colors/app_color.dart';

var buttonShadow = [
  const BoxShadow(color: AppColors.primary),
  BoxShadow(
      color: Colors.black.withOpacity(0.25),
      blurRadius: 1.0,
      offset: const Offset(-3.0, -2.0)),
  BoxShadow(
      color: Colors.black.withOpacity(0.25),
      blurRadius: 4.0,
      offset: const Offset(0.0, 2.0)),
];
