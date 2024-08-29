import 'package:flutter/material.dart';
import 'package:mobilegarage/vendor_app/utils/app_colors/app_colors.dart';

var circularInputDecoration = BoxDecoration(
  borderRadius: BorderRadius.circular(45),
);

//! INPUT CONTAINER DECORATION
var circularErrorInputDecoration = BoxDecoration(
  border: Border.all(color: Colors.red),
  borderRadius: BorderRadius.circular(45),
  // boxShadow: innerInputShadow
);

BoxDecoration appBoxDecotration({List<BoxShadow>? innerShadow,Color? color}) {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(45),
    boxShadow: innerShadow,
    color: color 
  );
}

// BoxDecoration radioButtonDecoration(bool selected) {
//   return BoxDecoration(
//     color: selected == true ? AppColors.primary_color : AppColors.white_color,
//     shape: BoxShape.circle,
//     border: selected == true
//         ? Border.all(color: AppColors.primary_color)
//         : Border.all(
//             color: AppColors.bg_grey,
//             width: 2,
//           ),
//   );
// }
