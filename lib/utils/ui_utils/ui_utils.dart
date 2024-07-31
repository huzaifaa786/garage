// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:gap/gap.dart';
// import 'package:get/get.dart';
// import 'package:mrfast/utils/app_text/app_rich_text.dart';
// import 'package:mrfast/utils/app_text/app_text.dart';

// class UiUtilites {
//   static UploadphotoAlert(
//     context,
//     title1,
//     ontap,
//     title2,
//     ontapno,
//   ) {
//     return showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           backgroundColor: AppColors.white,
//           surfaceTintColor: AppColors.white,
//           shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.all(Radius.circular(13))),
//           content: Container(
//               height: 230.h,
//               width: 300.w,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.all(Radius.circular(20.0)),
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Gap(23),
//                   Text(
//                     "Upload photo".tr,
//                     style:
//                         TextStyle(fontWeight: FontWeight.w500, fontSize: 14.sp),
//                   ),
//                   Gap(25),
//                   Divider(
//                     thickness: 1,
//                     color: AppColors.grey.shade300,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(top: 15, bottom: 15),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         SvgPicture.asset(
//                           "assets/icons/bluecolorcamera.svg",
//                           height: 12.h,
//                           width: 12.w,
//                         ),
//                         Gap(4),
//                         GestureDetector(
//                           onTap: ontap,
//                           child: Text(
//                             title1,
//                             style: TextStyle(
//                                 color: AppColors.lightblue,
//                                 fontWeight: FontWeight.w400,
//                                 fontSize: 11.sp),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Expanded(
//                     child: Divider(
//                       thickness: 1,
//                       color: AppColors.grey.shade300,
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(top: 15, bottom: 15),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         SvgPicture.asset(
//                           "assets/icons/picture.svg",
//                           height: 19.h,
//                           width: 18.w,
//                         ),
//                         Gap(4),
//                         GestureDetector(
//                           onTap: ontapno,
//                           child: Text(
//                             title2,
//                             style: TextStyle(
//                                 color: AppColors.lightblue,
//                                 fontWeight: FontWeight.w400,
//                                 fontSize: 11.sp),
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ],
//               )),
//         );
//       },
//     );
//   }

//   static errorSnackbar(String title, String message) {
//     Get.snackbar(
//       title.tr,
//       message.tr,
//       colorText: AppColors.white,
//       backgroundColor: AppColors.red,
//       duration: const Duration(seconds: 2),
//       snackPosition: SnackPosition.BOTTOM,
//     );
//   }

//   static logoutSuccessAlert(context, ontap, ontapno) {
//     return showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           backgroundColor: AppColors.white,
//           surfaceTintColor: AppColors.white,
//           shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.all(Radius.circular(13))),
//           content: Container(
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.all(Radius.circular(20.0)),
//             ),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               mainAxisSize: MainAxisSize.min,
//               children: <Widget>[
//                 Gap(10),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 15, right: 15),
//                   child: Text(
//                     'Are You Sure, you want to logout!'.tr,
//                     textAlign: TextAlign.center,
//                     style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
//                   ),
//                 ),
//                 Gap(30),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     GestureDetector(
//                       onTap: ontap,
//                       child: Container(
//                         height: 35,
//                         width: 55,
//                         decoration: BoxDecoration(
//                             color: AppColors.primary_color,
//                             borderRadius: BorderRadius.circular(10)),
//                         child: Center(
//                           child: Text(
//                             'Yes'.tr,
//                             style: TextStyle(fontSize: 20.0),
//                           ),
//                         ),
//                       ),
//                     ),
//                     GestureDetector(
//                       onTap: ontapno,
//                       child: Container(
//                         height: 35,
//                         width: 50,
//                         decoration: BoxDecoration(
//                             color: AppColors.primary_color,
//                             borderRadius: BorderRadius.circular(10)),
//                         child: Center(
//                           child: Text(
//                             'No'.tr,
//                             style: TextStyle(fontSize: 20.0),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 )
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }

//   static successSnackbar(String message, String title) {
//     Get.snackbar(
//       title.tr,
//       message.tr,
//       backgroundColor: AppColors.green,
//       colorText: AppColors.white,
//       duration: const Duration(seconds: 2),
//       snackPosition: SnackPosition.BOTTOM,
//     );
//   }

//   static showBottomSheet(container) {
//     Get.bottomSheet(container);
//   }

//   static SuccessAlert(context) {
//     return showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           Future.delayed(Duration(seconds: 5), () {
//             Get.back();
//           });
//           return AlertDialog(
//             backgroundColor: AppColors.lightblack,
//             surfaceTintColor: AppColors.lightblack,
//             content: Wrap(children: [
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       GestureDetector(
//                           onTap: () {
//                             Get.back();
//                           },
//                           child: SvgPicture.asset('assets/icons/cancel.svg'))
//                     ],
//                   ),
//                   Gap(5.h),
//                   SvgPicture.asset('assets/icons/Success.svg'),
//                   Gap(10.h),
//                   AppText(
//                     title: 'You have placed your\n order successfully !'.tr,
//                     size: 12.sp,
//                     fontWeight: FontWeight.w500,
//                     color: AppColors.white,
//                   ),
//                   Gap(17.h),
//                   AppText(
//                     title: 'and we are currently connecting'.tr,
//                     size: 10.sp,
//                     fontWeight: FontWeight.w400,
//                     color: AppColors.white,
//                   ),
//                   AppText(
//                     title: 'you to your partner.'.tr,
//                     size: 10.sp,
//                     fontWeight: FontWeight.w400,
//                     color: AppColors.white,
//                   ),
//                   Gap(20.h),
//                   Container(
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(150),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.white.withOpacity(0.2),
//                             spreadRadius: 12,
//                             blurRadius: 10,
//                             offset: Offset(2, 3),
//                           ),
//                         ],
//                       ),
//                       child: ClipRRect(
//                         borderRadius: BorderRadius.circular(150),
//                         child: Image.asset(
//                           'assets/icons/thunder.gif',
//                           width: 120.w,
//                           height: 132.h,
//                           fit: BoxFit.cover,
//                         ),
//                       )),
//                   Gap(20.h),
//                 ],
//               ),
//             ]),
//           );
//         });
//   }

//   static errorAlert(context) {
//     return showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           // Future.delayed(Duration(seconds: 3), () {
//           //   Get.back();
//           // });
//           return AlertDialog(
//             backgroundColor: AppColors.white,
//             surfaceTintColor: AppColors.white,
//             content: Wrap(children: [
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       GestureDetector(
//                           onTap: () {
//                             Get.back();
//                           },
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: SvgPicture.asset(
//                               'assets/icons/cancel.svg',
//                               color: AppColors.black.withOpacity(0.5),
//                             ),
//                           ))
//                     ],
//                   ),
//                   Gap(5.h),
//                   SvgPicture.asset('assets/icons/warning.svg'),
//                   Gap(10.h),
//                   AppText(
//                     title: 'Please'.tr,
//                     size: 13.sp,
//                     fontWeight: FontWeight.w600,
//                     color: AppColors.black,
//                   ),
//                   Gap(17.h),
//                   AppText(
//                     title: 'Fill all details required!'.tr,
//                     size: 12.sp,
//                     fontWeight: FontWeight.w500,
//                     color: AppColors.black.withOpacity(0.5),
//                   ),
//                   Gap(20.h),
//                 ],
//               ),
//             ]),
//           );
//         });
//   }
// }
