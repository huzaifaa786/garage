// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/utils/app_text/app_text.dart';
import 'package:mobilegarage/utils/colors/app_color.dart';

class ChartsCard extends StatelessWidget {
  const ChartsCard({super.key, this.item});
  final item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: item["onTap"],
      child: Container(
        margin: EdgeInsets.only(bottom: 2),
        padding: EdgeInsets.symmetric(horizontal: 20),
        width: Get.width,
        height: 81,
        color: AppColors.white,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: CachedNetworkImage(
                imageUrl: item["imgurl"],
                height: 55,
              ),
            ),
            Gap(8),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  title: item["messagetitle"],
                  color: AppColors.darkprimary,
                  size: 14,
                  fontWeight: FontWeight.w600,
                ),
                Gap(4),
                Row(
                  children: [
                    AppText(
                      title: item["messageSubTitle"],
                      color: AppColors.grey,
                      size: 10,
                      fontWeight: FontWeight.w500,
                    ),
                    item["showBluedot"]
                        ? Container(
                            height: 5,
                            width: 5,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.darkblue,
                            ),
                          )
                        : SizedBox.shrink(),
                    AppText(
                      title: item['newMessage'],
                      size: 10,
                      fontWeight: FontWeight.w600,
                      color:
                          item["showcolor"] ? AppColors.black : AppColors.grey,
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
