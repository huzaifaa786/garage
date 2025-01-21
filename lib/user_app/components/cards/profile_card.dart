import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/user_app/utils/App_image_network/app_image_network.dart';
import 'package:mobilegarage/user_app/utils/app_text/app_text.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    super.key,
    required this.userName,
    required this.userphone,
    required this.image,
    required this.ontap,
  });

  final String userName;
  final String userphone;
  final String image;
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
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(80),
                  child: AppNetworkImage(
                    assetPath: 'assets/images/user_profile.png',
                    networkImage: image,
                  ),
                ),
                Gap(10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: Get.width * 0.4),
                      child: Text(
                        userName,
                        maxLines: 1,
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                    ),
                    const Gap(2),
                    Text(
                      userphone,
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
                  AppText(
                    title: 'Edit'.tr,
                    color: AppColors.primary,
                    size: 13,
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
