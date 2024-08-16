// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/app/cart/cart_controller.dart';
import 'package:mobilegarage/app/cart/components/cart_card.dart';
import 'package:mobilegarage/app/order_history/components/order_history_card.dart';
import 'package:mobilegarage/components/app_bar/top_bar.dart';
import 'package:mobilegarage/components/buttons/main_button.dart';
import 'package:mobilegarage/components/textfields/promocode_textfield.dart';
import 'package:mobilegarage/utils/app_text/app_text.dart';
import 'package:mobilegarage/utils/colors/app_color.dart';
import 'package:mobilegarage/utils/shadows/appbar_shadow.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
      builder: (controller) => Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(95.0),
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [appbarShadow],
            ),
            child: AppBar(
              automaticallyImplyLeading: false,
              scrolledUnderElevation: 0.0,
              toolbarHeight: 95.0,
              title: TopBar(title: 'Cart'),
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
                      title: 'Items ( ' + '2' + ' )',
                      size: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
                Gap(10),
                ListView.builder(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemCount: controller.orders.length,
                    itemBuilder: (BuildContext context, int index) {
                      final orders = controller.orders[index];
                      return Column(
                        children: [
                          CartCard(
                            orders: orders,
                          ),
                          Gap(20)
                        ],
                      );
                    }),
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
          height: 100,
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
              MainButton(
                buttonWidth: Get.width * 0.5,
                title: 'Purchase',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
