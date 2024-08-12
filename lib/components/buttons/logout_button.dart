// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:mobilegarage/utils/app_text/app_text.dart';
import 'package:mobilegarage/utils/colors/app_color.dart';
import 'package:mobilegarage/utils/shadows/button_shadow.dart';

class LogoutButton extends StatelessWidget {
  LogoutButton({
    super.key,
    required this.image,
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
  final String image;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
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
          shadows: buttonShadow,
        ),

        child: Row(
          children: [
            Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                color: AppColors.lightprimary,
                borderRadius: BorderRadius.circular(80),
              ),
              child: SvgPicture.asset(
                image,
                color: AppColors.primarybg,
                fit: BoxFit.scaleDown,
              ),
            ),
            // Image.asset('assets/images/logout.png'),
            Gap(10),
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
