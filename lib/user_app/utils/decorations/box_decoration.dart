//! INPUT CONTAINER DECORATION
import 'package:flutter/material.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';

var circularInputDecoration = BoxDecoration(
  borderRadius: BorderRadius.circular(34),
  color: AppColors.lightgrey,

  // boxShadow: innerInputShadow
);

//! INPUT CONTAINER DECORATION
var circularErrorInputDecoration = BoxDecoration(
  border: Border.all(
    color: Colors.red,
  ),
  color: AppColors.white,
  borderRadius: BorderRadius.circular(34),
  // boxShadow: innerInputShadow,
);
