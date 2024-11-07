import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';

import 'package:mobilegarage/vendor_app/utils/app_text/app_text.dart';

class HomeAppbar extends StatelessWidget {
   HomeAppbar({
    super.key,
    this.notification,
    this.chat,
    this.name,
    this.isnotification = true
  });
  final isnotification;

  final notification;
  final chat;
  String? name='Street Garage';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset('assets/images/appbar.png'),
               AppText(
                title:'  '+ name.toString(),
                size: 12,
                fontWeight: FontWeight.w600,
                color: const Color.fromARGB(255, 158, 9, 12),
              ),
            ],
          ),
          Row(
            children: [
              InkWell(
                onTap: notification,
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(6),
                      child: SvgPicture.asset('assets/images/bell.svg'),
                    ),
                      if(isnotification==true)

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
              InkWell(
                onTap: chat,
                child: Stack(
                  children: [
                    Container(
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
                    Positioned(
                      top: 2,
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
            ],
          ),
        ],
      ),
    );
  }
}
