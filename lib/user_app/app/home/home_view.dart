// ignore_for_file: prefer_const_constructors

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/user_app/app/filter_service/filter_service_view.dart';
import 'package:mobilegarage/user_app/app/home/components/banner_card.dart';
import 'package:mobilegarage/user_app/app/home/components/home_appbar.dart';
import 'package:mobilegarage/user_app/app/home/components/service_icons.dart';
import 'package:mobilegarage/user_app/app/home/home_controller.dart';
import 'package:mobilegarage/user_app/components/textfields/icon_inputfield.dart';
import 'package:mobilegarage/routes/app_routes.dart';
import 'package:mobilegarage/user_app/utils/app_text/app_text.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      autoRemove: false,
      builder: (controller) {
        return GestureDetector(
          onTap: () {
            // Dismiss the keyboard when tapping anywhere outside the input
            FocusScope.of(context).unfocus();
          },
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              scrolledUnderElevation: 0.0,
              toolbarHeight: 80,
              title: HomeAppbar(
                onNotificationtap: () {
                  Get.toNamed(AppRoutes.notification)!.then((value) {
                    controller.countNotification();
                  });
                  ;
                },
                isnotification:
                    controller.notificationcount == '0' ? false : true,
              ),
            ),
            body: SingleChildScrollView(
              child: SafeArea(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 40.0, right: 40.0),
                        child: IconInputField(
                          controller: controller.searchController,
                          hasprefix: true,
                          hint: 'Search for garages, service ..'.tr,
                          readOnly: false,
                          onsubmit: (value) {
                            Get.toNamed(AppRoutes.search, parameters: {
                              'searchtext': controller.searchController.text
                            });
                          },
                        ),
                      ),
                      Gap(10),
                      if (controller.banners.isNotEmpty)
                        CarouselSlider.builder(
                          options: CarouselOptions(
                            height: 190,
                            enableInfiniteScroll: true,
                            autoPlay: true,
                            autoPlayCurve: Curves.ease,
                            viewportFraction: 0.8,
                            enlargeCenterPage: false,
                            onPageChanged: (index, reason) {
                              controller.updateIndex(index);
                            },
                          ),
                          itemCount: controller.banners.length,
                          itemBuilder: (context, index, realIndex) {
                            return BannerCard(
                              networkImage: controller.banners[index].image,
                              onTap: () {
                                Get.toNamed(AppRoutes.garage, parameters: {
                                  'id': controller.banners[index].garageid
                                      .toString(),
                                });
                              },
                            );
                          },
                        ),
                      Gap(10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:
                            List.generate(controller.banners.length, (index) {
                          return AnimatedContainer(
                            duration: Duration(milliseconds: 300),
                            margin: EdgeInsets.symmetric(horizontal: 4.0),
                            height: 6.0,
                            width:
                                controller.currentIndex == index ? 20.0 : 6.0,
                            decoration: BoxDecoration(
                              color: controller.currentIndex == index
                                  ? AppColors.primary
                                  : AppColors.lightPink,
                              borderRadius: controller.currentIndex == index
                                  ? BorderRadius.circular(10.0)
                                  : BorderRadius.circular(50.0),
                            ),
                          );
                        }),
                      ),
                      Gap(30),
                      Padding(
                        padding: const EdgeInsets.only(left: 40.0, right: 30.0),
                        child: Row(
                          children: [
                            Gap(10),
                            AppText(
                              title: 'Explore Services!'.tr,
                              fontWeight: FontWeight.w600,
                              size: 16.0,
                              color: AppColors.darkprimary,
                            ),
                          ],
                        ),
                      ),
                      Gap(10),
                      GridView.builder(
                        padding: EdgeInsets.only(left: 20.0, right: 20.0),
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          crossAxisSpacing: 9.0,
                          mainAxisSpacing: 1.0,
                          mainAxisExtent: Get.height * 0.17,
                        ),
                        itemCount: controller.servicesList.length,
                        itemBuilder: (context, index) {
                          final item = controller.servicesList[index];
                          return ServicesIcons(
                            imageUrl: item.image,
                            text: box.read('locale') == 'ar'
                                ? item.ar_name
                                : item.name,
                            ontap: () {
                              Get.toNamed(
                                AppRoutes.filterorder,
                                parameters: {
                                  'categoryId': item.id.toString(),
                                  'path': 'filter'
                                },
                              );
                            },
                          );
                        },
                      ),
                      Gap(10),
                    ]),
              ),
            ),
          ),
        );
      },
    );
  }
}
