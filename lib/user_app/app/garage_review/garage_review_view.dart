// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/user_app/app/garage/garage_controller.dart';
import 'package:mobilegarage/user_app/app/garage_review/components/garage_review_card.dart';
import 'package:mobilegarage/user_app/utils/app_text/app_text.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';

class GarageReviewBottomSheetView extends StatelessWidget {
  const GarageReviewBottomSheetView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GarageController>(
        builder: (controller) => Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                  color: AppColors.white),
              child: Wrap(
                children: [
                  SizedBox(
                    width: Get.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Gap(40),
                        AppText(
                          title: 'Reviews'.tr,
                          size: 14,
                          fontWeight: FontWeight.w600,
                        ),
                        Gap(20),
                        controller.garageReviews.isNotEmpty
                            ? ListView.builder(
                                itemCount: controller.garageReviews.length,
                                shrinkWrap: true,
                                physics: BouncingScrollPhysics(),
                                itemBuilder: (context, index) =>
                                    GarageReviewCard(
                                  garageReview: controller.garageReviews[index],
                                ),
                              )
                            : SizedBox(
                              height: Get.height*0.2,
                              child: Center(
                                child: AppText(
                                  title: 'No Review found!'.tr,
                                  color: AppColors.black.withOpacity(0.3),
                                ),
                              ),
                            ),
                        Divider(
                          color: AppColors.lightgrey,
                        ),
                        Gap(50),
                      ],
                    ),
                  )
                ],
              ),
            ));
  }
}
