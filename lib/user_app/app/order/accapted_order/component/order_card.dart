// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/user_app/app/order/accapted_order/accapted_order_controller.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';
import 'package:mobilegarage/vendor_app/utils/app_text/app_text.dart';
import 'package:shimmer/shimmer.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AccaptedOrderController>(
      builder: (controller) => Container(
        width: Get.width * 0.9,
        decoration: BoxDecoration(
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              children: [
                CachedNetworkImage(
                  imageUrl: 'https://dummyimage.com/70x70/000/fff',
                  height: 170,
                  width: Get.width * 0.57,
                  fit: BoxFit.fill,
                  placeholderFadeInDuration: Duration(milliseconds: 500),
                  placeholder: (context, url) => Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      color: Colors.white,
                      height: 170,
                    ),
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
                Gap(4),
                Flexible(
                  child: Column(
                    children: [
                      Gap(4),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(60)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(60),
                          child: CachedNetworkImage(
                            height: 72,
                            // width: Get.width * 0.21,
                            imageUrl:
                                'https://dummyimage.com/600x400/40d123/0dff00',
                            fit: BoxFit.cover,
                            placeholderFadeInDuration:
                                Duration(milliseconds: 500),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                        ),
                      ),
                      AppText(
                        title: 'Super car oil',
                        size: 11,
                        fontWeight: FontWeight.w600,
                      ),
                      Gap(4),
                      AppText(
                        title:
                            'Car oil 700 ml best quality for all car types',
                        size: 9,
                        fontWeight: FontWeight.w400,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overFlow: TextOverflow.ellipsis,
                      ),
                      Row(
                        children: [
                          AppText(
                            title: '34 AED',
                            size: 9,
                            fontWeight: FontWeight.w500,
                            color: AppColors.darkblue,
                          ),
                        ],
                      ),
                      Gap(4),
                    ],
                  ),
                ),
                Gap(4),
              ],
            ),
            Row(
              children: [
                AppText(
                  title: 'Street Garage ',
                  size: 13,
                  fontWeight: FontWeight.w600,
                ),
                Gap(3),
                AppText(
                  title: '14 Services',
                  size: 9,
                  fontWeight: FontWeight.w500,
                  color: AppColors.darkblue,
                )
              ],
            ),
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
                  itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
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
            Row(
              children: [Icon(Icons.location_on_outlined)],
            ),
          ],
        ),
      ),
    );
  }
}
