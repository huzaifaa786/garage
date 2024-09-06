// ignore_for_file: prefer_typing_uninitialized_variables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';

import 'package:mobilegarage/vendor_app/utils/app_text/app_text.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword(
      {super.key, this.icon, this.text, this.ontap, this.langtext = ''});
  final icon;
  final text;
  final ontap;
  final langtext;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: InkWell(
        onTap: ontap,
        child: Container(
          height: 49,
          width: Get.width * 0.8,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                          color: AppColors.white_color,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: SvgPicture.asset(icon),
                        )),
                    AppText(
                      title: '  ' + text,
                      size: 12,
                      color: AppColors.black_color,
                      fontWeight: FontWeight.w500,
                    ),
                    AppText(
                      title: '  ' + langtext,
                      size: 10,
                      color: const Color.fromARGB(255, 196, 195, 195),
                      fontWeight: FontWeight.w500,
                    )
                  ],
                ),
                SvgPicture.asset('assets/images/arrow.svg')
              ],
            ),
          ),
          decoration: BoxDecoration(
            color: AppColors.light_red,
            borderRadius: BorderRadius.circular(50),
          ),
        ),
      ),
    );
  }
}
