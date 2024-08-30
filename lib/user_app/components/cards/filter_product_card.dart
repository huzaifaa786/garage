// ignore_for_file: prefer_const_constructors, use_super_parameters, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/user_app/utils/App_image_network/app_image_network.dart';
import 'package:mobilegarage/user_app/utils/app_text/app_text.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';

class FilterProductCard extends StatelessWidget {
  String? imageUrl;
  String? productname;
  String? produstdiscription;

  FilterProductCard(
      {Key? key, this.imageUrl, this.productname, this.produstdiscription})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.1),
            blurRadius: 4.0,
          ),
          BoxShadow(
            color: AppColors.black.withOpacity(0.1),
            blurRadius: 4.0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: AppNetworkImage(
              assetPath: 'assets/images/mobiloil.png',
              height: 70,
              width: 70,

              //  CachedNetworkImage(
              //   imageUrl: imageUrl!,
              //   height: Get.height * 0.1,
              //   width: Get.width * 0.3,
              // fit: BoxFit.cover,
              // placeholder: (context, url) => CircularProgressIndicator(),
              // errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          Gap(8),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: Get.width * 0.27),
            child: AppText(
              title: productname!,
              fontWeight: FontWeight.w700,
              size: 9.0,
              textAlign: TextAlign.center,
              overFlow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          Gap(8),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: Get.width * 0.25),
            child: AppText(
              title: produstdiscription!,
              fontWeight: FontWeight.w500,
              size: 5.0,
              textAlign: TextAlign.center,
              overFlow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
        ],
      ),
    );
  }
}
