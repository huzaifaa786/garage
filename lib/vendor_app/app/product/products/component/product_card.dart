// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:mobilegarage/vendor_app/app/product/products/component/button.dart';
import 'package:mobilegarage/vendor_app/app/product/products/products_controller.dart';
import 'package:mobilegarage/vendor_app/utils/app_colors/app_colors.dart';
import 'package:mobilegarage/vendor_app/utils/app_text/app_text.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    this.img = 'https://dummyimage.com/50x47/000/fff',
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
              BoxShadow(
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
                    child: CachedNetworkImage(
                      imageUrl: controller.image?.isEmpty ?? true
                          ? img
                          : controller.image.toString(),
                      placeholder: (context, url) =>
                          CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Gap(10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      title: 'Car Tyre',
                      size: 14,
                      fontWeight: FontWeight.w600,
                    ),
                    AppText(
                      title: price+' AED',
                      size: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.lightblue,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        EdittButton(
                          icon: 'assets/images/edit.svg',
                          width: Get.width * 0.25,
                          text: 'Edit',
                          color: AppColors.light_red,
                        ),
                        Gap(12),
                        EdittButton(
                          icon: 'assets/images/delete.svg',
                          width: Get.width * 0.25,
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
