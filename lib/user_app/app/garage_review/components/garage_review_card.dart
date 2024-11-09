// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/models/garage_reviews_model.dart';
import 'package:mobilegarage/user_app/utils/App_image_network/app_image_network.dart';
import 'package:mobilegarage/user_app/utils/app_text/app_text.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';

class GarageReviewCard extends StatelessWidget {
  GarageReviewCard({super.key, this.garageReview});
  GarageReviewsModel? garageReview;
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
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                      child: AppNetworkImage(
                        assetPath: 'assets/images/street_garage.png',
                        networkImage: garageReview!.user!.image != null
                            ? garageReview!.user!.image.toString()
                            : null,
                      )),
                  Gap(10),
                  ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: Get.width * 0.53),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppText(
                              // title: 'Street garage',
                              title: garageReview!.user!.name.toString(),
                              size: 12,
                              maxLines: 1,
                              overFlow: TextOverflow.ellipsis,
                              fontWeight: FontWeight.w600,
                            ),
                            AppText(
                              title:
                                  garageReview!.createdAtRelative.toString().tr,
                              size: 10,
                              fontWeight: FontWeight.w600,
                              color: AppColors.greybg,
                            ),
                          ],
                        ),
                        Gap(5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            RatingBarIndicator(
                              rating:
                                  double.parse(garageReview!.rating.toString()),
                              itemCount: 5,
                              itemSize: 11,
                              unratedColor: AppColors.black.withOpacity(0.5),
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                            ),
                            // Gap(3),
                            // AppText(
                            //   title: '4.0',
                            //   size: 10,
                            // ),
                          ],
                        ),
                        Gap(8),
                        if (garageReview!.comment != null)
                          AppText(
                            title: garageReview!.comment.toString(),
                            size: 10,
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Gap(10)
      ],
    );
  }
}
