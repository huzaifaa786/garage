import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/user_app/app/home/home_controller.dart';
import 'package:mobilegarage/user_app/components/textfields/main_input.dart';
import 'package:mobilegarage/user_app/utils/app_text/app_text.dart';
import 'dart:ui';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';
import 'package:mobilegarage/vendor_app/utils/app_button/app_button.dart';

class RatingAlertDialog extends StatelessWidget {
  final String garagetitle;
  final String? garageimg;

  const RatingAlertDialog({Key? key, required this.garagetitle, this.garageimg})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) => GestureDetector(
        // onTap: controller.toggleSelection,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
          child: Center(
            child: SingleChildScrollView(
              child: Stack(
                alignment: Alignment.topCenter,
                clipBehavior: Clip.none,
                children: [
                  AlertDialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 15),
                    backgroundColor: Colors.white,
                    surfaceTintColor: Colors.white,
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Gap(20),
                        AppText(
                          title: garagetitle,
                          size: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.primary_color,
                          textAlign: TextAlign.center,
                        ),
                        Gap(15),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: AppText(
                            title:
                                'Your order has been \ndelivered! We enjoy serving \n you Please rate us.'
                                    .tr,
                            textAlign: TextAlign.center,
                            size: 13,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Gap(10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RatingBar.builder(
                              initialRating: controller.ratingss,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              glow: false,
                              itemSize: 22,
                              unratedColor: AppColors.divider_color,
                              itemPadding:
                                  EdgeInsets.symmetric(horizontal: 2.0),
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: AppColors.orange,
                              ),
                              onRatingUpdate: (rating) {
                                controller.updateRatingg(rating);
                              },
                            ),
                          ],
                        ),
                        Gap(20),
                        MainInput(
                          hint: 'Type a comment..'.tr,
                          controller: controller.ratingController,
                          errorText: '',
                        ),
                        Gap(20),
                        AppButton(
                          buttonColor: AppColors.primary_color,
                          buttonWidth: 0.5,
                          title: 'Submit'.tr,
                          ontap: () {
                            controller.storeRating();
                          },
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: -10,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(53),
                      child: CachedNetworkImage(
                        imageUrl: garageimg.toString(),
                        // height: 100,
                        // width: 100,
                        height: Get.height * 0.08,
                        // width: Get.width*0.2,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
