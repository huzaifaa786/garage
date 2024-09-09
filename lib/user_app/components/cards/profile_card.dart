import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/route_manager.dart';
import 'package:mobilegarage/routes/app_pages.dart';
import 'package:mobilegarage/routes/app_routes.dart';
import 'package:mobilegarage/user_app/utils/App_image_network/app_image_network.dart';
import 'package:mobilegarage/user_app/utils/app_text/app_text.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    super.key,
    required this.userName,
    required this.userEmail,
    this.image,
    required this.ontap,
  });

  final String userName;
  final String userEmail;
  final image;
  final VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 11),
        height: Get.height * 0.1,
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.all(color: AppColors.white),
          borderRadius: BorderRadius.circular(40),
          // boxShadow: [ // Adding shadow effect
          //   BoxShadow(
          //     color: Colors.black.withOpacity(0.2), // Shadow color
          //     blurRadius: 2, // Softness of the shadow
          //     offset: Offset(0, 0), // Offset from the container
          //   ),
          // ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(80),
                  child: const AppNetworkImage(
                    assetPath: 'assets/images/user_profile.png',
                  ),
                
                ),
                // ),
             
                const Gap(10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      userName,
                      //'User38498990'
                      style: const TextStyle(
                          fontSize: 14,
                          //fontWeight: FontWeight.bold,
                          fontWeight: FontWeight.w500),
                    ),
                    const Gap(2),
                    Text(
                      userName,
                      //'+971 0000 0000'
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            GestureDetector(
              onTap: ontap,
              child: Row(
                children: [
                  const AppText(
                    title: 'Edit',
                    color: AppColors.primary,
                    size: 12,
                    fontWeight: FontWeight.w500,
                  ),
                  const Gap(5),
                  Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                      color: AppColors.lightPink,
                      borderRadius: BorderRadius.circular(80),
                    ),
                    child: SvgPicture.asset(
                      'assets/icons/edit.svg',
                      color: AppColors.primarybg,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
