// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/user_app/utils/app_text/app_text.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';
import 'package:mobilegarage/vendor_app/utils/app_button/app_button.dart';

class UiUtilites {

  



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

  static logoutSuccessAlert(context, ontap, ontapno) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return BackdropFilter(
         filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: AlertDialog(
            backgroundColor: AppColors.white,
            surfaceTintColor: AppColors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            content: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: SvgPicture.asset(
                          'assets/icons/cross.svg',
                          height: 20,
                          width: 20,
                        ),
                      ),
                    ],
                  ),
                  Gap(10),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Text(
                      'Are you Sure that \nyou want to log out?'.tr,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Gap(20),
                  Container(
                      child:
                          Divider(thickness: 1, height: 1, color: Colors.grey)),
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20)),
                            ),
                            child: Center(
                              child: Text(
                                'No'.tr,
                                style: TextStyle(
                                    fontSize: 18.0,
                                    color: AppColors.red,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 50,
                        width: 1,
                        color: Colors.grey,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(20)),
                            ),
                            child: Center(
                              child: Text(
                                'Yes'.tr,
                                style: TextStyle(
                                    fontSize: 18.0,
                                    color: AppColors.lightgreen, // Green text for "Yes"
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // static successSnackbar(String message, String title) {
  //   Get.snackbar(
  //     title.tr,
  //     message.tr,
  //     backgroundColor: AppColors.white,
  //     colorText: AppColors.darkprimary,
  //     duration: const Duration(seconds: 2),
  //     snackPosition: SnackPosition.BOTTOM,
  //   );
  // }

  // static showBottomSheet(container) {
  //   Get.bottomSheet(container);
  // }
  static DeleteAlert(context, carName, yesOnTap, noOnTap) {
    return showDialog(
        context: context,
        builder: (
          BuildContext context,
        ) {
          // Future.delayed(Duration(seconds: 5), () {
          //   Get.back();
          // });

          return AlertDialog(
              content: Wrap(children: [
            Column(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 14.0),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: "Are you sure that you want to delete ",
                          style: DefaultTextStyle.of(context).style,
                          children: <TextSpan>[
                            TextSpan(
                              text: "“$carName”",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red),
                            ),
                            TextSpan(text: ' from your cars?'),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Row(
                      children: [
                        Container(
                          width: Get.width * 0.3,
                          height: Get.height * 0.1 / 2.4,
                          decoration: BoxDecoration(
                            border: Border(
                                top: BorderSide(color: AppColors.grey.shade200),
                                right:
                                    BorderSide(color: AppColors.grey.shade200)),
                          ),
                          child: Center(
                              child: Expanded(
                            child: GestureDetector(
                              onTap: noOnTap,
                              child: Text(
                                "No",
                                style: TextStyle(color: AppColors.red),
                              ),
                            ),
                          )),
                        ),
                        Container(
                          width: Get.width * 0.3,
                          height: Get.height * 0.1 / 2.4,
                          decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(color: AppColors.grey.shade200),
                            ),
                          ),
                          child: Center(
                              child: Expanded(
                            child: GestureDetector(
                              onTap: yesOnTap,
                              child: Text(
                                "Yes",
                                style: TextStyle(color: Colors.green),
                              ),
                            ),
                          )),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ]));
        });
  }

  static SuccessAlert(context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        Future.delayed(Duration(seconds: 5), () {
          Get.back();
        });
        return AlertDialog(
          backgroundColor: AppColors.white,
          surfaceTintColor: AppColors.white,
          // contentPadding: EdgeInsets.all(0),
          content: SizedBox(
            width: Get.width * 0.5,
            height: Get.height * 0.27,
            child: Wrap(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(150),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white.withOpacity(0.2),
                            spreadRadius: 12,
                            blurRadius: 10,
                            offset: Offset(2, 3),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(150),
                        child: Image.asset(
                          'assets/images/cart_bg.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Gap(20),
                    AppText(
                      title: 'Added to cart successfully !'.tr,
                      size: 12,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primarybg,
                    ),
                    Gap(20),
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        height: Get.height * 0.05,
                        width: Get.width * 0.4,
                        decoration: BoxDecoration(
                          color: AppColors.lightprimary,
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Gap(14),
                            Container(
                              decoration: BoxDecoration(),
                              child: AppText(
                                title: 'View cart',
                                fontWeight: FontWeight.w500,
                                size: 10.0,
                                color: AppColors.primary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

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
}
