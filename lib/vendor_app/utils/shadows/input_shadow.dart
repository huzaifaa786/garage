//! INNER INPUT SHADOW
import 'package:flutter/cupertino.dart';
import 'package:mobilegarage/vendor_app/utils/app_colors/app_colors.dart';

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
