// ignore_for_file: prefer_typing_uninitialized_variables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';

import 'package:mobilegarage/vendor_app/utils/app_text/app_text.dart';

class AcceptedButton extends StatelessWidget {
  const AcceptedButton({
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
          height: 40,
          width: width,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppText(
                  title: '  ' + text,
                  size: 10,
                  color: AppColors.white_color,
                  fontWeight: FontWeight.w500,
                )
              ],
            ),
          ),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(50),
          ),
        ),
      ),
    );
  }
}
