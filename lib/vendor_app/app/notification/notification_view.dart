import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mobilegarage/vendor_app/app/notification/component/notification_card.dart';
import 'package:mobilegarage/vendor_app/app/notification/notification_controller.dart';
import 'package:mobilegarage/vendor_app/layout/app_layout.dart';
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
          appBarTitle: 'Notification',
          hasBgColor: true,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    AppText(
                      title: 'Today',
                      size: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ],
                ),
              ),
              NotificationCard(
                name: 'Ali Raza',
                ordername: 'car wash',
              ),
              NotificationCard(
                name: 'Ali Raza',
                ordername: 'car wash',
              ),
              NotificationCard(
                name: 'Ali Raza',
                ordername: 'car wash',
              ),
            ],
          )),
    );
  }
}
