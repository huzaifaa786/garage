// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mobilegarage/user_app/utils/app_text/app_text.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';

class IconMainButton extends StatelessWidget {
  IconMainButton({
    super.key,
    this.title,
    double? radius,
    this.onTap,
    double? height,
    final buttonWidth,
    double? fontsize = 14.0,
    this.btncolor = AppColors.primary,
    this.textcolor = AppColors.white,
    this.txtweight = FontWeight.w600,
  })  : radius = radius ?? 45.0,
        height = height ?? 60.0,
        buttonWidth = buttonWidth ?? 334.0,
        fontsize = fontsize ?? 14.0;

  final String? title;

  final double? radius;
  final Function()? onTap;
  final double? height;
  final double? buttonWidth;
  final double? fontsize;
  final Color btncolor;
  final Color textcolor;
  final FontWeight txtweight;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height,
        width: buttonWidth,
        // decoration: BoxDecoration(
        //   boxShadow: buttonShadow,
        //   // color: AppColors.primary,
        //   borderRadius: BorderRadius.circular(radius!),
        // ),
        decoration: ShapeDecoration(
          color: btncolor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(45), side: BorderSide.none),
          // shadows: buttonShadow,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              Icon(
                                        Icons.done_all_rounded,
                                        color: AppColors.white,
                                        size: 20,
                                      ),
                                      Gap(5),
            
            AppText(
              title: '$title',
              color: textcolor,
              size: fontsize,
              fontWeight: txtweight,
            ),
          ],
        ),
      ),
    );
  }
}
