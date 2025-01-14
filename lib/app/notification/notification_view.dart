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
            title: 'Notifications'.tr,
            showgarageicon: false,
          ),
        ),
        backgroundColor: AppColors.lightgrey,
        body: SafeArea(
            child: SingleChildScrollView(
                child: Container(
          height: Get.height,
          width: Get.width,
          child: controller.notifications.isNotEmpty
              ? ListView.builder(
                  shrinkWrap: true,
                  // reverse:true,
                  itemCount: controller.notifications.length,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    final item = controller.notifications[index];

                    return NotificationCard(
                      status: item.order != null
                          ? item.order!.status.toString()
                          : item.requestOrder != null ?item.requestOrder!.status.toString():null,
                      notification: item,
                    );
                  },
                )
              : Center(
                  child: Text(
                  'No notification found !'.tr,
                  style: TextStyle(
                      color: const Color.fromARGB(255, 180, 180, 180)),
                )),
        ))),
      ),
    );
  }
}
