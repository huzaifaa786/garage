// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_typing_uninitialized_variables, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobilegarage/utils/colors/app_color.dart';

class GoogleMapButton extends StatelessWidget {
  const GoogleMapButton({
    super.key,
    @required this.title,
    this.buttonWidth = 0.90,
    this.buttonHeight = 60.0,
    this.fontSize = 12.0,
    this.color = AppColors.lightprimary,
    this.borderColor = AppColors.grey,
    this.widgetsColor = AppColors.primary,
    this.hasIcon = true,
    this.address,
    this.iconSvgPath = 'assets/icons/map.svg',
    @required this.onPressed,
  });
  final title;
  final color;
  final buttonHeight;
  final address;
  final fontSize;
  final buttonWidth;
  final onPressed;
  final hasIcon;
  final iconSvgPath;
  final borderColor;
  final widgetsColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: Get.width * buttonWidth,
        height: address != '' ? null : buttonHeight,
        padding: address != '' ? EdgeInsets.all(12) : null,
        decoration: ShapeDecoration(
          color: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(35),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (hasIcon)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: SvgPicture.asset(
                      iconSvgPath,
                      color: widgetsColor,
                      fit: BoxFit.scaleDown,
                      height: 22,
                      width: 22,
                    ),
                  ),
                Text(
                  title,
                  style: TextStyle(
                    color: widgetsColor,
                    fontSize: fontSize,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            if (address != '') Text('$address')
          ],
        ),
      ),
    );
  }
}
