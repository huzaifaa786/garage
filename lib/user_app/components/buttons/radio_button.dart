// // ignore_for_file: prefer_typing_uninitialized_variables

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:mrfastpartner/components/enums/enums.dart';
// import 'package:mrfastpartner/utils/app_text/app_text.dart';
// import 'package:mrfastpartner/utils/colors/app_color.dart';

// class RadioButton<T> extends StatelessWidget {
//   final T value1;
//   final T value2;
//   final T groupValue;
//   final Function(T?)? onChanged;
//   final Color activeColor;
//   final width;

//   const RadioButton({
//     super.key,
//     required this.value1,
//     required this.value2,
//     required this.groupValue,
//     required this.onChanged,
//     required this.activeColor,
//     this.width = 250.0,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: width,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: <Widget>[
//           Row(
//             children: [
//               Radio<T>(
//                 value: value1,
//                 groupValue: groupValue,
//                 onChanged: onChanged,
//                 activeColor: activeColor,
//               ),
//               AppText(
//                 title: value1.toString().split('.').last,
//                 size: 12.sp,
//                 fontWeight: FontWeight.w500,
//                 color: AppColors.black,
//               )
//             ],
//           ),
//           Row(
//             children: [
//               Radio<T>(
//                 value: value2,
//                 groupValue: groupValue,
//                 onChanged: onChanged,
//                 activeColor: activeColor,
//               ),
//               AppText(
//                 title: value2.toString().split('.').last,
//                 size: 12.sp,
//                 fontWeight: FontWeight.w500,
//                 color: AppColors.black,
//               )
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
