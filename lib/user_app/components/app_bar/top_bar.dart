// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobilegarage/user_app/utils/app_text/app_text.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';

class TopBar extends StatelessWidget {
  const TopBar({
    super.key,
    this.title,
    this.showicon = true,
    this.showgarageicon = true,
    this.showtrailingicon = false,
    this.showstack = false,
    this.textColor = AppColors.darkprimary,
  });

  final String? title;
  final bool showicon;
  final bool showgarageicon;
  final bool showtrailingicon;
  final bool showstack;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    GetStorage box = GetStorage();
    return Stack(
      children: [
        Container(
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
                        child: box.read('locale') == 'ar'
                        ?SvgPicture.asset(
                                'assets/icons/backarrow_right.svg',
                                color: textColor,
                              )
                            : SvgPicture.asset(
                                'assets/icons/backarrow.svg',
                                color: textColor,
                              )
                            
                      )
                    : const SizedBox.shrink(),
                Row(
                  children: [
                    AppText(
                      title: '$title',
                      size: 16,
                      fontWeight: FontWeight.w600,
                      color: textColor,
                    ),
                    Gap(5),
                    if (showgarageicon)
                      SvgPicture.asset('assets/icons/authorizegarage.svg')
                  ],
                ),
                if (showtrailingicon)
                  Row(
                    children: [
                      Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                          color: AppColors.lightPink,
                          borderRadius: BorderRadius.circular(80),
                        ),
                        child: SvgPicture.asset(
                          'assets/icons/cart_new.svg',
                          color: AppColors.primarybg,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                      Gap(10),
                    ],
                  )
                else
                  AppText(
                    title: '*****',
                    color: Colors.transparent,
                  ),
              ],
            ),
          ),
        ),
        // Positioned(
        //   top: 1,
        //   right: 8,
        //   child: Container(
        //     height: 4,
        //     width: 4,
        //     decoration: BoxDecoration(
        //       borderRadius: BorderRadius.circular(10),
        //       color: AppColors.primary,
        //     ),
        //   ),
        // )
      ],
    );
  }
}
