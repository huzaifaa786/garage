// ignore_for_file: prefer_typing_uninitialized_variables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/models/product_model.dart';
import 'package:mobilegarage/user_app/utils/App_image_network/app_image_network.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';
import 'package:mobilegarage/vendor_app/app/product/products/component/button.dart';
import 'package:mobilegarage/vendor_app/utils/app_text/app_text.dart';
import 'package:mobilegarage/vendor_app/utils/ui_utils.dart';

class ProductCard extends StatelessWidget {
  ProductCard({super.key, this.product, this.ondeltap,this.oneditTap});

  ProductModel? product;
  final ondeltap;
  final oneditTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
              ClipRRect(
                  borderRadius: BorderRadius.circular(13),
                  child: AppNetworkImage(
                    networkImage: product!.images!.first.imageUrl,
                    assetPath: 'assets/images/battery.png',
                    height: 90,
                    width: 90,
                    fit: BoxFit.cover,
                  )),
              const Gap(10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      title: product!.description!.toString(),
                      size: 14,
                      fontWeight: FontWeight.w600,
                      maxLines: 2,
                    ),
                    // const Gap(6.0),
                    // AppText(
                    //   title: products!.description.toString(),
                    //   size: 12,
                    //   fontWeight: FontWeight.w500,
                    // ),
                    const Gap(6.0),
                    AppText(
                      title: product!.price.toString() + ' AED',
                      size: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.lightblue,
                    ),
                    const Gap(8.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        EdittButton(
                          ontap: oneditTap,
                          icon: 'assets/images/edit.svg',
                          width: Get.width * 0.22,
                          text: 'Edit',
                          color: AppColors.light_red,
                        ),
                        const Gap(12),
                        EdittButton(
                          ontap: () {
                            UiUtilites.confirmAlertDialog(
                              title:
                                  'Are you sure you want to delete this Product?',
                              context: Get.context,
                              onCancelTap: () {
                                Get.back();
                              },
                              onConfirmTap: ondeltap,
                              cancelText: 'No'.tr,
                              confirmText: 'Yes'.tr,
                            );
                          },
                          icon: 'assets/images/delete.svg',
                          width: Get.width * 0.22,
                          text: 'Delete',
                          color: AppColors.light_red,
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
