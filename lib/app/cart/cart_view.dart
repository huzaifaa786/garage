// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/app/cart/cart_controller.dart';
import 'package:mobilegarage/app/cart/components/cart_card.dart';
import 'package:mobilegarage/routes/app_routes.dart';
import 'package:mobilegarage/user_app/app/payment/components/icon_button.dart';
import 'package:mobilegarage/user_app/components/app_bar/top_bar.dart';
import 'package:mobilegarage/user_app/utils/app_text/app_text.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';
import 'package:mobilegarage/vendor_app/utils/ui_utils.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
      autoRemove: false,
      initState: (state) {
        Future.delayed(Duration(milliseconds: 100), () {
          state.controller!.getCartData();
        });
      },
      builder: (controller) => controller.cart != null
          ? Scaffold(
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(70.0),
                child: Container(
                  decoration: BoxDecoration(),
                  child: AppBar(
                    automaticallyImplyLeading: false,
                    scrolledUnderElevation: 0.0,
                    toolbarHeight: 95.0,
                    title: TopBar(
                      title: 'Cart'.tr,
                      showgarageicon: false,
                      showicon: false,
                    ),
                  ),
                ),
              ),
              body: SafeArea(
                  child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
                      Gap(30),
                      Row(
                        children: [
                          AppText(
                            title: "Items (".tr +
                                " " +
                                '${controller.cart!.items!.length} )',
                            size: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ],
                      ),
                      Gap(10),
                      controller.cart != null
                          ? ListView.builder(
                              shrinkWrap: true,
                              physics: BouncingScrollPhysics(),
                              itemCount: controller.cart!.items!.length,
                              itemBuilder: (BuildContext context, int index) {
                                // final orders = controller.orders[index];
                                final item = controller.cart!.items![index];

                                return Column(
                                  children: [
                                    CartCard(
                                      item: item,
                                      ontap: () {
                                        UiUtilites.confirmAlertDialog(
                                          context: context,
                                          onCancelTap: () {
                                            Get.back();
                                          },
                                          onConfirmTap: () async {
                                            controller.deleteCartItems(
                                                item.id.toString());
                                          },
                                          title:
                                              'Are you Sure that you want\n to delete this product ?'
                                                  .tr,
                                          cancelText: 'No'.tr,
                                          confirmText: 'Yes'.tr,
                                        );
                                        // UiUtilites.showConfirmationDialog(
                                        //   false,
                                        //   'Are you Sure that you want\n to delete this product ?'
                                        //       .tr,
                                        //   onConfirm: () async {
                                        //     controller.deleteCartItems(
                                        //         item.id.toString());
                                        //   },
                                        // );
                                      },
                                    ),
                                    Gap(20)
                                  ],
                                );
                              })
                          : Text(''),
                      // Row(
                      //   children: [
                      //     Gap(10),
                      //     AppText(
                      //       title: 'Promo code',
                      //       size: 13,
                      //       fontWeight: FontWeight.w600,
                      //     ),
                      //   ],
                      // ),
                      // Gap(6),
                      // PromocodeTextfield(
                      //   controller: controller.promocodeController,
                      //   hint: 'Promo Code'.tr,
                      //   errorText: '',
                      //   onTap: controller.promoCode,
                      //   isApplied: controller.isapplied,
                      // ),
                    ],
                  ),
                ),
              )),
              bottomNavigationBar: Container(
                height: 90,
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.grey.withOpacity(0.4))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppText(
                          title: 'Total:'.tr,
                          size: 13,
                          fontWeight: FontWeight.w500,
                          color: AppColors.black.withOpacity(0.4),
                        ),
                        Gap(10),
                        AppText(
                          title: controller.cart!.totalAmount.toString() +
                              ' ' +
                              'AED'.tr,
                          size: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ],
                    ),
                    IconMainButton(
                      onTap: () {
                        Get.toNamed(AppRoutes.search_result, parameters: {
                          'garageid': controller.cart!.garageId.toString(),
                        });
                      },
                      buttonWidth: Get.width * 0.4,
                      height: Get.height * 0.06,
                      title: 'Purchase'.tr,
                    ),
                  ],
                ),
              ),
            )
          : Center(
              child: Text(
              'No item Yet!'.tr,
              style: TextStyle(color: AppColors.greybg),
            )),
    );
  }
}
