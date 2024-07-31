// // ignore_for_file: use_full_hex_values_for_flutter_colors, prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_typing_uninitialized_variables

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:gap/gap.dart';
// import 'package:get/get.dart';
// import 'package:mrfastpartner/utils/app_text/app_text.dart';
// import 'package:mrfastpartner/utils/borders/border.dart';
// import 'package:mrfastpartner/utils/colors/app_color.dart';
// import 'package:mrfastpartner/utils/decorations/box_decoration.dart';

// class KilometerInputfield extends StatelessWidget {
//   const KilometerInputfield({
//     super.key,
//     this.controller,
//     this.hint,
//     this.obscure = false,
//     this.maxlines = 1,
//     this.readOnly = false,
//     this.lable,
//     this.validator,
//     this.autovalidateMode,
//     this.errorText,
//     this.type = TextInputType.text,
//     this.onchange,
//     this.height = 50.0,
//     this.width,
//   });
//   final double height;
//   final width;
//   final controller;
//   final validator;
//   final obscure;
//   final hint;
//   final type;
//   final lable;
//   final autovalidateMode;
//   final maxlines;
//   final readOnly;
//   final String? errorText;
//   final onchange;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Container(
//           height: 50.0.h,
//           // width: width,
//           decoration:
//               //  errorText!.isNotEmpty
//               // ? circularErrorInputDecoration
//               // :
//               circularInputDecoration,
//           child: Padding(
//             padding: EdgeInsets.only(right: 12.w),
//             child: Row(
//               children: [
//                 SizedBox(
//                   width: width,
//                   child: TextFormField(
//                     onChanged: onchange,
//                     onSaved: onchange,
//                     onFieldSubmitted: onchange,
//                     readOnly: readOnly,
//                     maxLines: maxlines,
//                     obscureText: obscure,
//                     controller: controller,
//                     validator: validator,
//                     autovalidateMode: autovalidateMode ??
//                         (validator == true.obs
//                             ? AutovalidateMode.always
//                             : AutovalidateMode.onUserInteraction),
//                     keyboardType: type,
//                     decoration: InputDecoration(
//                         contentPadding:
//                             EdgeInsets.symmetric(vertical: 6.h, horizontal: 16.w),
//                         floatingLabelBehavior: FloatingLabelBehavior.always,
//                         fillColor: Colors.transparent,
//                         filled: true,
//                         border: inputborder,
//                         errorBorder: errorInputBorder,
//                         errorStyle: TextStyle(fontSize: 0),
//                         hoverColor: Colors.transparent,
//                         focusColor: Colors.transparent,
//                         hintText: hint,
//                         hintStyle: TextStyle(
//                             color: AppColors.black.withOpacity(0.4),
//                             fontSize: 12.sp,
//                             fontWeight: FontWeight.w400)),
//                   ),
//                 ),
//                 AppText(
//                   title: '|',
//                   size: 12.sp,
//                   fontWeight: FontWeight.w500,
//                   color: AppColors.black.withOpacity(0.4),
//                 ),
//                 Gap(7.w),
//                 AppText(
//                   title: 'Km'.tr,
//                   size: 11.sp,
//                   fontWeight: FontWeight.w400,
//                 )
//               ],
//             ),
//           ),
//         ),
//         // if (errorText!.isNotEmpty)
//         //   Padding(
//         //     padding: EdgeInsets.only(top: 4, left: 16, right: 16),
//         //     child: Text(errorText!,
//         //         style: TextStyle(color: Colors.red, fontSize: 9)),
//         //   )
//       ],
//     );
//   }
// }
