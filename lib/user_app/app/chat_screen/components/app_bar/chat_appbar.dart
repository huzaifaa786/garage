import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/user_app/utils/App_image_network/app_image_network.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';

import 'package:mobilegarage/vendor_app/utils/app_text/app_text.dart';

class ChatAppbar extends StatelessWidget {
  const ChatAppbar(
      {super.key,
      required this.child,
      this.appBarTitle,
      this.hasIcon = true,
      this.hasBgColor = false,
      this.hasShadow = true,
      this.isRectangle = false,
      this.appBarimage});
  final Widget child;
  final String? appBarTitle;
  final String? appBarimage;

  final bool hasIcon;
  final bool hasBgColor;
  final bool hasShadow;
  final bool isRectangle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          hasBgColor ? AppColors.divider_color : AppColors.white_color,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(
            kToolbarHeight + 20), // Adjust height if needed
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            boxShadow: hasShadow
                ? [
                    BoxShadow(
                      color: AppColors.black_color.withOpacity(0.2),
                      blurRadius: 4,
                    ),
                  ]
                : null,
          ),
          child: AppBar(
            automaticallyImplyLeading: false,
            title: Row(
              mainAxisAlignment: hasIcon == true
                  ? MainAxisAlignment.start // Aligns items to the start
                  : MainAxisAlignment.center,
              children: [
                if (hasIcon == true)
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                        vertical:
                            12.0), // Add some padding for better alignment
                    child: InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: AppColors.darkprimary,
                      ),
                    ),
                  ),
                  Gap(10),
                ClipRRect(
                    child: SvgPicture.asset(
                 'assets/images/avatar.svg',
                  height: 43,
                  width: 43,
                   color: AppColors.primary,
                )
                  
                    ),
                const SizedBox(width: 12),
                AppText(
                  title: '$appBarTitle',
                  size: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.darkprimary,
                ),
                if (hasIcon == true)
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.transparent,
                    ),
                  ),
              ],
            ),
            elevation: 0,
            backgroundColor: AppColors.white_color,
            surfaceTintColor: AppColors.white_color,
          ),
        ),
      ),
      body: SafeArea(
        child: child,
      ),
    );
  }
}
