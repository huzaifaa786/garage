// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/app/home/components/service_cards.dart';
import 'package:mobilegarage/app/home/components/service_icons.dart';
import 'package:mobilegarage/app/home/components/home_appbar.dart';
import 'package:mobilegarage/app/home/components/view_all.dart';
import 'package:mobilegarage/app/home/home_controller.dart';
import 'package:mobilegarage/components/textfields/icon_inputfield.dart';
import 'package:mobilegarage/routes/app_routes.dart';
import 'package:mobilegarage/utils/app_text/app_text.dart';
import 'package:mobilegarage/utils/ui_utils/ui_utils.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      autoRemove: false,
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            scrolledUnderElevation: 0.0,
            toolbarHeight: 80,
            title: HomeAppbar(),
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 40.0, right: 30.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   
                    GestureDetector(
                      onTap: () {},
                      child: IconInputField(
                        hasprefix: true,
                        hint: 'Search for garages, service ..'.tr,
                        readOnly: false,
                        onChange: (value) {
                          Get.toNamed(AppRoutes.search);
                        },
                      ),
                    ),
                    Gap(30),
                    if (controller.hasServices) ...[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppText(
                            title: 'What are you looking for?',
                            fontWeight: FontWeight.w600,
                            size: 16.0,
                          ),
                          if (controller.services.length > 4)
                            ViewMore(
                              initialText: controller.showAllItems
                                  ? 'View less'
                                  : 'View more',
                              toggledText: 'View less',
                              showIcon: true,
                              onTap: controller.toggleView,
                            ),
                        ],
                      ),
                      Gap(22),
                      GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: controller.itemCount < 4
                              ? controller.itemCount
                              : 4,
                          crossAxisSpacing: 8.0,
                          mainAxisSpacing: 8.0,
                          mainAxisExtent: 110,
                        ),
                        itemCount: controller.itemCount,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          if (index >= controller.services.length) {
                            return SizedBox.shrink();
                          }
                          final item = controller.services[index];
                          return ServicesIcons(
                            imageUrl: item.imageUrl,
                            text: item.text,
                            
                          );
                        },
                      ),
                      Gap(40),
                    ] else ...[
                      Gap(0),
                    ],
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              'assets/images/car_wash.png',
                              height: 22,
                              width: 22,
                            ),
                            Gap(10),
                            GestureDetector(
                              onTap: () {
                                Get.toNamed(AppRoutes.orders);
                              },
                              child: AppText(
                                title: 'Car wash',
                                fontWeight: FontWeight.w600,
                                size: 16.0,
                              ),
                            ),
                          ],
                        ),
                        ViewMore(
                          initialText: 'See all',
                          showIcon: false,
                        ),
                      ],
                    ),
                    Gap(22),
                    SizedBox(
                      height: 180,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.servicesCards.length,
                        shrinkWrap: true,
                        physics: AlwaysScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          final item = controller.servicesCards[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 4.0, horizontal: 2.0),
                            child: ServiceCard(
                              image: item.image,
                              title: item.title,
                              onTap: () {
                                UiUtilites.SuccessAlert(context);
                              },
                              price: item.price,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
