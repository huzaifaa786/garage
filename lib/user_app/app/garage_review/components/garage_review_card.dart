// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/user_app/utils/app_text/app_text.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';

class GarageReviewCard extends StatelessWidget {
  const GarageReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          color: AppColors.lightgrey,
        ),
        Gap(20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Container(
                      height: 6,
                      width: 6,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: AppColors.darkblue),
                    ),
                  ),
                  Gap(15),
                  ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: CachedNetworkImage(
                        imageUrl: 'https://dummyimage.com/93x93/000/fff',
                        height: 35,
                        width: 35,
                      )),
                  Gap(10),
                  ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: Get.width * 0.53),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          title: 'Street garage',
                          size: 12,
                          maxLines: 1,
                          overFlow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.w600,
                        ),
                        Gap(5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
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
                            ),
                          ],
                        ),
                        Gap(8),
                        AppText(
                          title:
                              'This is the best car washing i had ever ,thank you street garage!',
                          size: 10,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              AppText(
                title: '3h ago',
                size: 10,
                fontWeight: FontWeight.w600,
                color: AppColors.greybg,
              ),
            ],
          ),
        ),
        Gap(10)
      ],
    );
  }
}
