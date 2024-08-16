// ignore_for_file: avoid_unnecessary_containers, prefer_typing_uninitialized_variables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:mobilegarage/vendor_app/app/home/home_controller.dart';
import 'package:mobilegarage/vendor_app/utils/app_colors/app_colors.dart';
import 'package:mobilegarage/vendor_app/utils/app_text/app_text.dart';

class Reviewcard extends StatelessWidget {
  const Reviewcard({
    super.key,
    this.img = 'https://dummyimage.com/50x47/000/fff',
    this.ordername,
    this.name,
  });
  final img;
  final ordername;
  final name;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<VHomeController>(
      builder: (controller) => Padding(
        padding: const EdgeInsets.only(top: 4),
        child: Container(
          decoration: BoxDecoration(color: AppColors.white_color),
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 7,
                            width: 7,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.lightblue,
                            ),
                          ),
                          Gap(6),
                          Container(
                            height: 47,
                            width: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(38),
                              child: CachedNetworkImage(
                                imageUrl: controller.image?.isEmpty ?? true
                                    ? img
                                    : controller.image.toString(),
                                placeholder: (context, url) =>
                                    CircularProgressIndicator(),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Gap(8),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppText(
                                  title: name,
                                  fontWeight: FontWeight.w600,
                                  size: 12,
                                ),
                                Gap(10),
                                Row(
                                  children: [
                                    RatingBar.builder(
                                      initialRating: controller.ratings,
                                      minRating: 1,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: 5,
                                      glow: false,
                                      itemSize: 14,
                                      unratedColor: Colors.grey,
                                      itemPadding:
                                          EdgeInsets.symmetric(horizontal: 2.0),
                                      itemBuilder: (context, _) =>
                                          Icon(Icons.star, color: Colors.yellow),
                                      onRatingUpdate: (rating) {
                                        controller.updateRating(rating);
                                      },
                                    ),
                                    Gap(10),
                                    AppText(
                                      title: controller.ratings.toString(),
                                      size: 8.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ],
                                ),
                                AppText(
                                  maxLines: 2,
                                  title:
                                      'this battery is very good, and the delivery is fast .',
                                )
                              ],
                            ),
                          ),
                          AppText(
                            title: '3h ago',
                            color: Colors.grey,
                            size: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ],
                      ),
                    ),
                    
                  ],
                ),
                Gap(20),
                 Divider(
                        color: const Color.fromARGB(255, 209, 208, 208),
                        thickness: 1.0,
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
