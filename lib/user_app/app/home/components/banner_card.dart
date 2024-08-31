// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/user_app/utils/App_image_network/app_image_network.dart';
import 'package:shimmer/shimmer.dart';

class BannerCard extends StatelessWidget {
  const BannerCard({
    super.key,
    this.onTap,
    this.picture,
    this.isRectangle = false,
  });

  final onTap;
  final picture;
  final bool isRectangle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: isRectangle ? EdgeInsets.zero : const EdgeInsets.only(right: 5),
      child: ClipRRect(
          borderRadius: isRectangle
              ? BorderRadius.circular(0)
              : BorderRadius.circular(10),
          child: AppNetworkImage(
            assetPath: 'assets/images/washing.png',
            width: Get.width,
          )),
    );
  }
}
