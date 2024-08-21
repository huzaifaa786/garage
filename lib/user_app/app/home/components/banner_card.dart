// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
        borderRadius: isRectangle ? BorderRadius.circular(0) : BorderRadius.circular(10),
        child: CachedNetworkImage(
          imageUrl: picture,
          width: isRectangle ? Get.width : Get.width * 0.9,
          fit: BoxFit.fitWidth,
          placeholderFadeInDuration: Duration(milliseconds: 500),
          placeholder: (context, url) => Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              color: Colors.white,
              width: 60,
              height: 60,
            ),
          ),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
      ),
    );
  }
}
