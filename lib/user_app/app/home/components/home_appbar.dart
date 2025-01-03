// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';

class HomeAppbar extends StatelessWidget {
  const HomeAppbar(
      {super.key,
      this.onNotificationtap,
      this.isnotification = true,
      this.ischat = false,
      this.onChatntap});
  final onNotificationtap;
  final onChatntap;

  final isnotification;
  final ischat;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SvgPicture.asset(
          'assets/icons/home_logo.svg',
          height: 30,
          width: 130,
        ),
        Gap(45),
        Column(
          children: [
            Gap(10),
            Row(
              children: [
                InkWell(
                  onTap: onNotificationtap,
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(6),
                        child: SvgPicture.asset('assets/images/bell.svg'),
                      ),
                      if (isnotification == true)
                        Positioned(
                          top: 3,
                          right: 0,
                          child: Container(
                            height: 7,
                            width: 7,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.primary_color,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                Gap(20),
                GestureDetector(
                  onTap: onChatntap,
                  child: Stack(children: [
                    Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                        color: AppColors.lightPink,
                        borderRadius: BorderRadius.circular(80),
                      ),
                      child: SvgPicture.asset(
                        'assets/icons/chat.svg',
                        color: AppColors.darkprimary,
                      ),
                    ),
                    if (ischat == true)
                      Positioned(
                        top: 0,
                        right: 0,
                        child: Container(
                          height: 7,
                          width: 7,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.primary_color,
                          ),
                        ),
                      ),
                  ]),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
