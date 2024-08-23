// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/routes/app_routes.dart';
import 'package:mobilegarage/user_app/app/payment/components/payment_checkout_card.dart';
import 'package:mobilegarage/user_app/app/payment/payment_controller.dart';
import 'package:mobilegarage/user_app/components/buttons/main_button.dart';
import 'package:mobilegarage/user_app/utils/app_text/app_text.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';
import 'package:mobilegarage/user_app/utils/ui_utils/ui_utils.dart';

class PaymentBottomsheet extends StatelessWidget {
  const PaymentBottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PaymentsController>(
      builder: (controller) => ConstrainedBox(
        constraints: BoxConstraints(maxHeight: Get.height * 0.8),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)
          ),
          child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                  color: AppColors.lightgrey),
              child: SingleChildScrollView(
                child: Wrap(children: [
                  SizedBox(
                      width: Get.width,
                      child: SingleChildScrollView(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Gap(40),
                              AppText(
                                title: 'Summary',
                                size: 14,
                                fontWeight: FontWeight.w600,
                              ),
                              Gap(20),
                              ListView.builder(
                                shrinkWrap: true,
                                physics: BouncingScrollPhysics(),
                                itemCount: controller.orders.length,
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      PaymentCheckoutCard(
                                        orders: controller.orders[index],
                                      ),
                                      Gap(15),
                                    ],
                                  );
                                },
                              ),
                              Gap(30),
                              Container(
                                width: Get.width,
                                decoration: BoxDecoration(
                                  color: AppColors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: AppColors.black.withOpacity(0.1),
                                        blurRadius: 4),
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30, vertical: 10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Gap(10),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          AppText(
                                            title: 'Total:',
                                            size: 10,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          AppText(
                                            title: '30.50 AED',
                                            size: 14,
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.darkblue,
                                          ),
                                        ],
                                      ),
                                      Gap(20),
                                    ],
                                  ),
                                ),
                              ),
                              Gap(20),
                              Container(
                                width: Get.width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(30),
                                      topRight: Radius.circular(30)),
                                  color: AppColors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.25),
                                      blurRadius: 4,
                                    ),
                                  ],
                                ),
                                child: Center(
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 20),
                                    child: MainButton(
                                      buttonWidth: Get.width * 0.7,
                                      title: 'Checkout',
                                      onTap: () {
                                        Get.toNamed(AppRoutes.main);
                        },
                                    ),
                                  ),
                                ),
                              ),
                            ]),
                      ))
                ]),
              )),
        ),
      ),
    );
  }
}
