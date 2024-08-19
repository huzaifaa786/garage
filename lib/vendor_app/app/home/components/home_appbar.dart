import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobilegarage/vendor_app/utils/app_colors/app_colors.dart';
import 'package:mobilegarage/vendor_app/utils/app_text/app_text.dart';


class HomeAppbar extends StatelessWidget {
  const HomeAppbar({
    super.key,
    this.notification,
    this.chat,
  });

  final notification;
  final chat;

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
                title: '  Street Garage',
                size: 12,
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
          Row(
            children: [
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(6),
                    child: InkWell(
                        onTap: notification,
                        child: SvgPicture.asset('assets/images/bell.svg')),
                  ),
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
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: InkWell(
                        onTap: chat,
                        child: Image.asset('assets/images/chat.png')),
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
            ],
          ),
        ],
      ),
    );
  }
}
