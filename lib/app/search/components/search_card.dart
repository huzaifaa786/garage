// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/utils/app_text/app_text.dart';
import 'package:mobilegarage/utils/colors/app_color.dart';

class SearchCard extends StatelessWidget {
  final String? image;
  final String? logoimage;

  final String? title;
  final String? services;

  final VoidCallback? onTap;
  final String? price;

  const SearchCard({
    this.image,
    this.services,
    this.title,
    this.onTap,
    this.price,
    this.logoimage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: Get.width * 0.28,
      // height: Get.height * 0.2,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 4,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                  borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                  child: CachedNetworkImage(
                    imageUrl: image!,
                    height: Get.height * 0.15,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
              ),
              Positioned(
                top: 15,
                left: 15,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(60),
                    border: Border.all(
                      width: 2,
                      color: AppColors.lightprimary,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(60),
                    child: CachedNetworkImage(
                      imageUrl: logoimage!,
                      fit: BoxFit.cover,
                      height: 26,
                      width: 26,
                      placeholder: (context, url) =>
                          CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText(
                      title: title!,
                      fontWeight: FontWeight.w600,
                      size: 12,
                    ),
                    AppText(
                      title: services!,
                      fontWeight: FontWeight.w500,
                      size: 10.0,
                      color: Colors.blue,
                    ),
                  ],
                ),
                Gap(7),
                Row(
                  children: [
                    RatingBarIndicator(
                      rating: 4.0,
                      itemCount: 5,
                      itemSize: 11,
                      unratedColor: AppColors.black.withOpacity(0.5),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                    ),
                    Gap(3),
                    AppText(
                      title: '4.0',
                      size: 10,
                      fontWeight: FontWeight.w500,
                    )
                  ],
                ),
                Gap(7),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset('assets/icons/map_pin.svg'),
                    Gap(5),
                    SizedBox(
                      width: Get.width * 0.73,
                      child: AppText(
                        title: 'Dubai Zayed street , road 3452 ',
                        size: 11,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25, bottom: 10),
                  child: Row(
                    children: [
                      ClipPath(
                        clipper: RightCircularClipper(),
                        child: Container(
                          padding: EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                              color: Colors.red.withOpacity(0.1),
                              // border: Border.all(),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  bottomLeft: Radius.circular(20))),
                          height: 50,
                          width: Get.width * 0.6,
                          child: Center(
                            child: Text(
                              'View garage',
                              style: TextStyle(color: Colors.red, fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                      Image.asset(
                        'assets/images/chat.png',
                        height: 31,
                        width: 32,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class RightCircularClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double radius = size.height / 3;
    Path path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width - radius, 0)
      ..arcToPoint(
        Offset(size.width - radius, size.height),
        radius: Radius.circular(radius),
        clockwise: false,
      )
      ..lineTo(0, size.height)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
