// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:mobilegarage/routes/app_routes.dart';
import 'package:mobilegarage/user_app/utils/App_image_network/app_image_network.dart';
import 'package:mobilegarage/vendor_app/app/product/products/component/button.dart';
import 'package:mobilegarage/vendor_app/app/product/products/products_controller.dart';
import 'package:mobilegarage/vendor_app/utils/app_colors/app_colors.dart';
import 'package:mobilegarage/vendor_app/utils/app_text/app_text.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    this.img = 'assets/images/washing.png',
    this.price,
  });
  final img;
  final price;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VProductsController>(
      builder: (controller) => Padding(
        padding: const EdgeInsets.only(top: 13),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.white_color,
            boxShadow: [
              const BoxShadow(
                color: Colors.grey,
                blurRadius: 4,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      // child: CachedNetworkImage(
                      //   imageUrl: controller.image?.isEmpty ?? true
                      //       ? img
                      //       : controller.image.toString(),
                      //   placeholder: (context, url) =>
                      //       const CircularProgressIndicator(),
                      //   errorWidget: (context, url, error) =>
                      //       const Icon(Icons.error),
                      //   fit: BoxFit.cover,
                      // ),
                      child: AppNetworkImage(
                        assetPath: 'assets/images/black_tyre.png',
                        width: Get.width,
                      )),
                ),
                const Gap(10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AppText(
                      title: 'Car Tyre',
                      size: 14,
                      fontWeight: FontWeight.w600,
                    ),
                    AppText(
                      title: price + ' AED',
                      size: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.lightblue,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        EdittButton(
                          ontap: () {
                            Get.toNamed(AppRoutes.vproduct_form_view);
                          },
                          icon: 'assets/images/edit.svg',
                          width: Get.width * 0.22,
                          text: 'Edit',
                          color: AppColors.light_red,
                        ),
                        const Gap(12),
                        EdittButton(
                          icon: 'assets/images/delete.svg',
                          width: Get.width * 0.22,
                          text: 'Delete',
                          color: AppColors.light_red,
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
