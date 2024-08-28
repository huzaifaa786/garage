// ignore_for_file: prefer_typing_uninitialized_variables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobilegarage/vendor_app/utils/app_colors/app_colors.dart';
import 'package:mobilegarage/vendor_app/utils/app_text/app_text.dart';



class EdittButton extends StatelessWidget {
  const EdittButton({
    super.key,
    this.icon,
    this.text,
    this.ontap,
    this.color,
    this.width,
  });
  final icon;
  final text;
  final ontap;
  final color;
  final width;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: InkWell(
        onTap: ontap,
        child: Container(
          height: 35,
          width: width,
           decoration: BoxDecoration(
          color: AppColors.light_red,
          border: Border.all(color: AppColors.primary_color),
          borderRadius: BorderRadius.circular(50),
        ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(icon,height: 15,),
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
      ),
    );
  }
}
