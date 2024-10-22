// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/user_app/app/garage/garage_controller.dart';
import 'package:mobilegarage/user_app/utils/App_image_network/app_image_network.dart';
import 'package:mobilegarage/user_app/utils/app_text/app_text.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';

class GarageProductCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<GarageController>(
        builder: (controller) => Container(
              width: Get.width * 0.3,
              margin: EdgeInsets.only(bottom: 4),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.25),
                    blurRadius: 10,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(12),
                      ),
                    ),
                    child: ClipRRect(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(12)),
                        child: AppNetworkImage(
                          networkImage: controller
                              .garage!.products![0].images![0].imageUrl
                              .toString(),
                          assetPath: 'assets/images/washing.png',
                          width: double.infinity,
                          height: 80,
                          fit: BoxFit.cover,
                        )),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 8.0, right: 5.0, left: 5.0),
                    child: AppText(
                      title: controller.garage!.products![0].oilextra!.isEmpty
                          ? controller.garage!.products![0].brands!.name
                              .toString()
                          : controller.garage!.products![0].categoryId == '2'
                              ? controller.garage!.products![0].brands!.name
                                  .toString()
                              : controller
                                  .garage!.products![0].oilextra![0].name
                                  // '',
                                  .toString(),
                      fontWeight: FontWeight.w600,
                      size: 14.0,
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      // overFlow: TextOverflow.ellipsis,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 8.0, bottom: 8.0, right: 5.0, left: 5.0),
                    child: AppText(
                      title: controller.garage!.products![0].oilextra!.isEmpty
                          ? controller.garage!.products![0].description
                              .toString()
                          : controller
                              .garage!.products![0].oilextra![0].description
                              .toString(),
                      fontWeight: FontWeight.w400,
                      size: 10.0,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      overFlow: TextOverflow.ellipsis,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppText(
                        title: controller.garage!.products![0].oilextra!.isEmpty
                            ? controller.garage!.products![0].price.toString()
                            : controller.garage!.products![0].oilextra![0].price
                                .toString(),
                        color: Color.fromARGB(255, 0, 91, 165),
                        fontWeight: FontWeight.w600,
                        textAlign: TextAlign.center,
                        size: 10.0,
                        maxLines: 1,
                      ),
                      Gap(5),
                      AppText(
                        title: 'AED',
                        color: Color.fromARGB(255, 0, 91, 165),
                        textAlign: TextAlign.center,
                        fontWeight: FontWeight.w600,
                        size: 10.0,
                      ),
                    ],
                  ),
                  Gap(20),
                ],
              ),
            ));
  }
}
