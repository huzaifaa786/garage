// ignore_for_file: prefer_const_constructors

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/user_app/app/home/components/banner_card.dart';
import 'package:mobilegarage/user_app/app/home/components/home_appbar.dart';
import 'package:mobilegarage/user_app/app/home/components/service_icons.dart';
import 'package:mobilegarage/user_app/app/home/home_controller.dart';

import 'package:mobilegarage/user_app/components/textfields/icon_inputfield.dart';
import 'package:mobilegarage/routes/app_routes.dart';
import 'package:mobilegarage/user_app/utils/app_text/app_text.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int i = 0;

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
            title: HomeAppbar(
              onNotificationtap: () {
                Get.toNamed(AppRoutes.notification);
              },
            ),
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 40.0, right: 30.0),
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
                  Gap(10),
                  CarouselSlider.builder(
                    itemCount: 5,
                    itemBuilder: (context, index, realIndex) {
                      return BannerCard(
                        picture: 'https://dummyimage.com/70x70/000/fff',
                        onTap: () {
                          print('object');
                        },
                      );
                    },
                    options: CarouselOptions(
                      height: Get.height * 0.28,
                      enableInfiniteScroll: true,
                      autoPlay: true,
                      viewportFraction: 0.9,
                      enlargeCenterPage: false,
                      onPageChanged: (index, reason) {
                        setState(() {
                          i = index;
                        });
                      },
                    ),
                  ),
                  Gap(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SmoothPageIndicator(
                        controller: PageController(),
                        count: 6,
                        axisDirection: Axis.horizontal,
                        effect: ExpandingDotsEffect(
                            dotHeight: 5,
                            dotWidth: 5,
                            activeDotColor: AppColors.primary,
                            dotColor: AppColors.lightprimary),
                      ),
                    ],
                  ),
                  Gap(30),
                  if (controller.hasServices) ...[
                    Row(
                      children: [
                        Gap(10),
                        AppText(
                          title: 'Explore Services!',
                          fontWeight: FontWeight.w600,
                          size: 16.0,
                          color: AppColors.primarybg,
                        ),
                      ],
                    ),
                    Gap(30),
                    Expanded(
                      child: GridView.builder(
                        gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: controller.itemCount,
                          crossAxisSpacing: 6.0,
                          mainAxisSpacing: 2.0,
                          mainAxisExtent: Get.height * 0.18,
                        ),
                        itemCount: controller.services.length,
                        itemBuilder: (context, index) {
                          final item = controller.services[index];
                          return ServicesIcons(
                            imageUrl: item.imageUrl,
                            text: item.text,
                          );
                        },
                      ),
                    ),
                    Gap(40),
                  ] else ...[
                    Gap(0),
                  ],
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}