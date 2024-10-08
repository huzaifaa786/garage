// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/app/notification/components/notification_card.dart';
import 'package:mobilegarage/app/notification/notification_controller.dart';
import 'package:mobilegarage/user_app/components/app_bar/top_bar.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotificationController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: TopBar(
            title: 'Notifications',
            showgarageicon: false,
          ),
        ),
        backgroundColor: AppColors.lightgrey,
        body: SafeArea(
            child: SingleChildScrollView(
                child: Container(
          height: 700,
          width: Get.width,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: controller.notifications.length,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) => NotificationCard(),
          ),
        ))),
      ),
    );
  }
}
