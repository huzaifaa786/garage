// ignore_for_file: prefer_const_constructors

import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/routes/app_routes.dart';
import 'package:mobilegarage/user_app/app/order/accapted_order/accapted_order_controller.dart';
import 'package:mobilegarage/user_app/app/order/accapted_order/component/order_card.dart';
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
    return GetBuilder<AccaptedOrderController>(
      autoRemove: false,
      builder: (controller) => AppLayout(
        appBarTitle: 'Accepted Orders',
        hasBgColor: false,
        hasShadow: true,
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AppText(
                    title: 'Select garage',
                    size: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
              Gap(7),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AppText(
                    title: '(12) garages',
                    size: 12,
                    fontWeight: FontWeight.w500,
                    color: AppColors.darkprimary,
                  ),
                ],
              ),
              SizedBox(height: 10),
              Gap(6),
              OrderCard(),
              Gap(50),
              MainButton(
                title: 'Confirm',
                btncolor: controller.isSelected
                    ? AppColors.primary
                    : AppColors.greybg,
                onTap: () {
                  controller.toggleSelection();
                  if(controller.isSelected){
                       Get.toNamed(AppRoutes.search_result);
                  }
              
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
