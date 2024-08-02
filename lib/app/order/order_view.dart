// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/app/order/order_controller.dart';
import 'package:mobilegarage/components/app_bar/top_bar.dart';
import 'package:mobilegarage/components/buttons/dotted_border_button.dart';
import 'package:mobilegarage/components/textfields/main_input.dart';
import 'package:mobilegarage/utils/app_text/app_text.dart';
import 'package:mobilegarage/utils/colors/app_color.dart';
import 'package:mobilegarage/utils/shadows/appbar_shadow.dart';

class OrderView extends StatefulWidget {
  const OrderView({super.key});

  @override
  State<OrderView> createState() => _OrderViewState();
}

class _OrderViewState extends State<OrderView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderController>(
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
                    title: TopBar(
                      showicon: true,
                      title: 'Find Service',
                    ),
                  ),
                ),
              ),
              body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: Column(
                    children: [
                      Gap(30),
                      Row(
                        children: [
                          SizedBox(
                            height: Get.height * 0.05,
                            width: Get.width * 0.45,
                            child: AppText(
                              title: 'What service do you need?',
                              size: 16,
                              fontWeight: FontWeight.w600,
                              color: AppColors.darkprimary,
                            ),
                          ),
                        ],
                      ),
                      Gap(30),
                      MainInput(
                        hint: 'I need..',
                        controller: controller.serviceController,
                        errorText: '',
                      ),
                      Gap(15),
                      MainInput(
                        hint: 'Price',
                        controller: controller.priceController,
                        errorText: '',
                      ),
                    //   DottedBorderButton(
                    //   title: 'Upload vehicle photo'.tr,
                    //   imgselect: () => controller.selectvechileImage('vehicle'),
                    //   isImgSelected: controller.isImageSelected('vehicle'),
                    // ),
                    ],
                  ),
                ),
              ),
            ));
  }
}
