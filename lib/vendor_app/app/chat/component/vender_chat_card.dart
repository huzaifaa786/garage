// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/user_app/utils/App_image_network/app_image_network.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';
import 'package:mobilegarage/vendor_app/app/chat/vender_chat_controller.dart';

import 'package:mobilegarage/vendor_app/utils/app_text/app_text.dart';

class ChatCard extends StatelessWidget {
  const ChatCard({
    super.key,
    this.name,
    this.img,
    this.ontap,
  });
  final name;
  final img;
  final ontap;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VChatController>(
      builder: (controller) => GestureDetector(
        onTap: ontap,
        child: Padding(
          padding: const EdgeInsets.only(top: 6),
          child: Container(
            height: 80,
            decoration: BoxDecoration(color: AppColors.white_color),
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: SvgPicture.asset(
                       'assets/images/avatar.svg',
                        color: AppColors.primary,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const Gap(8),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Gap(6),
                        AppText(
                          title: name,
                          fontWeight: FontWeight.w600,
                          size: 14,
                        ),
                        Gap(10),
                        AppText(
                          maxLines: 1,
                          overFlow: TextOverflow.ellipsis,
                          title: 'Tap here to view messages'.tr,
                          size: 11,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey,
                        ),
                      ]),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Row(
//                       children: [
//                         Container(
//                           height: 7,
//                           width: 7,
//                           decoration: const BoxDecoration(
//                             shape: BoxShape.circle,
//                             color: AppColors.lightblue,
//                           ),
//                         ),
//                         const Gap(5),
//                         const AppText(
//                           title: '3 days ago',
//                           size: 11,
//                           fontWeight: FontWeight.w500,
//                           color: Colors.grey,
//                         ),
//                       ],
//                     ),