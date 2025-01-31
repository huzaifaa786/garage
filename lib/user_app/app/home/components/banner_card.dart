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
    this.networkImage,
    this.assetPath = '',
  });

  final onTap;
  final picture;
  final bool isRectangle;
  final String? networkImage;
  final String? assetPath;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: isRectangle ? EdgeInsets.zero : const EdgeInsets.only(right: 5),
        child: ClipRRect(
          borderRadius:
              isRectangle ? BorderRadius.circular(0) : BorderRadius.circular(10),
          child: CachedNetworkImage(
            imageUrl: networkImage.toString(),
            width: isRectangle ? Get.width : Get.width * 0.9,
            fit: BoxFit.cover,
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
          ),
        ),
      
        
      ),
    );
  }
}
