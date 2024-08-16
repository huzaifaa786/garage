// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:mrfastpartner/utils/borders/border.dart';
// import 'package:mrfastpartner/utils/colors/app_color.dart';
// import 'package:mrfastpartner/utils/decorations/box_decoration.dart';

// class PasswordInputField extends StatelessWidget {
//   const PasswordInputField({
//     super.key,
//     this.controller,
//     this.hint,
//     this.obscure = false,
//     this.maxlines = false,
//     this.readOnly = false,
//     this.lable,
//     this.errorText,
//     this.validator,
//     this.autovalidateMode,
//     this.toggle,
//     this.onchange,
//     this.type = TextInputType.text,
//     this.height = 50.0,
//     this.width,
//   });

//   final double height;
//   final width;
//   final TextEditingController? controller;
//   final String? Function(String?)? validator;
//   final bool obscure;
//   final String? hint;
//   final TextInputType type;
//   final void Function()? toggle;
//   final lable;
//   final errorText;
//   final autovalidateMode;
//   final maxlines;
//   final readOnly;
//   final onchange;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Container(
//           decoration: errorText!.isNotEmpty
//               ? circularErrorInputDecoration
//               : circularInputDecoration,
//           child: TextFormField(
//             onChanged: onchange,
//             onSaved: onchange,
//             onFieldSubmitted: onchange,
//             readOnly: readOnly,
//             obscureText: obscure,
//             controller: controller,
//             obscuringCharacter: '*',
//             validator: validator,
//             autovalidateMode: autovalidateMode ??
//                 (validator != null
//                     ? AutovalidateMode.always
//                     : AutovalidateMode.onUserInteraction),
//             keyboardType: type,
//             decoration: InputDecoration(
//               suffixIcon: InkWell(
//                 borderRadius: BorderRadius.circular(30),
//                 onTap: () {
//                   if (toggle != null) {
//                     toggle!();
//                   }
//                 },
//                 child: !obscure
//                     ? SvgPicture.asset('assets/icons/eye.svg',
//                         height: 24, fit: BoxFit.scaleDown)
//                     : SvgPicture.asset('assets/icons/eye-off.svg',
//                         height: 24, fit: BoxFit.scaleDown),
//               ),
//               floatingLabelBehavior: FloatingLabelBehavior.always,
//               contentPadding:
//                   EdgeInsets.symmetric(vertical: 12.h, horizontal: 15.w),
//               fillColor: Colors.transparent,
//               border: inputborder,
//               errorBorder: errorInputBorder,
//               errorStyle: TextStyle(fontSize: 0),
//               hoverColor: Colors.transparent,
//               focusColor: Colors.transparent,
//               hintText: hint,
//               hintStyle: TextStyle(
//                 color: AppColors.black.withOpacity(0.4),
//                 fontSize: 12.sp,
//                 fontWeight: FontWeight.w400,
//               ),
//             ),
//           ),
//         ),
//         if (errorText != null && errorText!.isNotEmpty)
//           Padding(
//             padding: EdgeInsets.only(top: 4.h, left: 4.w, right: 4.w),
//             child: Text(
//               errorText!,
//               style: TextStyle(color: Colors.red, fontSize: 9.sp),
//             ),
//           ),
//       ],
//     );
//   }
// }
