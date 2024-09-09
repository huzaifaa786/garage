//! INNER INPUT SHADOW
import 'package:flutter/cupertino.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';

var innerInputShadow = [
  BoxShadow(color: AppColors.primary_color),
  BoxShadow(
      color: AppColors.white_color.withOpacity(0.1),
      spreadRadius: -5.0,
      blurRadius: 20.0),
  BoxShadow(
      color: AppColors.white_color.withOpacity(0.05),
      spreadRadius: -5.0,
      blurRadius: 20.0),
];
