import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';

import 'package:mobilegarage/vendor_app/utils/app_text/app_text.dart';
import 'package:mobilegarage/vendor_app/utils/box_decorations/box_decorations.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    this.height = 50,
    this.buttonWidth = 1.0,
    this.buttonColor,
    this.boxShadow,
    this.textColor,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.prefixWidget,
    this.suffixWidget,
    this.title,
    this.titleColor,
    this.ontap,
  });
  final double? height;
  final double buttonWidth;
  final Color? buttonColor;
  final List<BoxShadow>? boxShadow;
  final Color? textColor;
  final MainAxisAlignment mainAxisAlignment;
  final Widget? prefixWidget;
  final Widget? suffixWidget;
  final String? title;
  final Color? titleColor;
  final Function()? ontap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      borderRadius: BorderRadius.circular(45),
      child: Container(
        height: height,
        width: Get.width * buttonWidth,
        decoration:
            appBoxDecotration(innerShadow: boxShadow, color: buttonColor),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: mainAxisAlignment,
            children: [
              if (prefixWidget != null) prefixWidget!,
              AppText(
                title: '$title',
                size: 14,
                fontWeight: FontWeight.w600,
                color: titleColor ?? AppColors.white_color,
              ),
              if (suffixWidget != null) suffixWidget!,
            ],
          ),
        ),
      ),
    );
  }
}
