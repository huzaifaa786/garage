// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/user_app/utils/App_image_network/app_image_network.dart';
import 'package:mobilegarage/user_app/utils/app_text/app_text.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';

class SSSSCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.32,
      margin: EdgeInsets.only(bottom: 4),
      // height: Get.height * 0.3 / 1.3,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.25),
            blurRadius: 10,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(12),
                  ),
                ),
                child: ClipRRect(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(12)),
                    child: AppNetworkImage(
                      assetPath: 'assets/images/washing.png',
                      width: double.infinity,
                      height: 80,
                    )),
              ),
              Positioned(
                top: 8,
                left: 8,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(60),
                    border: Border.all(
                      width: 2,
                      color: AppColors.lightPink,
                    ),
                  ),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(60),
                      child: AppNetworkImage(
                        assetPath: 'assets/images/street_garage.png',
                      )),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, right: 5.0, left: 5.0),
            child: Flexible(
              child: AppText(
                title: 'Super car oil',
                fontWeight: FontWeight.w600,
                size: 14.0,
                maxLines: 2,
                textAlign: TextAlign.center,
                overFlow: TextOverflow.ellipsis,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 8.0, bottom: 8.0, right: 5.0, left: 5.0),
            child: Flexible(
              child: AppText(
                title: 'Car oil 700 ml best quality for all car types',
                fontWeight: FontWeight.w400,
                size: 10.0,
                maxLines: 2,
                textAlign: TextAlign.center,
                overFlow: TextOverflow.ellipsis,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: AppText(
                  title: '29.99',
                  color: Color.fromARGB(255, 0, 91, 165),
                  fontWeight: FontWeight.w600,
                  textAlign: TextAlign.center,
                  size: 10.0,
                  maxLines: 1,
                ),
              ),
              Gap(5),
              Flexible(
                child: AppText(
                  title: 'AED',
                  color: Color.fromARGB(255, 0, 91, 165),
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.w600,
                  size: 10.0,
                ),
              ),
            ],
          ),
          Gap(20),
        ],
      ),
    );
  }
}
