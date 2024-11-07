// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/user_app/app/payment/components/date_location_card.dart';
import 'package:mobilegarage/user_app/app/payment/components/icon_button.dart';
import 'package:mobilegarage/user_app/app/payment/components/payment_cart_card.dart';
import 'package:mobilegarage/user_app/app/payment/payment_controller.dart';
import 'package:mobilegarage/user_app/components/app_bar/top_bar.dart';
import 'package:mobilegarage/user_app/components/textfields/promocode_textfield.dart';
import 'package:mobilegarage/user_app/utils/app_text/app_text.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';
import 'package:mobilegarage/user_app/utils/shadows/appbar_shadow.dart';
import 'package:mobilegarage/vendor_app/utils/app_constants/text_strings.dart';
import 'package:mobilegarage/vendor_app/utils/ui_utils.dart';

class PaymentView extends StatelessWidget {
  const PaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PaymentsController>(
      builder: (controller) => controller.cart != null
          ? Scaffold(
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(70.0),
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [appbarShadow],
                  ),
                  child: AppBar(
                    automaticallyImplyLeading: false,
                    scrolledUnderElevation: 0.0,
                    toolbarHeight: 95.0,
                    title: TopBar(
                      title: 'Payment'.tr,
                      showgarageicon: false,
                    ),
                  ),
                ),
              ),
              body: SafeArea(
                  child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: controller.cart != null
                      ? Column(
                          children: [
                            Gap(30),
                            Row(
                              children: [
                                AppText(
                                  title: "${'Items'.tr}" +
                                      " " +
                                      "(${controller.cart!.items!.length})",
                                  size: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ],
                            ),
                            Gap(10),
                            ListView.builder(
                                shrinkWrap: true,
                                physics: BouncingScrollPhysics(),
                                itemCount: controller.cart!.items!.length,
                                itemBuilder: (BuildContext context, int index) {
                                  final item = controller.cart!.items![index];
                                  return Column(
                                    children: [
                                      PaymentCartCard(
                                        item: item,
                                        ontap: () {
                                          UiUtilites.showConfirmationDialog(
                                            false,
                                            'Are you Sure that you want\n to delete this product ?'
                                                .tr,
                                            onConfirm: () async {
                                              controller.deleteCartItems(
                                                  item.id.toString());
                                            },
                                          );
                                        },
                                      ),
                                      Gap(20)
                                    ],
                                  );
                                }),
                            Row(
                              children: [
                                Gap(15),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AppText(
                                      title: 'Date & Time'.tr,
                                      size: 10,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    Gap(8),
                                    DateLocationCard(
                                      txt: controller.date.toString(),
                                    ),
                                    Gap(8),
                                    AppText(
                                      title: 'Location'.tr,
                                      size: 10,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    Gap(8),
                                    DateLocationCard(
                                      txt: controller.location.toString(),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            Gap(15),
                            Row(
                              children: [
                                Gap(10),
                                AppText(
                                  title: 'Promo code'.tr,
                                  size: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ],
                            ),
                            Gap(6),
                            PromocodeTextfield(
                              controller: controller.promocodeController,
                              hint: 'Promo code'.tr,
                              errorText: '',
                              onTap: controller.promoCode,
                              isApplied: controller.isapplied,
                            ),
                            Gap(20)
                          ],
                        )
                      : Center(
                          child: Text(
                          'No item Yet!'.tr,
                          style: TextStyle(color: AppColors.greybg),
                        )),
                ),
              )),
              bottomNavigationBar: Container(
                height: controller.discountAmount != ''
                    ? Get.height * 0.25
                    : Get.height * 0.18,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                  color: AppColors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      blurRadius: 4,
                      offset: Offset(4, 4),
                    ),
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      blurRadius: 4,
                      offset: Offset(-4, -4),
                    ),
                  ],
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (controller.discountAmount != '') Gap(10),
                      if (controller.discountAmount != '')
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            AppText(
                              title: 'Sub total:'.tr,
                              size: 10,
                              fontWeight: FontWeight.w500,
                            ),
                            AppText(
                              title: controller.cart!.totalAmount.toString(),
                              size: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ],
                        ),
                      if (controller.discountAmount != '') Gap(15),
                      if (controller.discountAmount != '')
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            AppText(
                              title: 'discount:'.tr,
                              size: 10,
                              fontWeight: FontWeight.w500,
                            ),
                            AppText(
                              title: controller.discountAmount.toString(),
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
                            title: 'Total:'.tr,
                            size: 10,
                            fontWeight: FontWeight.w500,
                          ),
                          AppText(
                            title: controller.discountAmount != ''
                                ? controller.promoTotal.toString()
                                : controller.cart!.totalAmount.toString(),
                            size: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ],
                      ),
                      Gap(20),
                      Row(
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.done_all_rounded,
                                color: AppColors.white,
                                size: 20,
                              ),
                              IconMainButton(
                                buttonWidth: Get.width * 0.7,
                                title: 'Pay'.tr,
                                onTap: () {
                                  controller.makePayment(
                                      context,
                                      double.parse(controller.cart!.totalAmount
                                          .toString()));
                                  // Get.bottomSheet(
                                  //   PaymentBottomsheet(),
                                  //   isScrollControlled: true,
                                  // );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
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
