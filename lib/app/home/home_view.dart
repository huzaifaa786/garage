// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/app/home/components/service_cards.dart';
import 'package:mobilegarage/app/home/components/service_icons.dart';
import 'package:mobilegarage/app/home/components/home_appbar.dart';
import 'package:mobilegarage/app/home/components/view_all.dart';
import 'package:mobilegarage/app/home/home_controller.dart';
import 'package:mobilegarage/components/textfields/icon_inputfield.dart';
import 'package:mobilegarage/utils/app_text/app_text.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeController controller = HomeController.instance;

  bool _showAllItems = false;

  void _toggleView() {
    setState(() {
      _showAllItems = !_showAllItems;
    });
  }

  @override
  Widget build(BuildContext context) {
    final int itemCount = _showAllItems ? controller.services.length : 4;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        scrolledUnderElevation: 0.0,
        toolbarHeight: 80,
        title: HomeAppbar(),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 42.0),
          child: Column(
            children: [
              IconInputField(
                hasprefix: true,
                hint: 'Search for garages, service ..'.tr,
                readOnly: false,
              ),
              Gap(30),
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
                      initialText: _showAllItems ? 'View less' : 'View more',
                      toggledText: 'View less',
                      showIcon: true,
                      onTap: _toggleView,
                    ),
                ],
              ),
              Gap(22),
              Flexible(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                    mainAxisExtent: 110,
                  ),
                  itemCount: itemCount.clamp(0, controller.services.length),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'assets/images/car_wash.png',
                        height: 22,
                        width: 22,
                      ),
                      Gap(10),
                      AppText(
                        title: 'Car wash',
                        fontWeight: FontWeight.w600,
                        size: 16.0,
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
              Flexible(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 0.0,
                    mainAxisSpacing: 8.0,
                    mainAxisExtent: Get.height * 0.24,
                  ),
                  itemCount: itemCount.clamp(0, controller.services.length),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final item = controller.services[index];
                    return ServiceCard(
                      imageUrl: item.imageUrl,
                      title: 'qghjnwergh',
                      onTap: () {},
                      price: '123456',
                    );
                  },
                ),
              ),
              Gap(40),
            ],
          ),
        ),
      ),
    );
  }
}
