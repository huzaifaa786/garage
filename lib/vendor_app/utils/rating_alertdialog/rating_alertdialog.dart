import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/user_app/components/textfields/main_input.dart';
import 'dart:ui';

import 'package:mobilegarage/user_app/utils/colors/app_color.dart';
import 'package:mobilegarage/vendor_app/app/home/home_controller.dart';

class RatingAlertDialog extends StatelessWidget {
  final String gatagetitle;

  const RatingAlertDialog({
    Key? key,
    required this.gatagetitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VHomeController>(
      builder: (controller) => GestureDetector(
        onTap: controller.toggleSelection,
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
                    contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                    backgroundColor: Colors.white,
                    surfaceTintColor: Colors.white,
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                       
                       Gap(15),
                        Text(
                          gatagetitle,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColors.primary,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 10),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Text(
                            'Your order has been delivered!',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Text(
                            'We enjoy serving you',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Text(
                            'Please rate us.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                        Gap(3),
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
                              unratedColor: Colors.grey,
                              itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                              itemBuilder: (context, _) =>
                                  Icon(Icons.star, color: Colors.yellow),
                              onRatingUpdate: (rating) {
                                controller.updateRatingg(rating);
                              },
                            ),
                          ],
                        ),
                        Gap(20),
                        MainInput(
                          hint: 'Type a comment..'.tr,
                          controller: controller.nameController,
                          errorText: '',
                        ),
                        Gap(10),
                      ],
                    ),
                  ),
                  Positioned(
                    top: -10, // Adjust the value based on the image size
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(53),
                      child: CachedNetworkImage(
                        imageUrl: controller.img,
                        // height: 100, 
                        // width: 100, 
                        height: Get.height*0.1, 
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

class MyWidget extends StatelessWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return RatingAlertDialog(
              gatagetitle: 'Street garage',
            );
          },
        );
      },
     
    );
  }
}
