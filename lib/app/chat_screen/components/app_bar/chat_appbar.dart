// ignore_for_file: prefer_typing_uninitialized_variables, prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';

import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/utils/app_text/app_text.dart';
import 'package:mobilegarage/utils/colors/app_color.dart';

class ChatTopBar extends StatelessWidget {
  const ChatTopBar({
    super.key,
    this.showicon,
    this.title,
  });
  final showicon;
  final title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 40, right: 80),
          child: Row(
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
              Gap(4),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: CachedNetworkImage(
                      imageUrl: "https://dummyimage.com/61x61/000/fff",
                      // color: AppColors.darkprimary,
                    ),
                  ),
                  Gap(8),
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
        ),
        Divider(
          thickness: 2,
          color: AppColors.grey.shade100,
        ),
      ],
    );
  }
}
