// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/app/home/components/service_icons.dart';
import 'package:mobilegarage/app/home/components/home_appbar.dart';
import 'package:mobilegarage/app/home/home_controller.dart';
import 'package:mobilegarage/components/textfields/icon_inputfield.dart';
import 'package:mobilegarage/routes/app_routes.dart';
import 'package:mobilegarage/utils/app_text/app_text.dart';
import 'package:mobilegarage/utils/colors/app_color.dart';

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
                  Gap(50),
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
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
