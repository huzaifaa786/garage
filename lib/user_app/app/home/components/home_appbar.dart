// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/routes/app_routes.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';

class HomeAppbar extends StatelessWidget {
  const HomeAppbar({super.key,this.onNotificationtap});
  final onNotificationtap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SvgPicture.asset(
          'assets/icons/home_logo.svg',
          height: 37,
          width: 143,
        ),
        Gap(45),
        Column(
          children: [
            Gap(10),
            Row(
              children: [
                GestureDetector(
                  onTap: onNotificationtap,
                    child: SvgPicture.asset('assets/icons/bell.svg')),
                Gap(20),
                GestureDetector(onTap: () {
                  Get.toNamed(AppRoutes.chats_accounts);
                },
                  child: Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      color: AppColors.lightprimary,
                      borderRadius: BorderRadius.circular(80),
                    ),
                    child:SvgPicture.asset('assets/icons/chat.svg'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
