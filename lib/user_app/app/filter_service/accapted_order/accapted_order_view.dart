// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/routes/app_routes.dart';
import 'package:mobilegarage/user_app/app/filter_service/accapted_order/component/order_card.dart';
import 'package:mobilegarage/user_app/app/filter_service/filter_service_controller.dart';
import 'package:mobilegarage/user_app/components/buttons/main_button.dart';
import 'package:mobilegarage/user_app/utils/app_text/app_text.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';
import 'package:mobilegarage/vendor_app/layout/app_layout.dart';

class AccaptedOrderView extends StatefulWidget {
  const AccaptedOrderView({super.key});

  @override
  State<AccaptedOrderView> createState() => _AccaptedOrderViewState();
}

class _AccaptedOrderViewState extends State<AccaptedOrderView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<FilterServiceController>(
      autoRemove: false,
      builder: (controller) => AppLayout(
        appBarTitle: 'Accepted Orders',
        hasBgColor: false,
        hasShadow: true,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Gap(30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    AppText(
                      title: 'Select garage',
                      size: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
              ),
              Gap(7),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    AppText(
                      title: '(${controller.garages.length.toString()})'+' garages',
                      size: 12,
                      fontWeight: FontWeight.w500,
                      color: AppColors.darkprimary,
                    ),
                  ],
                ),
              ),
              ListView.builder( 
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemCount: controller.garages.length,
                itemBuilder: (context, index) {
                  return  OrderCard(
                    garage: controller.garages[index],
                  );
                },
              ),
              Gap(50),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: MainButton(
                  buttonWidth: Get.width * 0.8,
                  height: Get.height * 0.07,
                  title: 'Confirm',
                  fontsize: 12,
                  btncolor: controller.isSelected
                      ? AppColors.primary
                      : AppColors.greybg,
                  onTap: () {
                    controller.toggleSelection();
                    if (controller.isSelected) {
                      Get.toNamed(AppRoutes.search_result);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}