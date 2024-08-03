// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/utils/app_text/app_text.dart';
import 'package:mobilegarage/utils/colors/app_color.dart';

class TopBar extends StatelessWidget {
  const TopBar({
    super.key,
    this.title,
    this.showicon = true,
    this.textColor = AppColors.darkprimary,
  });

  final String? title;
  final bool showicon;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(left: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            showicon
                ? GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: SvgPicture.asset(
                      'assets/icons/backarrow.svg',
                      color: textColor,
                    ),
                  )
                : const SizedBox.shrink(),
            AppText(
              title: '$title',
              size: 16,
              fontWeight: FontWeight.w600,
              color: textColor,
            ),
            AppText(
              title: '*****',
              color: Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }
}
