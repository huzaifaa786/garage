// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/app/cart/components/cart_card.dart';
import 'package:mobilegarage/user_app/app/payment/components/payment_bottomsheet.dart';
import 'package:mobilegarage/user_app/app/payment/payment_controller.dart';
import 'package:mobilegarage/user_app/components/app_bar/top_bar.dart';
import 'package:mobilegarage/user_app/components/buttons/main_button.dart';
import 'package:mobilegarage/user_app/components/textfields/promocode_textfield.dart';
import 'package:mobilegarage/user_app/utils/app_text/app_text.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';
import 'package:mobilegarage/user_app/utils/shadows/appbar_shadow.dart';

class PaymentView extends StatelessWidget {
  const PaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PaymentsController>(
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
              title: TopBar(title: 'Payment'),
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      title: 'Date &Time',
                      size: 10,
                      fontWeight: FontWeight.w500,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: AppColors.lightprimary,
                          borderRadius: BorderRadius.circular(5)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            AppText(
                              title: '18 March 2024',
                              size: 10,
                              fontWeight: FontWeight.w500,
                            ),
                            Gap(9),
                            AppText(
                              title: '09:00 am',
                              size: 10,
                              fontWeight: FontWeight.w500,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
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
                Gap(20)
              ],
            ),
          ),
        )),
        bottomNavigationBar: Container(
          height: Get.height * 0.24,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            color: AppColors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                blurRadius: 4,
                offset: Offset(4, 4),
              ),
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                blurRadius: 4,
                offset: Offset(-4, -4),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Gap(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    AppText(
                      title: 'Sub total:',
                      size: 10,
                      fontWeight: FontWeight.w500,
                    ),
                    AppText(
                      title: '100.50 AED',
                      size: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
                Gap(15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    AppText(
                      title: 'discount:',
                      size: 10,
                      fontWeight: FontWeight.w500,
                    ),
                    AppText(
                      title: '70.50 AED',
                      size: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
                Gap(15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    AppText(
                      title: 'Total:',
                      size: 10,
                      fontWeight: FontWeight.w500,
                    ),
                    AppText(
                      title: '30.50 AED',
                      size: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
                Gap(20),
                MainButton(
                  buttonWidth: Get.width * 0.7,
                  title: 'Pay',
                  onTap: () {
                    Get.bottomSheet(
                      PaymentBottomsheet(),
                      isScrollControlled: true,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}