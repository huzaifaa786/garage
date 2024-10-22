// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/app/cart/cart_controller.dart';
import 'package:mobilegarage/app/cart/components/cart_card.dart';
import 'package:mobilegarage/user_app/app/payment/components/icon_button.dart';
import 'package:mobilegarage/user_app/components/app_bar/top_bar.dart';
import 'package:mobilegarage/user_app/components/textfields/promocode_textfield.dart';
import 'package:mobilegarage/user_app/utils/app_text/app_text.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
      autoRemove: false,
      
      builder: (controller) => Scaffold(
        
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70.0),
          child: Container(
            decoration: BoxDecoration(
                ),
            child: AppBar(
              automaticallyImplyLeading: false,
              scrolledUnderElevation: 0.0,
              toolbarHeight: 95.0,
              title: TopBar(
                title: 'Cart',
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
                      title: 'Items ( ${controller.cart!.items!.length} )',
                      size: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
                Gap(10),
                controller.cart!=null
                ?ListView.builder(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemCount: controller.orders.length,
                    itemBuilder: (BuildContext context, int index) {
                      // final orders = controller.orders[index];
                                  final item = controller.cart!.items![index];

                      return Column(
                        children: [
                          CartCard(
                            item: item,
                          ),
                          Gap(20)
                        ],
                      );
                    }):Text(''),
                Row(
                  children: [
                    Gap(10),
                    AppText(
                      title: 'Promo code',
                      size: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
                Gap(6),
                PromocodeTextfield(
                  controller: controller.promocodeController,
                  hint: 'Promo Code'.tr,
                  errorText: '',
                  onTap: controller.promoCode,
                  isApplied: controller.isapplied,
                ),
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText(
                    title: 'Total:',
                    size: 12,
                    fontWeight: FontWeight.w500,
                    color: AppColors.black.withOpacity(0.4),
                  ),
                  Gap(10),
                  AppText(
                    title: '30.00AED',
                    size: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
              IconMainButton(
                buttonWidth: Get.width * 0.4,
                height: Get.height * 0.06,
                title: 'Purchase',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
