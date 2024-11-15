import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';
import 'package:mobilegarage/vendor_app/app/notification/component/notification_card.dart';
import 'package:mobilegarage/vendor_app/app/notification/notification_controller.dart';
import 'package:mobilegarage/vendor_app/layout/app_layout.dart';
import 'package:mobilegarage/vendor_app/utils/app_constants/text_strings.dart';
import 'package:mobilegarage/vendor_app/utils/app_text/app_text.dart';

class VNotificationView extends StatefulWidget {
  const VNotificationView({super.key});

  @override
  State<VNotificationView> createState() => _VNotificationViewState();
}

class _VNotificationViewState extends State<VNotificationView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<VNotificationController>(
      autoRemove: false,
      builder: (controller) => AppLayout(
          appBarTitle: 'Notifications'.tr,
          hasBgColor: true,
          child: controller.notifications.isNotEmpty
              ? SingleChildScrollView(
                  child: Column(
                    children: [
                      // Padding(
                      //   padding: EdgeInsets.all(20.0),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.start,
                      //     children: [
                      //       AppText(
                      //         title: 'Today',
                      //         size: 20,
                      //         fontWeight: FontWeight.w700,
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      ListView.builder(
                          shrinkWrap: true,
                          reverse: true,
                          physics: BouncingScrollPhysics(),
                          itemCount: controller.notifications.length,
                          itemBuilder: (BuildContext context, int index) {
                            final item = controller.notifications[index];
                            return NotificationCard(
                              notifications: item,
                              
                            );
                          }),
                      
                    ],
                  ),
                )
              : Center(
                  child: AppText(
                    title: 'No notifications available \n for this garage.'.tr,
                    color: AppColors.black,
                    textAlign: TextAlign.center,
                  ),
                )),
    );
  }
}
