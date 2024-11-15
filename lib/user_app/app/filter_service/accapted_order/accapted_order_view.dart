// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/routes/app_routes.dart';
import 'package:mobilegarage/user_app/app/filter_service/accapted_order/component/order_card.dart';
import 'package:mobilegarage/user_app/app/filter_service/accapted_order/component/order_filter_bottomsheet.dart';
import 'package:mobilegarage/user_app/app/filter_service/accapted_order/component/selected_filtercard.dart';
import 'package:mobilegarage/user_app/app/filter_service/filter_service_controller.dart';
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
        appBarTitle:
            controller.path == 'filter' ? 'Service Results'.tr : 'Accepted Orders'.tr,
        hasBgColor: false,
        hasShadow: true,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Gap(30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.bottomSheet(
                          OrderFilterBottomsheet(),
                          isScrollControlled: true,
                        );
                      },
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: AppColors.lightPink),
                        child: SvgPicture.asset(
                          'assets/icons/filter.svg',
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
                    Gap(10),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30)),
                      child: AppText(
                        title: 'Filter By'.tr,
                        fontWeight: FontWeight.w600,
                        size: 16.0,
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
              ),
              Gap(10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    if (controller.selecetedPrice != '')
                      OrderSelectedFilterCard(
                          onCancel: () {
                            controller.selecetedPrice = '';
                            controller.selectIndexPrice(0);
                            controller.update();
                          },
                          controller: controller,
                          text: controller.selecetedPrice),
                  ],
                ),
              ),
              Gap(5),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    if (controller.selecetedPlace != '')
                      OrderSelectedFilterCard(
                          onCancel: () {
                            controller.selecetedPlace = '';
                            controller.selectIndexClosest(0);
                            controller.update();
                          },
                          controller: controller,
                          text: controller.selecetedPlace),
                  ],
                ),
              ),
              Gap(5),
              if (controller.selecetedRating != '')
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      OrderSelectedFilterCard(
                          onCancel: () {
                            controller.selecetedRating = '';
                            controller.selectIndexRating(0);
                            controller.update();
                          },
                          controller: controller,
                          text: controller.selecetedRating),
                    ],
                  ),
                ),
              Gap(10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    AppText(
                      title: 'Select garage'.tr,
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
                      title:
                          '(${controller.garages.length.toString()}) ${'garages'.tr}',
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
                  final garageAddress =
                      controller.garageAddresses.length > index
                          ? controller.garageAddresses[index]
                          : null;
                  return OrderCard(
                    garage: controller.garages[index],
                    // location: garageAddress!['location'],
                     location: garageAddress != null ? garageAddress['location'] : 'Unknown location',

                    city:garageAddress != null ? garageAddress['city'] : 'Unknown location',
                    isSelected: controller.selectedGarageIndex == index,
                    onchattap: () {},
                    ontap: () {
                      Get.toNamed(AppRoutes.garage, parameters: {
                        'id': controller.garages[index].id.toString(),
                        'productId': controller.path != 'filter'
                            ? controller.garages[index].order!.orderItems![0]
                                .products!.id
                                .toString()
                            : controller.garages[index].products![0].id
                                .toString(),
                        // 'productextraId':
                        // controller
                        //         .garages[index].products![0].oilextra!.isEmpty
                        //     ? ''
                        //     : controller
                        //         .garages[index].products![0].oilextra![0].id
                        //         .toString()
                        'productextraId': controller.path != 'filter'
                            ? (controller.garages[index].order!.orderItems![0]
                                        .productsExtra ==
                                    null
                                ? ''
                                : controller.garages[index].order!
                                    .orderItems![0].productsExtra!.id
                                    .toString())
                            : (controller.garages[index].products![0].oilextra!
                                    .isEmpty
                                ? ''
                                : controller
                                    .garages[index].products![0].oilextra![0].id
                                    .toString()),
                      });
                    },
                  );
                },
              ),
              // Gap(50),
              // Padding(
              //   padding:
              //       const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              //   child: MainButton(
              //     buttonWidth: Get.width * 0.8,
              //     height: Get.height * 0.07,
              //     title: 'Confirm',
              //     fontsize: 12,
              //     btncolor: controller.isSelected
              //         ? AppColors.primary
              //         : AppColors.greybg,
              //     onTap: () {
              //       // controller.toggleSelection();
              //       if (controller.isSelected) {
              //         Get.toNamed(AppRoutes.search_result);
              //       }
              //     },
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
