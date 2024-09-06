// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';

import 'package:mobilegarage/vendor_app/utils/app_text/app_text.dart';

class EditButton extends StatelessWidget {
  const EditButton({
    super.key,
    this.width,
    this.icon,
    this.text,
    this.ontap,
  });
  final width;
  final icon;
  final text;
  final ontap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        height: 40,
        width: width,
        decoration: BoxDecoration(
          color: AppColors.light_red,
          border: Border.all(color: AppColors.primary_color),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
          child: Row(
            children: [
              SvgPicture.asset(
                icon,
                height: 13,
              ),
              AppText(
                title: '  ' + text,
                size: 10,
                color: AppColors.primary_color,
                fontWeight: FontWeight.w500,
              )
            ],
          ),
        ),
      ),
    );
  }
}
