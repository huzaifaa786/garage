// ignore_for_file: avoid_unnecessary_containers, prefer_typing_uninitialized_variables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/models/notifications_model.dart';
import 'package:mobilegarage/routes/app_routes.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';
import 'package:mobilegarage/vendor_app/app/notification/notification_controller.dart';
import 'package:mobilegarage/vendor_app/utils/app_text/app_text.dart';

class NotificationCard extends StatelessWidget {
  NotificationCard({
    super.key,
    this.img = 'https://dummyimage.com/50x47/000/fff',
    // this.ordername,
    // this.name,
    this.notifications,
  });
  final img;
  // final ordername;
  // final name;
  NotificationsModel? notifications;
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
                    const Gap(6),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(60),
                          child: CachedNetworkImage(
                            imageUrl: notifications!.userImage == null
                                ? img
                                : notifications!.userImage.toString(),
                            placeholder: (context, url) =>
                                const CircularProgressIndicator(),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                            fit: BoxFit.cover,
                          ),
                        ),
                        const Gap(8),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText(
                                title: notifications!.username.toString(),
                                fontWeight: FontWeight.w600,
                                size: 12,
                              ),
                              const Gap(10),
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
                                    itemPadding: const EdgeInsets.symmetric(
                                        horizontal: 2.0),
                                    itemBuilder: (context, _) => const Icon(
                                        Icons.star,
                                        color: Colors.yellow),
                                    onRatingUpdate: (rating) {
                                      controller.updateRating(rating);
                                    },
                                  ),
                                  const Gap(10),
                                  AppText(
                                    title: controller.ratings.toString(),
                                    size: 8.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ],
                              ),
                              AppText(
                                title: 'Ordered a ${notifications!.categoryName.toString()} ,click to accept ',
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
                                  GestureDetector(
                                    onTap: () {
                                      Get.toNamed(AppRoutes.orders);
                                    },
                                    child: AppText(
                                      title: '  view',
                                      color: Colors.blue,
                                      size: 11,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )
                                ],
                              ),
                              const Gap(6),
                              const AppText(
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
