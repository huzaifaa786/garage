// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';

class AppNetworkImage extends StatelessWidget {
  const AppNetworkImage({
    super.key,
    this.networkImage,
    this.height = 42.0,
    this.width = 42.0,
    this.assetPath = '',
    this.fit = BoxFit.contain,
  });
  final String? networkImage;
  final double? height;
  final double? width;
  final String assetPath;
  final fit;
  @override
  Widget build(BuildContext context) {
      if (networkImage == null || networkImage!.isEmpty) {
      // Display asset image or fallback widget
      return assetPath.isNotEmpty
          ? Image.asset(
              assetPath,
              fit: fit,
              width: width,
              height: height,
            )
          : Icon(Icons.error, size: width);
    }

    // CachedNetworkImage for valid networkImage URL
    return CachedNetworkImage(
      imageUrl: networkImage!,
      height: height,
      width: width,
      fit: fit,
      placeholderFadeInDuration: Duration(milliseconds: 500),
      placeholder: (context, url) => Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(color: Colors.white, width: width, height: height),
      ),
      errorWidget: (context, url, error) => assetPath.isNotEmpty
          ? Image.asset(
              assetPath,
              fit: BoxFit.cover,
              width: width,
              height: height,
            )
          : Icon(Icons.error, size: width),
    );
    // return CachedNetworkImage(
    //   imageUrl: networkImage.toString(),
    //   height: height,
    //   width: width,
    //   fit: fit,
    //   placeholderFadeInDuration: Duration(milliseconds: 500),
    //   placeholder: (context, url) => Shimmer.fromColors(
    //     baseColor: Colors.grey[300]!,
    //     highlightColor: Colors.grey[100]!,
    //     child: Container(color: Colors.white, width: width, height: height),
    //   ),
    //   errorWidget: (context, url, error) => assetPath.isNotEmpty
    //       ? Image.asset(
    //           assetPath!,
    //           fit: BoxFit.cover,
    //         )
    //       : Icon(Icons.error),
    // );
  }
}
