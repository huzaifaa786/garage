// ignore_for_file: avoid_unnecessary_containers, prefer_typing_uninitialized_variables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:mobilegarage/vendor_app/app/notification/notification_controller.dart';
import 'package:mobilegarage/vendor_app/utils/app_colors/app_colors.dart';
import 'package:mobilegarage/vendor_app/utils/app_text/app_text.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({
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
    return GetBuilder<VNotificationController>(
      builder: (controller) => Padding(
        padding: const EdgeInsets.only(top: 12),
        child: Container(
          height: 110,
          decoration: BoxDecoration(color: AppColors.white_color),
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
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
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                        Column(
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
                                title: 'Ordered a $ordername ,click to accept ',
                                size: 11,
                                fontWeight: FontWeight.w600,
                              ),
                              Row(
                                children: [
                                  AppText(
                                    title: 'or reject order',
                                    size: 11,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  AppText(
                                    title: '  view',
                                    color: Colors.blue,
                                    size: 11,
                                    fontWeight: FontWeight.w600,
                                  )
                                ],
                              ),
                              Gap(6),
                              AppText(
                                title: 'now',
                                size: 11,
                              )
                            ]),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: InkWell(
                      onTap: () {},
                      child: Image.asset('assets/images/chat.png')),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
