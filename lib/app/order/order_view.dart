// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/components/app_bar/top_bar.dart';
import 'package:mobilegarage/utils/app_text/app_text.dart';
import 'package:mobilegarage/utils/colors/app_color.dart';

class OrderView extends StatefulWidget {
  const OrderView({super.key});

  @override
  State<OrderView> createState() => _OrderViewState();
}

class _OrderViewState extends State<OrderView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        scrolledUnderElevation: 0.0,
        // shadowColor: AppColors.shadowblack,
        toolbarHeight: 95.0,
        title: TopBar(
          showicon: true,
          title: 'Find Service',
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
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
          ],
        ),
      ),
    );
  }
}
