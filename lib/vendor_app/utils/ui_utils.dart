// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ui';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/routes/app_routes.dart';
import 'package:mobilegarage/user_app/components/buttons/main_button.dart';
import 'package:mobilegarage/user_app/components/textfields/main_input.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';
import 'package:mobilegarage/vendor_app/utils/app_button/app_button.dart';
import 'package:mobilegarage/vendor_app/utils/app_constants/const_images.dart';
import 'package:mobilegarage/vendor_app/utils/app_constants/text_strings.dart';
import 'package:mobilegarage/vendor_app/utils/app_text/app_text.dart';

class UiUtilites {
  static errorSnackbar(String title, String message) {
    AnimatedSnackBar(
      mobileSnackBarPosition: MobileSnackBarPosition.bottom,
      mobilePositionSettings: const MobilePositionSettings(
        bottomOnAppearance: 20,
      ),
      duration: Duration(milliseconds: 2000),
      builder: ((context) {
        return MaterialAnimatedSnackBar(
          titleText: title,
          messageText: message,
          type: AnimatedSnackBarType.error,
        );
      }),
    ).show(Get.context!);
  }

  static successSnackbar(String message, String title) {
    AnimatedSnackBar(
      mobileSnackBarPosition: MobileSnackBarPosition.bottom,
      mobilePositionSettings: const MobilePositionSettings(
        bottomOnAppearance: 20,
      ),
      duration: Duration(milliseconds: 2000),
      builder: ((context) {
        return MaterialAnimatedSnackBar(
          titleText: title,
          messageText: message,
          type: AnimatedSnackBarType.success,
        );
      }),
    ).show(Get.context!);
  }

  static confirmAlertDialog(
      {required context,
      required onCancelTap,
      required onConfirmTap,
      required title,
      required cancelText,
      required confirmText}) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
          child: AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            contentPadding: EdgeInsets.only(top: 10.0),
            backgroundColor: AppColors.white_color,
            surfaceTintColor: AppColors.white_color,
            content: Wrap(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: SvgPicture.asset(
                              ImageConst.cancel_ic,
                              height: 20,
                              width: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: AppText(
                        title: title,
                        size: 14,
                        fontWeight: FontWeight.w600,
                        textAlign: TextAlign.center,
                        fontFamily: 'ibarraRealNova',
                      ),
                    ),
                    Gap(10),
                    Divider(
                      thickness: 1,
                      height: 0,
                      color: AppColors.input_bg_color,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: InkWell(
                            onTap: onCancelTap,
                            child: Container(
                              height: 35,
                              width: Get.width * 0.4,
                              decoration: BoxDecoration(
                                  border: Border(
                                      right: BorderSide(
                                          color: AppColors.input_bg_color))),
                              child: Center(
                                child: AppText(
                                  title: cancelText,
                                  size: 13,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'ibarraRealNova',
                                  color:
                                      AppColors.black_color.withOpacity(0.51),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          child: InkWell(
                            onTap: onConfirmTap,
                            child: SizedBox(
                              height: 35,
                              width: Get.width * 0.4,
                              child: Center(
                                child: AppText(
                                  title: confirmText,
                                  size: 13,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.primary_color,
                                  fontFamily: 'ibarraRealNova',
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Gap(10),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static successAlertDialog(
      {required context,
      required onTap,
      required title,
      required buttontitle,
      required description}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
          child: AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            backgroundColor: AppColors.white_color,
            surfaceTintColor: AppColors.white_color,
            content: Wrap(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  width: Get.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(ImageConst.success_ic),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: AppText(
                          title: '$title',
                          size: 14,
                          fontWeight: FontWeight.w700,
                          textAlign: TextAlign.center,
                          color: AppColors.darkprimary,
                        ),
                      ),
                      Gap(10),
                      AppText(
                        title: '$description',
                        size: 12,
                        textAlign: TextAlign.center,
                        color: AppColors.hint_text_color,
                      ),
                      Gap(20),
                      AppButton(
                        height: 45,
                        title: '$buttontitle',
                        buttonColor: AppColors.primary_color.withOpacity(0.1),
                        titleColor: AppColors.primary_color,
                        ontap: onTap,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );

    Future.delayed(Duration(seconds: 3), () {
      if (Navigator.canPop(context)) {
        Navigator.pop(context);
      }
    });
  }

  static pendingApprovalAlertDialog({
    required BuildContext context,
    required VoidCallback onTap,
    String? title,
    required String description,
    String? buttonTitle,
    String? imageAssetPath,
  }) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 5),
              backgroundColor: AppColors.white_color,
              surfaceTintColor: AppColors.white_color,
              content: Wrap(
                children: [
                  SizedBox(
                    width: Get.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        if (imageAssetPath != null)
                          SvgPicture.asset(imageAssetPath),
                        if (title != null)
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 4.0),
                            child: AppText(
                              title: title,
                              size: 14,
                              fontWeight: FontWeight.w700,
                              textAlign: TextAlign.center,
                              color: AppColors.darkprimary,
                            ),
                          ),
                        Gap(10),
                        AppText(
                          title: description,
                          size: 12,
                          textAlign: TextAlign.center,
                          color: AppColors.hint_text_color,
                        ),
                        Gap(20),
                        if (buttonTitle != null)
                          AppButton(
                            height: 45,
                            title: buttonTitle,
                            buttonColor:
                                AppColors.primary_color.withOpacity(0.1),
                            titleColor: AppColors.primary_color,
                            ontap: onTap,
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  static void showConfirmationDialog(bool intendedValue, String message,
      {VoidCallback? onConfirm}) {
    Get.dialog(
      AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text(
          message,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                ),
                child: Text(
                  "No".tr,
                  style: TextStyle(color: Colors.red, fontSize: 16),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  onConfirm!();
                  Get.back();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                ),
                child: Text(
                  'Yes'.tr,
                  style: TextStyle(color: Colors.green, fontSize: 16),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  static void AddProductDialog(BuildContext context,
      TextEditingController nameController, VoidCallback? onsubmit) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(45),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Add new'.tr,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.close),
                      color: AppColors.darkGrey,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: AppText(
                    title: 'Enter name',
                    size: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.darkGrey,
                  ),
                ),
                Gap(8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: MainInput(
                    controller: nameController,
                    errorText: '',
                    hint: 'product name',
                  ),
                ),
                Gap(30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: MainButton(
                    title: 'Submit',
                    onTap: onsubmit,
                  ),
                ),
                Gap(15)
              ],
            ),
          ),
        );
      },
    );
  }

  static void ProductPendingDialog(
    BuildContext context,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        Future.delayed(Duration(seconds: 2), () {
          Navigator.of(context).pop();
        });
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(45),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: Icon(Icons.close),
                      color: AppColors.darkGrey,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppText(
                      title: 'Pending Approval',
                      size: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
                Gap(30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35),
                  child: MainButton(
                    title: 'Done',
                    textcolor: AppColors.red,
                    btncolor: AppColors.lightPink,
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                Gap(15)
              ],
            ),
          ),
        );
      },
    );
  }
}
