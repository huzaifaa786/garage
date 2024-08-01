// // // ignore_for_file: deprecated_member_use

// import 'package:flutter/material.dart';

// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';
// import 'package:mobilegarage/utils/app_text/app_text.dart';


// class TopBar extends StatelessWidget {
//   const TopBar({
//     super.key,
//     this.title,
//     this.showicon = true,
//     this.textColor = Colors.black,
//   });

//   final String? title;
//   final bool showicon;
//   final Color textColor;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.only(left: 20),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           showicon
//               ? GestureDetector(
//                   onTap: () {
//                     Get.back();
//                   },
//                   child: SvgPicture.asset(
//                     'assets/icons/backarrow.svg',
//                     color: textColor,
//                   ),
//                 )
//               : const SizedBox.shrink(),
//           AppText(
//             title: '$title',
//             size: 16,
//             fontWeight: FontWeight.w500,
//             color: textColor,
//           ),
//           SvgPicture.asset(
//             'assets/icons/backarrow.svg',
//             color: Colors.transparent,
//           ),
//         ],
//       ),
//     );
//   }
// }
