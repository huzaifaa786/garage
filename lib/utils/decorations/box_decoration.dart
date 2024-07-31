//! INPUT CONTAINER DECORATION
import 'package:flutter/material.dart';
import 'package:mobilegarage/utils/colors/app_color.dart';

var circularInputDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(4),
    color: AppColors.lightgrey,
    border: Border.all(
      color: AppColors.black,
      width: 1,
    )

    // boxShadow: innerInputShadow
    );

//! INPUT CONTAINER DECORATION
var circularErrorInputDecoration = BoxDecoration(
  border: Border.all(color: Colors.red,),
   color: AppColors.white,
  borderRadius: BorderRadius.circular(4),
  // boxShadow: innerInputShadow,
);
