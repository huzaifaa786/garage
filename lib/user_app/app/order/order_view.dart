// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_unnecessary_containers
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/user_app/app/order/components/circle.dart';
import 'package:mobilegarage/user_app/app/order/components/line.dart';
import 'package:mobilegarage/user_app/app/order/order_controller.dart';
import 'package:mobilegarage/user_app/components/app_bar/top_bar.dart';
import 'package:mobilegarage/user_app/utils/app_text/app_text.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';
import 'package:mobilegarage/user_app/utils/shadows/appbar_shadow.dart';

class OrderView extends StatefulWidget {
  const OrderView({super.key});

  @override
  State<OrderView> createState() => _OrderViewState();
}

int activeStep = 0;

class _OrderViewState extends State<OrderView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderController>(
        autoRemove: false,
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
                  child: SingleChildScrollView(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Gap(50),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  Gap(10),
                                  Circle(),
                                  Line(),
                                  Circle(),
                                  Line(),
                                  Circle(),
                                  Line(),
                                  Circle(),
                                  Line(),
                                  Circle(),
                                ],
                              ),
                              Gap(10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  //! Filter By

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 35,
                                        width: 35,
                                        decoration: BoxDecoration(
                                          color: AppColors.lightprimary,
                                          borderRadius:
                                              BorderRadius.circular(80),
                                        ),
                                        child: SvgPicture.asset(
                                          'assets/icons/filter.svg',
                                          fit: BoxFit.scaleDown,
                                        ),
                                      ),
                                      Gap(10),
                                      AppText(
                                        title: 'Filter By',
                                        fontWeight: FontWeight.w600,
                                        size: 16.0,
                                        color: AppColors.primary,
                                      ),
                                    ],
                                  ),
                                  Gap(5),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Gap(18),
                                      AppText(
                                        title: 'Approximate price '.tr,
                                        fontWeight: FontWeight.w400,
                                        size: 10.0,
                                        color: AppColors.grey,
                                      ),
                                      Row(
                                        children: [
                                          ConstrainedBox(
                                            constraints: BoxConstraints(
                                                maxWidth: Get.width * 0.35),
                                            child: AppText(
                                              title: '123.444444',
                                              fontWeight: FontWeight.w600,
                                              size: 13.0,
                                              color: AppColors.primarybg,
                                              overFlow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                            ),
                                          ),
                                          AppText(
                                            title: ' AED'.tr,
                                            fontWeight: FontWeight.w600,
                                            size: 13.0,
                                            color: AppColors.primarybg,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),

                                  //! All Brands
                                  Container(
                                    height: Get.height * 0.052,
                                  ),

                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Gap(18),
                                          AppText(
                                            title: 'All brands'.tr,
                                            fontWeight: FontWeight.w600,
                                            size: 12.0,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          )
                        ]),
                  ),
                ),
              ),
            ));
  }
}
