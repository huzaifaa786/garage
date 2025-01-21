// ignore_for_file: avoid_unnecessary_containers, prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/models/notifications_model.dart';
import 'package:mobilegarage/routes/app_routes.dart';
import 'package:mobilegarage/user_app/app/filter_service/filter_service_view.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';
import 'package:mobilegarage/vendor_app/app/chat_screen/vender_chat_detail_screen_view.dart';
import 'package:mobilegarage/vendor_app/app/notification/notification_controller.dart';
import 'package:mobilegarage/vendor_app/utils/app_text/app_text.dart';

class NotificationCard extends StatelessWidget {
  NotificationCard({
    super.key,
    this.img = 'assets/icons/user_filled.svg',
    // this.ordername,
    // this.name,
    this.notifications,
  });
  final img;
  // final ordername;
  // final name;
  NotificationsModel? notifications;
  @override
  Widget build(BuildContext context) {
    // String categoryname = notifications!.categoryName == null
    //     ? notifications!.body.toString()
    //     : notifications!.categoryName.toString();
    return GetBuilder<VNotificationController>(
      builder: (controller) => Padding(
        padding: const EdgeInsets.only(top: 12),
        child: Container(
          height: 110,
          width: Get.width,
          decoration: BoxDecoration(color: AppColors.white_color),
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 7,
                      width: 7,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.lightblue,
                      ),
                    ),
                    const Gap(6),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(60),
                            child: SvgPicture.asset(
                              height: 40,
                              img,
                              placeholderBuilder: (context) =>
                                  const CircularProgressIndicator(),
                              fit: BoxFit.cover,
                            )),
                        const Gap(8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (notifications!.categoryName == null) Gap(10),
                            AppText(
                              title: notifications!.username.toString(),
                              fontWeight: FontWeight.w600,
                              size: 13,
                              maxLines: 1,
                              overFlow: TextOverflow.ellipsis,
                            ),
                            Gap(10),
                            if (notifications!.categoryName != null)
                              AppText(
                                title: 'Ordered a'.tr +
                                    ' ' +
                                    '${notifications!.categoryName.toString()}'
                                        .tr,
                                size: 11,
                                fontWeight: FontWeight.w600,
                                maxLines: 2,
                                overFlow: TextOverflow.ellipsis,
                              ),
                            if (notifications!.categoryName == null)
                              Row(
                                children: [
                                  AppText(
                                    title: box.read('locale') == 'ar'
                                        ? notifications!.artitle.toString()
                                        : notifications!.title.toString(),
                                    size: 11,
                                    fontWeight: FontWeight.w600,
                                    maxLines: 2,
                                    overFlow: TextOverflow.ellipsis,
                                  ),
                                  if (notifications!.title ==
                                      'New Order Received'.tr)
                                    GestureDetector(
                                      onTap: () {
                                        notifications!.ordertype != 'urgent'
                                            ? Get.toNamed(
                                                AppRoutes.vorders_view)
                                            : notifications!.ordertype ==
                                                    'urgent'
                                                ? Get.toNamed(AppRoutes
                                                    .vurgent_orders_view)
                                                : () {};
                                      },
                                      child: AppText(
                                        title: '  ' + 'view'.tr,
                                        color: Colors.blue,
                                        size: 11,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    )
                                ],
                              ),
                            if (notifications!.categoryName != null)
                              Row(
                                children: [
                                  AppText(
                                    title:
                                        'click to accept, or reject order'.tr,
                                    size: 11,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  if (notifications!.ordertype !=
                                      'Not specified')
                                    GestureDetector(
                                      onTap: () {
                                        notifications!.ordertype != 'urgent'
                                            ? Get.toNamed(
                                                AppRoutes.vorders_view)
                                            : Get.toNamed(
                                                AppRoutes.vurgent_orders_view);
                                      },
                                      child: AppText(
                                        title: '  ' + 'view'.tr,
                                        color: Colors.blue,
                                        size: 11,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    )
                                ],
                              ),
                            const Gap(6),
                            AppText(
                              title: controller.timeAgo(
                                  notifications!.createdAt!.toIso8601String()),
                              size: 11,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                if (notifications!.sender != null)
                  InkWell(
                    onTap: () {
                      // Get.toNamed(AppRoutes.chatScreen);
                      Get.to(() => ChatDetailScreenView(
                          id: notifications!.sender!.id.toString(),
                          name: notifications!.sender!.name.toString(),
                          profilePic: '',
                          screen: 'chat'));
                    },
                    child: Container(
                      height: 30,
                      width: 40,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: AppColors.lightPink),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: SvgPicture.asset(
                          'assets/icons/chat.svg',
                          fit: BoxFit.scaleDown,
                          height: 20.0,
                          width: 18.0,
                          color: AppColors.darkprimary,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
