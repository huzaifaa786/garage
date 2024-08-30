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
  });
  final String? networkImage;
  final double? height;
  final double? width;
  final String? assetPath;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: networkImage.toString(),
      height: height,
      width: width,
      fit: BoxFit.cover,
      placeholderFadeInDuration: Duration(milliseconds: 500),
      placeholder: (context, url) => Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(color: Colors.white, width: width, height: height),
      ),
      errorWidget: (context, url, error) =>
          assetPath != '' ? Image.asset(assetPath!,fit: BoxFit.cover,) : Icon(Icons.error),
    );
  }
}