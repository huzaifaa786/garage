// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/cupertino.dart';

import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/user_app/utils/app_text/app_text.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';

class IconTopBar extends StatelessWidget {
  const IconTopBar({
    super.key,
    this.showicon,
    this.title,
  });
  final showicon;
  final title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 40, right: 120),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Image.asset(
                  "assets/images/back arrow.png",
                  color: AppColors.darkprimary,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              showicon
                  ? Image.asset(
                      'assets/images/chat withoutbackground.png',
                      // color: AppColors.darkprimary,
                    )
                  : Text(''),
              Gap(3),
              AppText(
                title: title,
                size: 16,
                textAlign: TextAlign.center,
                color: AppColors.darkprimary,
                fontWeight: FontWeight.w600,
              )
            ],
          ),
        ],
      ),
    );
  }
}
